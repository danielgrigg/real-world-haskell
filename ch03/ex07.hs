-- 5. Write a function that determines whether its input list is a palindrome.

-- Let's reuse our work from ex06. Let's palindrome the first half and compare to the original list.
myPalindrome xs = let myReverse [] = []
                      myReverse (y:ys) = myReverse ys ++ [y]
                  in xs ++ myReverse xs

isPalindrome xs | odd (length xs) = False
                | otherwise = myPalindrome (take (div (length xs) 2) xs) == xs

--*Main> isPalindrome [1,2,3,4]
--False
--*Main> isPalindrome [1,2,3]
--False
--*Main> isPalindrome [1,2,3,3,2,1]
--True


