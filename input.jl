#---------------------------#
#---Archivo de parámetros---#
#---------------------------#

rf = 59.0	# Tamaño del dominio espacial
dr = 0.05	# Resolución espacial

Nr = Int(rf/dr)	# Determinamos el número de pasos
println("Número de pasos espaciales: ", Nr )


f0 = 0.1	# Valor central del campo en t=0
alpha0_seed = 0.9322289142001354    # Semilla para arrancar Initial_Siddhartha.jl
w_seed = 1.0726979015213376       # Semilla para arrancar Initial_Poster.jl  

tf = 300        # Tiempo final de integración
courant = 0.5   # Parámetro de Courant

dt = courant*dr # Determinamos el tamaño del paso temporal
Nt = Int(tf/dt) # Calculamos el número de pasos temporales





