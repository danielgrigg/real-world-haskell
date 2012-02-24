-- 6. Write your own definition of concat using foldr.

myConcat xs = foldr (++) [] xs
