-- 1. Write your own "safe" definitions of the standard partial list funciton, but make sure they never fail.  As a hint, you might want to consider using the following types:

safeHead :: [a] -> Maybe a
safeTail :: [a] -> Maybe [a]
safeLast :: [a] -> Maybe a
safeInit :: [a] -> Maybe [a]

safeHead (x:_) = Just x
safeHead [] = Nothing

safeTail (x:xs) = Just xs
safeTail [] = Nothing

-- since there's no mention of not wrapping the standard functions we can do this...
safeLast (x:xs) = Just (last (x:xs))
safeLast [] = Nothing

-- but if that irks you, here's the alternative :P
--safeLast (x:xs) | null xs = Just x
--                | otherwise = safeLast xs
--safeLast [] = Nothing

safeInit (x:xs) = Just (init (x:xs))
safeInit [] = Nothing
