// Generyczna klasa algorytmu wyzarzania
abstract class SimulatedAnnealing[A, R : Ordering]{
    import scala.Ordering.Implicits._

    def Tmin: Double
    def Tmax: Double
    def Td: Double // [0..1]

    def T(t: Double) = t * Td

    def F(x: A): R  // cost function
    def S(x: A): A  // new state generator

    def P(a: A, b: A, t: Double): Double

    def apply(s0: A) = {
        def inner(bestState: A, oldState: A, t: Double): A = {
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

// Klasa reprezentujaca zadanie
case class Task(index: Int, p: Int, d: Int, w: Int){
    override def toString = index.toString
}

// Klasa reprezentujaca uporzadkowanie zadan
case class TaskList(list: List[Task]){
    lazy val cost = ((0,0) /: list){
        case ((time, cost), task) =>
            val newTime = time + task.p
            val newCost = cost + math.max(0, (newTime - task.d)) * task.w
            (newTime, newCost)
    }._2

    override def toString = "%s : %d" format (list.map(_.toString).mkString("[", ",", "]"), cost)

    // funkcja generujaca permutacje uszeregowania
    // zamieniajaca miejscami 2 losowe elementy
    def randomPermutation = {
        val rand = new scala.util.Random
        val i1 = rand.nextInt(list.length)
        var i2 = rand.nextInt(list.length)
        while(i1 == i2){ i2 = rand.nextInt(list.length) }

        val arr = list.toArray
        val tmp = arr(i1)
        arr(i1) = arr(i2)
        arr(i2) = tmp

        TaskList(arr.toList)
    }
}

// implementacja wyzarzania dla klasy TaskList
val SA = (td: Double) => new SimulatedAnnealing[TaskList, Int] with Alg {
    def Tmin = 0.01
    def Tmax = 100.0
    def Td = td

    def F(list: TaskList) = list.cost
    def S(list: TaskList) = list.randomPermutation
    def P(a: TaskList, b: TaskList, t: Double) = math.pow(math.E, -( F(b) - F(a) ) / t)
}
