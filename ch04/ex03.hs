-- 3. Using the command framework from the earlier section "A Simple Command-Line Framework" on page 71, write a program that prints the first word of each line of its input.

-- ghc --make ex03.hs
import System.Environment (getArgs)

interactWith function inputFile outputFile = do
             input <- readFile inputFile
             writeFile outputFile (function input)

main = mainWith myFunction
     where mainWith function = do
           args <- getArgs
           case args of
                [input,output] -> interactWith function input output
                _ -> putStrLn "error: exactly two arguments needed"

myFunction = firstWordsJoined

-- and our replacement function to capture the words.  
firstWordsJoined input = unwords (firstWords (lines input))            
                 where firstWords (l:ls) | null l = firstWords ls
                                         | otherwise = (head (words l)) : firstWords ls
                       firstWords [] = []


