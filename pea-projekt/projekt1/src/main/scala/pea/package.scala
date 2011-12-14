package object pea {
    type Alg = TaskList => TaskList

    case class Task(index: Int, p: Int, d: Int, w: Int){
        override def toString = index.toString
    }

    case class TaskList(list: Array[Task]){
        lazy val cost = ((0,0) /: list){
            case ((time, cost), task) =>
                val newTime = time + task.p
                val newCost = cost + math.max(0, (newTime - task.d)) * task.w
                (newTime, newCost)
        }._2

        override def toString = "%s : %d" format (list.map(_.toString).mkString("[", ",", "]"), cost)

        def randomPermutation = {
            val rand = new scala.util.Random
            val i1 = rand.nextInt(list.length)
            var i2 = rand.nextInt(list.length)
            while(i1 == i2){ i2 = rand.nextInt(list.length) }

            val arr = list.clone
            val tmp = arr(i1)
            arr(i1) = arr(i2)
            arr(i2) = tmp

            TaskList(arr)
        }
    }

    trait Common {
        def selections[A](list: List[A]): List[(A, List[A])] = list match {
            case Nil => Nil
            case x :: xs => (x, xs) :: (for((y, ys) <- selections(xs)) yield (y, x :: ys))
        }

        implicit def taskListOrdering = new Ordering[TaskList]{
            def compare(x: TaskList, y: TaskList): Int = x.cost compare y.cost
        }
        
        implicit def arraySwap[T](arr: Array[T]) = new {
            def swapped(i: Int, j: Int) = {
                val tmp = arr(i)
                arr(i) = arr(j)
                arr(j) = tmp
                arr
            }
        }

    }
}
