include("compacticity.jl")
include("metric.jl")

println("Aplicando la Perturbación...")

# Definiendo la perturbación
perturbacion = [A * exp(-(i - r0)^2 / sigma) for i in r]

# Aplicando la perturbación a los campos
phi1 .+= perturbacion
psi1 .-= (2.0/sigma) .* (r .- r0) .* perturbacion
pi1 .= -alpha0_real .* a ./ alpha .* phi1

# Recalculando la métrica
Constricciones_metricas!(a, alpha, phi1, phi2, psi1, psi2, pi1, pi2, dr, Nr, r)

# Recalculando la masa de Schwarzschild
m = [ri/2 * (1 - 1/ai^2) for (ri, ai) in zip(r, a)] 

# Guardar datos
open("data/Perturbing_State.dat", "w") do io
	write(io, "r\ta\talpha\tphi1\tphi2\tpsi1\tpsi2\tpi1\tpi2\tm\n") 
	writedlm(io, [r a alpha phi1 phi2 psi1 psi2 pi1 pi2 m], '\t')
end #del do

println("|----------------------------------------|")
println("|--- Parámetros del Estado Perturbado ---|")
println("|----------------------------------------|") 
println()

# Masa ADM
masa_ADM_p = m[end]
println("Masa ADM = ", masa_ADM_p)

# Diferencia porcentual del cambio de masa:
delta_percent = (masa_ADM_p - masa_ADM) / masa_ADM * 100
println("Cambio porcentual de la masa: ", delta_percent, "%")

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
