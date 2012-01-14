package pea

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
            val best = bestOf(population)

            val nextGen = population.grouped(2).flatMap {
                case a :: b :: Nil =>
                    val (x,y) = crossover(a,b)
                    mutate(x) :: mutate(y) :: Nil
                case _ => Nil
            }

            val newPopulation = (population ++ nextGen).sortBy(F)(implicitly[Ordering[R]].reverse).take(2*K)
            val newBest = bestOf(newPopulation)

            if(n > 0) inner(n-1, newPopulation, newBest)
            else newBest
        }

        val initial = (1 to (2*K)).map(i => newRandom(s0)).toList

        inner(N, initial, initial.head)
    }

    override def toString = "G(k=%d, n=%d)" format (K, N)
}
