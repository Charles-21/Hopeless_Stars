function Constricciones_metricas!(a, alpha, 
                                phi1, phi2, psi1, psi2, pi1, pi2, dr, Nr, r)

  a[1] = a[2] = 1.0

  #--- Constricción para a ---#

  for i in 3:Nr
      rhoa = 0.5 * ( (pi1[i-1]^2 + pi2[i-1]^2 +
                        psi1[i-1]^2 + psi2[i-1]^2) / a[i-1]^2 +
                        phi1[i-1]^2 + phi2[i-1]^2 )

      ssa = a[i-1] * ( 0.5 * (1.0 - a[i-1]^2) / r[i-1] +
                      r[i-1] * a[i-1]^2 * rhoa )

      rk1 = a[i-1] + 0.5 * dr * ssa

      rhoa1 = 0.5 * ( (pi1[i-1]^2 + pi2[i-1]^2 +
                        psi1[i-1]^2 + psi2[i-1]^2) / rk1^2 +
                        phi1[i-1]^2 + phi2[i-1]^2 )

      rhoa2 = 0.5 * ( (pi1[i]^2 + pi2[i]^2 +
                        psi1[i]^2 + psi2[i]^2) / rk1^2 +
                        phi1[i]^2 + phi2[i]^2 )

      rrhoa = 0.5 * ( r[i-1] * rhoa1 + r[i] * rhoa2 )

      ssa = rk1 * ( (1.0 - rk1^2) / (r[i-1] + r[i]) + rk1^2 * rrhoa )

      a[i] = a[i-1] + dr * ssa
  end
  
  
  #--- Fin del ciclo de a ---#
  
  alpha[Nr] = 1.0/a[Nr]

  #--- Constricción para alpha ---#

  for i in (Nr-1):-1:2
    rhoa = 0.5 * ( (pi1[i+1]^2  + pi2[i+1]^2 +
                    psi1[i+1]^2 + psi2[i+1]^2) / a[i+1]^2 +
                    phi1[i+1]^2 + phi2[i+1]^2 )

    ssa = 0.5 * (1.0 - a[i+1]^2) / r[i+1] +
          r[i+1] * a[i+1]^2 * rhoa

    aux1 = (a[i+1]^2 - 1.0) / r[i+1] + ssa -
           r[i+1] * a[i+1]^2 * (phi1[i+1]^2 + phi2[i+1]^2)

    ssalpha = alpha[i+1] * aux1

    aux = alpha[i+1] - 0.5 * dr * ssalpha

    #------------------------------------------------
    rhoa = 0.5 * ( (pi1[i]^2  + pi2[i]^2 +
                    psi1[i]^2 + psi2[i]^2) / a[i]^2 +
                    phi1[i]^2 + phi2[i]^2 )

    ssa2 = 0.5 * (1.0 - a[i]^2) / r[i] +
           r[i] * a[i]^2 * rhoa

    aux2 = (a[i]^2 - 1.0) / r[i] + ssa2 -
           r[i] * a[i]^2 * (phi1[i]^2 + phi2[i]^2)

    ssalpha = 0.5 * (aux1 + aux2)

    alpha[i] = alpha[i+1] - dr * aux * ssalpha
  
  end #--- Fin del ciclo de alpha ---#

  alpha[1] = alpha[2]
  
  return nothing

end #--- Fin de la función métrica ---#
