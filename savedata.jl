function Save_Data!(n, t, r, strideT, strideR, Nr, phi1, L2, masa)
    if n % strideT == 0

	println(t) # Imprimiendo en pantalla el contador temporal

        # Valor central de phi1
        open("data/phi1.t", "a") do io
            write(io, "$(t)\t$(phi1[begin])\n")
        end # del do

        # Norma de adot
        open("data/L2_adot.t", "a") do io
            write(io, "$(t)\t$(L2)\n")
        end # del do

        # Máximo de a
        open("data/a_max.t", "a") do io
            write(io, "$(t)\t$(maximum(a))\n")
        end # del do

        # Máximo de alpha
        open("data/alpha_max.t", "a") do io
            write(io, "$(t)\t$(maximum(alpha))\n")
        end # del do
        
	# Masa ADM en el tiempo
        open("data/masa_ADM.t", "a") do io
            write(io, "$(t)\t$(masa[end])\n")
        end # del do

        # Superficie phi1
        open("data/phi1.rt", "a") do io
            for j in 1:strideR:Nr
                write(io, "$(t)\t$(r[j])\t$(phi1[j])\n")
            end # del for
            write(io, "\n")
        end # del do

        # Superficie a
        open("data/a.rt", "a") do io
            for j in 1:strideR:Nr
                write(io, "$(t)\t$(r[j])\t$(a[j])\n")
            end # del for
            write(io, "\n")
        end # del do

        # Superficie alpha
        open("data/alpha.rt", "a") do io
            for j in 1:strideR:Nr
                write(io, "$(t)\t$(r[j])\t$(alpha[j])\n")
            end # del for
            write(io, "\n")
        end # del do
    
      end # del if
    return nothing
end # de la función Save_Data
