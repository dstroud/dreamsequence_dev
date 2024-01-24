---- module for creating a lattice of sprockets based on a single fast "superclock"
--
-- @module Lattice
-- @release v2.0
-- @author tyleretters & ezra & zack & rylee

local Lattice, Sprocket = {}, {}

--- instantiate a new lattice
-- @tparam[opt] table args optional named attributes are:
-- - "auto" (boolean) turn off "auto" pulses from the norns clock, defaults to true
-- - "ppqn" (number) the number of pulses per quarter cycle of this superclock, defaults to 96
-- @treturn table a new lattice
function Lattice:new(args)
  local l = setmetatable({}, { __index = Lattice })
  args = args == nil and {} or args
  l.auto = args.auto == nil and true or args.auto
  l.ppqn = args.ppqn == nil and 96 or args.ppqn
  l.enabled = false
  l.transport = 0
  l.superclock_id = nil
  l.sprocket_id_counter = 100
  l.sprockets = {}
  l.sprocket_ordering = {{}, {}, {}, {}, {}}
  return l
end

--- start running the lattice
function Lattice:start()
  self.enabled = true
  if self.auto and self.superclock_id == nil then
    self.superclock_id = clock.run(self.auto_pulse, self)
  end
end

--- reset the norns clock without restarting lattice
function Lattice:reset()
  -- destroy clock, but not the sprockets
  self:stop()
  if self.superclock_id ~= nil then
    clock.cancel(self.superclock_id)
    self.superclock_id = nil
  end
  for i, sprocket in pairs(self.sprockets) do
    sprocket.phase = sprocket.division * self.ppqn * 4 * (1 - sprocket.delay) -- "4" because in music a "quarter note" == "1/4"
    sprocket.downbeat = false
  end
  self.transport = 0
  params:set("clock_reset", 1)
end

--- reset the norns clock and restart lattice
function Lattice:hard_restart()
  self:reset()
  self:start()
end

--- stop the lattice
function Lattice:stop()
  self.enabled = false
end

--- toggle the lattice
function Lattice:toggle()
  self.enabled = not self.enabled
end

--- destroy the lattice
function Lattice:destroy()
  self:stop()
  if self.superclock_id ~= nil then
    clock.cancel(self.superclock_id)
  end
  self.sprockets = {}
  self.sprocket_ordering = {}
end

--- set_meter is deprecated
function Lattice:set_meter(_)
  print("meter is deprecated")
end

--- use the norns clock to pulse
-- @tparam table s this lattice
function Lattice.auto_pulse(s)
  while true do
    s:pulse()
    clock.sync(1/s.ppqn)
  end
end

--- advance all sprockets in this lattice a single by pulse, call this manually if lattice.auto = false
function Lattice:pulse()
  if self.enabled then
    local ppc = self.ppqn * 4 -- pulses per cycle; "4" because in music a "quarter note" == "1/4"
    local flagged=false
    for i = 1, 5 do
      for _, id in ipairs(self.sprocket_ordering[i]) do
        local sprocket = self.sprockets[id]

         -- flipping these two for debug. reverse!!
          -- quantized division changes
          -- if sprocket.division_new ~= nil then
          --   -- method prioritizes consistent changes ON DIV, irrespective of swing amount
          --   if sprocket.phase > sprocket.division * ppc then  -- simplify or run BEFORE phase increment

          if sprocket.phase == sprocket.division * ppc then  -- one over so we don't re-check during swing period flip!
            -- if sprocket.phase + 1 == sprocket.division * ppc then  -- flip!
              local ppd = ppc * (sprocket.division_new or sprocket.division)  -- NEW pulses per div
              local txp_mod = self.transport % ppd -- pulses/phase past previous valid beat div
              local prev_beat = math.floor(self.transport / ppd) * ppd -- previous valid beat (no swing)
              local next_beat = prev_beat + ppd -- upcoming valid beat (no swing)
              local next_beat_downbeat = next_beat / ppd % 2 == 0 -- whether the upcoming beat is downbeat (std) or not (swing)
              if sprocket.division_new ~= nil then  -- flip!
  
                -- run these here!
                -- local ppd = ppc * sprocket.division_new  -- NEW pulses per div
                -- local txp_mod = self.transport % ppd -- pulses/phase past previous valid beat div
                -- local prev_beat = math.floor(self.transport / ppd) * ppd -- previous valid beat (no swing)
                -- local next_beat = prev_beat + ppd -- upcoming valid beat (no swing)
                -- local next_beat_downbeat = next_beat / ppd % 2 == 0 -- whether the upcoming beat is downbeat (std) or not (swing)
  
                -- if debug then
                --   print("-----------------------------------")
                --   debug_change_count = debug_change_count + 1
                -- end
                
                -- params:set("chord_duration_index", params:get("chord_div_index")) -- todo: make a feature
  
              
                sprocket.division = sprocket.division_new
                sprocket.division_new = nil
                print("new div: " .. sprocket.division,
                "new phase: " .. sprocket.phase
                )
                -- sprocket_chord.division = new_div
                
                
                -- sprocket_transport.phase = txp_mod + 1 -- new_phase + 1 -- effective next lattice action. +1 since lattice has already incremented
        
                -- -- -- sprocket_chord.phase = util.wrap(new_phase, 1, ppd) -- effective immediately on next sprocket (sprocket_chord)
                -- sprocket_chord.phase = (txp_mod == 0 and ppd or txp_mod) -- alt. phase 0 is "wrapped" to ppd to fire immediately
                sprocket.phase = (txp_mod == 0 and ppd or txp_mod) -- alt. phase 0 is "wrapped" to ppd to fire immediately
  
                if txp_mod == 0 then -- "valid" beat
                  sprocket_chord.downbeat = next_beat_downbeat
                else -- "skip beat"
                  sprocket_chord.downbeat = not next_beat_downbeat -- wag but seems to be needed when skipping a beat (even if it's an effective skip via phase)
                  -- debug_velocity = .1 -- will eventually something like this to block transport_handler
                end
  
  
              end
              
              -- debug for chord only at the moment
              if sprocket.id == sprocket_chord.id then 
                print(
                  -- condition,
                  "div "..sprocket.division,
                  "txp "..string.format("%05d", (self.transport or 0)), 
                  -- "old_".."\u{F8} "..old_phase,
                  -- "downbeat "..(sprocket_chord.downbeat == true and "true" or "false"), 
                  -- "swing_val "..swing_val,
                  "txp_mod "..txp_mod,
                  "prev_beat "..prev_beat,
                  "next_beat "..next_beat,
                  "next_db "..tostring(sprocket.downbeat),
                  "txp_".."\u{F8} "..sprocket_transport.phase,
                  "ch_".."\u{F8} "..sprocket_chord.phase,
                  "beat "..round(clock.get_beats(),2)
                )
              end
  
            end

        if sprocket.enabled then
          sprocket.phase = sprocket.phase + 1


          local swing_val = 2 * sprocket.swing / 100
          if not sprocket.downbeat then
            swing_val = 1
          end
          if sprocket.phase > sprocket.division * ppc * swing_val then
            sprocket.phase = sprocket.phase - (sprocket.division * ppc)
            if sprocket.delay_new ~= nil then
              sprocket.phase = sprocket.phase - (sprocket.division * ppc) * (1 - (sprocket.delay - sprocket.delay_new))
              sprocket.delay = sprocket.delay_new
              sprocket.delay_new = nil
            end
            sprocket.action(self.transport)
            sprocket.downbeat = not sprocket.downbeat
          end
        elseif sprocket.flag then
          self.sprockets[sprocket.id] = nil
          flagged = true
        end
      end
    end
    if flagged then
      self:order_sprockets()
    end
    self.transport = self.transport + 1
  end
end

--- factory method to add a new sprocket to this lattice
-- @tparam[opt] table args optional named attributes are:
-- - "action" (function) called on each step of this division (lattice.transport is passed as the argument), defaults to a no-op
-- - "division" (number) the division of the sprocket, defaults to 1/4
-- - "enabled" (boolean) is this sprocket enabled, defaults to true
-- - "swing" (number) is the percentage of swing (0 - 100%), defaults to 50
-- - "delay" (number) specifies amount of delay, as fraction of division (0.0 - 1.0), defaults to 0
-- - "order" (number) specifies the place in line this lattice occupies from 1 to 5, lower first, defaults to 3
-- @treturn table a new sprocket
function Lattice:new_sprocket(args)
  self.sprocket_id_counter = self.sprocket_id_counter + 1
  args = args == nil and {} or args
  args.id = self.sprocket_id_counter
  args.order = args.order == nil and 3 or util.clamp(args.order, 1, 5)
  args.action = args.action == nil and function(t) return end or args.action
  args.division = args.division == nil and 1/4 or args.division
  args.enabled = args.enabled == nil and true or args.enabled
  args.phase = args.division * self.ppqn * 4 -- "4" because in music a "quarter note" == "1/4"
  args.swing = args.swing == nil and 50 or util.clamp(args.swing,0,100)
  args.delay = args.delay == nil and 0 or util.clamp(args.delay,0,1)
  local sprocket = Sprocket:new(args)
  self.sprockets[self.sprocket_id_counter] = sprocket
  self:order_sprockets()
  return sprocket
end

--- new_pattern is deprecated
function Lattice:new_pattern(args)
  print("'new_pattern' is deprecated; use 'new_sprocket' instead.")
  return self:new_sprocket(args)
end

--- "private" method to keep numerical order of the sprocket ids
-- for use when pulsing
function Lattice:order_sprockets()
  self.sprocket_ordering = {{}, {}, {}, {}, {}}
  for id, sprocket in pairs(self.sprockets) do
    table.insert(self.sprocket_ordering[sprocket.order],id)
  end
  for i = 1, 5 do
    table.sort(self.sprocket_ordering[i])
  end
end

--- "private" method to instantiate a new sprocket, only called by Lattice:new_sprocket()
-- @treturn table a new sprocket
function Sprocket:new(args)
  local p = setmetatable({}, { __index = Sprocket })
  p.id = args.id
  p.order = args.order
  p.division = args.division
  p.action = args.action
  p.enabled = args.enabled
  p.flag = false
  p.swing = args.swing
  p.downbeat = false
  p.delay = args.delay
  p.phase = args.phase * (1-args.delay)
  return p
end

--- start the sprocket
function Sprocket:start()
  self.enabled = true
end

--- stop the sprocket
function Sprocket:stop()
  self.enabled = false
end

--- toggle the sprocket
function Sprocket:toggle()
  self.enabled = not self.enabled
end

--- flag the sprocket to be destroyed
function Sprocket:destroy()
  self.enabled = false
  self.flag = true
end

--- set the division of the sprocket
-- @tparam number n the division of the sprocket
function Sprocket:set_division(n)
   self.division_new = n
end

--- set the action for this sprocket
-- @tparam function the action
function Sprocket:set_action(fn)
  self.action = fn
end

--- set the swing of the sprocket
-- @tparam number the swing value 0-100%
function Sprocket:set_swing(swing)
  self.swing = util.clamp(swing,0,100)
end

--- set the delay for this sprocket
-- @tparam fraction of the time between beats to delay (0-1)
function Sprocket:set_delay(delay)
  self.delay_new = util.clamp(delay,0,1)
end

return Lattice