-- 3. Extent your function to handle the following kinds of exceptional conditions by calling error:

-- asInt_fold "" == 0
-- asInt_fold "-" == 0
-- asInt_fold "-3" == -3
-- asInt_fold "2.7" Exception not a digit
-- asInt_fold "314159265358979323846"

import Data.Char (digitToInt)
import Data.List

-- The question is confusing but I assume the author means, 'in those examples with valid input, 
-- instead throw an error.  The last example is really bizarre (see book), 
-- so I take it as meaning too large a number.
asInt_fold :: [Char] -> Integer

asInt_fold cs | length cs > 20 = error "number too long"
              | otherwise = 
                let step acc x = acc * 10 + (fromIntegral (digitToInt x))
                in case cs of
                    ('-':rest) -> error "minus number oh noes"
                    (_:'.':_)  -> error "can't do floating-points!"
                    []       -> error "empty oh noes"
                    _          -> foldl' step 0 cs
