-- Define a tree type that has only one constructor, like our Java example.  
-- Instead of the Empty constructor, use the Maybe type to refer to a node's 
-- children.

--data Tree a = Node a (Tree a) (Tree a)
--            | Empty
--            deriving (Show)

-- not proud to admit this took more fiddling than should be necessary.  
-- I'm thinking the book is quite poor now. Content is introduced in a haphazard
-- fashion, with important concepts just glossed over.

data Tree a = Node a (Maybe (Tree a)) (Maybe (Tree a))
     deriving (Show)

x = Node 3 Nothing Nothing
y = Node 1 Nothing (Just (Node 2 Nothing Nothing))
z = Node 1 (Just (Node 7 Nothing Nothing)) (Just (Node 2 Nothing Nothing))

