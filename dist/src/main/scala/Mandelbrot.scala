package dist

import java.awt.image.BufferedImage
import java.awt.Color
import java.io.ByteArrayOutputStream
import javax.imageio.ImageIO

object Mandelbrot {
  val MAX_ITER = 5000
  val N = 256

  def image(data: Array[Array[Int]]) = {
    val img = new BufferedImage(N, N, BufferedImage.TYPE_INT_RGB)
    for {
      i <- 0 until N
      j <- 0 until N
    } img.setRGB(i, j, data(i)(j))
    val output = new ByteArrayOutputStream
    ImageIO.write(img, "png", output)
    output
  }

  def row(x: Int, y: Int, z: Int, row: Int): Array[Int] = {
    (0 until N).map { y0 => calculate(x * N + row, y * N + y0, z) }.toArray
  }

  def calculate(x: Int, y: Int, z: Int) = {
    val n = math.pow(2, z) * N

    val cx = (x/n) * 3.5 - 2.5
    val cy = (y/n) * 3.5 - 1.75
    pixel(cx, cy)
  }

  def pixel(cx: Double, cy: Double) = {
    var (i, zx, zy) = (0, 0.0, 0.0)

    while (zx * zx + zy * zy < 4 && i < MAX_ITER) {
      val temp = zx * zx - zy * zy + cx
      zy = 2 * zx * zy + cy;
      zx = temp;
      i = i + 1;
    }

    if (i == MAX_ITER) Color.BLACK.getRGB()
    else Color.getHSBColor(i / 20.0F, 1F, 1F).getRGB()
  }
}
