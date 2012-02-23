cost :: [Task] -> Int
cost tasks = let c1 (time, cost) task = (newTime, cost + (max 0 (newTime - d task)) * w task)
                    where newTime = time + p task
             in snd (foldl' c1 (0,0) tasks)
