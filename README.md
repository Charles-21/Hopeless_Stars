# *Perturbando estados de equilibrio de Estrellas de Bosones (BS's)*

Para determinar si una BS está en un estado de equilibrio estable o inestable, este programa calcula dicho estado, le aplica una perturbación y muestra su comportamiento en el tiempo.

---

**_Makefile_**:
Contiene dos comandos: run para ejecutar la evolución y clean para borrar los datos generados después de una evolución.

**_input.jl_**:
Parámetros de integración e inicialización.

**_initial.jl_**:
Solucionador para el estado estacionario utilizando RK4 y Shooting

**_compacticity.jl_**: 

Para el estado de equilibrio, calcula:

- M: Masa ADM
- N: Número de bariones (Una integral con Trapz)
- M99: 99% de la masa ADM
- R99: Superficie en la cual se concentra dicha cantidad de masa
- Compacticidad: M99/R99

**_perturbing.jl_**:  

Añade la perturbación y realiza los calculos de compacticity.jl para el estado perturbado

**_fuentes.jl_**: 

Discretización de los operadores temporales.

**_metric.jl_**: 

Discretización de las constricciones métricas.

**_evolution.jl_**: 

Contiene el ciclo principal de evolución. Arranca con el estado de equilibrio o bien con el estado perturbado.

**_savedata.jl_**: 
Opera el almacenamiento de datos.

**_Directorio "data"_**: 

**_stationary.gn_**:
**_perturbing.gn_**:
Scripts de gnuplot que lanzan la gráfica del estado inicial.

La extensión ".rt" indica superficies. La extensión ".t" indica una función dependiente sólo de t.

---
**_Talacha_**
... con la que se estructuró la lógica y diseño del programa. Se alojan códigos que permiten entender el funcionamiento general.
