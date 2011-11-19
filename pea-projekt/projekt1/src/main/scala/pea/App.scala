package pea

object App {
    val SA = new SimulatedAnnealing[TaskList, Int] with Alg {
        def Tmin = 0.01
        def Tmax = 100.0
        def Td = 0.99

        def F(list: TaskList) = list.cost
        def S(list: TaskList) = list.randomPermutation
        def P(a: TaskList, b: TaskList, t: Double) = math.pow(math.E, -( F(b) - F(a) ) / t)
    }

    def main(args: Array[String]){
        if(args.length == 0) sys.exit(-1)
        else {
            val source = io.Source.fromURL(getClass.getResource("/data/%s.txt" format args(0)))
            val tasks = TaskList(source.getLines.zipWithIndex.map {
                case (line, index) =>
                    val xs = line.split(" ").map(_.toInt)
                    Task(index+1, xs(0), xs(1), xs(2))
            }.toList)

            val algs: List[(String, Alg)] =
                // ("bruteforce", Bruteforce) ::
                // ("elimination", Elimination) ::
                ("simulated annealing", SA) ::
                Nil

            (1 to 4) foreach { i =>

                algs.foreach {
                    case (name, alg) =>
                        val (time, res) = bench(alg(tasks))
                        println("---")
                        // println("%-20s | %-30s | %5d" format (name, res, time))
                }

            }
        }
    }

    def bench[T](f: => T): (Long, T) = {
        val start = System.currentTimeMillis
        val res = f
        val end = System.currentTimeMillis
        (end-start, res)
    }
}
