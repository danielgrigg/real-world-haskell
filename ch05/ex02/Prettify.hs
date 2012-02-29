module Prettify where 

data Doc = Empty
         | Char Char
         | Text String
         | Line
         | Concat Doc Doc
         | Union Doc Doc
           deriving (Show, Eq)

empty :: Doc
empty = Empty

char :: Char -> Doc
char c = Char c

text :: String -> Doc
text "" = Empty
text s = Text s

string :: String -> Doc
string s = Text s

double :: Double -> Doc
double d = text (show d)

line :: Doc
line = Line

(<>) :: Doc -> Doc -> Doc
Empty <> y = y
x <> Empty = x
x <> y = x `Concat` y

hcat :: [Doc] -> Doc
hcat = fold (<>)

fold :: (Doc -> Doc -> Doc) -> [Doc] -> Doc
fold f = foldr f empty

fsep :: [Doc] -> Doc
fsep = fold (</>)

(</>) :: Doc -> Doc -> Doc
x </> y = x <> softline <> y

softline :: Doc
softline = group line

group :: Doc -> Doc
group x = flatten x `Union` x

flatten :: Doc -> Doc
flatten (x `Concat` y) = flatten x `Concat` flatten y
flatten Line           = Char ' '
flatten (x `Union` _)  = flatten x
flatten other          = other

compact :: Doc -> String
compact x = transform [x]
  where transform [] = ""
        transform (d:ds) = 
          case d of 
            Empty          -> transform ds
            Char c         -> c : transform ds
            Text s         -> s ++ transform ds
            Line           -> '\n':transform ds
            a `Concat` b   -> transform (a:b:ds)
            _ `Union` b    -> transform (b:ds)

punctuate :: Doc -> [Doc] -> [Doc]
punctuate p [] = []
punctuate p [d] = [d]
punctuate p (d:ds) = (d <> p) : punctuate p ds

-- EX02 additions here!  
-- To add 'nesting', we use a stack containing the indent levels matching the indent-tokens we've
-- encountered.  We push an indent for our current column when a "{([" style character is encountered 
-- and pop for closing tokens.  The top of the stack of is the current indent. Controllable indent
-- is supported by adding the extra input indent when we push the stack.
pretty i width x = best [0] 0 [x]
  where best ind col (d:ds) = 
            case d of
                 Empty         -> best ind col ds
                 Char c        -> c : best (indent c ind col) (col + 1) ds
                 Text s        -> s ++ best ind (col + length s) ds
                 Line          -> '\n' : (replicate hi ' ') ++ (best ind hi ds)
                 a `Concat` b  -> best ind col (a:b:ds)
                 a `Union` b   -> nicest col (best ind col (a:ds))
                                             (best ind col (b:ds))
            where hi = (head ind)
        best _ _ _ = ""
        
        nicest col a b | (width - least) `fits` a = a
                       | otherwise                = b
                       where least = min width col
        indent c ind col | any (==c) "{([" = (col+i):ind
                         | any (==c) "})]" = tail ind
                         | otherwise = ind

fits :: Int -> String -> Bool
w `fits` _ | w < 0 = False
w `fits` ""        = True
w `fits` ('\n':_)  = True
w `fits` (c:cs)    = (w - 1) `fits` cs

