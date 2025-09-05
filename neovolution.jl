using DelimitedFiles

# Estado inicial
  include("Stationary/Initial_Poster.jl")
  include("fuentes.jl")

function main()

  open("phi1.rt", "w") do io
      write(io, "# t\tr\tphi1\n")
  end

  # Ciclo principal de evolución
  local t = 0.0 
  for n in 1:10 # Los Geht's!  

    # Guardado de datos
    #if n % strideT == 0
        open("phi1.rt", "a") do io
            for j in 1:strideR:Nr
                write(io, "$(t)\t$(r[j])\t$(phi1[j])\n")
            end
            write(io, "\n")
        end
    #end

    # Vertir la solución en estos nuevos arreglos
    a_p = copy(a); alpha_p = copy(alpha)

    phi1_p = copy(phi1); psi2_p = copy(psi2)
    psi1_p = copy(psi1); phi2_p = copy(phi2)
    pi1_p = copy(pi1); pi2_p = copy(pi2)

    # Fuentes (Discretización de los operadores/ecuaciones diferenciales)
    fuentes!(phi1_f, phi2_f, psi1_f, psi2_f, pi1_f, pi2_f, phi1, phi2, psi1, psi2, pi1, pi2, Nr, dr, r)

    # Paso temporal
    phi1 .= phi1_p .+ dt .* phi1_f
    phi2 .= phi2_p .+ dt .* phi2_f

    psi1 .= psi1_p .+ dt .* psi1_f
    psi2 .= psi2_p .+ dt .* psi2_f

    pi1 .= pi1_p .+ dt .* pi1_f
    pi2 .= pi2_p .+ dt .* pi2_f

    # Condiciones de frontera
    psi1[1] = -psi1[2]
    psi2[1] = -psi2[2]
    pi1[1] = pi1[2]
    pi2[1] = pi2[2]

    byron = 1 + dt/dr + dt/r[Nr] 
    pi1[Nr] = (pi1[Nr-1]*(dt/dr - 1) + pi1_p[Nr]*(1 - dt/dr - dt/r[Nr]) + pi1_p[Nr-1]*(dt/dr + 1))/byron
    pi2[Nr] = (pi2[Nr-1]*(dt/dr - 1) + pi2_p[Nr]*(1 - dt/dr - dt/r[Nr]) + pi2_p[Nr-1]*(dt/dr + 1))/byron
    psi1[Nr] = -pi1[Nr] - phi1[Nr]/r[Nr]
    psi2[Nr] = -pi2[Nr] - phi2[Nr]/r[Nr]

    t += dt # Y ya sólo actualizamos el contador temporal

  end # Fin del ciclo principal de evolución

end # function main

main()
