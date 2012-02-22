-- 7. Define a function that joins a list of lists together using a separator value:

  -- intersperse :: a -> [[a]] -> [a]
-- eg, ["foo", "bar", "baz"] -> "foo:bar:baz" with delimiter ':'

-- typical join requiring knowledge of the trailing item semantics.  We lack mapcat, 
-- but we do have guards!
myJoin y (x:xs) | null xs = x
                | otherwise = x ++ (y:myJoin y xs)
