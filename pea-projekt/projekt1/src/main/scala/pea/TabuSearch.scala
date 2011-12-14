package pea

abstract class TabuSearch[A, T, R : Ordering]{
    import scala.Ordering.Implicits._

    def N: Int
    def Tsize: Int

    def F(x: A): R  // cost function
    def S(x: A): TraversableOnce[(A, T)]  // new states generator

    val tabu = new scala.collection.mutable.Queue[T]

    def isTabu(x: A) = tabu.exists(t => P(x, t))

    def P(x: A, t: T): Boolean

    def apply(s0: A) = {
        def inner(bestState: A, oldState: A, n: Int): A = {
            // println("n = " + n)
            if(n <= 0) bestState
            else {
                val newStates = S(oldState).toList.filterNot { e => isTabu(e._1) }
                if(newStates.isEmpty){
                  tabu.clear()
                  inner(bestState, oldState, n-1)
                } else {
                  val (newState, newTabu) = newStates.minBy { e => F(e._1) }
                  // if(F(newState) < F(oldState)){
                      // println("tabu: " + tabu)
                      // println("newState  " + (newState, newTabu))
                      tabu enqueue newTabu
                      if(tabu.length > Tsize) tabu.dequeue

                      if(F(newState) < F(bestState)) inner(newState, newState, n-1)
                      else inner(bestState, newState, n-1)
                  // } else {
                      // inner(bestState, oldState, n-1)
                  // }
                }
            }
        }

        inner(s0, s0, N)
    }
}
