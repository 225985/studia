package pea

abstract class SimulatedAnnealing[T, R : Ordering]{
    import scala.Ordering.Implicits._

    def Tmin: Double
    def Tmax: Double
    def Td: Double // [0..1]

    def T(t: Double) = t * Td

    def F(x: T): R  // cost function
    def S(x: T): T  // new state generator

    def P(a: T, b: T, t: Double): Double // lim (t -> 0) = 0 !!!

    def apply(s0: T) = {
        def inner(bestState: T, oldState: T, t: Double): T = {
            if(t < Tmin) oldState
            else {
                val newState = S(oldState)
                val (a,b) = if(F(newState) < F(oldState)){
                    if(F(newState) < F(bestState)) (newState, newState)
                    else (bestState, newState)
                } else if (math.random < P(oldState, newState, t)){
                    (bestState, newState)
                } else {
                    (bestState, oldState)
                }
                inner(a, b, T(t))
            }
        }

        inner(s0, s0, Tmax)
    }
}
