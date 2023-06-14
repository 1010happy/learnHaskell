doubleMe x = x + x 
doubleUs x y = x * 2 + y * 2
doubleUswithMe x y = doubleMe x + doubleMe y

doubleSmall x = if x < 5 then x*2 else x
helloString = "hello"

-- funcs below
addList x y = x ++ y
appendStartList a list = a : list
getnthzeroindex n list = list!!n
compareLargerList x y = if x > y then x else y

headfunc x = head x
tailfunc x = tail x
initfunc x = init x
lastfunc x = last x

lengthfunc x = length x
nullfunc x = null x
reversefunc x = reverse x
takefunc n x = take n x
dropfunc n x = drop n x

minimumfunc x = minimum x
maximumfunc x = maximum x
sumfunc x = sum x
productfunc x = product x

elemfunc a x = a `elem` x

capsarr = ['A'..'D']
stepsarr = [2,4..11]

takecyclefunc n a = take n (cycle a)
takerepeatfunc n a = take n (repeat a) -- same as replicate
replicatefunc n a = replicate n a 

--funky sets
exampleset = [x*2|x <- [1..5], x > 3]
filteringset = [ if x > 3 then "a" else "b" | x <- [1..5]]
omissionset = [x | x <- [1..10], x /= 5]
omissionset2 = [x | x <- [1..10] , (x `mod` 2) /= 0]

appendset = [a+b | a <- [1,2], b <- [2,3,4], b < 4] 
lengtharr = sum [1|_ <- [1,2,3,4]]
removelowercase = [x | x <- "bBaN", x `elem` ['A'..'Z']]

xxs = [[1,2],[2,3],[3,4]]
stackedarr = [[x| x <- xs, x `mod` 2 == 0]| xs <- xxs]

zipfunc = zip [1,2,3] [4,5,6]

rightangtri = [[a,b,c]| a <- [1..20], b <- [1..20], c <- [1..20], a*a + b*b == c*c, a < b, b < c]
