# Regla para ejecutar la evolución
run:
	julia evolution.jl

# Regla para limpiar los datos (excepto tus gnuplot .gn)
clean:
	rm -f data/*.dat data/*.rt data/*.t

