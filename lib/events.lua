events_lookup = {}									--
-- Song									
table.insert(events_lookup, {	category= 'Song', 	subcategory= 'Mood', 	event_type= 'param', 	id= 'mode', 	name= 'Mode', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'Song', 	subcategory= 'Mood', 	event_type= 'param', 	id= 'transpose', 	name= 'Key', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'Song', 	subcategory= 'Mood', 	event_type= 'param', 	id= 'clock_tempo', 	name= 'Tempo', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'Song', 	subcategory= 'Config', 	event_type= 'param', 	id= 'crow_out_1', 	name= 'Crow out 1', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'Song', 	subcategory= 'Config', 	event_type= 'param', 	id= 'crow_out_2', 	name= 'Crow out 2', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'Song', 	subcategory= 'Config', 	event_type= 'param', 	id= 'crow_out_3', 	name= 'Crow out 3', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'Song', 	subcategory= 'Config', 	event_type= 'param', 	id= 'crow_out_4', 	name= 'Crow out 4', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'Song', 	subcategory= 'Config', 	event_type= 'param', 	id= 'crow_clock_index', 	name= 'Crow clock', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'Song', 	subcategory= 'Config', 	event_type= 'param', 	id= 'crow_clock_swing', 	name= 'Crow swing', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'Song', 	subcategory= 'Generator', 	event_type= 'param', 	id= 'chord_generator', 	name= 'Chord algo', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'Song', 	subcategory= 'Generator', 	event_type= 'param', 	id= 'seq_generator', 	name= 'Seq algo', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'Song', 	subcategory= 'Generator', 	event_type= 'function', 	id= 'event_chord_gen', 	name= 'Chord gen', 	value_type= 'trigger', 	action= 'event_chord_gen()', 		})
table.insert(events_lookup, {	category= 'Song', 	subcategory= 'Generator', 	event_type= 'function', 	id= 'event_seq_gen', 	name= 'Seq gen', 	value_type= 'trigger', 	action= 'event_seq_gen()', 		})
table.insert(events_lookup, {	category= 'Song', 	subcategory= 'Generator', 	event_type= 'function', 	id= 'event_gen', 	name= 'C+S gen', 	value_type= 'trigger', 	action= 'event_gen()', 		})
-- Chord									
table.insert(events_lookup, {	category= 'Chord', 	subcategory= 'Pattern', 	event_type= 'param', 	id= 'chord_div_index', 	name= 'Step length', 	value_type= 'continuous', 		order= '1', 	})
table.insert(events_lookup, {	category= 'Chord', 	subcategory= 'Pattern', 	event_type= 'param', 	id= 'chord_pattern_length', 	name= 'Pattern length', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'Chord', 	subcategory= 'Config', 	event_type= 'param', 	id= 'chord_voice', 	name= 'Voice', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'Chord', 	subcategory= 'Config', 	event_type= 'param', 	id= 'chord_channel', 	name= 'Channel', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'Chord', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'chord_type', 	name= 'Chord type', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'Chord', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'chord_octave', 	name= 'Octave', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'Chord', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'chord_range', 	name= 'Range', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'Chord', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'chord_max_notes', 	name= 'Max notes', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'Chord', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'chord_inversion', 	name= 'Inversion', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'Chord', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'chord_duration_index', 	name= 'Duration', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'Chord', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'chord_swing', 	name= 'Swing', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'Chord', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'chord_dynamics', 	name= 'Dynamics', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'Chord', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'chord_dynamics_ramp', 	name= 'Ramp (dynamics)', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'Chord', 	subcategory= 'Strum', 	event_type= 'param', 	id= 'chord_style', 	name= 'Strum', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'Chord', 	subcategory= 'Strum', 	event_type= 'param', 	id= 'chord_strum_length', 	name= 'Strum length', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'Chord', 	subcategory= 'Strum', 	event_type= 'param', 	id= 'chord_timing_curve', 	name= 'Strum curve', 	value_type= 'continuous', 			})
-- Seq 1									
for seq_no = 1, max_seqs do									
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Config', 	event_type= 'param', 	id= "seq_mute_" .. seq_no, 	name= 'Play/mute', 	value_type= 'continuous', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Config', 	event_type= 'param', 	id= "seq_voice_" .. seq_no, 	name= 'Voice', 	value_type= 'continuous', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Config', 	event_type= 'param', 	id= "seq_channel_" .. seq_no, 	name= 'Channel', 	value_type= 'continuous', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Config', 	event_type= 'param', 	id= "seq_note_priority_" .. seq_no, 	name= 'Priority', 	value_type= 'continuous', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Config', 	event_type= 'param', 	id= "seq_polyphony_" .. seq_no, 	name= 'Polyphony', 	value_type= 'continuous', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Config', 	event_type= 'param', 	id= "seq_start_on_" .. seq_no, 	name= 'Start', 	value_type= 'continuous', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Config', 	event_type= 'param', 	id= "seq_reset_on_" .. seq_no, 	name= 'Reset', 	value_type= 'continuous', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Config', 	event_type= 'param', 	id= "seq_pattern_change_" .. seq_no, 	name= 'Change', 	value_type= 'continuous', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Pattern', 	event_type= 'param', 	id= "seq_pattern_" .. seq_no, 	name= 'Pattern', 	value_type= 'continuous', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Pattern', 	event_type= 'param', 	id= "seq_pattern_length_" .. seq_no, 	name= 'Pattern length', 	value_type= 'continuous', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Pattern', 	event_type= 'param', 	id= "seq_start_" .. seq_no, 	name= 'Trigger start', 	value_type= 'trigger', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Pattern', 	event_type= 'param', 	id= "seq_reset_" .. seq_no, 	name= 'Trigger reset', 	value_type= 'trigger', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Pattern', 	event_type= 'param', 	id= "seq_div_index_" .. seq_no, 	name= 'Step length', 	value_type= 'continuous', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Pattern', 	event_type= 'param', 	id= "seq_pattern_rotate_" .. seq_no, 	name= 'Pattern ↑↓', 	value_type= 'continuous', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Pattern', 	event_type= 'param', 	id= "seq_loop_rotate_" .. seq_no, 	name= 'Loop ↑↓', 	value_type= 'continuous', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Pattern', 	event_type= 'param', 	id= "seq_shift_" .. seq_no, 	name= 'Pattern shift', 	value_type= 'continuous', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Pattern', 	event_type= 'function', 	id= "shuffle_seq_" .. seq_no, 	name= 'Pattern shuffle', 	value_type= 'trigger', 	action= "shuffle_seq(" .. seq_no .. ")", 		})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Notes', 	event_type= 'param', 	id= "seq_note_map_" .. seq_no, 	name= 'Notes', 	value_type= 'continuous', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Notes', 	event_type= 'param', 	id= "seq_octave_" .. seq_no, 	name= 'Octave', 	value_type= 'continuous', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Notes', 	event_type= 'param', 	id= "seq_duration_index_" .. seq_no, 	name= 'Duration', 	value_type= 'continuous', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Notes', 	event_type= 'param', 	id= "seq_swing_" .. seq_no, 	name= 'Swing', 	value_type= 'continuous', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Notes', 	event_type= 'param', 	id= "seq_accent_" .. seq_no, 	name= 'Accent', 	value_type= 'continuous', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Notes', 	event_type= 'param', 	id= "seq_dynamics_" .. seq_no, 	name= 'Dynamics', 	value_type= 'continuous', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Notes', 	event_type= 'param', 	id= "seq_probability_" .. seq_no, 	name= 'Probability', 	value_type= 'continuous', 			})
end									
-- MIDI harmonizer									
table.insert(events_lookup, {	category= 'MIDI harmonizer', 	subcategory= 'Config', 	event_type= 'param', 	id= 'midi_voice', 	name= 'Voice', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'MIDI harmonizer', 	subcategory= 'Config', 	event_type= 'param', 	id= 'midi_channel', 	name= 'Channel', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'MIDI harmonizer', 	subcategory= 'Config', 	event_type= 'param', 	id= 'midi_harmonizer_in_port', 	name= 'Port in', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'MIDI harmonizer', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'midi_note_map', 	name= 'Notes', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'MIDI harmonizer', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'midi_octave', 	name= 'Octave', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'MIDI harmonizer', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'midi_duration_index', 	name= 'Duration', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'MIDI harmonizer', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'midi_dynamics', 	name= 'Dynamics', 	value_type= 'continuous', 			})
-- CV harmonizer									
table.insert(events_lookup, {	category= 'CV harmonizer', 	subcategory= 'Config', 	event_type= 'param', 	id= 'crow_voice', 	name= 'Voice', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'CV harmonizer', 	subcategory= 'Config', 	event_type= 'param', 	id= 'crow_channel', 	name= 'Channel', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'CV harmonizer', 	subcategory= 'Config', 	event_type= 'param', 	id= 'crow_div_index', 	name= 'Trigger', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'CV harmonizer', 	subcategory= 'Config', 	event_type= 'param', 	id= 'crow_auto_rest', 	name= 'Auto-rest', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'CV harmonizer', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'crow_note_map', 	name= 'Notes', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'CV harmonizer', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'crow_octave', 	name= 'Octave', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'CV harmonizer', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'crow_duration_index', 	name= 'Duration', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'CV harmonizer', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'cv_harm_swing', 	name= 'Swing', 	value_type= 'continuous', 			})
table.insert(events_lookup, {	category= 'CV harmonizer', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'crow_dynamics', 	name= 'Dynamics', 	value_type= 'continuous', 			})
-- Crow events									
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 1', 	event_type= 'function', 	id= 'crow_trigger_1', 	name= 'Trigger', 	value_type= 'trigger', 	action= 'crow_trigger(1)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 1', 	event_type= 'param', 	id= 'crow_gate_1', 	name= 'Gate', 	value_type= 'continuous', 	action= 'crow.output[1].volts = params:get("crow_gate_1") * 10', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 1', 	event_type= 'param', 	id= 'crow_v_10_1', 	name= '1/10v increments', 	value_type= 'continuous', 	action= 'crow_v(1, params:get("crow_v_10_1")/10)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 1', 	event_type= 'param', 	id= 'crow_v_12_1', 	name= '1/12v increments', 	value_type= 'continuous', 	action= 'crow_v(1, params:get("crow_v_12_1")/12)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 1', 	event_type= 'param', 	id= 'crow_v_100_1', 	name= '1/100v increments', 	value_type= 'continuous', 	action= 'crow_v(1, params:get("crow_v_100_1")/100)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 1', 	event_type= 'param', 	id= 'crow_v_1000_1', 	name= '1/1000v increments', 	value_type= 'continuous', 	action= 'crow_v(1, params:get("crow_v_1000_1")/1000)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 1', 	event_type= 'param', 	id= 'crow_5v_8_steps_1', 	name= '5v 8-steps', 	value_type= 'continuous', 	action= 'crow_v_stepped(1, 5, 8, params:get("crow_5v_8_steps_1"))', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 2', 	event_type= 'function', 	id= 'crow_trigger_2', 	name= 'Trigger out', 	value_type= 'trigger', 	action= 'crow_trigger(2)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 2', 	event_type= 'param', 	id= 'crow_gate_2', 	name= 'Gate', 	value_type= 'continuous', 	action= 'crow.output[2].volts = params:get("crow_gate_2") * 10', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 2', 	event_type= 'param', 	id= 'crow_v_10_2', 	name= '1/10v increments', 	value_type= 'continuous', 	action= 'crow_v(2, params:get("crow_v_10_2")/10)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 2', 	event_type= 'param', 	id= 'crow_v_12_2', 	name= '1/12v increments', 	value_type= 'continuous', 	action= 'crow_v(2, params:get("crow_v_12_2")/12)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 2', 	event_type= 'param', 	id= 'crow_v_100_2', 	name= '1/100v increments', 	value_type= 'continuous', 	action= 'crow_v(2, params:get("crow_v_100_2")/100)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 2', 	event_type= 'param', 	id= 'crow_v_1000_2', 	name= '1/1000v increments', 	value_type= 'continuous', 	action= 'crow_v(2, params:get("crow_v_1000_2")/1000)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 2', 	event_type= 'param', 	id= 'crow_5v_8_steps_2', 	name= '5v 8-steps', 	value_type= 'continuous', 	action= 'crow_v_stepped(2, 5, 8, params:get("crow_5v_8_steps_2"))', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 3', 	event_type= 'function', 	id= 'crow_trigger_3', 	name= 'Trigger out', 	value_type= 'trigger', 	action= 'crow_trigger(3)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 3', 	event_type= 'param', 	id= 'crow_gate_3', 	name= 'Gate', 	value_type= 'continuous', 	action= 'crow.output[3].volts = params:get("crow_gate_3") * 10', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 3', 	event_type= 'param', 	id= 'crow_v_10_3', 	name= '1/10v increments', 	value_type= 'continuous', 	action= 'crow_v(3, params:get("crow_v_10_3")/10)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 3', 	event_type= 'param', 	id= 'crow_v_12_3', 	name= '1/12v increments', 	value_type= 'continuous', 	action= 'crow_v(3, params:get("crow_v_12_3")/12)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 3', 	event_type= 'param', 	id= 'crow_v_100_3', 	name= '1/100v increments', 	value_type= 'continuous', 	action= 'crow_v(3, params:get("crow_v_100_3")/100)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 3', 	event_type= 'param', 	id= 'crow_v_1000_3', 	name= '1/1000v increments', 	value_type= 'continuous', 	action= 'crow_v(3, params:get("crow_v_1000_3")/1000)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 3', 	event_type= 'param', 	id= 'crow_5v_8_steps_3', 	name= '5v 8-steps', 	value_type= 'continuous', 	action= 'crow_v_stepped(2, 5, 8, params:get("crow_5v_8_steps_2"))', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 4', 	event_type= 'function', 	id= 'crow_trigger_4', 	name= 'Trigger out', 	value_type= 'trigger', 	action= 'crow_trigger(4)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 4', 	event_type= 'param', 	id= 'crow_gate_4', 	name= 'Gate', 	value_type= 'continuous', 	action= 'crow.output[4].volts = params:get("crow_gate_4") * 10', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 4', 	event_type= 'param', 	id= 'crow_v_10_4', 	name= '1/10v increments', 	value_type= 'continuous', 	action= 'crow_v(4, params:get("crow_v_10_4")/10)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 4', 	event_type= 'param', 	id= 'crow_v_12_4', 	name= '1/12v increments', 	value_type= 'continuous', 	action= 'crow_v(4, params:get("crow_v_12_4")/12)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 4', 	event_type= 'param', 	id= 'crow_v_100_4', 	name= '1/100v increments', 	value_type= 'continuous', 	action= 'crow_v(4, params:get("crow_v_100_4")/100)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 4', 	event_type= 'param', 	id= 'crow_v_1000_4', 	name= '1/1000v increments', 	value_type= 'continuous', 	action= 'crow_v(4, params:get("crow_v_1000_4")/1000)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 4', 	event_type= 'param', 	id= 'crow_5v_8_steps_4', 	name= '5v 8-steps', 	value_type= 'continuous', 	action= 'crow_v_stepped(4, 5, 8, params:get("crow_5v_8_steps_4"))', 		})