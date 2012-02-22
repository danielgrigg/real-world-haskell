-- Write a function that computes the mean of a list, i.e., the sum of all elements in the list divided by its length.  (You may need to use the fromIntegral function to convert the length of the list from an integer into a floating-point number.)

-- jumped some of the working here.  Originally did a if-then-else sum because I was unsure
-- how the offside rule/indenting should be.  Turns out it just 'works' :)

myMean xs =  mySum xs / fromIntegral (length xs)
       where mySum (y:ys) = y + mySum ys
             mySum [] = 0
