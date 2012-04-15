package dist

import akka.actor._
import akka.routing.FromConfig
import akka.event._
import com.typesafe.config._

import akka.pattern.ask
import akka.util.Timeout
import akka.util.duration._
import akka.dispatch.Await

// case class Job(item: String)
// case class JobResult(count: Int)

// case class PartialJob(item: String)
// case class PartialJobResult(item: String, count: Int)


case class Job(i: Int, j: Int, zoom: Int) //TODO nie wiem za bardzo co ma przychodzic, dalem takie
case class JobResult(url: String)

case class PartialJob(i: Int, j: Int, er: Double, zoom: Int, dim: Int, it : Int)
case class PartialJobResult(i: Int, result: List[Int])



class WorkerActor extends Actor with ActorLogging {
  def receive = {
    case PartialJob(i, j, er, zoom, dim, it) =>
      log.info("Working on: " + i)
      val mandelbrot = new Mandelbrot(dim, er, it, zoom)
      var result = List[Int]()
      for(k <- j until dim ) {
        result = result ::: List(mandelbrot.pms(i * dim + k))
      }
      sender ! PartialJobResult(i, result)
  }
}

object Worker {
  def main(args: Array[String]) {
    val config = ConfigFactory.load()
    new Worker(config.getConfig("worker").withFallback(config))
  }
}

class Worker(config: Config) {
  val system = ActorSystem("Worker", config)
}


class BaseActor(router: ActorRef) extends Actor with ActorLogging {
  val dim = 256 //Na sztywno po ustaleniu z lenikiem
  def receive = {
    //TODO
    case Job(i, j, zoom) =>
      log.info("Distributing job")
      implicit val timeout = Timeout(5 seconds)

      // val count = item.split("-").map { item =>
      //   // send each item to router and return a Future
      //   router ? PartialJob(item)
      // }.map { future =>
      //   // await for each result
      //   Await.result(future, timeout.duration).asInstanceOf[PartialJobResult]
      // }.foldLeft(0) {
      //   case (sum, res) => sum + res.count // sum results
      // }

      for( k <- i to dim ) {
        
      }


      val url = "http://www.aaa.com"
      sender ! JobResult(url) // send result to client
  }
}
