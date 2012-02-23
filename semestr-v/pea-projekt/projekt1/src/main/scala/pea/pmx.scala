package pea

import scala.util._

object pmx {


  def pmx(a: TaskList, b: TaskList): (TaskList, TaskList) = {
    val rd = new Random()
    var i = rd.nextInt(a.list.length - 1)
    var j = rd.nextInt(a.list.length)
    while(i >= j){
      j = rd.nextInt(a.list.length)
    }

    // println(i)
    // println(j)
    var r1 = a.list.take(i) ++ b.list.drop(i).take(j-i) ++ a.list.drop(j)
    var r2 = b.list.take(i) ++ a.list.drop(i).take(j-i) ++ b.list.drop(j)

    var k = 0;
    for (item <- b.list.drop(i).take(j-i)){
        r1(a.list.indexOf(item)) = a.list.drop(i).take(j-i)(k)
        k = k + 1
    }

    println("i = " + i + ", j = " + j)
    println("a:  " + a.list.toList)
    println("b:  " + b.list.toList)
    println("r1: " + r1.toList)
    println("r2: " + r2.toList)
    // println("a.list.drop(i).take(j-i)(k) = " + a.list.drop(i).take(j-i)(k))
    // println("b.list.drop(i).take(j-i)(k) = " + b.list.drop(i).take(j-i)(k))

    k = 0
    for (item <- a.list.drop(i).take(j-i)){
        println("item: " + item)
        println("b.list.indexOf(item) = " + b.list.indexOf(item))

        r2(b.list.indexOf(item)) = b.list.drop(i).take(j-i)(k)
        k = k + 1
    }

    (new TaskList(r1), new TaskList(r2))
  }


  //   def main(args: Array[String]): Unit = {
  //       val a = TaskList(Array(new Task(0,0,0,0), new Task(1,0,0,0), new Task(2,0,0,0), new Task(3,0,0,0), new Task(4,0,0,0), new Task(5,0,0,0), new Task(6,0,0,0), new Task(7,0,0,0), new Task(8,0,0,0), new Task(9,0,0,0), new Task(10,0,0,0)))
  //       val b = TaskList(Array(new Task(10,0,0,0),new Task(9,0,0,0),new Task(8,0,0,0),new Task(7,0,0,0),new Task(6,0,0,0),new Task(5,0,0,0),new Task(4,0,0,0), new Task(3,0,0,0), new Task(2,0,0,0), new Task(1,0,0,0), new Task(0,0,0,0)))
  //       val (ap, bp) = pmx(a, b)
  //       println(ap)
  //       println(bp)
  // }


    def pmx2(ta: TaskList, tb: TaskList): (TaskList, TaskList) = {
        def zeros(n: Int) = new Array[Task](n)

        val (a, b, n) = (ta.list, tb.list, ta.list.length)

        val rand = new Random
        var ti = rand.nextInt(n)
        var tj = rand.nextInt(n)
        while(ti == tj){ tj = rand.nextInt(n) }
        val (i,j) = if(ti < tj) (ti, tj) else (tj, ti)

        val (af, ar) = a.splitAt(i)
        val (am, ab) = ar.splitAt(j-i)

        val (bf, br) = b.splitAt(i)
        val (bm, bb) = br.splitAt(j-i)

        val ax = zeros(i) ++ bm ++ zeros(n - j)
        val bx = zeros(i) ++ am ++ zeros(n - j)

        a.zipWithIndex.foreach { case (e,i) => if(ax(i) == null && !ax.contains(e)) ax(i) = e }
        b.zipWithIndex.foreach { case (e,i) => if(bx(i) == null && !bx.contains(e)) bx(i) = e }

        ax.zipWithIndex.foreach { case (e,i) => if(e == null) ax(i) = a.dropWhile(ax.contains).head }
        bx.zipWithIndex.foreach { case (e,i) => if(e == null) bx(i) = b.dropWhile(bx.contains).head }

        (TaskList(ax), TaskList(bx))
    }

}