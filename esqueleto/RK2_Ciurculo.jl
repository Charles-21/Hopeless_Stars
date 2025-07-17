@time begin
using DelimitedFiles
# ---------------------------------------
# Método de Runge-Kutta de segundo orden (RK2)

# Parámetros de integración
rf = 7.0           # Límite superior del dominio r
dr = 0.1           # Tamaño del paso
Nr = Int(rf / dr)  # Número de pasos

# Generación de malla r
r = [k * dr for k in 0:Nr]

# Ecuación diferencial vectoria
F(x, y, r) = [-y, x]

# Inicialización del arreglo solución y
x = zeros(Float64, Nr + 1)
y = zeros(Float64, Nr + 1)

# Condiciones iniciales
x[1] = 1.0
y[1] = 0.0   

# Método de Runge-Kutta de segundo orden (RK2)
function RK2(x_n, y_n, r_n, dr)
    k1 = dr * F(x_n, y_n, r_n)
    k2 = dr * F(x_n + k1[1], y_n +k1[2], r_n + dr)
    return (x_n + 0.5 * (k1[1] + k2[1]), y_n + 0.5 * (k1[2] + k2[2]))
end

# Bucle de integración
for k in 1:Nr
    x[k+1], y[k+1] = RK2(x[k], y[k], r[k], dr)
end

# Mostrar resultados en consola
println("r\t\tx\t\ty")
n_puntos = 10

for k in round.(Int, range(1, stop=length(r), length=n_puntos))
    println(r[k], "\t", x[k], "\t", y[k])
end


# Guardar datos
open("rk2_circulo.dat", "w") do io
    write(io, "r\tx\ty\n")
    writedlm(io, [r x y], '\t')
end

end # Detener el cronómetro
