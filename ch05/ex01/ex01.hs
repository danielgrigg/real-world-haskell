-- 1. Our current pretty printer is spartan so that it will fit without our space constraints,                     
-- but there are a number of useful improvements we can make.

-- Write a function, fill, with the following type signature:

--  fill :: Int -> Doc -> Doc

-- It should add spaces to a document until it is the given number of columns wide.
-- If it is already wider than this value, it should not add any spaces.

-- Ok, first up, the question is ambiguous - what do we consider a document exactly? is it the whole 
-- 'document' tree, a subtree, pre-prettied, post-prettied, where do we add spaces? every line? 
-- just the last line? the longest line?  Pretty clear the author just spat the question out of his arse.  tbf
-- most authors do! :/

-- So we'll just write a BS answer that's pretty easy and does 'something'.  We tally up the 
-- whole document length by flattening to characters and if < n chars, extend with spaces to n.  We
-- ignore newlines..

import PrettyJSON
import Prettify
import SimpleJSON

docLength :: Doc -> Int
docLength d = case d of 
              Empty             -> 0
              Char c            -> 1
              Text s            -> length s
              Line              -> 0
              a `Concat` b      -> (docLength a) + (docLength b)
              a `Union` b       -> max (docLength a) (docLength b)


fill :: Int -> Doc -> Doc
fill n d | dl < n = d `Concat` (text (replicate (n - dl) ' '))
         | otherwise = d
         where dl = docLength d

-- test cases
-- let x = renderJValue (JObject [("x", JBool True), ("y", JNumber 1)])
-- fill 30 x
-- fill 5 x
