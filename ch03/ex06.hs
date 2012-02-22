-- 4. Turn a list into a palindrome; i.e., it should read the same both backward and forward.  For example, given the list [1,2,3], your function should return [1,2,3,3,2,1].

-- at first glance, a pattern approach of flipping the atom and list parts seems a good approach
-- how about, take the original list and append the reversed list?
myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x]

-- ok reverse looks good, now the palindrome.

myPalindrome xs = let myReverse [] = []
                      myReverse (y:ys) = myReverse ys ++ [y]
                  in xs ++ myReverse xs

-- hmm, let or where, which is nicer? I'd have to where, for readability reasons.

-- ps, I use the ugly 'my' prefix because I'm unsure how namespaces work in haskell and don't want to risk pollution.
