package pea

abstract class TabuSearch[A, R : Ordering]{
    import scala.Ordering.Implicits._

    def N: Int

    def F(x: A): R  // cost function
    def S(x: A): TraversableOnce[A]  // new states generator

    def apply(s0: A) = {
        def inner(oldState: A, n: Int): A = {
            if(n <= 0) oldState
            else {
                val bestState = S(oldState).minBy(F)
                if(F(bestState) < F(oldState)) inner(bestState, n-1)
                else inner(oldState, n-1)
            }
        }

        inner(s0, N)
    }
}
