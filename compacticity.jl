using Trapz

include("initial.jl")
println("|------------------------------------------|")
println("|--- Parámetros del Estado de Equilibrio---|")
println("|------------------------------------------|") 
println()

# Masa ADM
masa_ADM = m[end]
println("Masa ADM = ", masa_ADM)

# Corriente de Norther
j0 = @. -4*pi * r^4 * phi1^2 * a / alpha

# Carga conservada con Trapz
N = trapz(r, j0)
println("N = ", N)

# 99% de la masa ADM
m99 = 0.99*m[end]
counter = findfirst(x -> x >= m99, m)
Masa_99 = m[counter]
println("Masa99 = ", Masa_99)

# Radio en el que se concentra dicha cantidad de masa
Radio_99 = r[counter]
println("Radio99 = ", Radio_99)

# Compacticidad
Compacticidad = Masa_99/Radio_99
println("Compacticidad = ", Compacticidad)

println()
println()
