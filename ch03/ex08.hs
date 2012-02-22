-- 6. Create a function that sorts a list of lists based on the length of each sublist.  (You may want to look at the sortBy function from the Data.List module.)

-- had to search how to import modules.  Gotta love exercises forcing that...
import Data.List (sortBy)

-- looking at :type sortBy and the docs, we just give it a predicate and a list, eg,
x = sortBy mySort [1, 5, 3, 8, 2]
    where mySort a b = compare a b

-- as for the problem itself.. well the predicate seems trivial and leads to...

-- added a type signature, see below.. concern is now waived :)
sortListsByLength :: [[a]] -> [[a]]
sortListsByLength a = sortBy byLength a 
                      where byLength a1 b1 = compare (length a1) (length b1)
 
-- which works, but the structure required for a is hidden in the implementation...which is 
-- kinda ugly.  Or is this where we use a type signature?

