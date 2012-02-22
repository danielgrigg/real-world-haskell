-- 2. Your function should behave as follows:

--asInt_fold "101" == 101
--asInt_fold "-31337" == -31337
--asInt_fold "1798" == 1798

-- The question is redundant, so we'll just copy from ex05.hs
import Data.Char (digitToInt)

asInt_fold cs = 
      let step acc x = acc * 10 + (digitToInt x)
      in case cs of
         ('+':rest) -> foldl step 0 rest
         ('-':rest) -> - (foldl step 0 rest)
         _          -> foldl step 0 cs

