object Zad1 {
    def main(args: Array[String]) {
        if(args.length == 1){
            val n = args(0).toInt
            val (p, d, w) = io.Source.fromFile("data/%d.txt" format n).getLines.map { _.split(" ").map(_.toInt) }.foldRight(List[Int](), List[Int](), List[Int]()){
                case (x, (p1, d1, w1)) => (x(0) :: p1, x(1) :: d1, x(2) :: w1)
            }

            println("Zadanie %d" format n)
            println()
            println("    P |     D |     W")
            println("---------------------")

            p.zip(d).zip(w) foreach {
                case ((p1, d1), w1) => println("%5d | %5d | %5d".format(p1, d1, w1))
            }

        } else {
            println("Podaj liczbe");
        }
    }
}
