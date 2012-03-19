package dist

import akka.actor._
import akka.routing.FromConfig
import akka.event._
import com.typesafe.config._

case class Job(item: String)
case class PartialJob(item: String)
case class Result(item: String, count: Int)

class WorkerActor extends Actor with ActorLogging {
  def receive = {
    case PartialJob(item) =>
      log.info("Working on: " + item)
      sender ! Result(item, item.length)
  }
}


object Worker {
  def main(args: Array[String]) {
    val config = ConfigFactory.load()
    new Worker(config.getConfig("worker" + args.head).withFallback(config))
  }
}

class Worker(config: Config) {
  val system = ActorSystem("Worker", config)
}

class BaseActor(router: ActorRef) extends Actor with ActorLogging {
  def receive = {
    case Job(item) =>
      log.info("Distributing job: " + item)
      item.split(" ").foreach { item => router ! PartialJob(item) }

    case Result(item, count) =>
      log.info("Got result for " + item + " => " + count)
  }
}

object Base {
  def main(args: Array[String]) = {
    val config = ConfigFactory.load()

    // Just for tests
    // new Worker(config.getConfig("worker1").withFallback(config))
    // new Worker(config.getConfig("worker2").withFallback(config))
    // --

    val system = ActorSystem("Base", config.getConfig("base").withFallback(config))
    val router = system.actorOf(Props[WorkerActor].withRouter(FromConfig()), name = "router")
    val base = system.actorOf(Props(new BaseActor(router)), name = "base")
    base ! Job("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus imperdiet laoreet orci, in laoreet nunc malesuada vitae. Curabitur sit amet arcu elit. Donec luctus pellentesque dui, at dignissim odio tempor et. Integer porttitor neque vel nunc vehicula tincidunt. In dapibus lacinia dui at vulputate. Quisque venenatis bibendum eros, quis scelerisque ipsum placerat id. Nullam mi sem, iaculis ut mollis quis, condimentum non ipsum. Pellentesque neque felis, mollis sit amet pellentesque quis, lobortis ac orci. Mauris pretium nulla a est dapibus convallis. Aenean eget tellus quam. Fusce cursus vestibulum nibh auctor pretium. Donec ultricies tortor non nibh pellentesque volutpat. Curabitur aliquam, lorem ac fermentum eleifend, tortor nisi rutrum ligula, ut dapibus mi velit in mi. Nulla dapibus, lorem et dignissim ultricies, lacus felis tincidunt ante, ut rutrum diam enim sed urna. Fusce egestas cursus euismod.")
  }
}
