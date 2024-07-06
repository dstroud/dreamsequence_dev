theory = {}

-- lookup for chord degrees and qualities, mirroring MusicUtil.SCALE_CHORD_DEGREES with added chord "quality"
-- indices 1-7 are triads, 8-14 are 7ths
chord_lookup = {
  {
    name = "Major",
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
  local index_to_chord = {"A","B","C","D","E","F","G"}
  return(index_to_chord[util.wrap(chord_to_index[chord] + offset, 1, 7)])
end


-- enforces the "alphabet rule" for chords and picks whichever key has fewer nonstandard chords (##, bb, B#, Cb, E#, Fb)
local function gen_keys()
  theory.keys = {}
  local chords_renamed = {}

  for mode = 1, 9 do
    theory.keys[mode] = {}

    for transpose = 0, 11 do
      theory.keys[mode][transpose] = {}
      chords_renamed = {["flat"] = {}, ["sharp"] = {}, ["flat_rank"] = 0, ["sharp_rank"] = 0}

      for _ , option in pairs({"flat", "sharp"}) do
        local prev_chord_name = nil
        local prev_letter = nil
        local key = musicutil.NOTE_NAMES[util.wrap((musicutil.SCALES[mode]["intervals"][1] + 1) + transpose, 1, 12)] -- for debug
        
        for chord_no = 1, 14 do
          local chord_name = musicutil.NOTE_NAMES[util.wrap((musicutil.SCALES[mode]["intervals"][util.wrap(chord_no, 1, 7)] + 1) + transpose, 1, 12)]
        
          if chord_no == 1 and option == "flat" and string.sub(chord_name, 2, 2) == "#" then
            chords_renamed[option .. "_rank"] = (chords_renamed[option .. "_rank"] or 0) + chord_equivalent[chord_name].rank_flat
            chord_name = chord_equivalent[chord_name].flat
          end

          local chord_letter = string.sub(chord_name, 1, 1)
          local equivalent = chord_equivalent[chord_name]
          local new_chord_name = chord_name
          local quality = chord_lookup[mode]["quality"][chord_no]

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

          if chord_no == 1 then
            chords_renamed[option].key = new_chord_name
          end
        end
      end

      -- keep the key that has a lower rank (fewer undesirable chord names)
      if (chords_renamed.flat_rank or 0) < (chords_renamed.sharp_rank or 0) then
        theory.keys[mode][transpose] = chords_renamed.flat
      else
        theory.keys[mode][transpose] = chords_renamed.sharp
      end
    end
  end
end
gen_keys()


-- collection of scales used to populate default custom scale tables
-- Includes those in MusicUtil/https://github.com/fredericcormier/WesternMusicElements and some additions
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
function find_scale(intervals)
  local lookup = theory.lookup_scales
  for lookup_idx = 1, #lookup do
    if #intervals == #lookup[lookup_idx].intervals then -- don't count partial matches
      scale_match = true
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