package dist

import com.typesafe.config._
import akka.routing.FromConfig

import com.typesafe.play.mini._
import play.api.mvc._
import play.api.mvc.Results._
import play.api.libs.concurrent._
import play.api.Play.current

import akka.actor._
import akka.pattern.ask
import akka.util.Timeout
import akka.util.duration._

import scala.collection.JavaConversions._

object Hardcore {
  lazy val config = ConfigFactory.load()

  lazy val system = ActorSystem("Base", config.getConfig("base"))
  lazy val router = system.actorOf(Props[WorkerActor].withRouter(FromConfig()), name = "router")

  lazy val base = {
    // Just for tests
    // new Worker(config.getConfig("worker1"))
    // new Worker(config.getConfig("worker2"))

    system.actorOf(Props(new BaseActor(router)), name = "base")
  }
}


object Web extends Application {
  implicit val timeout = Timeout(5 seconds)

  def route = {
    case GET(Path("/")) & QueryString(qs) => Action {
      val sentence = QueryString(qs, "s").flatMap(_.headOption).getOrElse("")

      Async {
        (Hardcore.base ? Job(sentence)).asPromise.map { case JobResult(count) => Ok("Count: " + count + "\n") }
      }
    }
  }
}
