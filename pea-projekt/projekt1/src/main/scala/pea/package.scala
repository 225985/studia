package object pea {
    type Alg = TaskList => TaskList

    case class Task(index: Int, p: Int, d: Int, w: Int){
        override def toString = index.toString
    }

    case class TaskList(list: List[Task]){
        lazy val cost = ((0,0) /: list){
            case ((time, cost), task) =>
                val newTime = time + task.p
                val newCost = cost + math.max(0, (newTime - task.d)) * task.w
                (newTime, newCost)
        }._2

        override def toString = "%s : %d" format (list.map(_.toString).mkString("[", ",", "]"), cost)
    }

    trait Common {
        def selections[A](list: List[A]): List[(A, List[A])] = list match {
            case Nil => Nil
            case x :: xs => (x, xs) :: (for((y, ys) <- selections(xs)) yield (y, x :: ys))
        }

        implicit def taskListOrdering = new Ordering[TaskList]{
            def compare(x: TaskList, y: TaskList): Int = x.cost compare y.cost
        }

        implicit def arraySwap(list: List[Task]) = new {
            def swapped(i: Int, j: Int) = {
                val cpy = list.toArray
                val tmp = cpy(i)
                cpy(i) = cpy(j)
                cpy(j) = tmp
                cpy.toList
            }
        }

    }
}
