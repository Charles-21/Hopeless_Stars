# *Perturbando estados de equilibrio de Estrellas de Bosones (BS's)*

Para determinar si una BS está en un estado de equilibrio estable o inestable, este programa calcula dicho estado, le aplica una perturbación y muestra su comportamiento en el tiempo.

---
**_input.jl_**:
Parámetros de integración e inicialización.

**_Initial.jl_**:
Solucionador para el estado estacionario utilizando RK4 y Shooting

**_Compacticidad.jl_**: 

Calcula:

- M: Masa ADM
- N: Número de bariones (Una integral con Trapz)
- M99: 99% de la masa ADM
- R99: Superficie en la cual se concentra dicha cantidad de masa
- Compacticidad: M99/R99

**_fuentes.jl_**: 

Discretización de los operadores temporales.

**_metric.jl_**: 

Discretización de las constricciones métricas.

**_evolution.jl_**: 

Contiene el ciclo principal de evolución y opera el almacenamiento de datos.


**_Directorio "data"_**: 

**_Stationary_State.dat_**: 
Archivo de salida que contiene la solución estacionaria.

**_stationary.gn_**:
Script de gnuplot que lanza la gráfica de la solución estacionaria

La extensión ".rt" indica superficies. La extensión ".t" indica una función dependiente sólo de t.

---
**_Talacha_**
... con la que se estructuró la lógica y diseño del programa. Se alojan códigos que permiten entender el funcionamiento general.
