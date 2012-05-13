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

import java.awt.image.BufferedImage
import java.awt.Color
import java.io.{ByteArrayOutputStream, ByteArrayInputStream}
import javax.imageio.ImageIO

object Hardcore {
  lazy val config = ConfigFactory.load()

  lazy val system = ActorSystem("Base", config.getConfig("base"))
  // lazy val router = system.actorOf(Props[WorkerActor].withRouter(FromConfig()), name = "router")

  lazy val base = {
    // Just for tests
    // new Worker(config.getConfig("worker"))

    // system.actorOf(Props(new BaseActor(router)), name = "base")
    system.actorOf(Props[SingleBaseActor], name = "base")
  }
}

object Web extends Application with Controller {
  implicit val timeout = Timeout(30 seconds)

  def route = {
    case GET(Path(Seg("img" :: size :: kind :: quality :: xs :: ys :: zs :: Nil))) => Action {
      (for {
        n <- parseInt(size)
        maxIter <- parseInt(quality)
        x <- parseInt(xs)
        y <- parseInt(ys)
        z <- parseInt(zs)
      } yield {
        println("Starting %d/%d/%d" format (x,y,z))

        Async {
          (Hardcore.base ? Render(kind, n, x, y, z, maxIter)).asPromise.map {
            case FractalData(data) =>
              println("Got fractal data %d/%d/%d" format (x,y,z))
              val output = render(data)
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

  def render(data: Array[Array[Int]]) = {
    println("rendering " + data.length)
    val img = new BufferedImage(data.length, data.length, BufferedImage.TYPE_INT_RGB)
    for {
      i <- 0 until data.length
      j <- 0 until data.length
    } img.setRGB(i, j, data(i)(j))
    val output = new ByteArrayOutputStream
    ImageIO.write(img, "png", output)
    output
  }

  def parseInt(s: String) = try { Some(s.toInt) } catch { case _ => None }

}
