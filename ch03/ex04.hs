-- Add a type signature for your function to your source file.  To test it, load the source file in ghci again.

-- copying from ex03.hs

myLength :: [a] -> Int
myLength xs 
          | null xs = 0
          | otherwise = 1 + myLength (tail xs)
