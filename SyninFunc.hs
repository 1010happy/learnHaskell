-- doing this again because its been a wheeele

--lucky :: Int -> String
lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY SEVEN"
lucky x = "not seven"

--longcheck and spel
spelLong :: (Integral a) => a -> String
spelLong 1 = "ONE"
spelLong 2 = "TWO"
spelLong 3 = "Three"
spelLong x = "NONE" --order matters. cals order.

-- recursion works
factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial x = x * factorial (x-1) -- using a x good as a catch

-- addpairs
addpairs :: (Num a) => (a,a) -> (a,a) -> (a,a) 
addpairs a b = (fst a + fst b, snd a + snd b)

addvects :: (Num a) => (a,a) -> (a,a) -> (a,a)
addvects (a,b) (c,d) = (a+c, b+d)

-- self fst snd
first :: (a,b,c) -> a
first (a,_,_) = a

second :: (a,b,c) -> b -- again b, c, place holder
second (_,b,_) = b

--list patter matching
-- in terminal
-- let xs = [(1,2),(3,4)]
-- [a+b | (a,b) <- xs]
-- [action | feed each val, conditions]

-- error call (return first of list) (catch error first)
listfirst :: [a] -> a
listfirst [] = error "empty"
listfirst (x:_) = x 

listsecond :: [a] -> a
listsecond [] = error "lmaoemptiii"
listsecond (a:b:_) = b --here, _ is the trailing array

listcount :: (Show a) => [a] -> String --ensures it can be converted to a string
listcount [] = "has none"
listcount (x:[]) = "has one" ++ show x
listcount (x:y:[]) = "has two" ++ show x ++ show y
listcount x = "idk bro"

--recursive lengthcount
lengthcount :: [a] -> Integer --technically there's a Num cast eg. (Num b) => [a] -> b
lengthcount [] = 0
lengthcount (_:xs) = lengthcount (xs) + 1 --no [] needed at end
-- here, xs is the trailing array, _ is 1 ele. In other words, the front eles are assumed as singles

-- sum list recurse
lengthsum :: (Num a) => [a] -> a -- a num was alr prev defined, can js use it again; will throw error 
lengthsum [] = 0
lengthsum (x:xs) = lengthsum(xs) + x

-- capitalize first letter
caps :: String -> String-- part in () shd be a typeclass
caps "" = "emptee string"
caps all@(x:xs) = "capsed: " ++ [x] ++ "original: " ++ all -- retain original

-- guards; ensure val conforms to form and deconstruct; 
-- gards: test if val T/F

testGuard :: (RealFloat a) => a -> String
testGuard g
    | g <= 5.0 = "less than 5"
    | g <= 6.2 = "less than 6.2"
    | otherwise = "bruh"
-- basically guard is if else but the | is a pipe downwards
-- last guard otherwise 

-- can use functions with many params
calcbmi :: (RealFloat a) => a -> a -> String
calcbmi w h 
    | w/h^2 <= 18.5 = "under"
    | w/h^2 <= 25.0 = "nice"
    | w/h^2 <= 30.0 = "fot"
    | otherwise = "WHALE??? IS THE TUTORIAL OK"

maxfunc :: (Ord a) => a -> a -> a
maxfunc a b 
    | a > b = a
    | otherwise = b

-- guards but cursed (inline)
maxfunck :: (Ord a) => a -> a -> a
maxfunck a b | a > b = a | otherwise = b

-- compare returns greater than larger than equals
-- tried w string: works, note can use ordering
comparefun :: (Ord a) => a -> a -> Ordering
-- comparefunc a b -- this works, but note the below can also be done
a `comparefun` b -- when calling func, need the `` in the name
    | a > b = GT
    | a == b = EQ
    | otherwise = LT


-- WHERE (basically variables/funcs in if else but extra)
-- were is a binding (syntatic construct to bind to vars at end of func so whole func can see (incl all guards))
-- actually its just variables

bmi :: (RealFloat a) => a -> a -> String
bmi w h 
    | bmi <= underv = "under"
    | bmi <= overv = "over"
    | bmi <= fatv = "fateer"
    | otherwise = "gone"
    where bmi = w/h^2
          (underv, overv, fatv) = (18.5, 20.5, 30.0)
-- careful, multiple definitions, has to start at exact same char space as bmi
-- under = 18.5
-- over = 20.5
-- fat = 30.0
-- under over fat in brackets is pattern matching

-- FUNCTIONS MUST START W LOWERCASE LETTERS
initials :: String -> String -> String
initials fn ln = [a] ++ [b]
    where (a:_) = fn 
          (b:_) = ln

-- bmi but list
bmilist :: (RealFloat a) => [(a,a)] -> [a] 
bmilist xs = [bmicalc w h | (w,h) <- xs]
    where bmicalc w h = w / h^2

-- let it goooo let it beeeee im one with the wind and seeeeaaa
-- let bindings(don't span across guards)
-- let .. in ... (single use guard, but it goes at the front)
-- in will close it; but if let is just used, it just defines the function

cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
    let sidearea = 2 * pi * r * h
        toparea = pi * r ^2
    in sidearea + 2 * toparea


-- [if 5 > 3 then "Woo" else "Boo", if 'a' > 'b' then "Foo" else "Bar"]
-- 4 * (if 5 > 3 then 3 else 4) -- 12
-- 4* (let a = 9 in a + 1) + 2 --42
--[let square x = x*x in (square 5, square 3, square 2)]

-- (let a = 100; b = 200; c = 300 in a*b*c, let foo="Hey "; bar = "there!" in foo ++ bar)
-- (let (a,b,c) = (1,2,3) in a+b+c) * 100 

calcbmilet :: (RealFloat a) => [(a,a)] -> [a]
-- calcbmilet xs = [bmi | (w,h) <- xs, let bmi = w/h^2]
calcbmilet xs = [bmi | (w,h) <- xs, let bmi = w/h^2, bmi > 3]

-- let boot x y z = x*y*z
-- boot 1 2 3 -- will work
-- but if with the in ie. let boot x y z = x * y * z in boot 1 2 3
-- it will not work (in kinda closes it) <will throw not in scope>

-- case expressions
-- case syntax ; takes var, then executes block of codes for specific val of var, then catch all
-- case: kinda like guard

head' :: [a] -> a
-- head' [] = error "empty arr"
-- head' (x:_) = x
head' xs = case xs of [] -> error "emptee"
                      (x:_) -> x

-- general
-- case expression of pattern -> result
--                    pattern -> result

describeList :: [a] -> String
describeList xs = case xs of [] -> error "emptee"
                             [x] -> "uno"
                             xs -> "manyeee"

anotherdescList :: [a] -> String
anotherdescList xs = "the list is" ++ what xs
    where what xs = case xs of [] -> error "emptee"
                               [x] -> "uno"
                               xs -> "manyee"