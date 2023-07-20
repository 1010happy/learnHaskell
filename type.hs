-- types and typeclasses


removelowercase x = [c|c<-x, c `elem` ['A'..'Z']]
-- :t head gives [a] -> a
-- :t fst gives (a,b) -> a
comparefunc a b =  a `compare` b

showString a = show a

-- read "5" - 2
-- Int can be replaced as any type
readfunctype a  = read a :: Int


--enum anything that is a sequence
-- ['a'..'e'], pred, succ

-- Bounded; anyth w a Bound
boundtest = maxBound :: (Int, Char, Bool)
-- minBound :: Bool
-- maxBound :: Int, Char etc. all works (anyth that is a continuous list can)

--Num; typeclass, members can act like numbers 
-- eg. :t 20 gives Num ;; but other things that are num include
numtest = 20 :: Float 
-- Int, Integer, Float Double etc.
-- similarly, investigating * realises it takes all Nums as argument (use :t (*))
-- need bracket else parse error

-- Integral also numeric (in this class there are ints and integers)
-- similie, Floating incl (Float, Double)

--fromIntegral :: (Num b, Integral a) => a -> b
-- all restricted into type of a, then return b
-- takes Int/Integer turns into Integral (more general)

-- fromIntegral (length [1,2,3,4]) + 3.2