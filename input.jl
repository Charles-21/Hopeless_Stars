#---------------------------#
#---Archivo de parámetros---#
#---------------------------#

rf = 15.0	# Dominio espacial
dr = 0.05	# Resolución espacial
Nr = Int(rf/dr)	# Número de pasos

f0 = 0.1	# Valor central del campo en t=0
alpha0_seed = 0.4	# Semilla para arrancar el shooting
