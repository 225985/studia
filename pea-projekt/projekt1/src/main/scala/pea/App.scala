package pea

object App {
    val SA = new SimulatedAnnealing[TaskList, Int] with Alg {
        def Tmin = 0.01
        def Tmax = 100.0
        def Td = 0.999

        def F(list: TaskList) = list.cost
        def S(list: TaskList) = list.randomPermutation
        def P(a: TaskList, b: TaskList, t: Double) = math.pow(math.E, -( F(b) - F(a) ) / t)
    }

    def readInstances(n: Int) = {
        def splitted[A](n: Int, list: List[A]): List[List[A]] = list match {
            case Nil => Nil
            case _ =>
                val (x, xs) = list.splitAt(n)
                x :: splitted(n, xs)
        }

        val source = io.Source.fromURL(getClass.getResource("/wt%d.txt" format n))
        val nums = source.getLines.flatMap(_.split(" +")).collect {
            case s if s.trim != "" => s.trim.toInt
        }.toList

        splitted(3*n, nums).map { group =>
            val parts = splitted(n, group)
            TaskList(parts(0).zip(parts(1)).zip(parts(2)).zipWithIndex map {
                case (((x,y), z), i) => Task(i, x, z, y)
            })
        }
    }

    def readOptimal(n: Int) = {
        val source = io.Source.fromURL(getClass.getResource("/wtopt%d.txt" format n))
        source.getLines.collect {
            case s if s.trim != "" => s.trim.toInt
        }.toList
    }

    def main(args: Array[String]){
        if(args.length == 0) sys.exit(-1)
        else {
            val n = args(0).toInt
            val instances = readInstances(n).zip(readOptimal(n)).drop(120)

            instances.zipWithIndex.foreach { case ((tasks, optimal), inst) =>
                println(" == Instance %s | optimal: %d == " format (inst+1, optimal))
                (1 to 10) foreach { i =>
                    val (time, res) = bench(SA(tasks))
                    val diff = (res.cost - optimal) * 100.0 / optimal
                    val c = if(diff == 0) Console.GREEN else Console.RED
                    println("%s%2d) %-120s [%5.2f%%] | %10d%s" format (c, i, res, diff, time, Console.RESET))
                }

                println()
                println()
            }

            // val algs: List[(String, Alg)] =
            //     // ("bruteforce", Bruteforce) ::
            //     // ("elimination", Elimination) ::
            //     ("simulated annealing", SA) ::
            //     Nil

            // (1 to 4) foreach { i =>

                // algs.foreach {
                //     case (name, alg) =>
                //         val (time, res) = bench(alg(tasks))
                //         // println("---")
                //         println("%-20s | %-30s | %5d" format (name, res, time))
                // }

            // }
        }
    }

    def bench[T](f: => T): (Long, T) = {
        val start = System.currentTimeMillis
        val res = f
        val end = System.currentTimeMillis
        (end-start, res)
    }
}
