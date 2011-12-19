package pea

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

                // val newStates = S(oldState).toList.filterNot { e => P(e._1) }
                // if(newStates.isEmpty){
                //     tabu.clear()
                //     inner(bestState, SR(oldState), n-1)
                // } else {
                //     val (newState, newTabu) = newStates.minBy { e => F(e._1) }
                //     tabu enqueue newTabu
                //     if(tabu.length > Tsize) tabu.dequeue
                //
                //     if(F(newState) < F(bestState)) inner(newState, newState, n-1)
                //     else inner(bestState, newState, n-1)
                // }
            }
        }

        inner(s0, s0, N, 0)
    }

    override def toString = "TS(n=%d, k=%d, t=%d)" format (N, Kmax, Tsize)
}
