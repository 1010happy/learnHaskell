-- maximum func exists but we make it recurse
maxfunc :: (Ord a) => [a] -> a
maxfunc [] = error "empty"
maxfunc [a] = a 
maxfunc (x:xs)
    | x > maxTail = x
    | otherwise = maxTail
    where maxTail = maxfunc xs 

-- max returns bigger num of 2
maxfunc' :: (Ord a) => [a] -> a
maxfunc' [] = error "empty"
maxfunc' [a] = a
maxfunc' (x:xs) = max (x) (maxfunc' (xs))

-- replicate; takes Int and some ele, returns list with repetitions of same ele
-- basically replicat 3 5 = [5,5,5]
replicate' :: (Integral i) => i -> a -> [a]
replicate' n a
    | n <= 0 = []
    |otherwise = a:replicate' (n-1) a
    -- | otherwise = [a] ++ replicate' (n-1) (a)

-- takes-- take 3 [5,4,3,2,1] = [5,4,3]
take' :: (Integral n, Eq a) => n -> [a] -> [a]
-- this does if n <= 0 or all == 
--take' n all@(x:xs)
--   | n <= 0 = []
--   | all == [] = [] -- ???this dies because when it needs to be a thiscan't be handled?s
--   | otherwise = x:take' (n-1) xs

--or 
take' n _ 
    | n <= 0 = []
take' _ [] = []
take' n (x:xs) = x:take' (n-1) xs

repeat' :: a -> [a]
repeat' x = x:repeat' x

-- take' 3 (repeat' 5)

-- reverse (reverse the list)
-- edge; [empty]

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

-- zip [1,2,3] [2,3] return [(1,2),(2,3)]
zip' :: [a] -> [b] -> [(a,b)] 
zip' _ [] = []
zip' [] _ = []
zip' (x1:xs1) (x2:xs2) = (x1,x2):zip' (xs1) (xs2)

-- elem (see if in list)
elem' :: (Eq a) => a->[a]->Bool
elem' _ [] = False
elem' a (x:xs)
    | a == x = True
    | otherwise = elem' a xs
    

-- quicksort take var, 2 [] smaller and bigger, smaller + x + bigger, sort each
quicksort (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = 
    let bigger = quicksort [a|a<-xs, a >= x]
    smaller = quicksort [a|a <- xs, a < x]
    in bigger ++ [x] ++ smaller
 