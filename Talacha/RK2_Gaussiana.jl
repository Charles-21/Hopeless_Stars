@time begin
using DelimitedFiles
# ---------------------------------------
# Resolución de dy/dr = -2ry, con y(0) = 1
# Método de Runge-Kutta de segundo orden (RK2)

# Parámetros de integración
rf = 7.0           # Límite superior del dominio r
dr = 0.1           # Tamaño del paso
Nr = Int(rf / dr)  # Número de pasos

# Generación de malla r
r = [k * dr for k in 0:Nr]

# Definición de la ecuación diferencial
Eq_dif(y, r) = -2 * r * y

# Inicialización del arreglo solución y
y = zeros(Float64, Nr + 1)
y[1] = 1.0   # Condición inicial: y(0) = 1

# Método de Runge-Kutta de segundo orden (RK2)
function RK2(y_n, r_n, dr)
    k1 = dr * Eq_dif(y_n, r_n)
    k2 = dr * Eq_dif(y_n + k1, r_n + dr)
    return y_n + 0.5 * (k1 + k2)
end

# Bucle de integración
for k in 1:Nr
    y[k+1] = RK2(y[k], r[k], dr)
end

# Mostrar resultados en consola
println("r\t\ty")
n_puntos = 10

for k in round.(Int, range(1, stop=length(r), length=n_puntos))
    println(r[k], "\t", y[k])
end


# Guardar datos

open("rk2_gaussiana.dat", "w") do io
	write(io, "r\ty\n")
	writedlm("rk2_gaussiana.dat", [r y],'\t')
end

end # Detener el cronómetro
