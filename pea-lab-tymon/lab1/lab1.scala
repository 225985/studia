case class Task(index: Int, p: Int, d: Int, w: Int){
    override def toString = index.toString
}

object Zad1 {
    def selections[A](list: List[A]): List[(A, List[A])] = list match {
        case Nil => Nil
        case x :: xs =>
            (x, xs) :: (for((y, ys) <- selections(xs)) yield (y, x :: ys))
    }

    def permute(list: List[Task], lb: Int): (Int, List[Task]) = {
        val perms = new scala.collection.mutable.ListBuffer[(Int, List[Task])]

        def branch(xs: List[Task], ys: List[Task]): Unit = {
            ys match {
                case Nil => perms += ((cost(xs), xs))
                case _ => selections(ys).map { case(z, zs) => if(cost(xs) < lb) branch(xs :+ z, zs) }
            }
        }

        branch(Nil, list)

        perms.minBy(_._1)
    }

    def permute2(list: List[Task], lb: Int): (Int, List[Task]) = {

        println(lb)

        def branch(xs: List[Task], ys: List[Task], qs: List[List[Task]]): List[List[Task]] = {
            println(xs + " | " + cost(xs))
            ys match {
                case Nil =>
                    xs :: qs
                case _ => {
                    if(cost(xs) < lb){
                        selections(ys).flatMap {
                            case sel @ (z, zs) =>
                                branch(xs :+ z, zs, qs)
                        }
                    } else {
                        println("cut!")
                        Nil
                    }

                }
            }
        }

        val perms = branch(Nil, list, Nil)

        println()
        perms.map(e => (cost(e), e)).minBy(_._1)
        // (0, Nil)
    }

    def swap[A](list: List[A]) = list match {
        case Nil => Nil
        case x :: Nil => x :: Nil
        case xx =>
            val (x::y::xs) = list.reverse
            (y::x::xs).reverse
    }

    def twotwo(list: List[Task]): (Int, List[Task]) = {
        def branch(xs: List[Task], ys: List[Task], qs: List[List[Task]]): List[List[Task]] = {
            // println(xs + " | " + cost(xs))
            ys match {
                case Nil => xs :: qs
                case _ if cost(swap(xs)) < cost(xs) => {
                    // println("swap better: " + xs)
                    qs
                }
                case _ => {
                    selections(ys).flatMap {
                        case sel @ (z, zs) =>
                            branch(xs :+ z, zs, qs)
                    }

                }
            }
        }

        val perms = branch(Nil, list, Nil)

        println()
        perms.map(e => (cost(e), e)).minBy(_._1)
    }

    //
    // def permute[A](list: List[A]): List[List[A]] = list match {
    //     case Nil => List(Nil)
    //     case x :: Nil => List(list)
    //     case x :: y :: Nil => List(list, List(y, x))
    //     case _ => for {
    //         (y, ys) <- selections(list)
    //         ps <- permute(ys)
    //     } yield {
    //         println((y, ps))
    //         // println((y :: ps).map(_.index))
    //         y :: ps
    //     }
    // }



    var costc = 0
    var costCache = scala.collection.mutable.Map[List[Task], Int]()

    def cost(list: List[Task]) = {
        // if(costCache.contains(list)){
            // costCache(list)
        // } else {
            costc += 1
            val co = (list.foldLeft((0,0)){
                case ((time, cost), x) => (time+x.p, cost + Math.max(0, (time+x.p) - x.d) * x.w)
            })._2
            // costCache(list) = co
            co
        // }
    }

    def main(args: Array[String]) {
        // println(List(1,2,3).permutations.toList)

        // println(permute(Array(1)))
        // println(permute(List(1,2)))
        // println(permute(List(1,2,3)))
        // println(permute(List(1,2,3,4)))
        // permute(List(1,2,3,4,5))
        // selections(List(1,2,3)) foreach println
        // selections(List(1,2,3,4)) foreach println
        // selections(List(1,2,3,4,5)) foreach println


        if(args.length == 1){
            val n = args(0).toInt
            println("Zadanie %d" format n)
            println()
            println("    P |     D |     W")
            println("---------------------")
            val tasks = io.Source.fromFile("data/%d.txt" format n).getLines.zipWithIndex.map {
                case (line, index) =>
                    val xs = line.split(" ").map(_.toInt)
                    Task(index+1, xs(0), xs(1), xs(2))
            }.toList // take 3

            tasks map { t => "%5d | %5d | %5d".format(t.p, t.d, t.w) } foreach println


            // println(permute2(tasks, 50))
            costc = 0
            println(permute(tasks, cost(tasks)))
            println(costc)

            costc = 0
            println(twotwo(tasks))
            println(costc)

            println(costc)
        } else {
            println("Podaj liczbe");
        }
    }
}
