# **Estadística Computacional**
## **Otoño 2016**
## **Instituto Tecnológico Autómo de México**

<div style = "height: 40px;"></div>

Curso para las Maestrías en Ciencias de Datos y Ciencias en Computación. Aquí encontrarán código y materiales del curso.

### Contenido
1. <a href="#temario">Temario</a>
2. <a href="#calificacion">Sistema de calificación</a>
3. <a href="#tareas">Descripción de las tareas</a>
4. <a href="#ensayo">Ensayo</a>
5. <a href="#final">Examen final</a>



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
    + Selección de parámetros en Metropolis Hastings
    + Aplicación: Inferencia Bayesiana
    + Aplicación: Solución de un problema de cálculo de medias y varianzas usando inferencia bayesiana
    + Diagnóstico de un problema de MCMC
    + Slice sampling
    + Gibbs sampling
6. Boostrapping


Más temas serán agregados conforme los vayamos cubriendo en el curso.


### Sistema de calificación
<a name="calificacion"></a>

Rubro       |      Peso
------------|--------------
Tareas      |       50%
Ensayo      |       10%
Proyecto final    |  35%
Examen final presencial |  5%

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
</pre>
Pos supuesto sus apps no tienen que llamarse `app1`, `app2`, ... como en el ejemplo anterior.

Noten que la *creatividad* e *iniciativa propia* son elementos importantes de este curso, por lo que los estudiantes que incluyan mejoras no incluidas inicialmente por el profesor serán recompensandos.


#### Tarea 1: Método de la Función Inversa

* **Forma de entrega**: Shiny app
* **Fecha recomendada de terminación**:  agosto
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
* **Fecha recomendada de terminación**:  septiembre
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

#### Tarea 3: MCMC, regresión lineal y estadística Bayesiana
* **Forma de entrega**: Shiny app
* **Fecha recomendada de terminación**:  octubre
* **Objetivo**: Hacer un análisis *regresión lineal simple bayesiana* usando Markov Chain Monte Carlo. Deben incluir algún tipo de análisis de diagnóstico.
El objetivo es *predecir* una variable *y* usando otra variable aleatoria *x*. Detrás hay un modelo de la forma
<div align="center">y = a + x*beta + eps con eps x ~ N(0, sigma^2)</div>
Los parámetros desconocidos del modelo son `a`, `beta` y `eps` (el efecto de x y la precisión del ajuste respecitivamente).
En un análisis bayesiano suponemos una distribución inicial para estos parámetros. La distribución inicial debe ser un reflejo de su certidumbre o incertidumbre de cierto valor que podría tomar. El usuario debe dar sus suposiciones iniciales.
* **Input mínimo**
    + Parámetros para las distribuciones iniciales. Vamos a suponer que son de la forma <br/> `a ~ N(a_0, sda_0^2), beta ~ N(b_0, sdb_0^2), sigma_0 ~ Gamma(shape0, scale0)`
    + `n_sim`: número de simulaciones para el Método de MCMC que elijan
    + Parámetros adicionales para el modelo de MCMC que elija. Por ejemplo, si elije Random-Walk Metropolis tienen que elegir un tamaño de brinco.
* **Output mínimo**
    + Herramientas de diagnóstico numéricas y visuales para evaluar al convergencia del MCMC
    + Un `scatterplot` de `x` con `y` con la linea `hat(y) = a + beta*x` encimada.
    + Tiempo de cómputo.
* **Instrucciones adicionales**: Su método debe estar programado en `Rcpp`. Si utilizan alguna bibliografía para elejir sus métodos pueden ponerlo en la app. Si quieren sorprender al maestro intenten un método adaptativo de Metropolis-Hasting en vez del método de Random-walk.

### Tarea 3b: MCMC, historia y avances
* Leer el artículo "The MCMC revolution". Hacer una síntesis de una página de los avances que ha habido en el área. 


### Ensayo
<a name="ensayo"></a>

* **Fecha de entrega**: 15/11/2016 en el horario de clase
* **Instrucciones**: Entregar un ensayo de una a dos cuartillas respondiendo las preguntas: *¿Cuál es la importancia de la estadística computacional?* *¿Qué relevancia tiene para su proyecto laboral o académico?*
* **Evaluación**: El objetivo de este ejercicio es evaluar sus habilidades de comunicación así como su entendimiento general del lugar que esta rama de estudio tiene dentro de la estadística y las ciencias de la computación. Será tomada en cuenta la ortografía y la calidad de la escritura.
* **Forma de entrega**: Documento en `.pdf` con copia impresa..

### Proyecto final
<a name="final"></a>

* **Instrucciones**: Deberán formar equipos de hasta 5 integrantes en los que deberán elegir un tema de su interés relacion con la clase. Su elección de temas puede estar relacionado con los siguientes temas: cadenas de Markov y sus aplicaciones, simulación por Monte Carlo, sucesiones de números aleatorios, bootstrapping y aplicaciones en estadística, teoría de MCMC, cualquier aplicación interesante de MCMC no vista en clase. <br/> Deberán elaborar un video de máximo 30min en el que expliquen el tema o teoría que les interesó. <br/> Noten que no es necesario gastar dinero en materiales para hacer un video profesional pues existen un gran número de herramientas gratuitas. En la evaluación se tomará en cuenta no sólo el contenido teórico de su proyecto, que es el más importante, sino también la calidad de la presentación y su habilidad de comunicación de un tema técnico. <br/> No se requiere entregar un proyecto escrito. No obstante, cualquier material adicional a la presentación que entreguen será tomado en cuenta positivamente para ayudar a la calificación. <br/> Tomen en cuenta que la creatividad es un factor importante.
* **Fechas importantes**
    + Propuesta de tema y definición de equipos: 31/10/2016 via correo electrónico. Un solo correo por equipo mencionando los integrantes.
    + Entrega de video: 10/12/2016


### Examen final presencial
<a name="final_presencial"></a>

Los detalles se darán más adelante cuando se publiquen las fechas de examenes.
