// generyczna klasa algorytmu genetycznego
abstract class Genetic[A, R : Ordering] extends Function1[A, A] {
    import scala.Ordering.Implicits._

    def K: Int // population size (will be doubled!)
    def F(x: A): R  // cost function
    def N: Int // number of iterations
    def M: Double // mutation probability
    def crossover(a: A, b: A): (A, A) // crossover function
    def mutation(a: A): A
    def newRandom(a: A): A

    def bestOf(as: List[A]): A = as.minBy(F)
    def mutate(a: A) = if(math.random < M) mutation(a) else a

    def apply(s0: A) = {

        def inner(n: Int, population: List[A], best: A): A = {
            val nextGen = population.grouped(2).flatMap {
                case a :: b :: Nil =>
                    val (x,y) = crossover(a,b)
                    mutate(x) :: mutate(y) :: Nil
                case _ => Nil
            }

            val newPopulation = (population ++ nextGen).sortBy(F).take(2*K)
            val newBest = bestOf(newPopulation)

            if(n > 0) inner(n-1, newPopulation, newBest)
            else newBest
        }

        val initial = (1 to (2*K)).map(i => newRandom(s0)).toList

        inner(N, initial, initial.head)
    }
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

// Implementacja algorytmu genetycznego
val GA = (n: Int, k: Int) => new Genetic[TaskList, Int] with Common {
    def N = n
    def M = 0.01
    def K = k
    def F(tasks: TaskList) = tasks.cost

    def crossover(a: TaskList, b: TaskList) = pmx(b,a)
    def mutation(tasks: TaskList) = TaskList(randomPermutation(tasks.list))
    def newRandom(tasks: TaskList) = TaskList(randomPermutation(tasks.list))

    def pmx(ta: TaskList, tb: TaskList): (TaskList, TaskList) = {
        def zeros(n: Int) = new Array[Task](n)

        val (a, b, n) = (ta.list, tb.list, ta.list.length)

        val rand = new Random
        var ti = rand.nextInt(n)
        var tj = rand.nextInt(n)
        while(ti == tj){ tj = rand.nextInt(n) }
        val (i,j) = if(ti < tj) (ti, tj) else (tj, ti)

        val (af, ar) = a.splitAt(i)
        val (am, ab) = ar.splitAt(j-i)

        val (bf, br) = b.splitAt(i)
        val (bm, bb) = br.splitAt(j-i)

        val ax = zeros(i) ++ bm ++ zeros(n - j)
        val bx = zeros(i) ++ am ++ zeros(n - j)

        a.zipWithIndex.foreach { case (e,i) => if(ax(i) == null && !ax.contains(e)) ax(i) = e }
        b.zipWithIndex.foreach { case (e,i) => if(bx(i) == null && !bx.contains(e)) bx(i) = e }

        ax.zipWithIndex.foreach { case (e,i) => if(e == null) ax(i) = a.dropWhile(ax.contains).head }
        bx.zipWithIndex.foreach { case (e,i) => if(e == null) bx(i) = b.dropWhile(bx.contains).head }

        (TaskList(ax), TaskList(bx))
    }

}
