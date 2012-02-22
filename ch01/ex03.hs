-- 3. The words function breaks a string up into a list of words.  Modify the WC.hs example in order to count the number of words in a file.

-- We just replace 'lines' with 'words'

main = interact wordCount
  where wordCount input = show (length (words input)) ++ "\n"
