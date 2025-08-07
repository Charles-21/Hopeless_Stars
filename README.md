**Esqueleto**

Estructura lógica que fui diseñando para hacer el programa de evolución dinámica de estrellas de bosones.
Tambien se alojan códigos útiles que permiten entender el funcionamiento de distintos aspectos del código.

# Stationary

**input.jl**
Parámetros de integración e inicialización.

**Initial.jl**

Solucionador para el estado estacionario utilizando RK4 y Shooting

**Stationary_State.dat**
Archivo de salida que contiene los datos de la solución.

**stationary.gn**
Script que lanza la gráfica de la solución.


**Compacticidad.jl**

Calcula:

- Masa ADM
- Número de bariones (Una integral)
- N99 (99% de N)
- r99 (Superficie en la cual se concentra el 99% de N)
- Eb (Energía de amarre, diferencia entre M y N)
- Compacticidad (N99/r99)








