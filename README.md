**Esqueleto**

Estructura lógica que fui diseñando para hacer el programa de evolución dinámica de estrellas de bosones.
Tambien se alojan códigos útiles que permiten entender el funcionamiento de distintos aspectos del código.

# Stationary

**_input.jl_**

Parámetros de integración e inicialización.

**_Initial.jl_**

Solucionador para el estado estacionario utilizando RK4 y Shooting

**_Stationary_State.dat_**

Archivo de salida que contiene los datos de la solución.

**_stationary.gn_**

Script que lanza la gráfica de la solución.


**_Compacticidad.jl_**

Calcula:

- M: Masa ADM
- N: Número de bariones (Una integral con Trapz)
- material99: 99% del material. Ya sea N o M
- r99: Superficie en la cual se concentra el 99% del material
- C: Compacticidad (material99/r99)







