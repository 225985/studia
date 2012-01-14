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

    println(i)
    println(j)
    var r1 = a.list.take(i) ++ b.list.drop(i).take(j-i) ++ a.list.drop(j)
    var r2 = b.list.take(i) ++ a.list.drop(i).take(j-i) ++ b.list.drop(j)
    
    var k = 0; 
    for (item <- b.list.drop(i).take(j-i)){
        r1(a.list.indexOf(item)) = a.list.drop(i).take(j-i)(k)
        k = k + 1
    }

    k = 0
    for (item <- a.list.drop(i).take(j-i)){
        r2(b.list.indexOf(item)) = b.list.drop(i).take(j-i)(k)
        k = k + 1
    }

    (new TaskList(r1), new TaskList(r2))
  }


  def main(args: Array[String]): Unit = {
    val a = TaskList(Array(new Task(0,0,0,0), new Task(1,0,0,0), new Task(2,0,0,0), new Task(3,0,0,0), new Task(4,0,0,0), new Task(5,0,0,0), new Task(6,0,0,0), new Task(7,0,0,0), new Task(8,0,0,0), new Task(9,0,0,0), new Task(10,0,0,0)))
    val b = TaskList(Array(new Task(10,0,0,0),new Task(9,0,0,0),new Task(8,0,0,0),new Task(7,0,0,0),new Task(6,0,0,0),new Task(5,0,0,0),new Task(4,0,0,0), new Task(3,0,0,0), new Task(2,0,0,0), new Task(1,0,0,0), new Task(0,0,0,0)))
    val (ap, bp) = pmx(a, b)
    println(ap)
    println(bp)
  }

}