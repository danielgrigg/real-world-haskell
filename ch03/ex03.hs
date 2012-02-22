-- Write a function that computes the number of elements in a list.  To test it, 
-- ensure that it gives the same answers as the standard length function.

myLength xs = if null xs
              then 0
              else 1 + myLength (tail xs)

-- pattern based for s&g
myLength2 xs 
          | null xs = 0
          | otherwise = 1 + myLength (tail xs)

