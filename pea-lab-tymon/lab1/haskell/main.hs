import Data.List
import System (getArgs)

data Task = Task {index::Int, p::Int, d::Int, w::Int}

instance Show Task where
    show t = show $ index t

showTask :: Task -> String
showTask t = show [index t, p t, d t, w t]



readTask :: String -> Int -> Task
readTask s i = case (map read (words s)) of x:y:z:[] -> Task {index=i, p=x, d=y, w=z}


selections :: [a] -> [(a, [a])]
selections []       = []
selections (x:xs)   = (x,xs) : [(y, x:ys) | (y,ys) <- selections xs]


permute :: [a] -> [[a]]
permute []  = [[]]
permute xs  = [y:ps | (y,ys) <- selections xs, ps <- permute ys]


cost :: [Task] -> Int
cost tasks = let c1 (time, cost) task = (newTime, cost + (max 0 (newTime - d task)) * w task)
                    where newTime = time + p task
             in snd (foldl c1 (0,0) tasks)


minimumCost :: [[Task]] -> ([Task], Int)
minimumCost tasks = minimumBy compareSnd $ map (\x -> (x,cost x)) tasks
    where compareSnd = \x y -> compare (snd x) (snd y)


bruteforce :: [Task] -> ([Task], Int)
bruteforce = minimumCost . permute


oneone :: [Task] -> ([Task], Int)
oneone tasks = minimumCost $ branch (cost tasks) [] tasks []
      where branch :: Int -> [Task] -> [Task] -> [[Task]] -> [[Task]]
            branch _ xs [] qs                   = xs : qs
            branch lb xs ys qs | cost xs < lb   = selections ys >>= fm
                where fm (z, zs) = branch lb (xs ++ [z]) zs qs
            branch _ _ _ _                      = []


run :: String -> ([Task] -> ([Task], Int)) -> IO ()
run n f = do
    x <- readFile ("../data/" ++ n ++ ".txt")
    print $ f $ map (uncurry readTask) (zip (lines x) [1..] )

main = do
    args <- System.getArgs
    case args of    "b":n:[] -> run n bruteforce
                    "o":n:[] -> run n oneone
                    _       -> error "Usage: main [b or o] [n]"


