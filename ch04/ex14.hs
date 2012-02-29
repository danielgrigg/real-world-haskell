-- 10. How many of the following Prelude functions can you rewrite using list folds?

-- * any
-- * cycle
-- * words
-- * unlines

-- For those functions where you can use either foldl' or foldr, which is more appropriate in each case?

import Data.List
import Data.Char (isSpace)

-- Use a lambda, because we can
myAny p xs = foldl' (\acc y -> (even y) || acc) False xs

-- Can't do cycle (right? *looks around*), since it infinitely expands the input.

-- Using a similar approach to ex13.hs
myWords (c:cs) = foldr step [""] (c:cs)
        where step y1 (y2:ys) | (isSpace y1) = "":(y2:ys)
                              | otherwise = (y1:y2):ys
myWords [] = []

myUnlines cs = foldr step "" cs
          where step y1 (y2:ys) = y1 ++ ('\n':y2:ys)
                step y1 [] = y1

-- Ok foldl vs foldr.  myAny could swing either way.  No special pattern matching needs and accumulating
-- a single value.  myWords faik is easier thanks to matching the prefix and succesor.  myUnlines 
-- could go either but foldr seems easy enough.