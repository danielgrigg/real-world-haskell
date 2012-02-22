-- 12. Using the code from the preceeding three exercises, implement Graham's scan algorithm for the convex hull of a set of 2D points.

-- ok, let's bring it all together.

-- huh..imports must be grouped at the top it appears
import Data.List (sortBy)

data DDirection = DLeft
               | DRight
               | DStraight
               deriving (Eq, Show)

--  I wonder about precision when deriving Eq...
data Vector2 = Vector2 { 
     x :: Double,
     y :: Double
     } deriving (Show, Eq)

-- construct a Vector between two points.
between a b = Vector2 (x b - x a) (y b - y a)

cross a b c = (x b - x a) * (y c - y a) - (y b - y a) * (x c - x a)

turnMade a b c | z > 0 = DLeft
               | z < 0 = DRight
               | otherwise = DStraight
         where z = cross a b c

turnsForList (x1:x2:x3:xs) = (turnMade x1 x2 x3) : (turnsForList (x2:x3:xs))
turnsForList (x1:x2:xs) = []


-- find the minimum y-valued point.  if multiple points match, find minimum x-valued.

-- just testing finding minimum value of a list..
minList (x1:xs) | null xs = x1
                | otherwise = min x1 (minList xs)

minY (x1:xs) | null xs = y x1
             | otherwise = min (y x1) (minY xs)

-- oh look there's a filter function we can use
-- but boy I'd love to learn me an anonymous lambda
filterMinY ps = filter pred ps where pred p = (y p) == (minY ps)

-- testing in ghci
-- filterMinY [Vector2 1 9, Vector2 2 3, Vector2 5 8, Vector2 7 2, Vector2 8 2]

-- the duality of our x and y operations screams, 'generalise me!', alas, I don't know
-- 'how' in Haskell yet ;)
maxX (p:ps) | null ps = x p
            | otherwise = max (x p) (maxX ps)
filterMaxX ps = filter pred ps where pred p = (x p) == (maxX ps)

firstPoint (ps) = head (filterMaxX (filterMinY ps))

-- we have a starting point, now we need to sort all polygon points against it. Particularly,
-- the angle subtended between the vector <firstPoint, current> and the x-axis.

vectorLength v = sqrt (x v * x v + y v * y v)
vectorSubtract a b = Vector2 (x a - x b) (y a - y b)
cosXAxis p = (x p) / (vectorLength p)

pointsByAngle s ps = s:(sortBy pred (filter notS ps))
              where pred a b = compare (cosXAxis (vectorSubtract b s)) (cosXAxis (vectorSubtract a s))
                    notS x = x /= s

              -- ++ [head qs])
pointsByDirection ps = turnsForList (qs) 
                       where qs = pointsByAngle (firstPoint ps) ps 

-- testing with these points
--[(Vector2 1 9), (Vector2 2 3), (Vector2 5 8), (Vector2 7 2), (Vector2 8 2)]

--[1, 2, 3, 4, 5, 6]
--[DLeft, DLeft, DRight, DLeft, DLeft, DLeft]

filterRightTurns (p:ps) (q:qs) | null qs = [p]
                         | (head qs) == DRight = filterRightTurns ps qs
                         | otherwise = p:(filterRightTurns ps qs)

rightTurns ps = length (filter isRight (turnsForList (pointsByAngle (firstPoint ps) ps)))
                where isRight x = x == DRight

convexHullFull ps = (filterRightTurns qs ([DLeft, DLeft] ++ turnsForList qs)) ++ [head qs]
                  where qs = pointsByAngle (firstPoint ps) ps

-- FUCK YEEEEEEAH!
convexHull3 ps | (rightTurns ps) > 0 = convexHull3 (filterRightTurns qs ([DLeft, DLeft] ++ turnsForList qs))
               | otherwise = ps ++ [head ps]
               where qs = pointsByAngle (firstPoint ps) ps

-- annealTurns (p1:p2:p3:p4:ps) | (turnMade p2 p3 p4) == DRight = annealTurns (p1:p2:p4:ps)
--                             | otherwise = p2:(annealTurns (p2:p3:p4:ps))
-- annealTurns (_) = []

annealTurns (p1:p2:p3:ps) os | (turnMade p1 p2 p3) == DRight = annealTurns fs fs 
                             | otherwise = p1:(annealTurns (p2:p3:ps) os)
                             where notP2 x = x /= p2
                                   fs = (filter notP2 os)
annealTurns (p1:p2:ps) os= [p1, p2]

convexHull2 ps = (firstPoint ps):(annealTurns os os) 
               where os = (pointsByAngle (firstPoint ps) ps)

-- t1 convex, [(Vector2 30 70),(Vector2 40 10),(Vector2 70 0),(Vector2 100 30),(Vector2 80 60)]
-- t2 concave, [(Vector2 30 70),(Vector2 40 10),(Vector2 70 0),(Vector2 100 30),(Vector2 80 60),(Vector2 60 30)]
-- t3 concave, [(Vector2 30 70),(Vector2 40 10),(Vector2 90 5), (Vector2 70 0),(Vector2 100 30),(Vector2 80 60),(Vector2 60 30)]

t4 = [(Vector2 16 4),(Vector2 52 53),(Vector2 75 92),(Vector2 52 62),(Vector2 63 12),
     (Vector2 27 72),(Vector2 34 10),(Vector2 73 0), (Vector2 96 21), (Vector2 74 68)]
t4_1 = (pointsByAngle (firstPoint t4) t4)

t5 = [(Vector2 22 94),(Vector2 47 89),(Vector2 73 71),(Vector2 48 0),(Vector2 12 57),(Vector2 81 88),(Vector2 35 9),(Vector2   14 90),(Vector2 23 63),(Vector2 73 94),(Vector2 64 67),(Vector2 50 4),(Vector2 98 86),(Vector2 78 40),(Vector2 93 13),    (Vector2 41 76),(Vector2 56 44),(Vector2 5 56),(Vector2 36 10),(Vector2 60 23),(Vector2 13 31),(Vector2 72 92),(Vector2   29 61),(Vector2 37 99),(Vector2 57 4),(Vector2 59 29),(Vector2 88 43),(Vector2 76 80),(Vector2 94 95),(Vector2 12 79),    (Vector2 51 26),(Vector2 80 75),(Vector2 13 52),(Vector2 22 54),(Vector2 99 53),(Vector2 77 8),(Vector2 17 56),(Vector2   62 86),(Vector2 12 98),(Vector2 97 43),(Vector2 7 31),(Vector2 13 5),(Vector2 45 36),(Vector2 8 57),(Vector2 44 46),      (Vector2 67 62),(Vector2 91 19),(Vector2 47 12),(Vector2 89 0),(Vector2 82 75)]

t5_1 = (pointsByAngle (firstPoint t4) t5)
