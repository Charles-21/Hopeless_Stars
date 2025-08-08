using Plots

include("Initial.jl")

# Función de masa
m = [ri/2 * (1 - 1/ai^2) for (ri, ai) in zip(r, a)]

# Graficar
plt_masa = plot(r, m, size=(900, 300),
                 xlabel="r", label=raw"m(r)", linecolor=:blue)

savefig(plt_masa, "masa.png")

println("Masa ADM = ", m[end])


#En este programa se calcula:

# Masa ADM

# Número de bariones

# r99 (Superficie en la cual se concentra el 99% de N)

# Energía de amarre

