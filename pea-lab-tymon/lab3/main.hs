import Data.List
import Data.Function
import qualified Data.Text as T
import System (getArgs)
import Debug.Trace (trace)
import Control.Arrow

data Task = Task {index::Int, p::Int}

instance Show Task where
    show t = (show $ index t) ++ "(" ++ (show $ p t) ++ ")"

showTask :: Task -> String
showTask t = show [index t, p t]

readTask :: String -> Int -> Task
readTask s i = Task i (read s)


-- LPT
lpt :: Int -> Int -> [Task] -> (Int, [(Task, Int)])
lpt p0 p1 tasks = case (foldl f (p0, p1, []) tasks) of (p0, p1, sch) -> (max p0 p1, reverse sch)
  where f (p0, p1, sch) t | p0 < p1 = (p0 + (p t), p1, (t, 0) : sch)
        f (p0, p1, sch) t           = (p0, p1 + (p t), (t, 1) : sch)


-- Bruteforce
bruteforce :: [Task] -> (Int, [(Task, Int)])
bruteforce tasks = minimumBy (compare `on` fst) $ map (time >>= (,)) $ map (zip tasks) $ comb (length tasks)

comb :: Int -> [[Int]]
comb n = inner 0 n [[]]

inner :: Int -> Int -> [[Int]] -> [[Int]]
inner k n xss | k == n = xss
inner k n xss          = inner (k+1) n $ xss >>= \xs -> [0:xs, 1:xs]

time :: [(Task, Int)] -> Int
time xs = (uncurry max) $ foldl f (0,0) xs
  where f (p0, p1) (t, 0) = (p0 + (p t), p1)
        f (p0, p1) (t, 1) = (p0, p1 + (p t))

-- Utils
machines :: [(Task, Int)] -> ([Task], [Task])
machines tasks =  (map fst *** map fst) $ partition ((0==) . snd) tasks

sump :: [Task] -> Int
sump tasks = foldl (\a t -> a + (p t)) 0 tasks

lb tasks = fromIntegral $ div (sum $ map p tasks) 2

run tasks e = let
  b =  (e * (lb tasks)) :: Float
  (ax, bx) = partition (\t -> (fromIntegral $ p t) > b) tasks
  (p0, p1) = machines $ snd $ bruteforce ax
  (m0, m1) = machines $ snd $ lpt (sump p0) (sump p1) bx
  in (b, e, p0, m0, p1, m1)

disp (k, e, p0, m0, p1,m1) = (show k) ++ " " ++ (show e) ++ "\n" ++ "m0: " ++ (show $ sump (p0++m0)) ++ " => " ++ (show p0) ++ " --- " ++ (show m0) ++ "\n" ++ "m1: " ++ (show $ sump (p1++m1)) ++ " => " ++ (show p1) ++ "---" ++ (show m1) ++ "\n"

main = do
    args <- System.getArgs
    x <- readFile "data.txt"
    let tasks = reverse $ sortBy (compare `on` p) $ map (uncurry readTask) (zip (take (read (args !! 0) :: Int) (lines x)) [1..] )
    putStrLn $ show $ map (\t -> (run tasks $ (read (args !! 1) :: Float))) [1..100000]
