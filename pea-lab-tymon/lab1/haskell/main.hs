import Data.List
import qualified Data.Text as T
import System (getArgs)
import Debug.Trace (trace)

data Task = Task {index::Int, p::Int, d::Int, w::Int}

instance Show Task where
    show t = show $ index t

showTask :: Task -> String
showTask t = show [index t, p t, d t, w t]

readTask :: String -> Int -> Task
readTask s i = Task {index=i, p=x, d=y, w=z} where (x:y:z:[]) = map read $ words s

selections :: [a] -> [(a, [a])]
selections []       = []
selections (x:xs)   = (x,xs) : [(y, x:ys) | (y,ys) <- selections xs]

permute :: [a] -> [[a]]
permute []  = [[]]
permute xs  = [y:ps | (y,ys) <- selections xs, ps <- permute ys]

cost :: [Task] -> Int
cost tasks = let c1 (time, cost) task = (newTime, cost + (max 0 (newTime - d task)) * w task)
                    where newTime = time + p task
             in snd (foldl' c1 (0,0) tasks)

minimumCost :: [[Task]] -> ([Task], Int)
minimumCost tasks = minimumBy compareSnd $ map (\x -> (x,cost x)) tasks
    where compareSnd = \x y -> compare (snd x) (snd y)

bruteforce :: [Task] -> ([Task], Int)
bruteforce = minimumCost . permute

eliminate :: ([Task] -> Bool) -> [Task] -> ([Task], Int)
eliminate p tasks = minimumCost $ branch [] tasks []
      where branch :: [Task] -> [Task] -> [[Task]] -> [[Task]]
            branch xs [] qs              = xs : qs
            branch xs ys qs | not (p xs) = selections ys >>= fm
                where fm (z, zs) = branch (xs ++ [z]) zs qs
            branch _  _  qs              = qs

elimination1' :: [Task] -> ([Task], Int)
elimination1' tasks = minimumCost $ branch [([], tasks)] [] (cost tasks)
     where branch :: [([Task], [Task])] -> [[Task]] -> Int -> [[Task]]
           branch [] res _              = res
           branch ((xs, []):zs) res st  = let nc = cost xs in if nc < st then branch zs (xs:res) nc else branch zs res st
           branch ((xs, ys):zs) res st  = branch ([(xs ++ [e], es) | (e,es) <- selections(ys)] ++ zs) res st



elimination1 :: [Task] -> ([Task], Int)
elimination1 tasks = eliminate (\xs -> cost xs >= lb) tasks
    where lb = cost tasks

elimination2 :: [Task] -> ([Task], Int)
elimination2 = eliminate (\xs -> anySwap (\ys -> cost ys < cost xs) xs)

run :: String -> ([Task] -> ([Task], Int)) -> IO ()
run n f = do
    x <- readFile ("../data/" ++ n ++ ".txt")
    let tasks = map (uncurry readTask) (zip (lines x) [1..] )

    -- putStrLn "   P    D    W"
    -- putStrLn "--------------"
    -- putStrLn $ unlines $ map (\task -> unwords $ map (\e -> T.unpack $ T.justifyRight 4 ' ' (T.pack $ show e)) [p task, d task, w task]) tasks

    let (res, cost) = f tasks
    -- putStrLn $ "Naljepsze uszeregowanie: " ++ (show res)
    -- putStrLn $ "                  Koszt: " ++ (show cost)
    print $ (res, cost)

-- swap [x1, x2, ... , xn, xm] into [x1, x2, ... , xm, xn]
swap :: [a] -> [a]
swap []     = []
swap [x]    = [x]
swap list   = case (reverse list) of x:y:xs -> reverse (y:x:xs)

swaps :: [a] -> [[a]]
swaps [] = []
swaps [x] = [[x]]
swaps (x:y:[]) = [[y,x]]
swaps (x:y:xs) = (y:x:xs) : map (y:) (swaps (x:xs))

anySwap :: ([a] -> Bool) -> [a] -> Bool
anySwap f xs = any f $ map reverse $ swaps $ reverse xs

main = do
    args <- System.getArgs
    case args of    "0":n:[] -> run n bruteforce
                    "1":n:[] -> run n elimination1
                    "1a":n:[] -> run n elimination1'
                    "2":n:[] -> run n elimination2
                    _        -> error "Usage: Main [0-2] [n]"
