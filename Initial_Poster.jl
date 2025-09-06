@time begin

using DelimitedFiles
using Roots

#----------------------------------#
# --- Estados Estacionarios :) --- #
#----------------------------------#

# Importar parámetros
include("input.jl")

# Generación de la malla r con Nr elementos para ser consistentes con el Compact
ϵ = 1e-6
r = [ϵ + k * dr for k in 0:Nr-1] # Desplazamos un chirri la malla para que no explote el solucionador.

# Sistema de ecuaciones
function Stationary_State(a, alpha, phi, psi, r, w) # Primera diferencia. La omega es parámetro.
  dln_a = (1-a^2)/(2r) + 0.5*r* (psi^2 + a^2*phi^2*(1+w^2/alpha^2))
  dln_alpha = (a^2-1)/r + dln_a - r*a^2*phi^2
  dphi = psi
  dpsi = -psi*(2/r + dln_alpha - dln_a) + a^2*phi*(1-w^2/alpha^2)

  return [a*dln_a, alpha*dln_alpha, dphi, dpsi]
end

# Algoritmo RK4
function RK4(a_n, alpha_n, phi_n, psi_n, r_n, dr, w)
  k1 = dr * Stationary_State(a_n, alpha_n, phi_n, psi_n, r_n, w)
  k2 = dr * Stationary_State(a_n + 0.5*k1[1],
                            alpha_n + 0.5*k1[2],
                            phi_n + 0.5*k1[3],
                            psi_n + 0.5*k1[4], r_n + 0.5*dr, w)
  k3 = dr * Stationary_State(a_n + 0.5*k2[1],
                            alpha_n + 0.5*k2[2],
                            phi_n + 0.5*k2[3],
                            psi_n + 0.5*k2[4], r_n + 0.5*dr, w)
  k4 = dr * Stationary_State(a_n + k3[1],  
                            alpha_n + k3[2],
                            phi_n + k3[3],
                            psi_n + k3[4], r_n + dr, w)

  # Siguiente paso
  a_N = a_n + (k1[1] + 2*k2[1]+2*k3[1]+k4[1])/6
  alpha_N = alpha_n + (k1[2] + 2*k2[2]+2*k3[2]+k4[2])/6
  phi_N = phi_n + (k1[3] + 2*k2[3]+2*k3[3]+k4[3])/6
  psi_N = psi_n + (k1[4] + 2*k2[4]+2*k3[4]+k4[4])/6
  
  return (a_N, alpha_N, phi_N, psi_N)
end

function Solver(f0, w) # variables de Inicialización o arranque

  # Inicialización de arreglos solución
  a = zeros(Float64, Nr)
  alpha = zeros(Float64, Nr)
  phi = zeros(Float64, Nr)
  psi = zeros(Float64, Nr)

  # Condiciones iniciales
  a[1] = 1.0 
  alpha[1] = 1
  phi[1] = f0               
  psi[1] = 0

 # Ciclo solucionador
  for k in 1:Nr-1       
    a[k+1], alpha[k+1], phi[k+1], psi[k+1] = RK4(a[k], alpha[k], phi[k], psi[k], r[k], dr, w)
  end
  return a, alpha, phi, psi
end


# Función de error a minimizar
function error(f0, w)  
  _, _, phi, _ = Solver(f0, w)
  return phi[end] # Ultimo valor de phi el cual queremos hacer cero
end

# Encontrando el valor correcto
w_guess = find_zero(w -> error(f0, w), w_seed) # Esta alpha 0 viene del input.jl
println("w_guess = ", w_guess)


# Ejecutar al solucionador
a, alphajor, phi1, psi1 = Solver(f0, w_guess) # Hasta aquí es casi lo de Siddhartha

# Valor de alpha en cero y recuperación de omega y alpha "originales"
alpha0 = 1/(a[end]*alphajor[end])

w = alpha0*w_guess
println("w = ", w)

alpha = alpha0 * alphajor

# Por lo tanto, ya toda la solución queda así:

# a (PALOMITA)
# alpha (PALOMITA)
# phi1 (PALOMITA)
phi2 = zeros(Float64, Nr)
# psi1 (PALOMITA)
psi2 = zeros(Float64, Nr)
pi1 = zeros(Float64, Nr)
pi2 = @. - w * a * phi1 / alpha

# y hasta aquí, todo se llama como se tiene que llamar. Procedemos a guardar

open("data/Stationary_State.dat", "w") do io
  write(io, "r\ta\talpha\tphi1\tphi2\tpsi1\tpsi2\tpi1\tpi2\n")
  writedlm(io, [r a alpha phi1 phi2 psi1 psi2 pi1 pi2], '\t')
end 
end # Detener el cronómetro 
