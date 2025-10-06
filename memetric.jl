function Metricas!(a, alpha, phi1, phi2, psi1, psi2, pi1, pi2, dr, Nr, r)

# Ecuación de a
function deq_a(a, phi1, phi2, psi1, psi2, pi1, pi2, r)
    dln_a = (1 - a^2)/(2r) + 0.5*r*(pi1^2 + pi2^2 + psi1^2 + psi2^2 + a^2*(phi1^2 + phi2^2))
    return a * dln_a
end # de deq_a

# Ecuación de alpha
function deq_alpha(a, alpha, phi1, phi2, psi1, psi2, pi1, pi2, r)
    dln_a = (1 - a^2)/(2r) + 0.5*r*(pi1^2 + pi2^2 + psi1^2 + psi2^2 + a^2*(phi1^2 + phi2^2))
    dln_alpha = (a^2 - 1)/r + dln_a - r*a^2*(phi1^2 + phi2^2)
    return alpha * dln_alpha
end # de deq_alpha

# RK4 general
function rk4_step(f, y, r, dr, args...)
    k1 = dr * f(y,               r,           args...)
    k2 = dr * f(y + 0.5*k1,      r + 0.5*dr,  args...)
    k3 = dr * f(y + 0.5*k2,      r + 0.5*dr,  args...)
    k4 = dr * f(y + k3,          r + dr,      args...)
    return y + (k1 + 2k2 + 2k3 + k4)/6
end

# Resolviendo a
#a .= 0.0 # Arreglo solución de a
a[1] = 1.0 # Condición de frontera

for k in 1:Nr-1
    a[k+1] = rk4_step(
        (a_loc, r_loc, phi1_k, phi2_k, psi1_k, psi2_k, pi1_k, pi2_k) ->
            deq_a(a_loc, phi1_k, phi2_k, psi1_k, psi2_k, pi1_k, pi2_k, r_loc),
        a[k], r[k], dr,
        phi1[k], phi2[k], psi1[k], psi2[k], pi1[k], pi2[k]
    )
end

# Resolviendo alpha hacia atrás

    alpha[Nr] = 1.0 / a[Nr]

    for k in Nr:-1:2  # de Nr -> 2

	alpha[k-1] = rk4_step(
        (alpha_loc, r_loc, a_k, phi1_k, phi2_k, psi1_k, psi2_k, pi1_k, pi2_k) ->
            deq_alpha(a_k, alpha_loc, phi1_k, phi2_k, psi1_k, psi2_k, pi1_k, pi2_k, r_loc),
        alpha[k], r[k], -dr,         # paso negativo para ir hacia atrás
        a[k], phi1[k], phi2[k], psi1[k], psi2[k], pi1[k], pi2[k]
	    )
     end

    alpha[1] = alpha[2]

	return nothing
end # de la super función

