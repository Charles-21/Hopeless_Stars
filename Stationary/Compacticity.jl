using Plots
using Trapz

include("Initial.jl")


#----------------#
#--- Masa ADM ---#
#----------------#

m = [ri/2 * (1 - 1/ai^2) for (ri, ai) in zip(r, a)]

# Graficar para verificar
plt_masa = plot(r, m, size=(500, 300),
                xlabel="r", label=raw"m(r)", linecolor=:blue)

savefig(plt_masa, "masa.png")

masa_ADM = m[end]
println("Masa ADM = ", masa_ADM)

#--------------------------#
#--- Número de Bariones ---#
#--------------------------#

# Corriente de Norther
j0 = @. -4*pi * r^4 * phi^2 * a / alpha

# Carga conservada con Trapz
N = trapz(r, j0)

println("N = ", N)

