include("initial.jl")
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
