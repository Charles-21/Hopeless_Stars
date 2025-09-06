@time begin
using DelimitedFiles
using Roots
# ---------------------------------------
# PROBLEMA DEL COHETE
#----------------------------------------

# Llamar parámetros
include("input.jl")

# Generación de malla r
r = [k * dr for k in 0:Nr]

# Sistema de ecuaciones
F(x, y, r) = [y, -g]

# Método de Runge-Kutta
function RK4(x_n, y_n, r_n, dr)
    k1 = dr * F(x_n, y_n, r_n)
    k2 = dr * F(x_n + 0.5*k1[1], y_n + 0.5*k1[2], r_n + 0.5*dr)
    k3 = dr * F(x_n + 0.5*k2[1], y_n + 0.5*k2[2], r_n + 0.5*dr)
    k4 = dr * F(x_n + k3[1], y_n + k3[2], r_n + dr)
    return (x_n + (k1[1] + 2*k2[1]+2*k3[1]+k4[1])/6, y_n + (k1[2] + 2*k2[2]+2*k3[2]+k4[2])/6)
end


function Solver(v0)
# Inicialización de arreglos solución
    x = zeros(Float64, Nr + 1)
    y = zeros(Float64, Nr + 1)
    x[1] = 0.0
    y[1] = v0
    for k in 1:Nr
        x[k+1], y[k+1] = RK4(x[k], y[k], r[k], dr)
    end
    return x, y
end

# Función de error a minimizar
function error(v0)
    error=Solver(v0)[1][end] - 50
    return error
end

# Encontramos la velocidad correcta
v0_real = find_zero(v0 -> error(v0), v0_seed)
println("v0_real = ", v0_real)

# Solución
x, y = Solver(v0_real)

# Guardar datos
open("rk4_cohete.dat", "w") do io
    write(io, "r\tx\ty\n")
    writedlm(io, [r x y], '\t')
end

end # Detener el cronómetro
