-- 9. Use ghci to load the Data.List module and figure out what groupBy does, then write your own implementation using a fold.

-- Alright so Data.List group by seems to span the 'grouping-function' using a fixed first element to the 
-- first element that fails.  So unless the oh-so-flexible function is an equivalence test it doesn't 
-- work very well.. Regardless, we have the interesting situation of working with an array-of-arrays,
-- where the new item is 'folded' into the 'head' array if p passes.  Sounds a little intimidating 
-- but fortunately I found haskell's pattern matching and type safety make things quite pleasant. 

-- The step function is separate because I wrote it first to incrementally test the question.  Again,
-- there's undoubtedly a cleaner solution for myStep, but it works.
myGroupBy p (x:xs) = foldr (myStep p) [[]] (x:xs)

-- to match groupBy we need this null pattern, else 'myGroupBy (==) []' results in [[]].
myGroupBy p [] = []

-- I kinda wanted to pattern match instead of null testing y2, but it's hairy. Hairy is bad mm-k.
myStep p y1 (y2:ys) | null y2 = [y1] : ys
                    | (p y1 (head y2)) = (y1:y2):ys
                    | otherwise = [y1] : (y2:ys)
