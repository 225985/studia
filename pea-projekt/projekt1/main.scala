abstract class SimulatedAnnealing[T, R](implicit ord: Ordering[R]) {
    def Tmin: Double
    def Tmax: Double
    def Td: Double // [0..1]

    def T(t: Double) = t * Td

    def F(x: T): R  // cost function
    def S(x: T): T  // new state generator
    def S0: T       // start state

    def P(a: T, b: T, t: Double): Double // lim (t -> 0) = 0 !!!

    def apply(): (T,R) = {
        var oldState = S0
        var bestState = oldState
        var i = 0
        var t = Tmax

        while(t > Tmin){
            println(oldState, F(oldState))

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

        (bestState, F(bestState))
    }
}

object App {
    val fx = new SimulatedAnnealing[Double, Double]{
        def Tmin = 0.01
        def Tmax = 100.0
        def Td = 0.99
        def S0 = 1.0
        def F(x: Double) = math.pow(x, 4) + math.pow(x, 3) + math.pow(x, 2) + x
        def S(x: Double) = if(math.random > 0.5) x + 0.01 else x - 0.01
        def P(a: Double, b: Double, t: Double) = math.pow(math.E, -( F(b) - F(a) ) / t)
    }

    def main(args: Array[String]){
        // println(fx())


        def pp[A](list: List[A]) = list.reverse match {
            case Nil => Nil
            case x :: xs => xs.zipWithIndex.map { case(_,i) => (xs.take(i+1) ::: x :: xs.drop(i+1)).reverse }
        }

        println(pp(List(1,2,3,4)))

    }
}
