package pea

abstract class TabuSearch[A, T, R : Ordering] extends Function1[A, A] {
    import scala.Ordering.Implicits._

    def N: Int
    def Tsize: Int

    def F(x: A): R  // cost function
    def S(x: A): TraversableOnce[T]  // new moves generator
    def NS(x: A, t: T): A // new state generator
    // def SR(x: A): A // new random state generator

    val tabu = new scala.collection.mutable.Queue[T]

    // def isTabu(x: T) = tabu.contains(x)

    def P(t: T): Boolean

    def apply(s0: A) = {
        def inner(bestState: A, oldState: A, n: Int): A = {
            if(n <= 0) bestState
            else {
                val newStates = S(oldState).toList.filterNot { m => P(m) } map { m => (NS(oldState, m), m) }
                val (newState, newTabu) = newStates.minBy { e => F(e._1) }
                println(n + " : " + newState)

                tabu enqueue newTabu
                if(tabu.length > Tsize) tabu.dequeue

                if(F(newState) < F(bestState)) inner(newState, newState, n-1)
                else inner(bestState, newState, n-1)

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

        inner(s0, s0, N)
    }

    override def toString = "TS(%d)" format N
}
