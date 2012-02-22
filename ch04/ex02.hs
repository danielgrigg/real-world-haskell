-- 2. Write a function splitWith that acts similarly to words but takes a predicate and a list of any type, and then splits its input on every element for which the predicate returns False.

import Data.Char

splitWith :: (a -> Bool) -> [a] -> [[a]]

-- appears quite similar to the 'portable splitLines' earlier, so let's try that.
-- the break + dropWhile should give us 'remove all items matching the predicate' semantics.

splitWith f [] = []
splitWith f cs = 
          let (pre, suf) = break f cs
          in pre : splitWith f (dropWhile f suf)

-- *Main> splitWith isPunctuation "the.quick.brown.fox"
-- ["the","quick","brown","fox"]
-- *Main> splitWith even [1,1,2,2,3,3,4,4]
-- [[1,1],[3,3]]
