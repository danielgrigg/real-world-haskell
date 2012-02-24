-- 7. Write your own definition of the standard takeWhile function, first using explicit recursion and then foldr.

takeWhile_recurse p (x:xs) | (p x) = x : takeWhile_recurse p xs
                           | otherwise = []
takeWhile_recurse p [] = []

-- this probably isn't the cleanest solution, but it works so meh
takeWhile_foldr p xs = foldr step [] xs 
                  where step y ys | (all p (y:ys)) = y : ys
                                  | (p y) = [y]
                                  | otherwise = []
