a = ->(n) { <<-EOF }
\\begin{landscape}
  \\begin{figure}[htbp]
    \\begin{center}
      \\includegraphics[scale=.5]{out/#{n}.png}
      \\caption{\\label{#{n}} XXX}
    \\end{center}
  \\end{figure}
\\end{landscape}

EOF

readlines.each {|l| puts a.(l.split(".").first) }


