using DelimitedFiles

function main()

  # Estado inicial
  include("../Stationary/Initial_Poster.jl")
  
  phi1_f = zeros(Float64, Nr); phi2_f = zeros(Float64, Nr)
  psi1_f = zeros(Float64, Nr); psi2_f = zeros(Float64, Nr)
  pi1_f = zeros(Float64, Nr); pi2_f = zeros(Float64, Nr)



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
    a_p = copy(a)
    alpha_p = copy(alpha)

    phi1_p = copy(phi1)
    psi2_p = copy(psi2)

    psi1_p = copy(psi1)
    phi2_p = copy(phi2)
      
    pi1_p = copy(pi1)
    pi2_p = copy(pi2)

    # Fuentes (Discretización de los operadores/ecuaciones diferenciales)
      
    # phi
    phi1_f .= alpha .* pi1 ./ a
    phi2_f .= alpha .* pi2 ./ a

    # psi
    for i in 2:Nr-1
      psi1_f[i] = 0.5/dr * (
            alpha[i+1]*pi1[i+1]/a[i+1] -
            alpha[i-1]*pi1[i-1]/a[i-1] )

      psi2_f[i] = 0.5/dr * (
            alpha[i+1]*pi2[i+1]/a[i+1] -
            alpha[i-1]*pi2[i-1]/a[i-1] )
    end

    # pi en dos bucles
    for i in 2:10
      pi1_f[i] = 3.0 * (
          (alpha[i+1]*r[i+1]^2*psi1[i+1]/a[i+1] -
          alpha[i-1]*r[i-1]^2*psi1[i-1]/a[i-1]) /
          (r[i+1]^3 - r[i-1]^3))
          - a[i]*alpha[i]*phi1[i]

      pi2_f[i] = 3.0 * (
          (alpha[i+1]*r[i+1]^2*psi2[i+1]/a[i+1] -
          alpha[i-1]*r[i-1]^2*psi2[i-1]/a[i-1]) /
          (r[i+1]^3 - r[i-1]^3))
          - a[i]*alpha[i]*phi2[i]
    end

    for i in 11:Nr-1
      pi1_f[i] = 0.5/dr * (
          (alpha[i+1]*r[i+1]^2*psi1[i+1]/a[i+1] -
          alpha[i-1]*r[i-1]^2*psi1[i-1]/a[i-1]))/ r[i]^2 - a[i]*alpha[i]*phi1[i]

      pi2_f[i] = 0.5/dr * (
          (alpha[i+1]*r[i+1]^2*psi2[i+1]/a[i+1] -
          alpha[i-1]*r[i-1]^2*psi2[i-1]/a[i-1]))/ r[i]^2 - a[i]*alpha[i]*phi2[i]
    end

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
