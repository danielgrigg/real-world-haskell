-- 2. From ghci, type :? to print some help.  Define a variable, such as let x = 1 and then type :show bindings. What do you see?

Let's take it from the top!

Prelude> :?
 -- LOTS OF HELP OMITTED HERE
Prelude> let x = 1
Prelude> :show bindings
it :: Integer = 3
x :: Integer = _
Prelude> 

-- Commentary!  The '_' wildcard seems kinda odd.. That 'it' binding you see is from the previous exercise.

-- True story: I had no idea until going back to this exercise how to define bindings in the repl, err ghci. Lots of lols trying 'x = 1' etc then figuring, 'oh well, I guess you can't bind variables in ghci...man that's teh ghey!".  