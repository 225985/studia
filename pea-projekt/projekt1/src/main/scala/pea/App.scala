package pea

object App {
    val SA = (td: Double) => new SimulatedAnnealing[TaskList, Int] with Alg {
        def Tmin = 0.01
        def Tmax = 100.0
        def Td = td

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
        if(args.length < 2) sys.exit(-1)
        else {
            val n = args(0).toInt
            val k = args(1).toInt
            val instances = readInstances(n).zip(readOptimal(n)).take(k)

            val tds = 0.99 :: 0.999 :: 0.9999 :: Nil


            val results = tds.map { td =>
                print("%7s | " format td.toString)
                val sa = SA(td)
                val r = instances.zipWithIndex.collect { case ((tasks, optimal), inst) if optimal > 0 =>
                    println(" == Instance %s | optimal: %d | td: %f == " format (inst+1, optimal, td))

                    val x = (1 to 10).par map { i =>
                        val (time, res) = bench(sa(tasks))
                        val diff = (res.cost - optimal) * 100.0 / optimal

                        val c = if(diff == 0) Console.GREEN else Console.RED
                        println("%s%2d) %-120s [%5.2f%%] | %10d%s" format (c, i, res, diff, time, Console.RESET))
                        // print("%s.%s" format (c, Console.RESET))

                        (time, diff)
                    }

                    x
                }
                println()

                (td, r)
            }


            results.foreach { case (td, instances) =>
                val (time, diff) = ((0.0, 0.0) /: instances){
                    case ((t,d), it) =>
                        val (time, diff) = ((0.0,0.0) /: it){ case ((a,b),(c,d)) => (a+c, b+d) }
                        (t + time / it.length, d + diff / it.length)
                }

                val avgTime = time / instances.length
                val avgDiff = diff / instances.length

                println("td: %5f | time: %5.2f | diff: %5.2f" format (td, avgTime, avgDiff))
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
