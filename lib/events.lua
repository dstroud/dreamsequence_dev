events_lookup = {}								--
-- Song								
table.insert(events_lookup, {	category= 'Song', 	subcategory= 'Mood', 	event_type= 'param', 	id= 'mode', 	name= 'Scale', 			})
table.insert(events_lookup, {	category= 'Song', 	subcategory= 'Mood', 	event_type= 'param', 	id= 'transpose', 	name= 'Key', 			})
table.insert(events_lookup, {	category= 'Song', 	subcategory= 'Mood', 	event_type= 'param', 	id= 'clock_tempo', 	name= 'Tempo', 			})
table.insert(events_lookup, {	category= 'Song', 	subcategory= 'Config', 	event_type= 'param', 	id= 'crow_out_1', 	name= 'Crow out 1', 			})
table.insert(events_lookup, {	category= 'Song', 	subcategory= 'Config', 	event_type= 'param', 	id= 'crow_out_2', 	name= 'Crow out 2', 			})
table.insert(events_lookup, {	category= 'Song', 	subcategory= 'Config', 	event_type= 'param', 	id= 'crow_out_3', 	name= 'Crow out 3', 			})
table.insert(events_lookup, {	category= 'Song', 	subcategory= 'Config', 	event_type= 'param', 	id= 'crow_out_4', 	name= 'Crow out 4', 			})
table.insert(events_lookup, {	category= 'Song', 	subcategory= 'Config', 	event_type= 'param', 	id= 'crow_clock_index', 	name= 'Crow clock', 			})
table.insert(events_lookup, {	category= 'Song', 	subcategory= 'Config', 	event_type= 'param', 	id= 'crow_clock_swing', 	name= 'Crow swing', 			})
table.insert(events_lookup, {	category= 'Song', 	subcategory= 'Generator', 	event_type= 'param', 	id= 'chord_generator', 	name= 'Chord algo', 			})
table.insert(events_lookup, {	category= 'Song', 	subcategory= 'Generator', 	event_type= 'param', 	id= 'seq_generator', 	name= 'Seq algo', 			})
table.insert(events_lookup, {	category= 'Song', 	subcategory= 'Generator', 	event_type= 'function', 	id= 'event_chord_gen', 	name= 'Chord gen', 	action= 'event_chord_gen()', 		})
table.insert(events_lookup, {	category= 'Song', 	subcategory= 'Generator', 	event_type= 'function', 	id= 'event_seq_gen', 	name= 'Seq gen', 	action= 'event_seq_gen()', 		})
table.insert(events_lookup, {	category= 'Song', 	subcategory= 'Generator', 	event_type= 'function', 	id= 'event_gen', 	name= 'C+S gen', 	action= 'event_gen()', 		})
-- Chord								
table.insert(events_lookup, {	category= 'Chord', 	subcategory= 'Pattern', 	event_type= 'param', 	id= 'chord_div_index', 	name= 'Step length', 		order= '1', 	})
table.insert(events_lookup, {	category= 'Chord', 	subcategory= 'Pattern', 	event_type= 'param', 	id= 'chord_pattern_length', 	name= 'Pattern length', 			})
table.insert(events_lookup, {	category= 'Chord', 	subcategory= 'Config', 	event_type= 'param', 	id= 'chord_mute', 	name= 'Play/mute', 			})
table.insert(events_lookup, {	category= 'Chord', 	subcategory= 'Config', 	event_type= 'param', 	id= 'chord_voice', 	name= 'Voice', 			})
table.insert(events_lookup, {	category= 'Chord', 	subcategory= 'Config', 	event_type= 'param', 	id= 'chord_channel', 	name= 'Channel', 			})
table.insert(events_lookup, {	category= 'Chord', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'chord_octave', 	name= 'Octave', 			})
table.insert(events_lookup, {	category= 'Chord', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'chord_range', 	name= 'Range', 			})
table.insert(events_lookup, {	category= 'Chord', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'chord_notes', 	name= 'Notes', 			})
table.insert(events_lookup, {	category= 'Chord', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'chord_inversion', 	name= 'Inversion', 			})
table.insert(events_lookup, {	category= 'Chord', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'chord_duration_index', 	name= 'Duration', 			})
table.insert(events_lookup, {	category= 'Chord', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'chord_swing', 	name= 'Swing', 			})
table.insert(events_lookup, {	category= 'Chord', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'chord_dynamics', 	name= 'Dynamics', 			})
table.insert(events_lookup, {	category= 'Chord', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'chord_dynamics_ramp', 	name= 'Ramp (dynamics)', 			})
table.insert(events_lookup, {	category= 'Chord', 	subcategory= 'Strum', 	event_type= 'param', 	id= 'chord_style', 	name= 'Strum', 			})
table.insert(events_lookup, {	category= 'Chord', 	subcategory= 'Strum', 	event_type= 'param', 	id= 'chord_strum_length', 	name= 'Strum length', 			})
table.insert(events_lookup, {	category= 'Chord', 	subcategory= 'Strum', 	event_type= 'param', 	id= 'chord_timing_curve', 	name= 'Strum curve', 			})
-- Seq 1								
for seq_no = 1, max_seqs do								
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Config', 	event_type= 'param', 	id= "seq_mute_" .. seq_no, 	name= 'Play/mute', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Config', 	event_type= 'param', 	id= "seq_voice_" .. seq_no, 	name= 'Voice', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Config', 	event_type= 'param', 	id= "seq_channel_" .. seq_no, 	name= 'Channel', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Config', 	event_type= 'param', 	id= "seq_note_priority_" .. seq_no, 	name= 'Priority', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Config', 	event_type= 'param', 	id= "seq_polyphony_" .. seq_no, 	name= 'Polyphony', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Config', 	event_type= 'param', 	id= "seq_start_on_" .. seq_no, 	name= 'Start', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Config', 	event_type= 'param', 	id= "seq_reset_on_" .. seq_no, 	name= 'Reset', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Config', 	event_type= 'param', 	id= "seq_pattern_change_" .. seq_no, 	name= 'Change', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Pattern', 	event_type= 'param', 	id= "seq_pattern_" .. seq_no, 	name= 'Pattern', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Pattern', 	event_type= 'param', 	id= "seq_pattern_length_" .. seq_no, 	name= 'Pattern length', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Pattern', 	event_type= 'param', 	id= "seq_start_" .. seq_no, 	name= 'Trigger start', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Pattern', 	event_type= 'param', 	id= "seq_reset_" .. seq_no, 	name= 'Trigger reset', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Pattern', 	event_type= 'param', 	id= "seq_div_index_" .. seq_no, 	name= 'Step length', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Pattern', 	event_type= 'param', 	id= "seq_pattern_rotate_" .. seq_no, 	name= 'Pattern ↑↓', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Pattern', 	event_type= 'param', 	id= "seq_loop_rotate_" .. seq_no, 	name= 'Loop ↑↓', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Pattern', 	event_type= 'param', 	id= "seq_shift_" .. seq_no, 	name= 'Pattern shift', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Pattern', 	event_type= 'function', 	id= "shuffle_seq_" .. seq_no, 	name= 'Pattern shuffle', 	action= "shuffle_seq(" .. seq_no .. ")", 		})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Notes', 	event_type= 'param', 	id= "seq_note_map_" .. seq_no, 	name= 'Notes', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Notes', 	event_type= 'param', 	id= "seq_octave_" .. seq_no, 	name= 'Octave', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Notes', 	event_type= 'param', 	id= "seq_duration_index_" .. seq_no, 	name= 'Duration', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Notes', 	event_type= 'param', 	id= "seq_swing_" .. seq_no, 	name= 'Swing', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Notes', 	event_type= 'param', 	id= "seq_accent_" .. seq_no, 	name= 'Accent', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Notes', 	event_type= 'param', 	id= "seq_dynamics_" .. seq_no, 	name= 'Dynamics', 			})
  table.insert(events_lookup, {	category = "Seq " .. seq_no, 	subcategory= 'Notes', 	event_type= 'param', 	id= "seq_probability_" .. seq_no, 	name= 'Probability', 			})
end								
-- MIDI harmonizer								
table.insert(events_lookup, {	category= 'MIDI in', 	subcategory= 'Config', 	event_type= 'param', 	id= 'midi_voice', 	name= 'Voice', 			})
table.insert(events_lookup, {	category= 'MIDI in', 	subcategory= 'Config', 	event_type= 'param', 	id= 'midi_channel', 	name= 'Channel', 			})
table.insert(events_lookup, {	category= 'MIDI in', 	subcategory= 'Config', 	event_type= 'param', 	id= 'midi_harmonizer_in_port', 	name= 'Port in', 			})
table.insert(events_lookup, {	category= 'MIDI in', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'midi_note_map', 	name= 'Notes', 			})
table.insert(events_lookup, {	category= 'MIDI in', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'midi_octave', 	name= 'Octave', 			})
table.insert(events_lookup, {	category= 'MIDI in', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'midi_duration_index', 	name= 'Duration', 			})
table.insert(events_lookup, {	category= 'MIDI in', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'midi_dynamics', 	name= 'Dynamics', 			})
-- CV harmonizer								
table.insert(events_lookup, {	category= 'CV in', 	subcategory= 'Config', 	event_type= 'param', 	id= 'crow_voice', 	name= 'Voice', 			})
table.insert(events_lookup, {	category= 'CV in', 	subcategory= 'Config', 	event_type= 'param', 	id= 'crow_channel', 	name= 'Channel', 			})
table.insert(events_lookup, {	category= 'CV in', 	subcategory= 'Config', 	event_type= 'param', 	id= 'crow_div_index', 	name= 'Trigger', 			})
table.insert(events_lookup, {	category= 'CV in', 	subcategory= 'Config', 	event_type= 'param', 	id= 'crow_auto_rest', 	name= 'Auto-rest', 			})
table.insert(events_lookup, {	category= 'CV in', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'crow_note_map', 	name= 'Notes', 			})
table.insert(events_lookup, {	category= 'CV in', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'crow_octave', 	name= 'Octave', 			})
table.insert(events_lookup, {	category= 'CV in', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'crow_duration_index', 	name= 'Duration', 			})
table.insert(events_lookup, {	category= 'CV in', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'cv_harm_swing', 	name= 'Swing', 			})
table.insert(events_lookup, {	category= 'CV in', 	subcategory= 'Notes', 	event_type= 'param', 	id= 'crow_dynamics', 	name= 'Dynamics', 			})
-- Crow events								
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 1', 	event_type= 'function', 	id= 'crow_trigger_1', 	name= 'Trigger', 	action= 'crow_trigger(1)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 1', 	event_type= 'param', 	id= 'crow_gate_1', 	name= 'Gate', 	action= 'crow.output[1].volts = params:get("crow_gate_1") * 10', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 1', 	event_type= 'param', 	id= 'crow_v_10_1', 	name= '1/10v increments', 	action= 'crow_v(1, params:get("crow_v_10_1")/10)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 1', 	event_type= 'param', 	id= 'crow_v_12_1', 	name= '1/12v increments', 	action= 'crow_v(1, params:get("crow_v_12_1")/12)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 1', 	event_type= 'param', 	id= 'crow_v_100_1', 	name= '1/100v increments', 	action= 'crow_v(1, params:get("crow_v_100_1")/100)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 1', 	event_type= 'param', 	id= 'crow_v_1000_1', 	name= '1/1000v increments', 	action= 'crow_v(1, params:get("crow_v_1000_1")/1000)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 1', 	event_type= 'param', 	id= 'crow_5v_8_steps_1', 	name= '5v 8-steps', 	action= 'crow_v_stepped(1, 5, 8, params:get("crow_5v_8_steps_1"))', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 2', 	event_type= 'function', 	id= 'crow_trigger_2', 	name= 'Trigger out', 	action= 'crow_trigger(2)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 2', 	event_type= 'param', 	id= 'crow_gate_2', 	name= 'Gate', 	action= 'crow.output[2].volts = params:get("crow_gate_2") * 10', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 2', 	event_type= 'param', 	id= 'crow_v_10_2', 	name= '1/10v increments', 	action= 'crow_v(2, params:get("crow_v_10_2")/10)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 2', 	event_type= 'param', 	id= 'crow_v_12_2', 	name= '1/12v increments', 	action= 'crow_v(2, params:get("crow_v_12_2")/12)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 2', 	event_type= 'param', 	id= 'crow_v_100_2', 	name= '1/100v increments', 	action= 'crow_v(2, params:get("crow_v_100_2")/100)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 2', 	event_type= 'param', 	id= 'crow_v_1000_2', 	name= '1/1000v increments', 	action= 'crow_v(2, params:get("crow_v_1000_2")/1000)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 2', 	event_type= 'param', 	id= 'crow_5v_8_steps_2', 	name= '5v 8-steps', 	action= 'crow_v_stepped(2, 5, 8, params:get("crow_5v_8_steps_2"))', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 3', 	event_type= 'function', 	id= 'crow_trigger_3', 	name= 'Trigger out', 	action= 'crow_trigger(3)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 3', 	event_type= 'param', 	id= 'crow_gate_3', 	name= 'Gate', 	action= 'crow.output[3].volts = params:get("crow_gate_3") * 10', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 3', 	event_type= 'param', 	id= 'crow_v_10_3', 	name= '1/10v increments', 	action= 'crow_v(3, params:get("crow_v_10_3")/10)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 3', 	event_type= 'param', 	id= 'crow_v_12_3', 	name= '1/12v increments', 	action= 'crow_v(3, params:get("crow_v_12_3")/12)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 3', 	event_type= 'param', 	id= 'crow_v_100_3', 	name= '1/100v increments', 	action= 'crow_v(3, params:get("crow_v_100_3")/100)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 3', 	event_type= 'param', 	id= 'crow_v_1000_3', 	name= '1/1000v increments', 	action= 'crow_v(3, params:get("crow_v_1000_3")/1000)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 3', 	event_type= 'param', 	id= 'crow_5v_8_steps_3', 	name= '5v 8-steps', 	action= 'crow_v_stepped(2, 5, 8, params:get("crow_5v_8_steps_2"))', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 4', 	event_type= 'function', 	id= 'crow_trigger_4', 	name= 'Trigger out', 	action= 'crow_trigger(4)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 4', 	event_type= 'param', 	id= 'crow_gate_4', 	name= 'Gate', 	action= 'crow.output[4].volts = params:get("crow_gate_4") * 10', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 4', 	event_type= 'param', 	id= 'crow_v_10_4', 	name= '1/10v increments', 	action= 'crow_v(4, params:get("crow_v_10_4")/10)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 4', 	event_type= 'param', 	id= 'crow_v_12_4', 	name= '1/12v increments', 	action= 'crow_v(4, params:get("crow_v_12_4")/12)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 4', 	event_type= 'param', 	id= 'crow_v_100_4', 	name= '1/100v increments', 	action= 'crow_v(4, params:get("crow_v_100_4")/100)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 4', 	event_type= 'param', 	id= 'crow_v_1000_4', 	name= '1/1000v increments', 	action= 'crow_v(4, params:get("crow_v_1000_4")/1000)', 		})
table.insert(events_lookup, {	category= 'Crow events', 	subcategory= 'Out 4', 	event_type= 'param', 	id= 'crow_5v_8_steps_4', 	name= '5v 8-steps', 	action= 'crow_v_stepped(4, 5, 8, params:get("crow_5v_8_steps_4"))', 		})