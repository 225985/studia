case class Task(index: Int, p: Int, d: Int, w: Int)

object Zad1 {
    def selections[A](list: List[A]): List[(A, List[A])] = list match {
        case Nil => Nil
        case x :: xs =>
            (x, xs) :: (for((y, ys) <- selections(xs)) yield (y, x :: ys))
    }

    def permute[A](list: List[A]): List[List[A]] = list match {
        case Nil => List(Nil)
        case x :: Nil => List(list)
        case x :: y :: Nil => List(list, List(y, x))
        case _ => for {
            (y, ys) <- selections(list)
            ps <- permute(ys)
        } yield y :: ps
    }

    def cost(list: List[Task]) = {
        (list.foldLeft((0,0)){
            case ((time, cost), x) => (time+x.p, cost + Math.max(0, (time+x.p) - x.d) * x.w)
        })._2
    }

    def main(args: Array[String]) {
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
            }.toList

            tasks map { t => "%5d | %5d | %5d".format(t.p, t.d, t.w) } foreach println

            val best = permute(tasks).map {t => (t, cost(t)) }.minBy(_._2)
            println(best._2)
            println(best._1.map(_.index))
        } else {
            println("Podaj liczbe");
        }
    }
}
