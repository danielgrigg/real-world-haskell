-- 8. Using the binary tree type that we defined earlier in this chapter, write a function that will determine the height of the tree.  The height is the largest number of hops from the root to an Empty.  For example, the tree Empty has height zero; Node "x" Empty Empty has height one; Node "x" Empty (Node "y" Empty Empty) has height two; and so on.

-- the tree type defined earlier

data Tree a = Node a (Tree a) (Tree a)
            | Empty
            deriving (Show)

-- we can think recursively of the height being the maximum of the two subtrees. 
treeHeight (Node a b c)  = 1 + max (treeHeight b) (treeHeight c)
treeHeight Empty = 0

-- kinda nice how explicitly our thought was expressed in haskell ;)