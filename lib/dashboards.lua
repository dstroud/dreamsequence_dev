dash_functions = {} -- storage for all dashboard functions
dash_list = {} -- dynamic list of selected functions to draw, set by dash_n params
dash_ids = {false}
dash_name = {"Off"}

------------------------------
-- MODULAR DASHBOARD FUNCTIONS
------------------------------

-- x origin of chord and arranger dashes
local dash_x = xy.dash_x
local width = 39

local lvl_pane = lvl.pane
local lvl_pane_selected = lvl.pane_selected
local lvl_pane_deselected = lvl.pane_deselected
local lvl_chart_deselected = lvl.chart_deselected
local lvl_menu_selected = lvl.menu_selected
-- local lvl_chart_area = lvl.chart_area
-- local lvl_menu_deselected = lvl.menu_deselected
-- local blinky = blinky -- can't be locally defined here or there's no updating of value
-- local led_pulse = led_pulse -- can't be locally defined here or there's no updating of value


-- function called by main script when we need to switch between normal and dim levels
function update_dash_lvls()
  -- lvl = lvl -- used by arranger dash

  lvl_pane = lvl.pane
  lvl_pane_selected = lvl.pane_selected
  lvl_pane_deselected = lvl.pane_deselected
  lvl_chart_deselected = lvl.chart_deselected
  lvl_menu_selected = lvl.menu_selected
  lvl_chart_area = lvl.chart_area
end

----------------------------------------------------
-- TRANSPORT STATE/METRONOME, CHORD PATTERN PROGRESS
----------------------------------------------------
table.insert(dash_ids, "transport")
table.insert(dash_name, "Transport")

function dash_functions.transport()
  -- pane
  screen.level(lvl_pane)
  screen.rect(dash_x, dash_y, width, 11)
  screen.fill()

  -- chord pattern text A-D
  screen.level(lvl_pane_selected)
  screen.move(dash_x + 3, dash_y + 8)
  screen.text(pattern_name[active_chord_pattern])

  -- CHORD PATTERN PROGRESS BAR
  -- dim chart area
  screen.level(0)
  screen.rect(dash_x + 10, dash_y + 3, 18, 5)
  screen.fill()

  -- pattern length
  screen.level(lvl_chart_deselected)
  screen.rect(dash_x + 11, dash_y + 4, chord_pattern_length[active_chord_pattern], 3)
  screen.fill()

  -- progress bar
  screen.level(lvl_menu_selected)
  screen.rect(dash_x + 11, dash_y + 4, chord_pattern_position, 3)
  screen.fill()

  -- transport state/metro glyph level
  if transport_state == "starting" and params:string("clock_source") == "link" then -- blink glyph. can't do metronome count-in due to https://github.com/monome/norns/issues/1756
    screen.level(blinky == 1 and lvl_pane_deselected or lvl_pane)
  elseif transport_state == "playing" then -- metronome with emphasis on new measure
    screen.level((metro_measure and lvl_pane_selected) or (sprocket_metro.downbeat and lvl_pane_deselected) or lvl_pane - 2)
  else
    screen.level(lvl_pane_selected)
  end

  -- redefine/simplify for glyphs
  local transport_state = transport_state == "starting" and "playing" or transport_state == "pausing" and "paused" or transport_state -- fix?

  -- glyph
  for i = 1, #glyphs[transport_state] do
    -- screen.pixel(dash_x + 13 + glyphs[transport_state][i][1], dash_y + 2 + glyphs[transport_state][i][2]) -- centered
    -- screen.pixel(dash_x + 3 + glyphs[transport_state][i][1], dash_y + 2 + glyphs[transport_state][i][2]) -- left
    screen.pixel(120 + glyphs[transport_state][i][1], dash_y + 3 + glyphs[transport_state][i][2]) -- right
  end
  screen.fill()

  dash_y = dash_y + 12 -- position for next dash
end



---------------------
-- CHORD READOUT: NAME
---------------------
table.insert(dash_ids, "chord_active_name")
table.insert(dash_name, "Chord name")

function dash_functions.chord_active_name()
  -- pane
  screen.level(lvl_pane)
  screen.rect(dash_x, dash_y, width, 17)
  screen.fill()

  screen.level(lvl_pane_selected)
  if active_chord_name_2 then                           -- 2-row chord
    screen.move(dash_x + 19, dash_y + 8)
    screen.text_center(active_chord_name_1 or "")
    screen.move(dash_x + 19, dash_y + 14)
    screen.text_center(active_chord_name_2)
  else                                                  -- 1-row chord
    screen.move(dash_x + 19, dash_y + 11)
    screen.text_center(active_chord_name_1 or "")
  end

  -- -- INTEGER NOTATION mockup/WIP
  -- screen.level(lvl_pane_deselected)
  -- for i = 0, 11 do
  --   local x =  i * 2
  --   for o = 0, 1 do
  --     screen.pixel(dash_x + 8 + x, (o * 2) + dash_y + 16)
  --     screen.fill()
  --   end
  -- end
  -- screen.fill()

  -- -- todo p1 optimize this. no way we should do this 60x a second lol
  -- screen.level(0)
  -- local chord_raw = chord_raw
  -- local root = chord_raw[1]
  -- for i = 1, #chord_raw do
  --   -- chord_raw[i] = chord_raw - root
  --   local i = chord_raw[i] - root
  --   screen.pixel(dash_x + 8 + i, dash_y + 18 - ((math.floor(i / 12)) * 2))
  -- end
  -- screen.fill()

  dash_y = dash_y + 18 -- position for next dash
end


-- ---------------------
-- -- CHORD READOUT: DEGREE
-- ---------------------
-- table.insert(dash_ids, "chord_active_degree")
-- table.insert(dash_name, "Chord degree")

-- function dash_functions.chord_active_degree()
--   -- pane
--   screen.level(lvl_pane)
--   screen.rect(dash_x, dash_y, width, 9)
--   screen.fill()

--   screen.level(lvl_pane_selected)
--   screen.move(dash_x + 15.5, dash_y + 7) -- centered
--   screen.text_center(active_chord_degree or "")

--   dash_y = dash_y + 10 -- position for next dash
-- end




--------------------------------------------
-- ARRANGER DASH M INVERTED(2+3 rows)
--------------------------------------------
table.insert(dash_ids, "arranger_chart")
table.insert(dash_name,"Arranger chart")

function dash_functions.arranger_chart()
  local lvl = lvl -- requires going to table for chart dimming :/
  local on = params:string("arranger") == "On"
  local final_seg = arranger_position >= arranger_length
  local valid_jump = arranger_queue and (arranger_queue <= arranger_length)

  -- ARRANGER PANE
  screen.level(lvl_pane)
  -- screen.level(on and lvl_pane or lvl_pane - 9)
  screen.rect(dash_x, dash_y, width, 22)
  screen.fill()


  -- ARRANGER POSITION READOUT
  -- dark = synced with arranger
  -- dim = arranger off
  -- pulsing = syncing

  screen.move(dash_x + 3, dash_y + 8)
  if arranger_active == false then  -- DE-SYNC
    if on then
      screen.level(lvl_pane_selected + 2 - led_pulse) -- pulse while waiting to enter arrangement
      else
      screen.level(lvl_pane_deselected)
      end

      if valid_jump then
      screen.text(arranger_queue)
      elseif final_seg and params:string("playback") == "1-shot" then
      screen.text("End") -- indicate we'll hit end, not wrap
      else
      screen.text(util.wrap(arranger_position + 1, 1, arranger_length)) -- segment we'll enter on
    end

  elseif arranger_position == 0 and chord_pattern_position == 0 then -- stopped
    screen.level(lvl_pane_selected)
    if valid_jump then
    screen.text(arranger_queue)
    else
    screen.text(arranger_position == 0 and 1 or arranger_position)
    end
  else                                          -- standard playback
    screen.level(lvl_pane_selected)
    screen.text(arranger_position)
  end
  screen.fill()


  -- ARRANGER MODE GLYPH

  -- glyph level -- todo see if we should pulse final segment when looping and blink when ending (to match grid led)
  local level = on and lvl_pane_selected or lvl_pane_deselected   -- bright == on/dark == off
  if final_seg and not valid_jump then                        -- blink final-segment warning
    if transport_state == "playing" then
      level = sprocket_metro.downbeat and level or (lvl_pane - 2) -- blink with metro when possible (todo look at letting metro free-run)
      else
      level = blinky == 1 and level or (lvl_pane - 2)        -- otherwise fast blinky
    end
  end
  screen.level(level)

  -- glyph type: loop or one-shot
  -- todo norns.ttf
  if params:string("playback") == "Loop" then
    for i = 1, #glyphs.loop do
    screen.pixel(120 + glyphs.loop[i][1], glyphs.loop[i][2] + dash_y + 3)
    end
  else
    for i = 1, #glyphs.one_shot do
    screen.pixel(120 + glyphs.one_shot[i][1], glyphs.one_shot[i][2] + dash_y + 3)
    end
  end

  screen.fill() -- remove when switching to norns.ttf


  -- -- ARRANGER CHART
  -- -- todo break into sub-function so we can do a variation without chart portion (just seg and glyph)
  
  -- black chart background
  screen.level(0)
  screen.rect(dash_x + 3, dash_y + 10, 33, 9)
  screen.fill()
  
  -- Axis reference marks
  screen.level(lvl_chart_deselected)
  for i = 1, 4 do
    screen.rect(dash_x + 4, dash_y + 9 + i * 2, 1, 1)
  end
  -- screen.pixel(dash_x + 4, dash_y + 21)
  screen.fill()
  
  local reset_shift = arranger_position == 0 and 2 or 0
  local arranger_dash_x = dash_x + 4 + reset_shift -- If arranger is reset, add an initial gap (and chop off the end)

  -- todo make these proper globals if we're doing this
  local dash_patterns = dash_patterns
  -- local dash_events = dash_events
  local dash_levels = dash_levels

  -- Draw arranger patterns and events timeline straight from x_dash_flat
  for i = 1, #dash_patterns do -- - reset_shift do
    local y = dash_patterns[i]
    if y > 0 and (arranger_dash_x < 125) then -- todo p1 optimize this
      -- arranger segment patterns
      screen.level(lvl[dash_levels[i]]) -- less efficient to access lvl but got to
      screen.rect(arranger_dash_x, dash_y + 7 + ((y + 1) * 2), 1, 1)
      screen.fill()
    end

    -- -- events pips
    -- screen.level(lvl[dash_events[i]])
    -- screen.pixel(arranger_dash_x, dash_y + 21)
    -- screen.fill()

    arranger_dash_x = arranger_dash_x + 1
  end


  dash_y = dash_y + 23 -- position for next dash
end



-----------------------------
-- ARRANGER TIME REMAINING COUNTDOWN
-----------------------------
table.insert(dash_ids, "time_remaining")
table.insert(dash_name, "Time remaining")

function dash_functions.time_remaining()
  -- local on = params:string("arranger") == "On"
  -- pane
  -- screen.level(on and lvl_pane or lvl_pane - 9)
  screen.level(lvl_pane)
  screen.rect(dash_x, dash_y, width, 11)
  screen.fill()

  screen.level(params:string("arranger") == "On" and lvl_pane_selected or lvl_pane_deselected)
  screen.move(dash_x + 3, dash_y + 8)
  screen.text("-0:" .. seconds_remaining) -- todo re-add hour digit

  dash_y = dash_y + 10 -- position for next dash
end


-----------------------------
-- ELAPSED PLAY TIME
-----------------------------
table.insert(dash_ids, "time_elapsed")
table.insert(dash_name, "Time elapsed")

function dash_functions.time_elapsed()
  -- pane
  screen.level(lvl_pane)
  screen.rect(dash_x, dash_y, width, 11)
  screen.fill()

  screen.level(lvl_pane_selected)
  screen.move(dash_x + 5, dash_y + 8)
  screen.text(seconds_elapsed or "00:00") -- todo p0 add hour
  
  -- -- todo center around :
  -- screen.move(dash_x + 14, dash_y + 7)
  -- screen.text_right("11")
  -- screen.text(":10")


  
  dash_y = dash_y + 10 -- position for next dash
end