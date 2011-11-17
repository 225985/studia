object App {
    def selections[A](list: List[A]): List[(A, List[A])] = list match {
        case Nil => Nil
        case x :: xs =>
            (x, xs) :: (for((y, ys) <- selections(xs)) yield (y, x :: ys))
    }


    def show[T](a: List[T]): String = a.mkString("[",",","]")
    def showA[T](a: List[(T, List[T])]): String = show(a.map(t => (t._1, show(t._2))))

    var index = 0

    // def permute[A](list: List[A]): List[List[A]] = {
    //     def branch[A](xs: List[A], ys: List[A], sels: List[(A, List[A])]): List[List[A]] = {
    //         pp(show(xs), show(ys), showA(sels))
    //         index += 1
    //         (ys, sels) match {
    //             case (Nil, _) => xs :: Nil
    //             case (_, Nil) =>
    //                 val newSels = selections(ys)
    //                 println("calculate selections for " + ys + " ==> " + showA(newSels))
    //                 branch(xs, Nil, newSels)
    //                 Nil
    //             case _   => selections(ys).flatMap {
    //                 case (z, zs) =>
    //                     branch(xs :+ z, zs, sels)
    //             }
    //         }
    //     }
    //
    //     branch(Nil, list, Nil)
    // }

    def permute[A](list: List[A]) = {
        def branch(data: List[(List[A], List[A])], res: List[List[A]], state: Int): List[List[A]] = {
            println(state, data)
            data match {
                case Nil             => res
                case (xs, Nil) :: zs => branch(zs, xs :: res, state + 1)
                case (xs, ys) :: zs  => branch(selections(ys).map { case (e, es) => (xs :+ e, es) } ::: zs, res, state + 1)
            }
        }

        branch(List((Nil, list)), Nil, 0)
    }


    def pp[A](args: String*) = println(args.mkString("\t"))


    def main(args: Array[String]) {
        println(permute(List(1,2,3)))
    }
}
