include("compacticity.jl")
include("memetric.jl")

println("Aplicando la Perturbación...")


# Definiendo la perturbación
perturbacion =  @. A * exp(-(r - r0)^2 / 0.1)
dperturbacion = @. -2 * (r - r0) / 0.1 * perturbacion # Derivada de la fokin perturbacion

# Aplicando la perturbación a los campos
phi1 .+= perturbacion
psi1 .+= dperturbacion
#pi1 .= -alpha0_real .* a ./ alpha .* phi1

# Recalculando la métrica
Metricas!(a, alpha, phi1, phi2, psi1, psi2, pi1, pi2, dr, Nr, r)

# Recalculando la masa de Schwarzschild
m_p = @. 0.5*r*(1 - 1/a^2)

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
masa_ADM_p = m_p[end]
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
