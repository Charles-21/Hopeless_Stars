#---------------------------#
#---Archivo de parámetros---#
#---------------------------#

# Dominio espacial

rf = 43.0	# Tamaño del dominio espacial
dr = 0.01	# Resolución espacial

Nr = Int(rf/dr)	# Determinamos el número de pasos

f0 = 0.2	# Valor central del campo en t=0
alpha0_seed = 0.8591595973731501     # Semilla para arrancar Initial_Siddhartha.jl

# Dominio temporal

tf = 20         # Tiempo final de integración
courant = 0.5   # Parámetro de Courant
dt = courant*dr # Tamaño del paso temporal
Nt = Int(tf/dt) # Calculamos el número de pasos temporales


# Guardado de datos

SaveDataR = 100 # Cuántos pasos espaciales quieres guardar
SaveDataT = 100 # Cuantos pasos temporales quieres guardar

strideR = max(1, div(Nr, SaveDataR))
strideT = max(1, div(Nt, SaveDataT))


# Perturbación Gaussiana
pert = false # ¿Deseas perturbar el Estado de Equilibrio?

A = 0.0008 # Amplitud gaussiana
sigma = 0.1 # Utilizado por Siddhartha
r0 = 6.0 # Utilizado por Siddhartha
