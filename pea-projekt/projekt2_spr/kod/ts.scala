//generyczna klasa algorytmu tabu search
abstract class TabuSearch[A, T, R : Ordering] extends Function1[A, A] {
    import scala.Ordering.Implicits._

    def N: Int
    def Tsize: Int
    def Kmax: Int

    def F(x: A): R  // cost function
    def S(x: A): TraversableOnce[T]  // new moves generator
    def NS(x: A, t: T): A // new state generator
    def SR(x: A): A // new random state generator

    val tabu = new scala.collection.mutable.Queue[T]

    def P(t: T): Boolean

    def apply(s0: A) = {
        tabu.clear()
        def inner(bestState: A, oldState: A, n: Int, k: Int): A = {
            if(n <= 0) {
                bestState
            } else if(k >= Kmax) {
                inner(bestState, SR(oldState), n, 0)
            } else {
                val newStates = S(oldState).toList.filterNot { m => P(m) } map { m => (NS(oldState, m), m) }
                val (newState, newTabu) = newStates.minBy { e => F(e._1) }

                tabu enqueue newTabu
                if(tabu.length > Tsize) tabu.dequeue

                if(F(newState) < F(bestState)) inner(newState, newState, n-1, 0)
                else inner(bestState, newState, n-1, k+1)
            }
        }

        inner(s0, s0, N, 0)
    }

    override def toString = "TS(%d)" format N
}

// Klasa reprezentujaca zadanie
case class Task(index: Int, p: Int, d: Int, w: Int){
    override def toString = index.toString
}

// Klasa reprezentujaca uporzadkowanie zadan
case class TaskList(list: Array[Task]){
    lazy val cost = ((0,0) /: list){
        case ((time, cost), task) =>
            val newTime = time + task.p
            val newCost = cost + math.max(0, (newTime - task.d)) * task.w
            (newTime, newCost)
    }._2
}

trait Common {
    implicit def taskListOrdering = new Ordering[TaskList]{
        def compare(x: TaskList, y: TaskList): Int = x.cost compare y.cost
    }

    implicit def arraySwap[T](arr: Array[T]) = new {
        def swapped(i: Int, j: Int) = {
            val cpy = arr.clone
            val tmp = cpy(i)
            cpy(i) = cpy(j)
            cpy(j) = tmp
            cpy
        }
    }
}

// Implementacja algorytmu Tabu Search
val TS = (n: Int, k: Int, t: Int) => new TabuSearch[TaskList, (Int, Int), Int] with Common {
    def N = n
    def Kmax = k
    def Tsize = t
    def F(tasks: TaskList) = tasks.cost

    def S(tasks: TaskList) = (0 until tasks.list.length).combinations(2).map { idx => (idx(0), idx(1)) }

    def NS(tasks: TaskList, move: (Int, Int)) = TaskList(tasks.list.swapped(move._1, move._2))

    def SR(tasks: TaskList) = TaskList(randomPermutation(tasks.list))

    def P(move: (Int, Int)) = {
        tabu.exists { case (a,b) => a == move._1 || b == move._1 || a == move._2 || b == move._2 }
    }
}

