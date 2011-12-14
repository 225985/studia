package pea

abstract class TabuSearch[A, R : Ordering]{
    import scala.Ordering.Implicits._

    def N: Int

    def F(x: A): R  // cost function
    def S(x: A): TraversableOnce[A]  // new states generator

    def apply(s0: A) = {
        def inner(bestState: A, oldState: A, n: Int): A = {
            if(n <= 0) bestState
            else {
                val newState = S(oldState).minBy(F)

                if(F(newState) < F(bestState)) inner(newState, newState, n-1)
                else inner(bestState, newState, n-1)
            }
        }

        inner(s0, s0, N)
    }
}
