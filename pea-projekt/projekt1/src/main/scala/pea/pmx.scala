package pea

object pmx {
  def pmx(a: TaskList, b: TaskList): (TaskList, TaskList) = {
    // ...
  }
  def main(args: Array[String]): Unit = {
    val a = TaskList(...)
    val b = TaskList(...)
    val (ap, bp) = pmx(a, b)
    println(ap)
    println(bp)
  }

}