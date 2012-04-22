package dist

import akka.actor._
import akka.routing.FromConfig
import akka.event._
import com.typesafe.config._

import akka.pattern.ask
import akka.util.Timeout
import akka.util.duration._
import akka.dispatch.Await


case class Render(kind: String, n: Int, x: Int, y: Int, z: Int, maxIter: Int)
case class FractalData(data: Array[Array[Int]])

case class RenderRow(kind: String, n: Int, x: Int, y: Int, z: Int, row: Int, maxIter: Int)
case class RowData(data: Array[Int])

class WorkerActor extends Actor with ActorLogging {
  def receive = {
    case RenderRow(kind, n, x, y, z, row, maxIter) =>
      // println("Working on %d/%d/%d %d" format (x,y,z,row))
      val data = Fractal(kind).row(n, x, y, z, row, maxIter)
      sender ! RowData(data)
  }
}

object Worker {
  def main(args: Array[String]) {
    val config = ConfigFactory.load()
    new Worker(config.getConfig("worker").withFallback(config))
  }
}

class Worker(config: Config) {
  println("Starting new worker")
  val system = ActorSystem("Worker", config)
}

class BaseActor(router: ActorRef) extends Actor with ActorLogging {
  import Config._

  def receive = {
    case Render(kind, n, x, y, z, maxIter) =>
      printf("Distributing %d/%d/%d" format (x,y,z))

      implicit val timeout = Timeout(15 seconds)

      val data = (0 until n).map { row =>
        router ? RenderRow(kind, n, x, y, z, row, maxIter)
      }.map { future =>
        Await.result(future, timeout.duration).asInstanceOf[RowData].data
      }.toArray

      sender ! FractalData(data)
  }
}

class SingleBaseActor extends Actor with ActorLogging {
  def receive = {
    case r @ Render(kind, n, x, y, z, maxIter) =>
      println(r.toString)

      val data = (0 until n).map { row => Fractal(kind).row(n, x, y, z, row, maxIter) }.toArray

      sender ! FractalData(data)
  }
}
