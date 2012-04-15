package dist

import akka.actor._
import akka.routing.FromConfig
import akka.event._
import com.typesafe.config._

import akka.pattern.ask
import akka.util.Timeout
import akka.util.duration._
import akka.dispatch.Await

case class Render(x: Int, y: Int, z: Int)
case class FractalData(data: Array[Array[Int]])

case class RenderRow(x: Int, y: Int, z: Int, row: Int)
case class RowData(data: Array[Int])

class WorkerActor extends Actor with ActorLogging {
  def receive = {
    case RenderRow(x, y, z, row) =>
      // println("Working on %d/%d/%d %d" format (x,y,z,row))
      val data = Mandelbrot.row(x, y, z, row)
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
  val N = 256

  def receive = {
    case Render(x, y, z) =>
      printf("Distributing %d/%d/%d" format (x,y,z))

      implicit val timeout = Timeout(15 seconds)

      val data = (0 until N).map { row =>
        router ? RenderRow(x, y, z, row)
      }.map { future =>
        Await.result(future, timeout.duration).asInstanceOf[RowData].data
      }.toArray

      sender ! FractalData(data)
  }
}
