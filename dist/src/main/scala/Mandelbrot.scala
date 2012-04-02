package dist

import java.io._
import java.lang.Math

class Complex(var a: Double, var b: Double){
  def +(that: Complex) = new Complex( this.a + that.a, this.b + that.b)
  def *(that: Complex) = new Complex( this.a * that.a - this.b * that.b, this.a * that.b + that.a * this.b)
  def abs() = Math.sqrt(this.a * this.a + this.b * this.b)
  def *=(that: Complex) ={
      val newa = this.a * that.a - this.b * that.b
      this.b = this.a * that.b + that.a * this.b
      this.a = newa
      this
    }
  def +=(that: Complex)={
      this.a += that.a
      this.b += that.b
      this
  }
}



object Mandelbrot1 {

  def run(n: Int, level: Int) : Unit = {
    val out = new FileOutputStream("man1.pgm")
    out.write(("P5\n"+n+" "+n+"\n255\n").getBytes())

    for {y0 <- 0 until n 
        x0 <- 0 until n }{

      val x = -2.0 + x0 * 3.0/n
      val y = -1.5 + y0 * 3.0/n

      var z = new Complex(0, 0)
      var c = new Complex(x, y)

      for( i <- 0 until level )
        z = z * z + c 

      if (z.abs < 2)
        out.write(0)
      else
        out.write(255)
    }

    out.close()
  }

  def main(args: Array[String]) {
    run(500, 2048)
  }
}

object Mandelbrot2 {

  def run(n: Int, level: Int) : Unit = {
    val out = new FileOutputStream("man2.pgm")
    out.write(("P5\n"+n+" "+n+"\n255\n").getBytes())

    for {y0 <- 0 until n
        x0 <- 0 until n }{

     val x = -2.0 + x0*3.0/n
     val y = -1.5 + y0*3.0/n

     var z = new Complex(0,0)
     var c = new Complex(x,y)
     var i = 0
     do {
       z *= z
       z += c
       i += 1
     } while( z.abs < 2 && i < level)

     if (z.abs < 2)
       out.write(0);
     else
       out.write( (i*255.0/level).toInt );
   }
    out.close()
    
  }

  def main(args: Array[String]) {
    run(100, 2048)
  }
}

