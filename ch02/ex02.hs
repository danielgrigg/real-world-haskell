-- 1. Haskell provides a standard function, last :: [a] -> a, that returns the last element of a list.  From reading the type alone, what are the possible valid behaviours (omitting crashes and infinite loops) that this function could have?  What are a few things that this function clearly cannot do?

Since it's a generic type the only possible outcome is returning some element within the array.  It can be any element of course.

Things it can't do... can't create an instance of a new value, eg, add elements together, return a constant. 
Can't use it to fuel your car. 
