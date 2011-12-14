package pea

abstract class TabuSearch[A, T, R : Ordering]{
    import scala.Ordering.Implicits._

    def N: Int
    def Tsize: Int

    def F(x: A): R  // cost function
    def S(x: A): TraversableOnce[(A, T)]  // new states generator

    val tabu = new scala.collection.mutable.Queue[T]

    def isTabu(x: A) = !tabu.forall(t => P(x, t))

    def P(x: A, t: T): Boolean

    def apply(s0: A) = {
        def inner(bestState: A, oldState: A, n: Int): A = {
            if(n <= 0) bestState
            else {
                val (newState, newTabu) = S(oldState).filter { e => !isTabu(e._1) }.minBy { e => F(e._1) }

                tabu enqueue newTabu
                if(tabu.length > Tsize) tabu.dequeue

                if(F(newState) < F(bestState)) inner(newState, newState, n-1)
                else inner(bestState, newState, n-1)
            }
        }

        inner(s0, s0, N)
    }
}
