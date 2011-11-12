import Data.List
-- import Criterion.Main

data Task = Task {index::Int, p::Int, d::Int, w::Int}

instance Show Task where
    show t = show $ index t


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


branch :: Int -> [Task] -> [Task] -> [[Task]] -> [[Task]]
branch _ xs [] qs                   = xs : qs
branch lb xs ys qs | cost xs < lb   = selections ys >>= fm
    where fm (z, zs) = branch lb (xs ++ [z]) zs qs
branch _ _ _ _                      = []


oneone :: [Task] -> ([Task], Int)
oneone tasks = minimumCost $ branch (cost tasks) [] tasks []


main = do
    let tasks = [Task 1 5 10 1, Task 2 8 4 2 , Task 3 11 22 2 , Task 4 5 23 3 , Task 5 3 2 2]

    print $ bruteforce tasks
    print $ oneone tasks
