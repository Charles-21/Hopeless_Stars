function SuperMetrica!(a, alpha, phi1, psi1, dr, Nr, r)

    # Ecuación de a 
    function deq_a(r_loc, a_loc, alpha_loc, phi1_loc, psi1_loc)
        dln_a = (1 - a_loc^2)/(2r_loc) +
                0.5*r_loc*(psi1_loc^2 + a_loc^2 * phi1_loc^2 * (1 + 1/alpha_loc^2))
        return a_loc * dln_a
    end # de deq_a

    # Ecuación de alpha
    function deq_alpha(r_loc, alpha_loc, a_loc, phi1_loc, psi1_loc)
        dln_a = (1 - a_loc^2)/(2r_loc) +
                0.5*r_loc*(psi1_loc^2 + a_loc^2 * phi1_loc^2 * (1 + 1/alpha_loc^2))
        dln_alpha = (a_loc^2 - 1)/r_loc + dln_a - r_loc * a_loc^2 * phi1_loc^2
        return alpha_loc * dln_alpha
    end # de deq_alpha

    # RK4 general
    function rk4_step(f, r_loc, y_loc, dr_loc, args...)
        k1 = dr_loc * f(r_loc,             y_loc,             args...)
        k2 = dr_loc * f(r_loc + 0.5*dr_loc, y_loc + 0.5*k1,    args...)
        k3 = dr_loc * f(r_loc + 0.5*dr_loc, y_loc + 0.5*k2,    args...)
        k4 = dr_loc * f(r_loc + dr_loc,     y_loc + k3,        args...)
        return y_loc + (k1 + 2k2 + 2k3 + k4)/6
    end # del RK4 general 

    # Integrar a(r) →
    a[1] = 1.0
    for k in 1:Nr-1
        a[k+1] = rk4_step(deq_a, r[k], a[k], dr, alpha[k], phi1[k], psi1[k])
    end

    # Integrar alpha(r) ←
    alpha[Nr] = 1.0 / a[Nr]
    for k in Nr:-1:2
        alpha[k-1] = rk4_step(deq_alpha, r[k], alpha[k], -dr, a[k], phi1[k], psi1[k])
    end
    alpha[1] = alpha[2]

    return nothing
end # de SuperMetrica
