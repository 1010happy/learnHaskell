-- curied functions; each func in haskell officially only takes 1
-- eg. max 4 5 = (max 4) 5 
-- max a b
-- max a creates func that gives a or unknown param
-- (max a) b feeds in said unknown param
-- ie.

-- max :: (Ord a) => a -> a -> a
-- is max :: (Ord a) => a -> (a -> a)
-- hence if func called back w too few params, can get back partial
-- eg.
-- basically function nesting

-- so basically any func func a b c is (((func a) b) c)
-- therefore declaring eg. funce = (func a) is the same as funce b = (func a) b  = func a b 
-- does still need the declaraion in front tho

mulThree :: (Num a) => a -> a -> a -> a
mulThree a b c = a * b * c
-- let mulTN = mulThree 9 
-- mulTN 1 2 gives 18

compare' :: (Ord a) => a -> a -> Ordering 
compare' a b
    | a > b = GT
    | a < b = LT
    |otherwise = EQ

-- let compareHundred = compare' 100
-- or

compareHundred :: (Num a, Ord a) => a -> Ordering
--compareHundred a = compare 100 a
-- and
compareHundred = compare 100 
-- do the same thing (technically that line isn't needed but the declaration is te same)
-- with the same declaration (cuz they take the a in anyw?)

-- infix funcs can be applied using sections
divideten :: (Floating a) => a -> a
divideten = (/10) -- so eg. divideten 200 will be (/10) 200

isUpperAlpha :: Char -> Bool
isUpperAlpha = (`elem`['A'..'Z'])

--() is kinda like the function to be applied on the next vars
-- compareHundred 120 etc.


-- infx functions

-- higherorderism in Order
-- func can take funcs as params

applytwice :: (a->a) -> a -> a --parantheses now mandatory to indicate function
applytwice f x = f (f x)
-- where f is a function works
-- eg.
-- applytwice (+3) 10  -- give 16
-- appends on whatever direction works
-- applyTwice (++ "HAHA") "HEY" -- hey haha haha
-- applytwce ("HAHA" ++) "HEY" -- haha haha hey
-- applytwice (multThree 2 2) 9
-- applytwice (3:) [1]

-- zipwidth: appends 2 lists by applying funcs between corresponding eles
zipWith' :: (a->b->c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
-- zipWith' f xs ys = [f a b| a <- xs, b <- ys] -- or
zipWith' f (x:xs) (y:ys) = (f x y): zipWith' f xs ys
--zipWith' (zipWith' (*)) [[1,2,3], [3,5,6]] [[3,2,2],[1,2,2]]

flip' :: (a->b->c) -> (b->a->c) 
-- takes func, returns same func with first 2 flipped
flip' f x y = f y x
-- or 
-- flip' f = g
--     where g x y = f y x

-- maps and filters
-- map takes func, applies to every list ele.
-- map :: (a -> b) -> [a] -> [b]
-- map _ [] = []
-- map f (x:xs) = f x : map f xs
-- inbuilt func

-- filter; takes function on whether thing is true, returns list of eles that are true
--filter' :: (a -> Bool) -> [a] -> [a]
--filter' _ [] = []
--filter' f xs = [x | x <- xs, f x]
-- or formally, 
-- filter f (x:xs)
--    | f x = x: filter f xs
--    | otherwise = filter f xs

--quicksort but with filter
qsort :: (Ord a) => [a] -> [a]
qsort [] = []
qsort (x:xs) = 
    let biggerlist = qsort (filter (>x) xs)
        smallerlist = qsort (filter (<= x) xs)
    in smallerlist ++ [x] ++ biggerlist

largestDivisible :: (Integral a) => a
largestDivisible = head (filter checc [100,99..])
    where checc a = (a `mod` 9 == 0)

-- sum (takeWhile (<100) (map (^2) [1,2..10]))

-- collatz sequences: take natural num
-- if num even / 2, if odd *3 + 1
-- produce entire chain

collatz :: (Integral a) => a -> [a]
collatz 1 = [1]
collatz x = x:collatz cur
    where cur = if x `mod` 2 == 0 then (x `div` 2) else (x * 3 + 1)
-- `div` to be used instead of / else become fractional
-- o 
-- collatz x 
--  | even x = x:collatz (x `div` 2)
--  | otherwise = x: collatz (x*3+1)    

numLongChains :: Int
numLongChains = length (filter isLong (map chain [1..100]))
    where isLong xs = length xs > 15

-- let listofFuns = map (*) [0..]
-- (listOfFuns !! 4) 5
-- basically gets (*4) 5 -- so 20

--Lambdas; anon funcs used cuz some funcs only needed once 
-- \ then ()


-- numLongChains = length (filter (\xs -> length xs > 15) (map chain [1..100]))
-- \xs -> length xs > 15 returns func that checks if length of list passed is greater than 15

--or 
-- zipWith (\a b -> (a * 30 + 3)/b) [5,4,3,2,1] [1,2,3,4,5]
--map (\(a,b) -> a+b) [(1,2),(3,4)]

addThree::(Num a) => a -> a -> a -> a
-- addThree a b c = a+b+c -- is the same as
addThree = \x -> \y -> \z -> x + y + z

flip'' :: (a -> b -> c) -> b -> a -> c
flip'' f = \x y -> f y x 

--only folds and forces (x:xs), pattern is called folds
-- map but single vval
-- fold takes binary func, starting val (Accum and list to fold)
-- sth xs varsused = foldl (\func) startval xs


sum' :: (Num a) => [a] -> a
-- foldl (function) (any start val) array
--sum' xs = foldl (\acc x -> acc + x) 0 xs -- needs starting val
-- ie
sum' = foldl (+) 0 -- auto returns final val

-- elem (if val part of list)
elem' :: (Eq a) => a -> [a] -> Bool
elem' a xs = foldl (\ans a x -> if x == a then True else ans) False xs

