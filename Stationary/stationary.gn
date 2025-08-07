set terminal qt size 1000,800 enhanced font 'Verdana,10'

unset output 

set multiplot layout 2,2 title "Estado Estacionario" font ",14"

# Gráfica 1: r vs a
set title "a(r)"
set xlabel "r"
set ylabel "a"
plot "Stationary_State.dat" using 1:2 with lines title "a(r)"

# Gráfica 2: r vs alpha
set title "alpha(r)"
set xlabel "r"
set ylabel "alpha"
plot "Stationary_State.dat" using 1:3 with lines title "alpha(r)"

# Gráfica 3: r vs phi
set title "phi(r)"
set xlabel "r"
set ylabel "phi"
plot "Stationary_State.dat" using 1:4 with lines title "phi(r)"

# Gráfica 4: r vs psi
set title "psi(r)"
set xlabel "r"
set ylabel "psi"
plot "Stationary_State.dat" using 1:5 with lines title "psi(r)"

unset multiplot
pause -1 "Presiona ENTER para cerrar la ventana"
