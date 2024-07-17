theory = {}

--#region chords

-- TODO reorder these:
-- extended list of chords, intervals
-- "quality" is technically quality+extension+alterations, used to append to chord letter
theory.chords = {
  {name = "Major", quality = "", short = "", alt_names = {"Maj"}, intervals = {0, 4, 7}}, -- blank quality!
  {name = "Minor", quality = "m", short = "m", alt_names = {"Min"}, intervals = {0, 3, 7}},

  {name = "Sus2", quality = "sus2", short = "ˢᵘˢ²", intervals = {0, 2, 7}},

  -- this sounds pretty good but apparently is not common per https://strungoutfretnot.com/2010/06/15/chord-theory-4-sus-chords/
  -- It is also uncommon to add a seventh to a sus2 chord. Sus2 chords do not have the harmonic momentum found in sus4 chords 
  -- – adding an extra note on top would only further weaken the suspended effect and harmonic momentum.
  {name = "Seventh sus2", quality = "7sus2", short = "⁷ˢᵘˢ²", intervals = {0, 2, 7, 10}}, -- some suggestion this is not common but it sounds good to me
  {name = "Sus4", quality = "sus", short = "ˢᵘˢ⁴", intervals = {0, 5, 7}},                  -- implied 4 in short quality
  {name = "Seventh sus4", quality = "7sus", short = "⁷ˢᵘˢ⁴", intervals = {0, 5, 7, 10}}, -- 2024-07-15 implied 4 in short quality

  -- {name = "Ninth sus4", quality = "9sus", intervals = {0, 5, 7, 10, 14}}, -- 2024-07-15 implied 4 in short quality
  -- no Eleventh sus4 as that's the 4th raised an octave
  -- {name = "Thirteenth sus4", quality = "13sus", intervals = {0, 5, 7, 10, 14, 20}}, -- SOUNDS LIKE ASS LOL


  {name = "Major 6", quality = "6", short = "⁶", alt_names = {"Maj6"}, intervals = {0, 4, 7, 9}}, -- convention omits M as there is no need to differentiate M/dominant

  {name = "Major 7", quality = "M7", short = "ᴹ⁷", alt_names = {"Maj7"}, intervals = {0, 4, 7, 11}},
  {name = "Major 69", quality = "69", short = "ᴹ⁶⁹", alt_names = {"Maj69"}, intervals = {0, 4, 7, 9, 14}},
  {name = "Major 9", quality = "M9", short = "ᴹ⁹", alt_names = {"Maj9"}, intervals = {0, 4, 7, 11, 14}},
  {name = "Major 11", quality = "M11", short = "ᴹ¹¹", alt_names = {"Maj11"}, intervals = {0, 4, 7, 11, 14, 17}},
  {name = "Major 13", quality = "M13", short = "ᴹ¹³", alt_names = {"Maj13"}, intervals = {0, 4, 7, 11, 14, 17, 21}},
  {name = "Dominant 7", quality = "7", short = "⁷", intervals = {0, 4, 7, 10}},
  {name = "Ninth", quality = "9", short = "⁹", intervals = {0, 4, 7, 10, 14}}, -- Dominant 7th chord with extension
  {name = "Eleventh", quality = "11", short = "¹¹", intervals = {0, 4, 7, 10, 14, 17}}, -- Dominant 7th chord with extension
  {name = "Thirteenth", quality = "13", short = "¹³", intervals = {0, 4, 7, 10, 14, 17, 21}}, -- Dominant 7th chord with extension
  {name = "Augmented", quality = "+", short = "⁺", intervals = {0, 4, 8}},
  {name = "Augmented 7", quality = "+7", short = "⁺⁷", intervals = {0, 4, 8, 10}},


  {name = "Minor Major 7", quality = "m♮7", short = "mᴹ⁷", alt_names = {"MinMaj7"}, intervals = {0, 3, 7, 11}}, -- or mM7 but benefits from superscript
  {name = "Minor 6", quality = "m6", short = "m⁶", alt_names = {"Min6"}, intervals = {0, 3, 7, 9}},
  {name = "Minor 7", quality = "m7", short = "m⁷", alt_names = {"Min7"}, intervals = {0, 3, 7, 10}},
  {name = "Minor 69", quality = "m69", short = "m⁶⁹", alt_names = {"Min69"}, intervals = {0, 3, 7, 9, 14}},
  {name = "Minor 9", quality = "m9", short = "m⁹", alt_names = {"Min9"}, intervals = {0, 3, 7, 10, 14}},
  {name = "Minor 11", quality = "m11", short = "m¹¹", alt_names = {"Min11"}, intervals = {0, 3, 7, 10, 14, 17}},
  {name = "Minor 13", quality = "m13", short = "¹³", alt_names = {"Min13"}, intervals = {0, 3, 7, 10, 14, 17, 21}},
  {name = "Diminished", quality = "°", short = "", alt_names = {"Dim"}, intervals = {0, 3, 6}}, -- superscript dim symbol in norns.ttf
  {name = "Diminished 7", quality = "°7", short = "°⁷", alt_names = {"Dim7"}, intervals = {0, 3, 6, 9}},
  {name = "Half Diminished 7", quality = "ø7", short = "⁷", alt_names = {"Min7b5"}, intervals = {0, 3, 6, 10}}, -- superscript half-dim symbol in norns.ttf
  {name = "Augmented Major 7", quality = "+M7", short = "⁺ᴹ⁷", alt_names = {"Maj7#5"}, intervals = {0, 4, 8, 11}},
}
-- Base data from https://github.com/fredericcormier/WesternMusicElements, extended by @dstroud


-- todo technically not needed except for roman numerals lookup
-- lookup for chord degrees and qualities, mirroring musicutil.SCALE_CHORD_DEGREES with breakout for chord roman numeral and "quality"
-- indices 1-7 are triads, 8-14 are 7ths
theory.chord_degree = {
  {
    name = "Major",
    numeral = {
      "I",  "ii",  "iii",  "IV",  "V",  "vi",  "vii",
      "I",  "ii",  "iii",  "IV",  "V",  "vi",  "vii"
    },
    chords = {
      "I",  "ii",  "iii",  "IV",  "V",  "vi",  "vii°",
      "IM7", "ii7", "iii7", "IVM7", "V7", "vi7", "viiø7"
    },
    quality = {
      "",  "m",  "m",  "",  "",  "m",  "°",
      "M7", "m7", "m7", "M7", "7", "m7", "ø7"
    }
  },
  {
    name = "Natural Minor",
    numeral = {
      "i",  "ii",  "III",  "iv",  "v",  "VI",  "VII",
      "i",  "ii",  "III",  "iv",  "v",  "VI",  "VII"
    },
    chords = {
      "i",  "ii°",  "III",  "iv",  "v",  "VI",  "VII",
      "i7", "iiø7", "IIIM7", "iv7", "v7", "VIM7", "VII7"
    },
    quality = {
      "m",  "°",  "",  "m",  "m",  "",  "",
      "m7", "ø7", "M7", "m7", "m7", "M7", "7"
    }
  },
  {
    name = "Harmonic Minor",
    numeral = {
      "i",  "ii",  "III",  "iv",  "V",  "VI",  "vii",
      "i",  "ii",  "III",  "iv",  "V",  "VI",  "vii"
    },
    chords = {
      "i",  "ii°",  "III+",  "iv",  "V",  "VI",  "vii°",
      "i♮7", "iiø7", "III+M7", "iv7", "V7", "VIM7", "vii°7"
    },
    quality = {
      "m",  "°",  "+",  "m",  "",  "",  "°",
      "m♮7", "ø7", "+M7", "m7", "7", "M7", "°7"
    }
  },
  {
    name = "Melodic Minor",
    numeral = {
      "i",  "ii",  "III",  "IV",  "V",  "vi",  "vii",
      "i",  "ii",  "III",  "IV",  "V",  "vi",  "vii"
    },
    chords = {
      "i",  "ii",  "III+",  "IV",  "V",  "vi°",  "vii°",
      "i♮7", "ii7", "III+M7", "IV7", "V7", "viø7", "viiø7"
    },
    quality = {
      "m",  "m",  "+",  "",  "",  "°",  "°",
      "m♮7", "m7", "+M7", "7", "7", "ø7", "ø7"
    }
  },
  {
    name = "Dorian",
    numeral = {
      "i",  "ii",  "III",  "IV",  "v",  "vi",  "VII",
      "i",  "ii",  "III",  "IV",  "v",  "vi",  "VII"
    },
    chords = {
      "i",  "ii",  "III",  "IV",  "v",  "vi°",  "VII",
      "i7", "ii7", "IIIM7", "IV7", "v7", "viø7", "VIIM7"
    },
    quality = {
      "m",  "m",  "",  "",  "m",  "°",  "",
      "m7", "m7", "M7", "7", "m7", "ø7", "M7"
    }
  },
  {
    name = "Phrygian",
    numeral = {
      "i",  "II",  "III",  "iv",  "v",  "VI",  "vii",
      "i",  "II",  "III",  "iv",  "v",  "VI",  "vii"
    },
    chords = {
      "i",  "II",  "III",  "iv",  "v°",  "VI",  "vii",
      "i7", "IIM7", "III7", "iv7", "vø7", "VIM7", "vii7"
    },
    quality = {
      "m",  "",  "",  "m",  "°",  "",  "m",
      "m7", "M7", "7", "m7", "ø7", "M7", "m7"
    }
  },
  {
    name = "Lydian",
    numeral = {
      "I",  "II",  "iii",  "iv",  "V",  "vi",  "vii",
      "I",  "II",  "iii",  "iv",  "V",  "vi",  "vii"
    },
    chords = {
      "I",  "II",  "iii",  "iv°",  "V",  "vi",  "vii",
      "IM7", "II7", "iii7", "ivø7", "VM7", "vi7", "vii7"
    },
    quality = {
      "",  "",  "m",  "°",  "",  "m",  "m",
      "M7", "7", "m7", "ø7", "M7", "m7", "m7"
    }
  },
  {
    name = "Mixolydian",
    numeral = {
      "I",  "ii",  "iii",  "IV",  "v",  "vi",  "VII",
      "I",  "ii",  "iii",  "IV",  "v",  "vi",  "VII"
    },
    chords = {
      "I",  "ii",  "iii°",  "IV",  "v",  "vi",  "VII",
      "I7", "ii7", "iiiø7", "IVM7", "v7", "vi7", "VIIM7"
    },
    quality = {
      "",  "m",  "°",  "",  "m",  "m",  "",
      "7", "m7", "ø7", "M7", "m7", "m7", "M7"
    }
  },
  {
    name = "Locrian",
    numeral = {
      "i",  "II",  "iii",  "iv",  "V",  "VI",  "vii",
      "i",  "II",  "iii",  "iv",  "V",  "VI",  "vii",
    },
    chords = {
      "i°",  "II",  "iii",  "iv",  "V",  "VI",  "vii",
      "iø7", "IIM7", "iii7", "iv7", "VM7", "VI7", "vii7"
    },
    quality = {
      "°",  "",  "m",  "m",  "",  "",  "m",
      "ø7", "M7", "m7", "m7", "M7", "7", "m7"
    }
  },
}


-- for converting between enharmonically equivalent chord names
local chord_equivalent = {
  ["A♭"] = {sharp = "G#",    flat = "B♭♭♭", rank_sharp = 0, rank_flat = 1},
  ["A"] =  {sharp = "G##",   flat = "B♭♭",  rank_sharp = 1, rank_flat = 1},
  ["A#"] = {sharp = "G###",  flat = "B♭",   rank_sharp = 1, rank_flat = 0},

  ["B♭"] = {sharp = "A#",    flat = "C♭♭",  rank_sharp = 0, rank_flat = 1},
  ["B"] =  {sharp = "A##",   flat = "C♭",   rank_sharp = 1, rank_flat = 1},
  ["B#"] = {sharp = "A###",  flat = "C",    rank_sharp = 1, rank_flat = 0},

  ["C♭"] = {sharp = "B",     flat = "D♭♭♭", rank_sharp = 0, rank_flat = 1},
  ["C"] =  {sharp = "B#",    flat = "D♭♭",  rank_sharp = 1, rank_flat = 1},
  ["C#"] = {sharp = "B##",   flat = "D♭",   rank_sharp = 1, rank_flat = 0},

  ["D♭"] = {sharp = "C#",    flat = "E♭♭♭", rank_sharp = 0, rank_flat = 1},
  ["D"] =  {sharp = "C##",   flat = "E♭♭",  rank_sharp = 1, rank_flat = 1},
  ["D#"] = {sharp = "C###",  flat = "E♭",   rank_sharp = 1, rank_flat = 0},

  ["E♭"] = {sharp = "D#",    flat = "F♭♭",  rank_sharp = 0, rank_flat = 1},
  ["E"] =  {sharp = "D##",   flat = "F♭",   rank_sharp = 1, rank_flat = 1},
  ["E#"] = {sharp = "D###",  flat = "F",    rank_sharp = 1, rank_flat = 0},

  ["F♭"] = {sharp = "E",     flat = "G♭♭♭", rank_sharp = 0, rank_flat = 1},
  ["F"] =  {sharp = "E#",    flat = "G♭♭",  rank_sharp = 1, rank_flat = 1},
  ["F#"] = {sharp = "E##",   flat = "G♭",   rank_sharp = 1, rank_flat = 0},

  ["G♭"] = {sharp = "F#",    flat = "A♭♭♭", rank_sharp = 0, rank_flat = 1},
  ["G"] =  {sharp = "F##",   flat = "A♭♭",  rank_sharp = 1, rank_flat = 1},
  ["G#"] = {sharp = "F###",  flat = "A♭",   rank_sharp = 1, rank_flat = 0},
}


local function chord_offset(chord, offset)
  local chord_to_index = {A = 1, B = 2, C = 3, D = 4, E = 5, F = 6, G = 7}
  local index_to_chord = {"A", "B", "C", "D", "E", "F", "G"}
  return(index_to_chord[util.wrap(chord_to_index[chord] + offset, 1, 7)])
end


-- enforces the "alphabet rule" for chords and picks whichever key has fewer nonstandard chords (##, bb, B#, Cb, E#, Fb)
-- todo update to use theory lib and work with additional scales
local function gen_keys()
  theory.scale_chord_names = {}          -- chord names (letter + quality) for [mode][key]. 1-7 triad, 8-14 7th
  theory.scale_chord_letters = {}        -- chord letters for [mode][key]. 1-7 repeated for 8-14
  local chords_renamed = {}
  local letters = {}

  for mode = 1, 9 do
    theory.scale_chord_names[mode] = {}
    theory.scale_chord_letters[mode] = {}

    for transpose = 0, 11 do
      theory.scale_chord_names[mode][transpose] = {}
      theory.scale_chord_letters[mode][transpose] = {}
      chords_renamed = {["flat"] = {}, ["sharp"] = {}, ["flat_rank"] = 0, ["sharp_rank"] = 0}
      letters = {["flat"] = {}, ["sharp"] = {}}

      for _ , option in pairs({"flat", "sharp"}) do
        local prev_chord_name = nil
        local prev_letter = nil
        
        for chord_no = 1, 14 do
          local chord_name = musicutil.NOTE_NAMES[util.wrap((musicutil.SCALES[mode]["intervals"][util.wrap(chord_no, 1, 7)] + 1) + transpose, 1, 12)]
        
          if chord_no == 1 and option == "flat" and string.sub(chord_name, 2, 2) == "#" then
            chords_renamed[option .. "_rank"] = (chords_renamed[option .. "_rank"] or 0) + chord_equivalent[chord_name].rank_flat
            chord_name = chord_equivalent[chord_name].flat
          end

          local chord_letter = string.sub(chord_name, 1, 1)
          local equivalent = chord_equivalent[chord_name]
          local new_chord_name = chord_name
          local quality = theory.chord_degree[mode]["quality"][chord_no] -- todo replace with generated names

          if prev_chord_name then
            if prev_letter == chord_letter then
              new_chord_name = equivalent.flat
              chords_renamed[option .. "_rank"] = (chords_renamed[option .. "_rank"] or 0) + equivalent.rank_flat
            elseif prev_letter == chord_offset(chord_letter, -2) then
              new_chord_name = equivalent.sharp
              chords_renamed[option .. "_rank"] = (chords_renamed[option .. "_rank"] or 0) + equivalent.rank_sharp
            end
          end

          prev_chord_name = new_chord_name
          prev_letter = string.sub(new_chord_name, 1, 1)
          chords_renamed[option][chord_no] =  new_chord_name .. quality
          letters[option][chord_no] = new_chord_name

        end
      end

      -- keep the key that has a lower rank (fewer undesirable chord names)
      if (chords_renamed.flat_rank or 0) < (chords_renamed.sharp_rank or 0) then
        theory.scale_chord_names[mode][transpose] = chords_renamed.flat
        theory.scale_chord_letters[mode][transpose] = letters.flat
      else
        theory.scale_chord_names[mode][transpose] = chords_renamed.sharp
        theory.scale_chord_letters[mode][transpose] = letters.sharp
      end
    end

  end
end
gen_keys()




-- generates base triad interval tables across 2 octaves for selected mode and key
function gen_chord_tab()
  local mode = params:get("mode")

  theory.chord_triad_intervals = {} -- table containing 2 octaves of chord intervals for degrees 1-7 (and 2nd octave, 8-14) for current mode+key

  -- optional, WIP:
  -- this would probably replace theory.chord_degree but needs work on degrees as well
  -- theory.chord_triad_names = {} -- table containing chord names for degrees 1-7, repeated for 8-14

  for x = 1, 14 do
    local octave = ((x > 7) and 1 or 0) * 12
    local degree = util.wrap(x, 1, 7)
    local intervals_raw = theory.lookup_scales[theory.base_scales[mode]]["intervals"]
    local intervals = {}
    local triad = {1, 3, 5}

    for i = degree, #intervals_raw do
      table.insert(intervals, intervals_raw[i] + octave)
    end

    for i = 1, degree do -- rotate to end of table and increase by an octave
      table.insert(intervals, (intervals_raw[i] + 12 + octave))
    end

    theory.chord_triad_intervals[x] = {}
    -- theory.chord_triad_names[x] = {}

    for i = 1, 3 do
      theory.chord_triad_intervals[x][i] = intervals[triad[i]]
    end

    -- print("debug x = " .. x .. ":")
    -- tab.print(theory.chord_triad_intervals[x])
    -- -- this needs some work. need to wrap intervals and look up scale using base table... not sure it's worth it RN
    -- print(find_chord(theory.chord_triad_intervals[x], theory.lookup_scales[27]["intervals"][util.wrap(x, 1, 7)]) or "chord not found")
    -- print(" ")
  end

end


-- Accepts a table of chord intervals and returns matching chord name
-- optional root arg converts absolute intervals to relative to root
-- look into: should this conversion happen here or upstream?
function find_chord(intervals, root)
  local lookup = theory.chords
  local root = root or 0
  local intervals_relative = {}

  for i = 1, #intervals do
    intervals_relative[i] = intervals[i] - root
  end

  for lookup_idx = 1, #lookup do
    if #intervals_relative == #lookup[lookup_idx].intervals then -- don't count partial matches
      local chord_match = true
      for i = 1, #intervals_relative do
        if intervals_relative[i] ~= lookup[lookup_idx].intervals[i] then
          chord_match = false
          break
        end
      end
      if chord_match then
        return(lookup[lookup_idx].name)
        -- return(lookup[lookup_idx].short) -- can return ""
      end
    end
  end
end


-- initialize tables where custom chords don't already exist
if not theory.custom_chords then
  theory.custom_chords = {}
end

for pattern = 1, 4 do
  if not theory.custom_chords[pattern] then -- create pattern table if needed
    theory.custom_chords[pattern] = {}
  end
  
  for x = 1, 14 do
    if not theory.custom_chords[pattern][x] then -- create col/degree table if needed
      theory.custom_chords[pattern][x] = {}
    end
  end
end

--#endregion chords


--#region scales
-- collection of scales used to populate default custom scale tables
-- will have chord_indices and chord_names inserted by separate function by gen_chord_lookups at library init
-- Includes those in musicutil/https://github.com/fredericcormier/WesternMusicElements and some additions
theory.lookup_scales = {
  -- {name = "Major", alt_names = {"Ionian"}, intervals = {0, 2, 4, 5, 7, 9, 11}},
  -- {name = "Natural Minor", alt_names = {"Minor", "Aeolian"}, intervals = {0, 2, 3, 5, 7, 8, 10}},
  -- {name = "Harmonic Minor", intervals = {0, 2, 3, 5, 7, 8, 11}},
  -- {name = "Melodic Minor", intervals = {0, 2, 3, 5, 7, 9, 11}},
  -- {name = "Dorian", intervals = {0, 2, 3, 5, 7, 9, 10}},
  -- {name = "Phrygian", intervals = {0, 1, 3, 5, 7, 8, 10}},
  -- {name = "Lydian", intervals = {0, 2, 4, 6, 7, 9, 11}},
  -- {name = "Mixolydian", intervals = {0, 2, 4, 5, 7, 9, 10}},
  -- {name = "Locrian", intervals = {0, 1, 3, 5, 6, 8, 10}},
  -- {name = "Whole Tone", intervals = {0, 2, 4, 6, 8, 10}},
  -- {name = "Major Pentatonic", alt_names = {"Gagaku Ryo Sen Pou"}, intervals = {0, 2, 4, 7, 9}},
  -- {name = "Minor Pentatonic", alt_names = {"Zokugaku Yo Sen Pou"}, intervals = {0, 3, 5, 7, 10}},
  -- {name = "Major Bebop", intervals = {0, 2, 4, 5, 7, 8, 9, 11}},
  -- {name = "Altered Scale", intervals = {0, 1, 3, 4, 6, 8, 10}},
  -- {name = "Dorian Bebop", intervals = {0, 2, 3, 4, 5, 7, 9, 10}},
  -- {name = "Mixolydian Bebop", intervals = {0, 2, 4, 5, 7, 9, 10, 11}},
  -- {name = "Blues Scale", alt_names = {"Blues"}, intervals = {0, 3, 5, 6, 7, 10}},
  -- {name = "Diminished Whole Half", intervals = {0, 2, 3, 5, 6, 8, 9, 11}},
  -- {name = "Diminished Half Whole", intervals = {0, 1, 3, 4, 6, 7, 9, 10}},
  -- {name = "Neapolitan Major", intervals = {0, 1, 3, 5, 7, 9, 11}},
  -- {name = "Hungarian Major", intervals = {0, 3, 4, 6, 7, 9, 10}},
  -- {name = "Harmonic Major", intervals = {0, 2, 4, 5, 7, 8, 11}},
  -- {name = "Hungarian Minor", intervals = {0, 2, 3, 6, 7, 8, 11}},
  -- {name = "Lydian Minor", intervals = {0, 2, 4, 6, 7, 8, 10}},
  -- {name = "Neapolitan Minor", alt_names = {"Byzantine"}, intervals = {0, 1, 3, 5, 7, 8, 11}},
  -- {name = "Major Locrian", intervals = {0, 2, 4, 5, 6, 8, 10}},
  -- {name = "Leading Whole Tone", intervals = {0, 2, 4, 6, 8, 10, 11}},
  -- {name = "Six Tone Symmetrical", intervals = {0, 1, 4, 5, 8, 9, 11}},
  -- {name = "Balinese", intervals = {0, 1, 3, 7, 8}},
  -- {name = "Persian", intervals = {0, 1, 4, 5, 6, 8, 11}},
  -- {name = "East Indian Purvi", intervals = {0, 1, 4, 6, 7, 8, 11}},
  -- {name = "Oriental", intervals = {0, 1, 4, 5, 6, 9, 10}},
  -- {name = "Double Harmonic", intervals = {0, 1, 4, 5, 7, 8, 11}},
  -- {name = "Enigmatic", intervals = {0, 1, 4, 6, 8, 10, 11}},
  -- {name = "Overtone", intervals = {0, 2, 4, 6, 7, 9, 10}},
  -- {name = "Eight Tone Spanish", intervals = {0, 1, 3, 4, 5, 6, 8, 10}},
  -- {name = "Prometheus", intervals = {0, 2, 4, 6, 9, 10}},
  -- {name = "Gagaku Rittsu Sen Pou", intervals = {0, 2, 5, 7, 9, 10}},
  -- {name = "In Sen Pou", intervals = {0, 1, 5, 2, 8}},
  -- {name = "Okinawa", intervals = {0, 4, 5, 7, 11}},
  -- {name = "Chromatic", intervals = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}},
  -- {name = "Minor Pentatonic ♭5", intervals = {0, 3, 5, 6, 10}},    -- DS 2024-07-06
  -- {name = "Iwato", intervals = {0, 1, 5, 6, 10}},                  -- DS 2024-07-06
  -- {name = "Blues Major Pentatonic", intervals = {0, 2, 5, 7, 9}},  -- DS 2024-07-06
  -- {name = "Blues Minor Pentatonic", intervals = {0, 3, 5, 8, 10}}, -- DS 2024-07-06
  -- {name = "Suspended Pentatonic", intervals = {0, 2, 5, 7, 10}},   -- DS 2024-07-06
  -- -- {name = "Minor Tetratonic", intervals = {0, 3, 5, 7}},        -- DS 2024-07-06 (for Harmonic/Melodic Minor)


  -- alphabetical
  {name = "Altered Scale", intervals = {0, 1, 3, 4, 6, 8, 10}},

  {name = "Balinese", intervals = {0, 1, 3, 7, 8}},
  {name = "Blues Major Pentatonic", intervals = {0, 2, 5, 7, 9}},  -- DS 2024-07-06
  {name = "Blues Minor Pentatonic", intervals = {0, 3, 5, 8, 10}}, -- DS 2024-07-06
  {name = "Blues Scale", alt_names = {"Blues"}, intervals = {0, 3, 5, 6, 7, 10}},

  {name = "Chromatic", intervals = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}},

  {name = "Diminished Half Whole", intervals = {0, 1, 3, 4, 6, 7, 9, 10}},
  {name = "Diminished Whole Half", intervals = {0, 2, 3, 5, 6, 8, 9, 11}},
  {name = "Dorian", intervals = {0, 2, 3, 5, 7, 9, 10}},
  {name = "Dorian Bebop", intervals = {0, 2, 3, 4, 5, 7, 9, 10}},
  {name = "Double Harmonic", intervals = {0, 1, 4, 5, 7, 8, 11}},

  {name = "East Indian Purvi", intervals = {0, 1, 4, 6, 7, 8, 11}},
  {name = "Eight Tone Spanish", intervals = {0, 1, 3, 4, 5, 6, 8, 10}},
  {name = "Enigmatic", intervals = {0, 1, 4, 6, 8, 10, 11}},

  {name = "Gagaku Rittsu Sen Pou", intervals = {0, 2, 5, 7, 9, 10}},

  {name = "Harmonic Major", intervals = {0, 2, 4, 5, 7, 8, 11}},
  {name = "Harmonic Minor", intervals = {0, 2, 3, 5, 7, 8, 11}},
  {name = "Hungarian Major", intervals = {0, 3, 4, 6, 7, 9, 10}},
  {name = "Hungarian Minor", intervals = {0, 2, 3, 6, 7, 8, 11}},

  {name = "In Sen Pou", intervals = {0, 1, 5, 2, 8}},
  {name = "Iwato", intervals = {0, 1, 5, 6, 10}},                  -- DS 2024-07-06

  {name = "Melodic Minor", intervals = {0, 2, 3, 5, 7, 9, 11}},

  {name = "Leading Whole Tone", intervals = {0, 2, 4, 6, 8, 10, 11}},
  {name = "Locrian", intervals = {0, 1, 3, 5, 6, 8, 10}},
  {name = "Lydian", intervals = {0, 2, 4, 6, 7, 9, 11}},
  {name = "Lydian Minor", intervals = {0, 2, 4, 6, 7, 8, 10}},

  {name = "Major", alt_names = {"Ionian"}, intervals = {0, 2, 4, 5, 7, 9, 11}},
  {name = "Major Bebop", intervals = {0, 2, 4, 5, 7, 8, 9, 11}},
  {name = "Major Locrian", intervals = {0, 2, 4, 5, 6, 8, 10}},
  {name = "Major Pentatonic", alt_names = {"Gagaku Ryo Sen Pou"}, intervals = {0, 2, 4, 7, 9}},
  {name = "Minor Pentatonic", alt_names = {"Zokugaku Yo Sen Pou"}, intervals = {0, 3, 5, 7, 10}},
  {name = "Minor Pentatonic ♭5", intervals = {0, 3, 5, 6, 10}},    -- DS 2024-07-06
  {name = "Mixolydian", intervals = {0, 2, 4, 5, 7, 9, 10}},
  {name = "Mixolydian Bebop", intervals = {0, 2, 4, 5, 7, 9, 10, 11}},

  {name = "Natural Minor", alt_names = {"Minor", "Aeolian"}, intervals = {0, 2, 3, 5, 7, 8, 10}},
  {name = "Neapolitan Major", intervals = {0, 1, 3, 5, 7, 9, 11}},
  {name = "Neapolitan Minor", alt_names = {"Byzantine"}, intervals = {0, 1, 3, 5, 7, 8, 11}},

  {name = "Okinawa", intervals = {0, 4, 5, 7, 11}},
  {name = "Oriental", intervals = {0, 1, 4, 5, 6, 9, 10}},
  {name = "Overtone", intervals = {0, 2, 4, 6, 7, 9, 10}},

  {name = "Persian", intervals = {0, 1, 4, 5, 6, 8, 11}},
  {name = "Phrygian", intervals = {0, 1, 3, 5, 7, 8, 10}},
  {name = "Prometheus", intervals = {0, 2, 4, 6, 9, 10}},

  {name = "Six Tone Symmetrical", intervals = {0, 1, 4, 5, 8, 9, 11}},
  {name = "Suspended Pentatonic", intervals = {0, 2, 5, 7, 10}},   -- DS 2024-07-06

  {name = "Whole Tone", intervals = {0, 2, 4, 6, 8, 10}},

}

-- lookup table to translate between 9 core DS scales and their index in the main lookup_scales table
theory.base_scales = {}
for base_idx = 1, #dreamsequence.scales do
  for scale_idx = 1, #theory.lookup_scales do
    if dreamsequence.scales[base_idx] == theory.lookup_scales[scale_idx].name then
      theory.base_scales[base_idx] = scale_idx
      break
    end
  end
end

-- generates valid chords for scales (currently just doing the 9 base scales)
-- inserts table with chord names and indices into lookup_scales
function gen_chord_lookups()

  -- option a: iterate through every scale to generate list of valid chords per degree
  -- for scale_idx = 1, #theory.lookup_scales do
  
  -- option b: iterate through only the 9 base DS scales to generate lists of valid chords per degree
  for scale_idx = 1, #theory.base_scales do
    scale_idx = theory.base_scales[scale_idx] -- just for option b

    local scale_tab = theory.lookup_scales[scale_idx]
    local scale_intervals = scale_tab.intervals

  
    scale_tab.chord_indices = {}
    scale_tab.chord_names = {}

    for degree = 1, #scale_intervals do -- warning- some don't have 7 "degrees"
      scale_tab["chord_indices"][degree] = {}
      scale_tab["chord_names"][degree] = {}

      -- compare each type of chord against the scale
      for chord_idx = 1, #theory.chords do -- temp just check 1st chord (Major)
        local chord_tab = theory.chords[chord_idx]
        local chord_intervals = chord_tab.intervals

        pass_chord = true

        -- iterate through each interval in chord
        for chord_i = 1, #chord_intervals do
          local interval = chord_intervals[chord_i]

          local pass_interval = false -- if chord interval is found in scale

          -- pass_interval is true when the chord's interval is found in the scale
          for scale_i = 1, #scale_intervals do
            if util.wrap(scale_intervals[scale_i] - scale_intervals[degree], 0, 11) == interval % 12 then
              pass_interval = true
            end
          end

          if not pass_interval then -- if chord interval was not matched in the scale, passes fail
            pass_chord = false
            break
          end
        end

        if pass_chord then
          table.insert(scale_tab.chord_indices[degree], chord_idx)
          table.insert(scale_tab.chord_names[degree], chord_tab.name) --.short)
        end

      end

    end
  end
end
gen_chord_lookups()



-- handling of custom scales:
-- 1. If globals dust/data/dreamsequence/scales.data file exists, use it
-- 2. Otherwise, generate default scale tables (but don't save to dust so these can be updates with new releases)
-- 3. If pset folder contains scales.data, load it
-- 4. Build derivative scales_bool table

-- Default scales for each of the 9 "modes"
function gen_default_scales()

  -- option a: populates all scales that fit within selected mode
  -- -- keep around in case we need to re-check or do alternate defaults
  -- local scales = find_matching_scales()

  -- -- can insert any additional scales with tones outside of the mode here (e.g. blues)
  -- table.insert(scales[1], {0, 3, 5, 6, 7, 10})  -- Blues (from musicutil)

  -- for i = 1, 9 do
  --   local unpopulated = 8 - #scales[i]
  --   for i = 1, unpopulated do
  --     table.insert(scales[i], {})
  --   end
  -- end



  -- option b:
  -- hardcoding a single scale so we can drop the somewhat iffy named tetratonic variant of minor pentatonic
  local scales = {}

  local default_scales = { -- open-ended so user can define notes entirely outside of scale
    {0, 2, 4, 7, 9},    -- major, major pentatonic
    {0, 3, 5, 7, 10},   -- natural minor, minor pentatonic
    {0, 3, 5, 7},       -- harmonic minor, tetratonic variant of minor pentatonic
    {0, 3, 5, 7},       -- melodic minor, tetratonic variant of minor pentatonic
    {0, 3, 5, 7, 10},   -- dorian, minor pentatonic
    {0, 3, 5, 7, 10},   -- phyrigian, minor pentatonic
    {0, 2, 4, 7, 9},    -- lydian, major pentatonic
    {0, 2, 4, 7, 9},    -- mixolydian, major pentatonic
    {0, 3, 5, 6, 10},   -- locrian, minor pentatonic ♭5
  }

for mode = 1, 9 do
  scales[mode] = {}
  scales[mode][1] = default_scales[mode]
  for i = 2, 8 do
    scales[mode][i] = {}
  end
end


  return(scales)
end



-- procedurally check for matching scales
-- this is cool but I'd rather folks just play around with discovering their own scales
-- her for reference or whatever
function find_matching_scales()
  local lookup = theory.lookup_scales
  local modes = {
    "Major", -- "Ionian", 
    "Natural Minor", -- "Aeolian", 
    "Harmonic Minor",
    "Melodic Minor",
    "Dorian",
    "Phrygian",
    "Lydian",
    "Mixolydian",
    "Locrian"
  }
  local defaults = {}
  for mode_idx = 1, 9 do
    local mode_name = modes[mode_idx]
  
    defaults[mode_idx] = {}

    -- generate bool table of tones in mode
    local intervals_in_mode = {}
    for i = 1, 12 do
      intervals_in_mode[i] = false
    end

    for lookup_idx = 1, #lookup do
      if lookup[lookup_idx].name == mode_name then

        for i = 1, #lookup[lookup_idx].intervals do
          intervals_in_mode[lookup[lookup_idx].intervals[i]] = true
        end

        break
      end
    end

    print(" ")
    print("Matching scales for " .. mode_name .. ":")

    -- check for scales that have matching intervals
    for lookup_idx = 1, #theory.lookup_scales do
      local scale = theory.lookup_scales[lookup_idx]
      local lookup_name = scale.name
      if lookup_name ~= mode_name then -- don't load the standard mode intervals
        local match = true
        
        for i = 1, #scale.intervals do
          if not intervals_in_mode[scale.intervals[i]] then
            match = false
            break
          end
        end
      
        if match then
          table.insert(defaults[mode_idx], scale.intervals)
          print("- " .. scale.name)
        end

      end

    end

  end

  return(defaults)
end


-- initialize tables where custom scales don't exist
if not theory.scales then
  theory.scales = {}
end

for mode_no = 1, 9 do
  if not theory.scales[mode_no] then -- create mode table if needed
    theory.scales[mode_no] = {}
  end
  
  for scale_no = 1, 8 do
    if not theory.scales[mode_no][scale_no] then -- create scale table if needed
      theory.scales[mode_no][scale_no] = {}
    end
  end

end



-- working table with bools to set state for LEDs.
-- Containts custom scales 1-8 for the current mode
function gen_custom_scale()
  theory.scales_bool = {}
  
  for y = 1, 8 do
    local custom = theory.scales[params:get("mode")][y] -- todo hook up to notes param somehow

    if custom then
      theory.scales_bool[y] = {}
      for x = 1, 12 do
        theory.scales_bool[y][x] = false
      end

      for i = 1, #custom do
        theory.scales_bool[y][custom[i] + 1] = true
      end
    end
  end

end


-- Accepts a table of scale intervals and returns matching scale name
function find_scale_name(intervals)
  local lookup = theory.lookup_scales
  for lookup_idx = 1, #lookup do
    if #intervals == #lookup[lookup_idx].intervals then -- don't count partial matches
      local scale_match = true
      for i = 1, #intervals do
        if intervals[i] ~= lookup[lookup_idx].intervals[i] then
          scale_match = false
          break
        end
      end
      if scale_match then
        return(lookup[lookup_idx].name)
      end
    end
  end
end


--#endregion scales