-- 1. What are the types of the following expressions?

 * False
 * (["foo", "bar"], 'a')
 * [(True, []), (False, [['a']])]

-- In order:

Bool
([[Char]], Char)
[(Bool, [[Char]])]

-- Commentary: Notice how haskell deduces the type of the empty-array in the first tuple of example 3. It must
-- be [[Char]] since array elements must have the same type.