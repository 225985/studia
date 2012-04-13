import java.awt.image.BufferedImage
import java.awt.Color
import java.awt.Dimension
import java.awt.Graphics2D
 
import scala.swing.MainFrame
import scala.swing.Panel
import scala.swing.SimpleSwingApplication
 
object Mandelbrot extends SimpleSwingApplication {
  val ER = 4.0 // escape radius
  val maxIter = 50000 // max iteration
  val N = 1000 // image dimension
 
  def top = new MainFrame {
    title = "Mandelbrot Set"
 
    contents = new Panel {
      override protected def paintComponent(g: Graphics2D) = {
        super.paintComponent(g)
        var start = System.currentTimeMillis()
        g setColor Color.BLACK
        var image = new BufferedImage(N, N, BufferedImage.TYPE_INT_RGB)
        var m = new Mandelbrot(N, ER, maxIter, 3)
        for {
          i <- 0 until N
          j <- 0 until N
        } image.setRGB(i, j, m.pms(i * N + j))
        g.drawImage(image, 0, 0, null)
        println(System.currentTimeMillis() - start)
      }
    }
 
    size = new Dimension(N, N)
  }
}
 
class Mandelbrot(n: Int, er: Double, maxIter: Int, zoom: Int) {
 
  val pms = (0 to n * n).map { (x => computeColor(x / n, x % n)) } // work gets done here
 
  def computeColor(x: Int, y: Int): Int = {
 
    var (i, zx, zy) = (0, 0.0, 0.0)
    val cx = -2.5 + x * (er / n) / zoom
    val cy = 2 - y * (er / n) / zoom
 
    while (zx * zx + zy * zy < er && i < maxIter) {
      val temp = zx * zx - zy * zy + cx
      zy = 2 * zx * zy + cy;
      zx = temp;
      i = i + 1;
    }
 
    if (i == maxIter)
      Color.BLACK.getRGB()
    else
      (Color.getHSBColor(i / 20.0F, 1F, 1F)).getRGB()
  }
}