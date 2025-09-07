using DelimitedFiles

# Estado inicial y subrutinas
include("perturbing.jl")
include("fuentes.jl")
include("metric.jl")
include("savedata.jl")

println("|---------------------------|")
println("|---Comienza la Evolución---|")
println("|---------------------------|") 
println()
println("Tiempo de evolución")

function evolve() # Función principal de evolución

    #------------------------------------#
    #--- Ciclo principal de evolución ---#
    #------------------------------------#
    local t = 0.0
    for n in 1:Nt # Los Geht's!

      # Guardando Pasos temporales
      Save_Data!(n, t, r, strideT, strideR, Nr, phi1)
      #----------------------------------------


      # Vertimos el estado inicial
      a_p = copy(a); alpha_p = copy(alpha)

      phi1_p = copy(phi1); psi2_p = copy(psi2)
      psi1_p = copy(psi1); phi2_p = copy(phi2)
      pi1_p = copy(pi1); pi2_p = copy(pi2)
      #----------------------------------------

      #-----------------------------#
      #--- Ciclo interno del ICN ---#
      #-----------------------------#
      for k in 1:3
              # Calculando las fuentes
              fuentes!(phi1_f, phi2_f, psi1_f, psi2_f, pi1_f, pi2_f, phi1, phi2, psi1, psi2, pi1, pi2, Nr, dr, r)
              #-------------------------------------------------------------------------------------------------

              # Flujo del ICN
              if k < 3
                 dtw = 0.5 * dt
              else
                  dtw = dt
              end # del if



              # Cálculo del Paso Temporal
              phi1 .= phi1_p .+ dtw .* phi1_f
              phi2 .= phi2_p .+ dtw .* phi2_f

              psi1 .= psi1_p .+ dtw .* psi1_f
              psi2 .= psi2_p .+ dtw .* psi2_f

              pi1 .= pi1_p .+ dtw .* pi1_f
              pi2 .= pi2_p .+ dtw .* pi2_f
              #------------------------------


              # Condiciones de frontera
              psi1[1] = -psi1[2]
              psi2[1] = -psi2[2]
              pi1[1] = pi1[2]
              pi2[1] = pi2[2]

              byron = 1 + dtw/dr + dtw/r[Nr] 
              pi1[Nr] = (pi1[Nr-1]*(dtw/dr - 1) + pi1_p[Nr]*(1 - dtw/dr - dtw/r[Nr]) + pi1_p[Nr-1]*(dtw/dr + 1))/byron
              pi2[Nr] = (pi2[Nr-1]*(dtw/dr - 1) + pi2_p[Nr]*(1 - dtw/dr - dtw/r[Nr]) + pi2_p[Nr-1]*(dtw/dr + 1))/byron
              psi1[Nr] = -pi1[Nr] - phi1[Nr]/r[Nr]
              psi2[Nr] = -pi2[Nr] - phi2[Nr]/r[Nr]
              #-------------------------------------

              # Calculando la métrica
              Constricciones_metricas!(a, alpha, phi1, phi2, psi1, psi2, pi1, pi2, dr, Nr, r)
              #------------------------------------------------------------------------------
      end # del ciclo interno del ICN

      t += dt # Actualización del tiempo

    end # del ciclo principal de evolución
end # de la función principal de evolución


# Ejecutando la función de evolución
@time begin
evolve()
println()
println("Tiempo de ejecución: ")
end # del cronómetro

println("|----------------------------------------------------|")  
println("|---Fin de la Evolución. Que tengas un buen día :)---|") 
println("|----------------------------------------------------|")
println()


