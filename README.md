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

- M: Masa ADM (listo) 
- N: Número de bariones (Una integral)
- N99: 99% de N
- r99: Superficie en la cual se concentra el 99% de N
- C: Compacticidad (N99/r99)

No puedo continuar escribiendo este programa hasta no resolver el problema de la adimensionalización






