-- 11. Define a function that takes a list of two-dimensional points and computes the direction of each successive triple.  Given a list of points [a,b,c,d,e], it should begin by computing the turn made by [a,b,c], then the turn made by [b,c,d], then [c,d,e].  Your function should return a list of Direction.

-- import our earlier work from ex12.hs
data DDirection = DLeft
               | DRight
               | DStraight
               deriving (Show)

--  I wonder about precision when deriving Eq...
data Vector2 = Vector2 { 
     x :: Double,
     y :: Double
     } deriving (Show, Eq)

-- construct a Vector between two points.
between a b = Vector2 (x b - x a) (y b - y a)

-- well I feel silly forgetting in ex12 that the cross product gives us the turn direction.
cross a b c = (x b - x a) * (y c - y a) - (y b - y a) * (x c - x a)

-- and huzzah, the turn made by 3 successive points
turnMade a b c | z > 0 = DLeft
               | z < 0 = DRight
               | otherwise = DStraight
         where z = cross a b c

-- ok let's do this incrementally and get the 'shape' right first then substitute 
-- our transformation function.
foo (x1:x2:x3:xs) = (x1+x2+x3) : (foo (x2:x3:xs))
foo (x1:x2:xs) = []

-- looks good.  This pattern matching business is proving really handy..

turnsForList (x1:x2:x3:xs) = (turnMade x1 x2 x3) : (turnsForList (x2:x3:xs))
turnsForList (x1:x2:xs) = []
