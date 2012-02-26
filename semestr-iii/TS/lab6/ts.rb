# encoding: utf-8
K = [-1.5, -1.0, -0.5, 0.5, 1.0, 1.5]
A = [0.3, 0.7]

puts [
  "Wpływ położenia rzeczywistego zera na odpowiedź impulsową",
  K.map {|k| "Charakterystyka filtru, $b=#{k}$" },
  "Wpływ położenia rzeczywistego bieguna na odpowiedź impulsową",
  K.map {|k| "Charakterystyka filtru, $a=#{k}$" },
  "Wpływ położenia zespolonego zera na odpowiedź impulsową (cz. 1)",
  "Wpływ położenia zespolonego zera na odpowiedź impulsową (cz. 2)",
  A.map {|a| K.map {|k| "Charakterystyka filtru, $b=#{k}\\pm#{a}i$" }  },
  "Wpływ położenia zespolonego bieguna na odpowiedź impulsową (cz. 1)",
  "Wpływ położenia zespolonego bieguna na odpowiedź impulsową (cz. 2)",
  A.map {|a| K.map {|k| "Charakterystyka filtru, $a=#{k}\\pm#{a}i$" }  },
].flatten.each_slice(2).map.with_index {|titles, i|
  titles.map.with_index {|title, j|
    <<-EOS
        \\includegraphics[scale=.3]{out/fig#{(2*i)+1+j}.png}
        \\caption{\\label{fig#{(2*i)+1+j}} #{title}}
    EOS
  }.join("")
}.map {|e|  
  <<-EOS
    \\begin{figure}[htbp]
      \\begin{center}
#{e}
      \\end{center}
    \\end{figure}
  EOS
}.join("\n")
