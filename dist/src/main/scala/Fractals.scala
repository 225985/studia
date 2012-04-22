package dist

import java.awt.Color

trait Fractal {
  def pixel(cx: Double, cy: Double, maxIter: Int): Int
  def size: Double
  def xOffset: Double
  def yOffset: Double

  def row(n: Int, x: Int, y: Int, z: Int, row: Int, maxIter: Int): Array[Int] = {
    (0 until n).map { y0 => calculate(n, x * n + row, y * n + y0, z, maxIter) }.toArray
  }

  def calculate(n: Int, x: Int, y: Int, z: Int, maxIter: Int) = {
    val m = math.pow(2, z) * n

    val cx = (x/m) * size - xOffset
    val cy = (y/m) * size - yOffset

    pixel(cx, cy, maxIter)
  }
}

object Fractal {
  val fractals = Map(
    "mandelbrot" -> Mandelbrot,
    "julia" -> Julia
  )
  def apply(kind: String) = fractals(kind)
}

object Mandelbrot extends Fractal {
  def size = 3.5
  def xOffset = 2.5
  def yOffset = 1.75

  def pixel(cx: Double, cy: Double, maxIter: Int) = {
    var (i, zx, zy) = (0, 0.0, 0.0)

    while (zx * zx + zy * zy < 4 && i < maxIter) {
      val temp = zx * zx - zy * zy + cx
      zy = 2 * zx * zy + cy;
      zx = temp;
      i = i + 1;
    }

    if (i == maxIter) Color.BLACK.getRGB()
    else Color.getHSBColor(i / 20.0F, 1F, 1F).getRGB()
  }
}

object Julia extends Fractal {
  def size = 4.0
  def xOffset = 2.0
  def yOffset = 2.0

  def pixel(cx: Double, cy: Double, maxIter: Int) = {
    val (a,b) = (-0.8, 0.156)
    var (i, zx, zy) = (0, cx, cy)

    while (zx * zx + zy * zy < 4 && i < maxIter) {
      val temp = zx * zx - zy * zy + a
      zy = 2 * zx * zy + b
      zx = temp
      i = i + 1
    }

    if (i == maxIter) Color.BLACK.getRGB()
    else Color.getHSBColor(i / 20.0F, 1F, 1F).getRGB()
  }
}
