import Plots
using Trapz

include("Initial_Poster.jl")


#----------------#
#--- Masa ADM ---#
#----------------#

m = [ri/2 * (1 - 1/ai^2) for (ri, ai) in zip(r, a)]

# Graficar para verificar
plt_masa = Plots.plot(r, m, size=(500, 300),
                xlabel="r", label=raw"m(r)", linecolor=:blue)

Plots.savefig(plt_masa, "masa.png")

masa_ADM = m[end]
println("Masa ADM = ", masa_ADM)

#--------------------------#
#--- Número de Bariones ---#
#--------------------------#

# Corriente de Norther
j0 = @. -4*pi * r^4 * phi1^2 * a / alpha

# Carga conservada con Trapz
N = trapz(r, j0)

println("N = ", N)

#----------------------#
#--- 99% de la masa ---#
#----------------------#

# Ciclo para calcular el 99% de la masa ADM
m99 = 0.99*m[end]

counter = findfirst(x -> x >= m99, m)

println("índice en el que se alcanza el 99% de la masa: ", counter)  

Masa_99 = m[counter]

println("Masa99 = ", Masa_99)

# Radio en el que se concentra dicha cantidad de masa
Radio_99 = r[counter]

#---------------------#
#--- Compacticidad ---#
#---------------------#
Compacticidad = Masa_99/Radio_99
println("Compacticidad = ", Compacticidad)

