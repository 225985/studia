package pea

object Elimination extends Alg with Common {
    def apply(tasks: TaskList) = {
        val p: List[Task] => Boolean = xs => {
            val xsc = TaskList(xs).cost
            anySwap(xs, (ys: List[Task]) => TaskList(ys).cost < xsc)
        }
        branch(Nil, tasks.list, Nil, p).map(TaskList).min
    }

    def branch[A](xs: List[A], ys: List[A], qs: List[List[A]], p: List[A] => Boolean): List[List[A]] = {
        ys match {
            case Nil            => xs :: qs
            case _ if !p(xs)    => selections(ys).flatMap {
                case (z, zs) => branch(xs :+ z, zs, qs, p)
            }
            case _              => qs
        }
    }

    def anySwap[A](xs: List[A], f: List[A] => Boolean) = swaps(xs.reverse).map(_.reverse).find(f).isDefined

    def swaps[A](list: List[A]): List[List[A]] = list match {
        case Nil            => Nil
        case x :: Nil       => List(list)
        case x :: y :: Nil  => List(List(y,x))
        case x :: y :: xs   => (y :: x :: xs) :: swaps(x::xs).map(y :: _)
    }
}
