package pea

abstract class SimulatedAnnealing[T, R](implicit ord: Ordering[R]) {
    def Tmin: Double
    def Tmax: Double
    def Td: Double // [0..1]

    def T(t: Double) = t * Td

    def F(x: T): R  // cost function
    def S(x: T): T  // new state generator

    def P(a: T, b: T, t: Double): Double // lim (t -> 0) = 0 !!!

    def apply(s0: T) = {
        var oldState = s0
        var bestState = oldState
        var i = 0
        var t = Tmax

        while(t > Tmin){
            val newState = S(oldState)
            if(ord.lt(F(newState), F(oldState))){
                if(ord.lt(F(newState), F(bestState))) bestState = newState
                oldState = newState
            } else if (math.random < P(oldState, newState, t)) {
                oldState = newState
            }

            t = T(t)
            i = i + 1
        }

        // (bestState, oldState)
        bestState
    }
}
