-- 1. Enter the following expressions into ghci.  What are their types?

5 + 8
3 * 5 + 8
2 + 4
(+) 2 4
sqrt 16
succ 6
succ 7
pred 9
pred 8
sin (pi / 2)
truncate pi
round 3.5
round 3.4
floor 3.7
ceiling 3.3

Ok, in order:

Prelude> 5 + 8
13
Prelude> :type it
it :: Integer
Prelude> 3 * 5 + 8
23
Prelude> :type it
it :: Integer
Prelude> 2 + 4
6
Prelude> :type it
it :: Integer
Prelude> (+) 2 4
6
Prelude> :type it
it :: Integer
Prelude> sqrt 16
4.0
Prelude> :type it
it :: Double
Prelude> succ 6
7
Prelude> :type it
it :: Integer
Prelude> succ 7
8
Prelude> :type it
it :: Integer
Prelude> pred 9
8
Prelude> :type it
it :: Integer
Prelude> pred 8
7
Prelude> :type it
it :: Integer
Prelude> sin (pi / 2)
1.0
Prelude> :type it
it :: Double
Prelude> truncate pi
3
Prelude> :type it
it :: Integer
Prelude> round 3.5
4
Prelude> :type it
it :: Integer
Prelude> round 3.4
3
Prelude> :type it
it :: Integer
Prelude> floor 3.7
3
Prelude> :type it
it :: Integer
Prelude> ceiling 3.3
4
Prelude> :type it
it :: Integer
