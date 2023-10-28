-- Used for clock modulo and durations
division_names = {
  {2, '1/64T'},
  {3, '1/64'},
  {4, '1/32T'},
  {6, '1/32'},
  {8, '1/16T'},
  {12, '1/16'},
  {16, '1/8T'},
  {24, '1/8'},
  {32, '1/4T'},
  {48, '1/4'},
  {64, '1/3'},
  {96, '1/2'},
  {128, '2/3'},
  {144, '3/4'},
  {192, '1'},
  {240, '1 1/4'},
  {256, '1 1/3'},
  {288, '1 1/2'},
  {320, '1 2/3'},
  {336, '1 3/4'},
  {384, '2'},
  {432, '2 1/4'},
  {448, '2 1/3'},
  {480, '2 1/2'},
  {512, '2 2/3'},
  {528, '2 3/4'},
  {576, '3'},
  {624, '3 1/4'},
  {640, '3 1/3'},
  {672, '3 1/2'},
  {704, '3 2/3'},
  {720, '3 3/4'},
  {768, '4'},
  {816, '4 1/4'},
  {832, '4 1/3'},
  {864, '4 1/2'},
  {896, '4 2/3'},
  {912, '4 3/4'},
  {960, '5'},
  {1008, '5 1/4'},
  {1024, '5 1/3'},
  {1056, '5 1/2'},
  {1088, '5 2/3'},
  {1104, '5 3/4'},
  {1152, '6'},
  {1200, '6 1/4'},
  {1216, '6 1/3'},
  {1248, '6 1/2'},
  {1280, '6 2/3'},
  {1296, '6 3/4'},
  {1344, '7'},
  {1392, '7 1/4'},
  {1408, '7 1/3'},
  {1440, '7 1/2'},
  {1472, '7 2/3'},
  {1488, '7 3/4'},
  {1536, '8'}
}

-- Strum length relative to chord step length
strum_lengths = {
  {1/96, '1/96'},
  {1/64, '1/64'},
  {1/48, '1/48'},
  {1/32, '1/32'},
  {1/24, '1/24'},
  {1/16, '1/16'},
  {1/12, '1/12'},
  {1/8, '1/8'},
  {1/6, '1/6'},
  {1/4, '1/4'},
  {1/3, '1/3'},
  {1/2, '1/2'},
  {2/3, '2/3'},
  {3/4, '3/4'},
  {1/1, '1'}
}


-- Used for cv harmonzier sample rate
crow_trigger_names = {
--  {2, '1/64T'},
--  {3, '1/64'},
  {4, '1/32T'},
  {6, '1/32'},
  {8, '1/16T'},
  {12, '1/16'},
  {16, '1/8T'},
  {24, '1/8'},
  {32, '1/4T'},
  {48, '1/4'},
  {64, '1/3'},
  {96, '1/2'},
  {128, '2/3'},
  {144, '3/4'},
  {192, '1'},
  {240, '1 1/4'},
  {256, '1 1/3'},
  {288, '1 1/2'},
  {320, '1 2/3'},
  {336, '1 3/4'},
  {384, '2'},
  {432, '2 1/4'},
  {448, '2 1/3'},
  {480, '2 1/2'},
  {512, '2 2/3'},
  {528, '2 3/4'},
  {576, '3'},
  {624, '3 1/4'},
  {640, '3 1/3'},
  {672, '3 1/2'},
  {704, '3 2/3'},
  {720, '3 3/4'},
  {768, '4'},
  {816, '4 1/4'},
  {832, '4 1/3'},
  {864, '4 1/2'},
  {896, '4 2/3'},
  {912, '4 3/4'},
  {960, '5'},
  {1008, '5 1/4'},
  {1024, '5 1/3'},
  {1056, '5 1/2'},
  {1088, '5 2/3'},
  {1104, '5 3/4'},
  {1152, '6'},
  {1200, '6 1/4'},
  {1216, '6 1/3'},
  {1248, '6 1/2'},
  {1280, '6 2/3'},
  {1296, '6 3/4'},
  {1344, '7'},
  {1392, '7 1/4'},
  {1408, '7 1/3'},
  {1440, '7 1/2'},
  {1472, '7 2/3'},
  {1488, '7 3/4'},
  {1536, '8'},
  {0, 'CV1'}
}