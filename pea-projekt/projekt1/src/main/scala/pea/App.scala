package pea

object Algorithms {
    def randomPermutation[A](a: Array[A]) = {
        val rand = new scala.util.Random
        val i1 = rand.nextInt(a.length)
        var i2 = rand.nextInt(a.length)
        while(i1 == i2){ i2 = rand.nextInt(a.length) }

        val b = a.clone
        val tmp = b(i1)
        b(i1) = b(i2)
        b(i2) = tmp
        b
    }

    // Simulated Annealing implementation + parameters
    val SA = (td: Double) => new SimulatedAnnealing[TaskList, Int] {
        def Tmin = 0.01
        def Tmax = 100.0
        def Td = td

        def F(tasks: TaskList) = tasks.cost
        def S(tasks: TaskList) = TaskList(randomPermutation(tasks.list))
        def P(a: TaskList, b: TaskList, t: Double) = math.pow(math.E, -( F(b) - F(a) ) / t)
    }

    // Tabu Search implementation + parameters
    val TS = (n: Int, k: Int, t: Int) => new TabuSearch[TaskList, (Int, Int), Int] with Common {
        def N = n
        def Kmax = k
        def Tsize = t
        def F(tasks: TaskList) = tasks.cost

        def S(tasks: TaskList) = (0 until tasks.list.length).combinations(2).map { idx => (idx(0), idx(1)) }
            // (TaskList(tasks.list.swapped(idx(0), idx(1))), (idx(0), idx(1)))
        // }

        def NS(tasks: TaskList, move: (Int, Int)) = TaskList(tasks.list.swapped(move._1, move._2))

        def SR(tasks: TaskList) = TaskList(randomPermutation(tasks.list))

        def P(move: (Int, Int)) = {
            tabu.exists { case (a,b) => a == move._1 || b == move._1 || a == move._2 || b == move._2 }
            // tasks.list.toList.indexWhere(e => e.index == tabu._1) < tasks.list.toList.indexWhere(e => e.index == tabu._2)
        }
    }

    val GA = (n: Int, k: Int) => new Genetic[TaskList, Int] with Common {
        def N = n
        def M = 0.01
        def K = k
        def F(tasks: TaskList) = tasks.cost

        def crossover(a: TaskList, b: TaskList) = pmx.pmx2(b,a)
        def mutation(tasks: TaskList) = TaskList(randomPermutation(tasks.list))
        def newRandom(tasks: TaskList) = TaskList(randomPermutation(tasks.list))
    }
}

object App {
    import Algorithms._


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
            TaskList(parts(0).zip(parts(1)).zip(parts(2)).zipWithIndex.map {
                case (((x,y), z), i) => Task(i, x, z, y)
            }.toArray)
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

            val algs =
                        (GA(1000, 40), 10) ::
                        // (TS(10, 4, 7),  10) ::
                        // (TS(10, 5, 7),  10) ::
                        // (TS(10, 6, 7),  10) ::
                        // (TS(10, 7, 7),  10) ::
                        // (TS(10, 4, 8),  10) ::
                        // (TS(10, 5, 8),  10) ::
                        // (TS(10, 6, 8),  10) ::
                        // (TS(10, 7, 8),  10) ::
                        // (TS(10, 4, 9),  10) ::
                        // (TS(10, 5, 9),  10) ::
                        // (TS(10, 6, 9),  10) ::
                        // (TS(10, 7, 9),  10) ::
                        // (TS(10, 4, 10),  10) ::
                        // (TS(10, 5, 10),  10) ::
                        // (TS(10, 6, 10),  10) ::
                        // (TS(10, 7, 10),  10) ::
                        // (TS(100, 4, 7),  10) ::
                        // (TS(100, 5, 7),  10) ::
                        // (TS(100, 6, 7),  10) ::
                        // (TS(100, 7, 7),  10) ::
                        // (TS(100, 4, 8),  10) ::
                        // (TS(100, 5, 8),  10) ::
                        // (TS(100, 6, 8),  10) ::
                        // (TS(100, 7, 8),  10) ::
                        // (TS(100, 4, 9),  10) ::
                        // (TS(100, 5, 9),  10) ::
                        // (TS(100, 6, 9),  10) ::
                        // (TS(100, 7, 9),  10) ::
                        // (TS(100, 4, 10),  10) ::
                        // (TS(100, 5, 10),  10) ::
                        // (TS(100, 6, 10),  10) ::
                        // (TS(100, 7, 10),  10) ::
                        // (TS(100), 10) ::
                        // (TS(200), 10) ::
                        // (TS(1000), 1) ::
                        // (SA(0.99),   10) ::
                        // (SA(0.999),  10) ::
                        // (SA(0.9999), 10) ::
                        Nil

            val results = algs.map { case (alg, k) =>
                val r = instances.zipWithIndex.collect { case ((tasks, optimal), inst) if optimal > 0 =>
                    print(" == Instance %s | optimal: %d | alg: %s == " format (inst+1, optimal, alg.toString))

                    val curr = tasks //.dup


                    val x = (1 to k)/*.par*/ map { i =>
                        val (time, res) = bench(alg(curr))
                        val diff = (res.cost - optimal) * 100.0 / optimal

                        val c = if(diff == 0) Console.GREEN else Console.RED
                        println("%s%2d) %-120s [%5.2f%%] | %10d%s" format (c, i, res, diff, time, Console.RESET))
                        // print("%s.%s" format (c, Console.RESET))

                        (time, diff)
                    }
                    println()

                    x
                }
                println()

                (alg, r)
            }


            results.foreach { case (alg, instances) =>
                val (time, diff) = ((0.0, 0.0) /: instances){
                    case ((t,d), it) =>
                        val (time, diff) = ((0.0,0.0) /: it){ case ((a,b),(c,d)) => (a+c, b+d) }
                        (t + time / it.length, d + diff / it.length)
                }

                val avgTime = time / instances.length
                val avgDiff = diff / instances.length

                println("alg: %-15s | time: %5.2f | diff: %5.2f" format (alg.toString, avgTime, avgDiff))
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
