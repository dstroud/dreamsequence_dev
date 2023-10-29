-- just a little WIP nb engine wrapper for polyperc
-- will be moved to a mod but I don't know how to get the engine to load there

local mod = require 'core/mods'
local music = require 'lib/musicutil'
engine.name = "PolyPerc"

if note_players == nil then
    note_players = {}
end

local function freq_to_note_num_float(freq)
    local reference = music.note_num_to_freq(60)
    local ratio = freq/reference
    return 60 + 12*math.log(ratio)/math.log(2)
end


local function format_percent(val)
  return(val.."%")
end


local function add_polyperc_player()
    local player = {
        count = 0
    }

    function player:add_params()

        params:add_group("nb_pp", "polyperc", 7)

        params:add_control("nb_pp_release", "release", controlspec.new(0.1, 10, 'exp', 0, 0.5, "s"))
        params:add_taper("nb_pp_cutoff", "cutoff", 100, 20000, 600, 4, 'Hz')
        params:add_number("nb_pp_tracking", "tracking", 0, 100, 50, function(param) return format_percent(param:get()) end)
        params:add_number("nb_pp_gain", "gain", 0, 100, 25, function(param) return format_percent(param:get()) end)
        params:add_number('nb_pp_pw', 'pulse width', 1, 99, 50, function(param) return format_percent(param:get()) end) 
        params:add_number("nb_pp_stereo", "stereo", 0, 100, 50, function(param) return format_percent(param:get()) end)
        params:add_number("nb_pp_detune", "detune", 0, 100, 0, function(param) return format_percent(param:get()) end)

        params:hide("nb_pp")
        
    end
    
    -- local pan = 1
    
    local function cointoss_inverse(val)
      return(val * (math.random(2) == 1 and -1 or 1))
    end
    
    function player:note_on(note, vel)
        -- PolyPerc crashes if sent >24000 hz!!!
        -- local note_hz = math.min(music.note_num_to_freq(note), 24000)
        local note_hz = music.note_num_to_freq(note)

        engine.amp(vel/2) -- for stereo only
        engine.cutoff(note_hz * (params:get("nb_pp_tracking")*.01) + params:get("nb_pp_cutoff"))
        engine.release(params:get("nb_pp_release"))
        engine.gain(params:get("nb_pp_gain")*.04)
        engine.pw(params:get("nb_pp_pw")*.01)
        local detune = params:get("nb_pp_detune")
        
        -- alternate for non-stereo version (don't forget to up amp!)
        -- pan = -pan
        -- engine.pan(pan * (params:get("nb_pp_stereo")/100))
        -- engine.hz(note_hz)

        -- bby's first psychoacoustics
        engine.pan(params:get("nb_pp_stereo")/100)
        engine.hz(math.min(note_hz * (1-(cointoss_inverse((math.random(0, detune)/5000)))), 24000))
        clock.run(function()
          clock.sleep(params:get("nb_pp_stereo")/5000)
          engine.pan(-params:get("nb_pp_stereo")/100)
          engine.hz(math.min(note_hz * (1-(cointoss_inverse((math.random(0, detune)/5000)))), 24000))
        end)
    end

    function player:note_off(note)
    end

    function player:describe()
        return {
            name = "polyperc",
            supports_bend = false,
            supports_slew = false,
            modulate_description = "unsupported",
        }
    end

    function player:stop_all()
    end

    function player:active()
        params:show("nb_pp")
        _menu.rebuild_params()
    end

    function player:inactive()
        params:hide("nb_pp")
        _menu.rebuild_params()
    end
    
    note_players["polyperc"] = player
end

mod.hook.register("script_pre_init", "nb polyperc pre init", function()
    add_polyperc_player()
end)
