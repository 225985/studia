package dist

import akka.actor._
import akka.routing.FromConfig
import akka.event._
import com.typesafe.config._

import akka.pattern.ask
import akka.util.Timeout
import akka.util.duration._
import akka.dispatch.Await

case class Job(item: String)
case class JobResult(count: Int)

case class PartialJob(item: String)
case class PartialJobResult(item: String, count: Int)

class WorkerActor extends Actor with ActorLogging {
  def receive = {
    case PartialJob(item) =>
      log.info("Working on: " + item)
      sender ! PartialJobResult(item, item.length)
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
  def receive = {
    case Job(item) =>
      log.info("Distributing job: " + item)
      implicit val timeout = Timeout(5 seconds)

      val count = item.split("-").map { item =>
        // send each item to router and return a Future
        router ? PartialJob(item)
      }.map { future =>
        // await for each result
        Await.result(future, timeout.duration).asInstanceOf[PartialJobResult]
      }.foldLeft(0) {
        case (sum, res) => sum + res.count // sum results
      }

      sender ! JobResult(count) // send result to client
  }
}
