
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
