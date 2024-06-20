-- nb voice for MIDI that passes channel arg to player as using mod_target `ch`
-- requires modified version of nb to pass `ch` to note_off
-- called by Dreamsequence; does not get registered with mod hook and is removed on script cleanup

local mod = require "core/mods"

if note_players == nil then
    note_players = {}
end

local abbreviate = function(s)
    if string.len(s) < 8 then return s end
    local acronym = util.acronym(s)
    if string.len(acronym) > 3 then return acronym end
    return string.sub(s, 1, 8)
end

local function add_midi_ds_players()
    for i, v in ipairs(midi.vports) do
        (function(i)
            if v.connected then
                local conn = midi.connect(i)
                local player = {
                    conn = conn
                }
                function player:add_params()
                    params:add_group("midi_voice_" .. i, "midi port " .. i, 3)
                    params:add_number("midi_chan_" .. i, "channel", 1, 16, 1)
                    params:add_number("midi_modulation_cc_" .. i, "modulation cc", 1, 127, 72)
                    params:add_number("midi_bend_range_" .. i, "bend range", 1, 48, 12)
                    params:hide("midi_voice_" .. i)
                end

                function player:ch()
                    return params:get("midi_chan_" .. i)
                end

                function player:note_on(note, vel, properties)
                    if properties == nil then
                        properties = {}
                    end
                    local ch = properties.ch or self:ch()
                    self.conn:note_on(note, util.clamp(math.floor(127 * vel), 0, 127), ch)
                end

                function player:note_off(note, vel, properties)
                    if properties == nil then
                        properties = {}
                    end
                    local ch = properties.ch or self:ch()
                    self.conn:note_off(note, util.clamp(math.floor(127 * (vel or 0)), 0, 127), ch)
                end

                function player:active()
                    params:show("midi_voice_" .. i)
                    _menu.rebuild_params()
                end

                function player:inactive()
                    params:hide("midi_voice_" .. i)
                    _menu.rebuild_params()
                end

                function player:modulate(val)
                    self.conn:cc(params:get("midi_modulation_cc_" .. i),
                        util.clamp(math.floor(127 * val), 0, 127),
                        self:ch())
                end

                function player:modulate_note(note, key, value)
                    if key == "pressure" then
                        self.conn:key_pressure(note, util.round(value * 127), self:ch())
                    end
                end

                function player:pitch_bend(note, amount)
                    local bend_range = params:get("midi_bend_range_" .. i)
                    if amount < -bend_range then
                        amount = -bend_range
                    end
                    if amount > bend_range then
                        amount = bend_range
                    end
                    local normalized = amount / bend_range -- -1 to 1
                    local send = util.round(((normalized + 1) / 2) * 16383)
                    self.conn:pitchbend(send, self:ch())
                end

                function player:describe()
                    local mod_d = "cc"
                    if params.lookup["midi_modulation_cc_" .. i] ~= nil then
                        mod_d = "cc " .. params:get("midi_modulation_cc_" .. i)
                    end
                    return {
                        name = v.name,
                        supports_bend = true,
                        supports_slew = false,
                        note_mod_targets = { "ch", "pressure" },
                        modulate_description = mod_d
                    }
                end

                function player:stop_all(val)
                    for ch = 1, 16 do -- all channels since init() calls before add_params()
                        self.conn:cc(120, 1, ch)
                    end
                end

                -- format using port # since space is very tight. Use 2-digits so nb will sort properly
                nb.players["midi port " .. string.format("%02d", i)] = player

            end
        end)(i)
    end
end

function pre_init()
    add_midi_ds_players()
end

mod.hook.register("script_pre_init", "midi ds pre init", pre_init)