# **Estadística Computacional**
## **Otoño 2016**
## **Instituto Tecnológico Autómo de México**

<div style = "height: 40px;"></div>

Curso para las Maestrías en Ciencias de Datos y Ciencias en Computación. Aquí encontrarán código y materiales del curso.

### Contenido
1. <a href="#temario">Temario</a>
2. <a href="#calificacion">Sistema de calificación</a>
3. <a href="#tareas">Descripción de las tareas</a>
4. <a href="#ensayo">Descripción del ensayo</a>
5. <a href="#final">Descripción del proyecto final</a>



### Temario
<a name="temario"></a>

1. Número aleatorios
    + Números verdaderamente aleatorios y pseudoaleatorios
    + Calidad de los números pseudoaleatorios
    + Métodos de generación de números pseudoaleatorios
    + Ejemplo en clase: código y app para crear número aleatorios usando el generador congruencial lineal
2. Simulación de variables aleatorias
    + Simulación de variableas aleatorias discretas
    + Simulación de variables aleatorias continuas: método de la función inversa, método de aceptación-rechazo y *overview* de otros métodos
3. Simulación por Monte Carlo
    + Intuición como método de integración numérica y como método de inferencia estadística no paramétrica
    + Intervalos de confianza asintóticos para los estimadores de Monte Carlo
    + *Overview* de métodos de reducción de varianza
    + Ejemplo en clase: problema del cumpleaños
4. Introducción a la Teoría de Cadenas de Markov
    + Procesos estocásticos y la propiedad de Markov
    + Propiedades elementales
    + Comportamiento largo plazo. Teorema Ergódico y Teorema Límite de Cadenas de Markov
    + Aplicaciones: Google PageRank, simulación de texto
    + Ejemplo en clase: simulación de cadenas de Markov usando C++ con R a través del paquete `Rcpp`
    + Cadenas reversibles
    + Extensión a cadenas a conjunto de espacios continuo
5. Markov Chain Monte Carlo
    + Aplicación de cadenas reversible al algoritmo de *Metropolis-Hastings*
    + Ejemplo: Programación del método de *Random-walk Metropolis* en Rcpp

Más temas serán agregados conforme los vayamos cubriendo en el curso.


### Sistema de calificación
<a name="calificacion"></a>

Rubro       |      Peso
------------|--------------
Tareas      |       50%
Ensayo      |       15%
Proyecto final |    35%

### Tareas
<a name="tareas"></a>

En esta sección encontrarán una descripción de las tareas que deben entregar. Habrá varios tipos de tareas; la mayoría de ellas implicarán la creación de una app de shiny. El objetivo es juntar todas las apps en un *shiny* formando un *showcase* de los temas aprendidos en el curso.

#### Instrucciones
Deberán crear un repositorio llamado `compstat2016`. Aquí, deberán tener un proyecto de shiny con archivos `ui.R` y `server.R` que contentan **una** aplicación en la que muestren **todas sus tareas**. Es importante que los arhicos del shiny **no** pueden estar en ninguna subcarpeta. Pueden tener subcarpetas dentro de su repositorio y tener otros archivos o datos ahí, pero el la app de shiny debe estar en la carpeta raíz.

Yo recomiendo que en su proyecto tengan la siguiente estructura, de manera que trabajen cada app de manera independiente y al final solo incluyan el mismo código en su showcase usando herramientos como `tabBox`, `conditionalPanel`, etc. La utilización de `shinydashboard` es decisión de ustedes.

<pre>
readme.md
ui.R
shiny.R // contiene en un showcase con la misma información que app1, app2, etc...
data/
|-- example1.Rda
|-- needed_file.csv
shinyapps/
|-- app1/
|   |-- ui.r
|   |-- server.r
|-- app2/
|   |-- ui.r
|   |-- server.r
|-- etc
</pre>
La *creatividad* e *iniciativa propia* son elementos importantes de este curso, por lo que los estudiantes que incluyan mejoras no incluidas inicialmente por el profesor serán recompensandos.


#### Tarea 1: Método de la Función Inversa

* **Forma de entrega**: Shiny app
* **Fecha recomendada de terminación**: durante agosto
* **Objetivo**: Crear una app simple para familiarizarse con shiny y reforzar el método de la función inversa como una técnica para simular variables aleatorias independientes.
* * **Output mínimo**
    + Un véctor numérico de simulaciones de una x ~ Exp(lambda).
    + Un histograma de x.
* **Input mínimo**
    + `nsim`: número de simulaciones
    + `lambda`: parámetro de la densidad exponencial que se quiere simular
    + `nbin`: un parámetro para el número de cajones de un histograma de las simulaciones
* **Instrucciones adicionales**: Se recomienda incluir una prueba de bondad de ajusta para verificar que los números creados tienen la distribución deseada. Pueden incluirse prueba gráficas como densidades empíricas vs densidades teóricas. Puede incluirse un botón para descargar la muestra simulada. Sean creativos.

#### Tarea 2: Integración numérica usando Monte Carlo

* **Forma de entrega**: Shiny app
* **Fecha recomendada de terminación**: durante septiembre
* **Objetivo**: Practicar el entendimiento de Monte Carlo como técnica de integración numérica y usar el enfoque de valor esperado para crear intervalos de precisión. Practicar las funciones `eval` y `parse` de R que permite recibir una expresión `s` de R en format de string y ejecutarla con el comando `eval(parse(text = s))`
* **Output mínimo**
    + El resultado de calcular int_a^b f(x) dx
    + Un gráfico que muestre los resultados de la simulación usando `N =10, 100, 1000, 10000, 100000` puntos. En el eje y incluir el resultado de la estimación con `N` puntos y en el eje x poner `log_10(N)` (logaritmo base 10).
    + El gráfico debe incluir intervalos de confianza al nivel `c %`
* **Input mínimo**
    + `a`: límite inferior para la integración
    + `b`: límite superior para la integración
    + `fun`: El usario debe introducir en un área de texto la funcíon que debe quiere integrar
    + `c`: El parámetro para crear intervalso de confianza al `c %`
* **Instrucciones adicionales**: Para un programa aún mejor, una dificultad es escribir el código de forma que no se rehaga la simulación una vez que se cambia el valor de `c`. Un excelente proyecto incluirá una comparación con un método numérico como el trapecio. Un programa que me deje completamente boquiabierto permitirá integrales múltiples (no es necesario esforzarse tanto).



### Ensayo
<a name="tareas"></a>

Se agregará esta sección más adelante cuando los detalles se discutan en clase.

### Final
<a name="tareas"></a>

Se agregará esta sección más adelante cuando los detalles se discutan en clase.
