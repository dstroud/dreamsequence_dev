dash_functions = {} -- storage for all dashboard functions
dash_list = {} -- dynamic list of selected functions to draw, set by dash_n params
dash_ids = {false}
dash_name = {"Off"}

------------------------------
-- MODULAR DASHBOARD FUNCTIONS
------------------------------
-- x origin of chord and arranger dashes
local dash_x = xy.dash_x
local width = 29

local lvl_pane = lvl.pane
local lvl_pane_selected = lvl.pane_selected
local lvl_pane_deselected = lvl.pane_deselected
local lvl_chart_deselected = lvl.chart_deselected
local lvl_menu_selected = lvl.menu_selected
-- local lvl_menu_deselected = lvl.menu_deselected
-- local blinky = blinky -- can't be locally defined here or there's no updating of value
-- local led_pulse = led_pulse -- can't be locally defined here or there's no updating of value

------------------------------
-- TRANSPORT STATE/METRONOME
------------------------------
table.insert(dash_ids, "transport")
table.insert(dash_name, "Transport")

function dash_functions.transport()
  -- pane
  screen.level(lvl_pane)
  screen.rect(dash_x, dash_y, width, 9)
  screen.fill()

  -- glyph level
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
      screen.pixel(dash_x + 12 + glyphs[transport_state][i][1], dash_y + 2 + glyphs[transport_state][i][2]) -- centered
      -- screen.pixel(dash_x + 3 + glyphs[transport_state][i][1], dash_y + 2 + glyphs[transport_state][i][2]) -- left
  end
  screen.fill()

  dash_y = dash_y + 10 -- position for next dash
end



-- ------------------------------
-- -- TRANSPORT STATE/METRONOME
-- ----------------------------
-- -- alternate style but needs to have sprocket_metro run 1/2 as slow and I'm not sure how to handle that without a second sprocket
-- table.insert(dash_ids, "transport_metro")
-- table.insert(dash_name, "Transport+metro")

-- function dash_functions.transport_metro()
--   -- pane
--   screen.level(lvl_pane)
--   screen.rect(dash_x, dash_y, width, 9)
--   screen.fill()

--   -- glyph level
--   if transport_state == "starting" then -- blink glyph. can't do metronome count-in due to https://github.com/monome/norns/issues/1756
--     screen.level(blinky == 1 and lvl_pane_deselected or lvl_pane)
--     metro_downbeat = false
--   elseif transport_state == "playing" then -- metronome with emphasis on new measure
--     -- screen.level((metro_measure and lvl_pane_selected) or (sprocket_metro.downbeat and lvl_pane_deselected) or lvl_pane - 2) 
--     screen.level(metro_measure and lvl_pane_selected or lvl_pane_deselected)
--   else
--     screen.level(lvl_pane_selected)
--   -- else
--     -- screen.level(0)
--   end

--   -- redefine/simplify for glyphs
--   local transport_state = transport_state == "starting" and "playing" or transport_state == "pausing" and "paused" or transport_state -- fix?

--   -- glyph
--   for i = 1, #glyphs[transport_state] do
--       -- screen.pixel(dash_x + 12 + glyphs[transport_state][i][1], dash_y + 2 + glyphs[transport_state][i][2]) -- centered
--       screen.pixel(dash_x + 3 + glyphs[transport_state][i][1], dash_y + 2 + glyphs[transport_state][i][2]) -- left
--   end
--   screen.fill()

--   -- print("DEBUG SPROCKET PHASE ", sprocket_measure.phase)
--   -- todo replace with norns.ttf glyphs
--   screen.level(0)
--   if sprocket_metro.downbeat then
--     -- left filled circle
--     -- screen.level(0)
--     screen.rect(dash_x + 15, dash_y + 3, 5, 3)
--     screen.rect(dash_x + 16, dash_y + 2, 3, 5)
--     screen.fill()

--     -- right unfilled circle
--     -- screen.level(lvl_pane_deselected)
--     screen.rect(dash_x + 21, dash_y + 3, 1, 3)
--     screen.rect(dash_x + 25, dash_y + 3, 1, 3)
--     screen.rect(dash_x + 22, dash_y + 2, 3, 1)
--     screen.rect(dash_x + 22, dash_y + 6, 3, 1)
--     screen.fill()

--   else

--     -- left unfilled circle
--     -- screen.level(lvl_pane_deselected)
--     screen.rect(dash_x + 15, dash_y + 3, 1, 3)
--     screen.rect(dash_x + 19, dash_y + 3, 1, 3)
--     screen.rect(dash_x + 16, dash_y + 2, 3, 1)
--     screen.rect(dash_x + 16, dash_y + 6, 3, 1)
--     screen.fill()

--     -- right filled circle
--     -- screen.level(0)
--     screen.rect(dash_x + 21, dash_y + 3, 5, 3)
--     screen.rect(dash_x + 22, dash_y + 2, 3, 5)
--     screen.fill()

--   end

--   dash_y = dash_y + 10 -- position for next dash
-- end


-----------------------------
-- CHORD PATTERN PROGRESS BAR
-----------------------------
table.insert(dash_ids, "chord_pattern")
table.insert(dash_name, "Chord pattern")

function dash_functions.chord_pattern()
  -- pane
  screen.level(lvl_pane)
  screen.rect(dash_x, dash_y, width, 9)
  screen.fill()

  -- pattern text a-d
  screen.level(lvl_pane_selected)
  screen.move(dash_x + 3, dash_y + 7)
  screen.text(pattern_name[active_chord_pattern])

  -- dim chart area
  screen.level(0)
  screen.rect(dash_x + 9, dash_y + 2, 18, 5)
  screen.fill()

  -- pattern length
  screen.level(lvl_chart_deselected)
  screen.rect(dash_x + 10, dash_y + 3, chord_pattern_length[active_chord_pattern], 3)
  screen.fill()

  -- progress bar
  screen.level(lvl_menu_selected)
  screen.rect(dash_x + 10, dash_y + 3, chord_pattern_position, 3)
  screen.fill()

  dash_y = dash_y + 10 -- position for next dash
end



---------------------
-- CHORD READOUT: NAME
---------------------
table.insert(dash_ids, "chord_active_name")
table.insert(dash_name, "Chord name")

function dash_functions.chord_active_name()
  -- pane
  screen.level(lvl_pane)
  screen.rect(dash_x, dash_y, width, 9)
  screen.fill()

  screen.level(lvl_pane_selected)
  if chord_no > 0 then
    screen.move(dash_x + 14, dash_y + 7) -- centered
    screen.text_center(active_chord_name)
  end

  dash_y = dash_y + 10 -- position for next dash
end


---------------------
-- CHORD READOUT: DEGREE
---------------------
table.insert(dash_ids, "chord_active_degree")
table.insert(dash_name, "Chord degree")

function dash_functions.chord_active_degree()
  -- pane
  screen.level(lvl_pane)
  screen.rect(dash_x, dash_y, width, 9)
  screen.fill()

  screen.level(lvl_pane_selected)
  if chord_no > 0 then
    screen.move(dash_x + 14, dash_y + 7) -- centered
    screen.text_center(active_chord_degree)
  end

  dash_y = dash_y + 10 -- position for next dash
end


--------------------------------------------
-- ARRANGER DASH M INVERTED(2+3 rows)
--------------------------------------------
table.insert(dash_ids, "arranger_chart")
table.insert(dash_name,"Arranger chart")

function dash_functions.arranger_chart()
  local on = params:string("arranger") == "On"
  local final_seg = arranger_position >= arranger_length
  local valid_jump = arranger_queue and (arranger_queue <= arranger_length)

  -- ARRANGER PANE
  screen.level(lvl_pane)
  -- screen.level(on and lvl_pane or lvl_pane - 9)
  screen.rect(dash_x, dash_y, width, 24)
  screen.fill()


  -- ARRANGER POSITION READOUT
  -- dark = synced with arranger
  -- dim = arranger off
  -- pulsing = syncing

  screen.move(dash_x + 3, dash_y + 7)
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
  local lvl = on and lvl_pane_selected or lvl_pane_deselected   -- bright == on/dark == off
  if final_seg and not valid_jump then                        -- blink final-segment warning
    if transport_state == "playing" then
      lvl = sprocket_metro.downbeat and lvl or (lvl_pane - 2) -- blink with metro when possible (todo look at letting metro free-run)
      else
      lvl = blinky == 1 and lvl or (lvl_pane - 2)        -- otherwise fast blinky
    end
  end
  screen.level(lvl)

  -- glyph type: loop or one-shot
  -- todo norns.ttf
  if params:string("playback") == "Loop" then
    for i = 1, #glyphs.loop do
    screen.pixel(dash_x + 21 + glyphs.loop[i][1], glyphs.loop[i][2] + dash_y + 2)
    end
  else
    for i = 1, #glyphs.one_shot do
    screen.pixel(dash_x + 21 + glyphs.one_shot[i][1], glyphs.one_shot[i][2] + dash_y + 2)
    end
  end

  screen.fill() -- remove when switching to norns.ttf



  -- ARRANGER CHART
  -- todo break into sub-function so we can do a variation without chart portion (just seg and glyph)
  
  -- black chart background
  screen.level(0)
  screen.rect(dash_x + 2, dash_y + 9, 25, 13)
  screen.fill()
  
  -- Axis reference marks
  screen.level(lvl_chart_deselected)
  for i = 1, 4 do
    screen.rect(dash_x + 3, dash_y + 9 + i * 2, 1, 1)
  end
  screen.pixel(dash_x + 3, dash_y + 19)
  screen.fill()
  
  local reset_shift = arranger_position == 0 and 2 or 0
  local arranger_dash_x = dash_x + 3 + reset_shift -- If arranger is reset, add an initial gap (and chop off the end)

  -- todo make these proper globals if we're doing this
  local dash_patterns = dash_patterns
  local dash_events = dash_events
  local dash_levels = dash_levels

  -- Draw arranger patterns and events timeline straight from x_dash_flat
  for i = 1, #dash_patterns - reset_shift do
    -- arranger segment patterns
    screen.level(dash_levels[i])
    screen.rect(arranger_dash_x , dash_y + 7 + ((dash_patterns[i] + 1) * 2), 1, 1)
    screen.fill()

    -- events pips
    screen.level(dash_events[i] or 0)--lvl_pane)
    screen.pixel(arranger_dash_x, dash_y + 19)
    screen.fill()

    arranger_dash_x = arranger_dash_x + 1
  end

  dash_y = dash_y + 25 -- position for next dash
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
  screen.rect(dash_x, dash_y, width, 9)
  screen.fill()

  -- pattern text a-d
  screen.level(params:string("arranger") == "On" and lvl_pane_selected or lvl_pane_deselected)
  screen.move(dash_x + 3, dash_y + 7)
  screen.text(seconds_remaining)

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
  screen.rect(dash_x, dash_y, width, 9)
  screen.fill()

  -- pattern text a-d
  screen.level(lvl_pane_selected)
  screen.move(dash_x + 3, dash_y + 7)
  screen.text(seconds_elapsed or "00:00")

  dash_y = dash_y + 10 -- position for next dash
end