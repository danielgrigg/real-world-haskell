-- 1. Use a fold (choosing the appropriate fold will make your code much simpler) to rewrite and improve upon the asInt function from the earlier section "Explicit Recursion" on page 85.

import Data.Char (digitToInt)

asInt cs = 
      let step acc x = acc * 10 + (digitToInt x)
      in case cs of
         ('+':rest) -> foldl step 0 rest
         ('-':rest) -> - (foldl step 0 rest)
         _          -> foldl step 0 cs



      