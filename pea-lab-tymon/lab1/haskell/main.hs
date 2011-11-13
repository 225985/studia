import Data.List
import Data.Function.Memoize
import System (getArgs)
import Debug.Trace (trace)

data Task = Task {index::Int, p::Int, d::Int, w::Int}

instance Show Task where
    show t = show $ index t


-- showTask :: Task -> String
showTask t = show [index t, p t, d t, w t]


-- readTask :: String -> Int -> Task
readTask s i = case (map read (words s)) of x:y:z:[] -> Task {index=i, p=x, d=y, w=z}


-- selections :: [a] -> [(a, [a])]
selections []       = []
selections (x:xs)   = (x,xs) : [(y, x:ys) | (y,ys) <- selections xs]


-- permute :: [a] -> [[a]]
permute []  = [[]]
permute xs  = [y:ps | (y,ys) <- selections xs, ps <- permute ys]


-- cost :: [Task] -> Int
cost tasks = let c1 (time, cost) task = (newTime, cost + (max 0 (newTime - d task)) * w task)
                    where newTime = time + p task
             in snd (foldl c1 (0,0) tasks)


-- minimumCost :: [[Task]] -> ([Task], Int)
minimumCost tasks = minimumBy compareSnd $ map (\x -> (x,cost x)) tasks
    where compareSnd = \x y -> compare (snd x) (snd y)


-- bruteforce :: [Task] -> ([Task], Int)
bruteforce = minimumCost . permute


-- eliminate :: ([Task] -> Bool) -> [Task] -> ([Task], Int)
eliminate p tasks = minimumCost $ branch [] tasks []
      where branch :: [Task] -> [Task] -> [[Task]] -> [[Task]]
            branch xs [] qs              = xs : qs
            branch xs ys qs | not (p xs) = selections ys >>= fm
                where fm (z, zs) = branch (xs ++ [z]) zs qs
            branch _  _  qs              = qs


-- oneone :: [Task] -> ([Task], Int)
oneone tasks = eliminate (\xs -> cost xs >= lb) tasks
    where lb = cost tasks


-- twotwo :: [Task] -> ([Task], Int)
twotwo = eliminate (\xs -> cost (swap xs) < cost xs)


-- run :: String -> ([Task] -> ([Task], Int)) -> IO ()
run n f = do
    x <- readFile ("../data/" ++ n ++ ".txt")
    print $ f $ map (uncurry readTask) (zip (lines x) [1..] )


-- swap [x1, x2, ... , xn, xm] into [x1, x2, ... , xm, xn]
-- swap :: [a] -> [a]
swap []     = []
swap [x]    = [x]
swap list   = case (reverse list) of x:y:xs -> reverse (y:x:xs)


main = do
    args <- System.getArgs
    case args of    "0":n:[] -> run n bruteforce
                    "1":n:[] -> run n oneone
                    "2":n:[] -> run n twotwo
                    "x":n:[] -> do
                            run n bruteforce
                            run n oneone
                            run n twotwo
                    _        -> error "Usage: main [0-2 | x] [n]"

