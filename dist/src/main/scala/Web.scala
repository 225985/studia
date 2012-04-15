package dist

import com.typesafe.config._
import akka.routing.FromConfig

import com.typesafe.play.mini._
import play.api.mvc._
import play.api.mvc.Results._
import play.api.libs.concurrent._
import play.api.libs.MimeTypes
import play.api.Play.current
import play.api.libs.iteratee._

import akka.actor._
import akka.pattern.ask
import akka.util.Timeout
import akka.util.duration._

import scala.collection.JavaConversions._

import java.io.ByteArrayInputStream

object Hardcore {
  lazy val config = ConfigFactory.load()

  lazy val system = ActorSystem("Base", config.getConfig("base"))
  lazy val router = system.actorOf(Props[WorkerActor].withRouter(FromConfig()), name = "router")

  lazy val base = {
    // Just for tests
    // new Worker(config.getConfig("worker"))

    system.actorOf(Props(new BaseActor(router)), name = "base")
  }
}

object Web extends Application with Controller {
  implicit val timeout = Timeout(30 seconds)

  def route = {
    case GET(Path(Seg("img" :: xs :: ys :: zs :: Nil))) => Action {
      (for {
        x <- parseInt(xs)
        y <- parseInt(ys)
        z <- parseInt(zs)
      } yield {
        println("Starting %d/%d/%d" format (x,y,z))

        Async {
          (Hardcore.base ? Render(x, y, z)).asPromise.map {
            case FractalData(data) =>
              println("Got fractal data %d/%d/%d" format (x,y,z))
              val output = Mandelbrot.image(data)
              val stream = new ByteArrayInputStream(output.toByteArray)
              println("Rendered %d/%d/%d" format (x,y,z))
              SimpleResult(
                header = ResponseHeader(OK, Map(
                  CONTENT_LENGTH -> stream.available.toString,
                  CONTENT_TYPE -> MimeTypes.types("png")
                )),
                Enumerator.fromStream(stream)
              )
          }
        }
      }) getOrElse NotFound
    }
  }

  def parseInt(s: String) = try { Some(s.toInt) } catch { case _ => None }

}
