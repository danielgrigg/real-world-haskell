-- 4. Write a program that transposes the text in a file.  For instance, it should convert "hello\nworld\n" to "hw\neo\nlr\nll\nod\n".

-- so we want to convert this
--hello 
--world

-- to this
--hw
--eo
--lr
--ll
--od

-- if the question means a matrix style transpose, then this is a better example:
-- 1  2  3  4
-- 5  6  7  8
-- 9  10 11 12
-- 13 14 15 16

-- to:
--1 5 9  13
--2 6 10 14
--3 7 11 15
--4 8 12 16

--test1:
--hello
--world
--the
--quick
--brown
--fox

--test2: run against ex04.hs! the result loooks pretty cool :)

-- Of course, that means treating the 'text in a file' as a matrix. For now, let's assume
-- we have a pure text file.  We need a matrix of H x W, where H is the number of lines and W
-- the maximum line length.

-- So a possible solution could be: read all lines and assemble the matrix with each element
-- corresponding to single chars.  Then recurse over each column, stopping when we've 
-- reached W columns. We can use a sparse array by ignoring missing characters on short lines.

import System.Environment (getArgs)

-- transpose each column
transposeText input = let ls = lines input
                          maxLength ls = maximum (map length ls)
                      in unlines (transposeLines ls (maxLength ls))

-- slice the nth column, then do the rest!
-- edit: upon running against test1 I realised a defect existed in my original approach: 
-- by not appending lines < maxLength with empty cells (space characters), the subsequent 
-- lines would intersperse, eg, in test1 'the' would mix with 'quick' for 'thecw'.

transposeLines ls n | n == 0 = []
               | otherwise = nextRow ls : transposeLines rest (n - 1)
               where rest = map (drop 1) ls                     
                     nextRow (l:ls)  = (firstElement l) : nextRow ls
                     nextRow [] = []
                     firstElement l | null l = ' '
                                    | otherwise = (head l)
                     

-- add our boiler-plate code to create a shell program

interactWith function inputFile outputFile = do
             input <- readFile inputFile
             writeFile outputFile (function input)

main = mainWith myFunction
     where mainWith function = do
           args <- getArgs
           case args of
                [input,output] -> interactWith function input output
                _ -> putStrLn "error: exactly two arguments needed"

myFunction = transposeText


