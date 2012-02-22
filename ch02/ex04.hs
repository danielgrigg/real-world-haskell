-- 3. Load your lastButOne function into ghci and try it out on lists of different lengths.  What happens when you pass it a list that's too short?

-- Using our soln from ex03.hs:

lastButOne xs = if null (tail (tail xs))
                then head xs
                else lastButOne (tail xs)

-- Some example use-cases:

*Main> lastButOne [1,2,3,4]
3
*Main> lastButOne [1,2,3,4,5]
4
*Main> lastButOne "foobar"
'a'
*Main> lastButOne "fo"
'f'
*Main> lastButOne "f"
*** Exception: Prelude.tail: empty list
*Main> lastButOne ""
*** Exception: Prelude.tail: empty list
*Main> 

-- So for <2 length, we get an exception as tail isn't 'empty-safe'.
