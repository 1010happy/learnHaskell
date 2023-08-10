-- example function
-- goes downwards in order
-- each line a function, abit like a case
lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY NUM 7"
lucky x = "sorry :("

sayNum :: (Integral a) => a -> String 
sayNum 2 = "TWO"
sayNum 3 = "THRWW"

--recursion
factorial :: (Integral a) => a -> a 
factorial 0 = 1
factorial n = n * factorial (n - 1)  

charName :: Char -> String  
charName 'a' = "Albert"  


--The type signature for `charName' lacks an accompanying binding

addVect :: (Num a) => (a,a) -> (a,a) -> (a,a)
--addVect x y = ((fst x + fst y), (snd x + snd y))
-- addVect x y = ((x !! 0 + y !! 0), (x !! 1 + y !! 1)) (only works for list not tuple)
addVect (a,b) (c,d) = (a+c,b+d)

-- self extraction
firstTrip :: (a,b,c) -> a -- underscores can't be used in declaration
firstTrip (a,_,_) = a
secondTrip :: (a,b,c) -> b
secondTrip (_,b,_) = b

-- in terminal, (pattern matching)
-- let xs = [(1,3), (4,3), (2,4), (5,3), (5,6), (3,1)]  
-- [a+b | (a,b) <- xs]  

-- x:xs binds an aray of [x eles, xs eles] (kinda has empty arr at back but not rly)
-- so eg. [1,2,3] technically is 1:2:3:[]
headtime :: [a] -> a
headtime [] = error "empty rip" -- error for error msg <runtime rrror:
headtime (x:_) = x


-- _ can be used in front or behind (if front, generally 1 var, if back, anyth)
-- : to join 2 arays, can (x:y) to show arr of 2 eles
tell :: [a] -> String -- original ver has a (Show a) => but doesn't explain why
-- a has to be part of show (can be turned into string?)
-- show turns into string
tell [] = "empty"
tell (x:[]) = "one"
tell (x:y:[]) = "222222"
tell (x:y:_) = "longer than 2"

-- can use recursion eg.
length' :: [a] -> Int -- again, asks for (Num a) =>mb they js wanted to limit to num
length' [] = 0
length' (x:[]) = 1
length' (_:xs) = 1 + length' xs 
-- length' (_:xs) = length' xs + 1 -- can use _ infront as well; _ denotes any 1 var if in front, anything at the back if behind?

--attempt sum array
summer :: (Num a) => [a] -> a
summer [] = 0
summer (x:[]) = x
summer (x:xs) = x + summer xs



