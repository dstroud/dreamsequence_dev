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
  if transport_state == "starting" then -- blink glyph. can't do metronome count-in due to https://github.com/monome/norns/issues/1756
    screen.level(fast_blinky == 1 and lvl_pane_deselected or lvl_pane)
  elseif transport_state == "playing" then -- metronome with emphasis on new measure
    screen.level((metro_measure and lvl_pane_selected) or (sprocket_metro.downbeat and lvl_pane_deselected) or lvl_pane)
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

  -- pattern step progress bar
  screen.level(lvl_pane_deselected)
  screen.rect(dash_x + 10, dash_y + 2, chord_pattern_length[active_chord_pattern], 5)
  screen.fill()

  screen.level(lvl_pane_selected)
  screen.rect(dash_x + 10, dash_y + 2, chord_pattern_position, 5)
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
-- ARRANGER DASH M (2+5 rows)
--------------------------------------------
table.insert(dash_ids, "arranger_chart")
table.insert(dash_name,"Arranger chart")

function dash_functions.arranger_chart()
  local on = params:string("arranger") == "On"
  local final_seg = arranger_position >= arranger_length
  local valid_jump = arranger_queue and (arranger_queue <= arranger_length)

  -- ARRANGER PANE
  screen.level(lvl_pane)
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
      lvl = fast_blinky == 1 and lvl or (lvl_pane - 2)        -- otherwise fast blinky
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
  -- todo break into sub-function so we can do a variation without chart portion (just  and glyph)
  -- Axis reference marks
  screen.level(lvl_pane_deselected)
  for i = 1, 4 do
    screen.rect(dash_x + 3, dash_y + 6 + i * 3, 1, 2)
  end

  screen.pixel(dash_x + 3, dash_y + 21)
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
    screen.rect(arranger_dash_x , dash_y + 6 + (dash_patterns[i] * 3), 1, 2)
    screen.fill()

    -- events pips
    screen.level(dash_events[i] or lvl_pane)
    screen.pixel(arranger_dash_x, dash_y + 21)
    screen.fill()

    arranger_dash_x = arranger_dash_x + 1
  end

  dash_y = dash_y + 25 -- position for next dash
end


-- --------------------------------------------
-- -- ARRANGER DASH M (2.1 rows)
-- --------------------------------------------
-- function dash_functions.arranger_chart()
--   local on = params:string("arranger") == "On"
--   local final_seg = arranger_position >= arranger_length
--   local valid_jump = arranger_queue and (arranger_queue <= arranger_length)

--   -- ARRANGER PANE
--   screen.level(lvl_pane)
--   screen.rect(dash_x, dash_y, width, 20)
--   screen.fill()


--   -- ARRANGER POSITION READOUT
--   -- dark = synced with arranger
--   -- dim = arranger off
--   -- pulsing = syncing

--   screen.move(dash_x + 3, dash_y + 7)
--   if arranger_active == false then  -- DE-SYNC
--     if on then
--       screen.level(lvl_pane_selected + 2 - led_pulse) -- pulse while waiting to enter arrangement
--       else
--       screen.level(lvl_pane_deselected)
--       end

--       if valid_jump then
--       screen.text(arranger_queue)
--       elseif final_seg and params:string("playback") == "1-shot" then
--       screen.text("End") -- indicate we'll hit end, not wrap
--       else
--       screen.text(util.wrap(arranger_position + 1, 1, arranger_length)) -- segment we'll enter on
--     end

--   elseif arranger_position == 0 and chord_pattern_position == 0 then -- stopped
--     screen.level(lvl_pane_selected)
--     if valid_jump then
--     screen.text(arranger_queue)
--     else
--     screen.text(arranger_position == 0 and 1 or arranger_position)
--     end
--   else                                          -- standard playback
--     screen.level(lvl_pane_selected)
--     screen.text(arranger_position)
--   end
--   screen.fill()


--   -- ARRANGER MODE GLYPH

--   -- glyph level -- todo see if we should pulse final segment when looping and blink when ending (to match grid led)
--   local lvl = on and lvl_pane_selected or lvl_pane_deselected   -- bright == on/dark == off
--   if final_seg and not valid_jump then                        -- blink final-segment warning
--     if transport_state == "playing" then
--       lvl = sprocket_metro.downbeat and lvl or (lvl_pane - 2) -- blink with metro when possible (todo look at letting metro free-run)
--       else
--       lvl = fast_blinky == 1 and lvl or (lvl_pane - 2)        -- otherwise fast blinky
--     end
--   end
--   screen.level(lvl)

--   -- glyph type: loop or one-shot
--   -- todo norns.ttf
--   if params:string("playback") == "Loop" then
--     for i = 1, #glyphs.loop do
--     screen.pixel(dash_x + 21 + glyphs.loop[i][1], glyphs.loop[i][2] + dash_y + 2)
--     end
--   else
--     for i = 1, #glyphs.one_shot do
--     screen.pixel(dash_x + 21 + glyphs.one_shot[i][1], glyphs.one_shot[i][2] + dash_y + 2)
--     end
--   end

--   screen.fill() -- remove when switching to norns.ttf



--   -- ARRANGER CHART
--   -- todo break into sub-function so we can do a variation without this
--   -- Axis reference marks
--   screen.level(lvl_pane_deselected)
--   for i = 1, 4 do
--     screen.rect(dash_x + 3, dash_y + 7 + i * 2, 1, 1)
--   end

--   screen.pixel(dash_x + 3, dash_y + 17)
--   screen.fill()
--   local reset_shift = arranger_position == 0 and 2 or 0
--   local arranger_dash_x = dash_x + 3 + reset_shift -- If arranger is reset, add an initial gap (and chop off the end)

--   -- todo make these proper globals if we're doing this
--   local dash_patterns = dash_patterns
--   local dash_events = dash_events
--   local dash_levels = dash_levels

--   -- Draw arranger patterns and events timeline straight from x_dash_flat
--   for i = 1, #dash_patterns - reset_shift do
--     -- arranger segment patterns
--     screen.level(dash_levels[i])
--     screen.rect(arranger_dash_x , dash_y + 7 + (dash_patterns[i] * 2), 1, 1)
--     screen.fill()

--     -- events pips
--     screen.level(dash_events[i] or lvl_pane)
--     screen.pixel(arranger_dash_x, dash_y + 17)
--     screen.fill()

--     arranger_dash_x = arranger_dash_x + 1
--   end

--   dash_y = dash_y + 21 -- position for next dash
-- end


-----------------------------
-- ARRANGER COUNTDOWN
-----------------------------
table.insert(dash_ids, "arranger_countdown")
table.insert(dash_name, "Arranger countdown")

function dash_functions.arranger_countdown()
  -- pane
  screen.level(lvl_pane)
  screen.rect(dash_x, dash_y, width, 9)
  screen.fill()

  -- pattern text a-d
  screen.level(params:string("arranger") == "On" and lvl_pane_selected or lvl_pane_deselected)
  screen.move(dash_x + 3, dash_y + 7)
  screen.text(seconds_remaining)

  dash_y = dash_y + 10 -- position for next dash
end