-- Write the converse of fromList for the List type: a function that takes a List a and generates a [a].
data List a = Cons a (List a)
            | Nil
              deriving (Show)

fromList (x:xs) = Cons x (fromList xs)
fromList [] = Nil

-- our 'converse' function..
toList (Cons x xs) = x:toList xs
toList Nil = []

