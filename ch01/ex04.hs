-- 4. Modify the WC.hs example again, in order to print the number of characters in a file.

-- input is a string, which is an array, so take the length of the input

main = interact wordCount
  where wordCount input = show (length input) ++ "\n"
