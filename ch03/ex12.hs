-- 10. Write a function that calculates the turn made by three two-dimensional points and returns a Direction.

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

-- relative angle between two vectors
relativeAngle a b = (atan2 (y b) (x b)) - (atan2 (y a) (x a))

-- and huzzah, the turn made by 3 successive points
turnMade a b c | z > 0 = DLeft
               | z < 0 = DRight
               | otherwise = DStraight
         where z = relativeAngle (between a b) (between a c)
