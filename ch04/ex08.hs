-- 4. The asInt_fold function uses error, so its callers cannot handle errors.  Rewrite the function to fix this problem:

-- So presumably we want to create a new ADT representing either an Int or an Error message...

import Data.List
import Data.Char

type ErrorMessage = String

-- don't I feel silly..after fumbling for a bit assuming the 'Right' and 'Left' in the output examples
-- was just junk, turns out the author's using the unmentioned 'Either' monad.  Awesome, not.  Guess we 
-- don't need to make our own 'Ei' type that magically constructs without a constructor :O

-- the last example for a string containing non-digits is kinda BS imo.  He seeems to only look at the 
-- second digit to decide validity (or ignores the remaining digits).  So we do a little better and output
-- the trailing string. *shrug*

asInt_either (c:cs) | length cs >= 20 =  Left "too long"
                    | not (all isDigit cs) = Left ("Non-digits '" ++ cs ++ "'.")
                    | otherwise = 
                      let step acc x = acc * 10 + (fromIntegral (digitToInt x))
                      in case cs of
                         ('-':rest) ->  Left "minus number oh noes"
                         (_:'.':_)  ->  Left "can't do floating-points!"
                         []         ->  Left "empty oh noes"
                         _          ->  Right (foldl' step 0 cs)
