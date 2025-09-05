phi1_f = zeros(Float64, Nr); phi2_f = zeros(Float64, Nr)
psi1_f = zeros(Float64, Nr); psi2_f = zeros(Float64, Nr)
pi1_f = zeros(Float64, Nr); pi2_f = zeros(Float64, Nr)

function fuentes!(phi1_f, phi2_f,
                  psi1_f, psi2_f,
                  pi1_f, pi2_f, 
                  phi1, phi2, psi1, psi2, pi1, pi2, 
                  Nr, dr, r)
    
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

    return nothing
end

