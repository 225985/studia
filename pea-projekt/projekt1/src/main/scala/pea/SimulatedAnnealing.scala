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
        def inner(oldState: T, t: Double): T = {
            println(oldState)
            if(t < Tmin) oldState
            else {
                val newState = S(oldState)
                inner(if(F(newState) < F(oldState) || math.random < P(oldState, newState, t)) newState else oldState, T(t))
            }
        }

        inner(s0, Tmax)

        // var oldState = s0
        // var bestState = oldState
        // var i = 0
        // var t = Tmax
        //
        // while(t > Tmin){
        //     val newState = S(oldState)
        //     if(F(newState) < F(oldState)){
        //         if(F(newState) < F(bestState)) bestState = newState
        //         oldState = newState
        //     } else if (math.random < P(oldState, newState, t)) {
        //         oldState = newState
        //     }
        //
        //     t = T(t)
        //     i = i + 1
        // }
        //
        // bestState
    }
}
