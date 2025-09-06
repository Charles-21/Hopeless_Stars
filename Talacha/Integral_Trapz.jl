# Integral con Trapz

using Trapz

# Malla
rf = 1.0        # Dominio espacial
dr = 0.01       # Resolución espacial
Nr = Int(rf/dr) # Número de pasos

r = [k * dr for k in 0:Nr]

# f(x) = x^2
integrando = [x^2 for x in r]

# Integración
area = trapz(r, integrando)

println("El resultado de la integral con Trapz es: ", area)
