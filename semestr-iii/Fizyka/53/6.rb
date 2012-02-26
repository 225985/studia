include Math

Zc = 12273.4
DZc = 0.27
Zl = 780.325
DZl = 0.001
Z1 = 11449.8
DZ1 = 0.1
R = 300
DR = 0.3
Rl = 289.0
DRl = 0.5

F = 400

print "C = "
C = 1/ (2*PI*F*sqrt(Zc**2 + R**2))
puts C

print "dC = "
DC = C * (Zc*DZc + R*DR)/(Zc**2 - R**2)
puts DC

print "L = "
L = 1/(2*PI*F) * sqrt(Zl**2 - (R+Rl)**2)
puts L

print "dL = "
DL = L*(Zl*DZl + R*DR + Rl*DRl)/(Zl**2 - (R+Rl)**2)
puts DL

print "Z2 = "
Z2 = sqrt((R+Rl)**2 + (2*PI*F*L - (1/(2*PI*F*C)))**2)
puts Z2

print "dZ2 = "
puts 1/Z2 * ((R+Rl)*(DR+DRl) + ((2*PI*F*L - (1/(2*PI*F*C))).abs * (2*PI*F*DL + (DC/(2*PI*F*C**2)))))
