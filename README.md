# **Estadística Computacional**
## **Otoño 2016**
## **Instituto Tecnológico Autómo de México**

<div style = "height: 40px;"></div>

Curso para las Maestrías en Ciencias de Datos y Ciencias en Computación. Aquí encontrarán código y materiales del curso.

### Contenido
1. <a href="#temario">Temario</a>
2. <a href="#calificacion">Sistema de calificación</a>
3. <a href="#tareas">Descripción de las tareas</a>
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
Proyecto final    |  45%
Examen final presencial |  5%

### Tareas
<a name="tareas"></a>

Voy a calificar sus tareas usando la función `shiny::runGithub(repo, username)` en `R`. El nombre del repositorio debe ser `compstat2016` y yo solo debo cambiar su nombre de usuario de Github para poder abrir la aplicación que contendrá sus tareas y que se elaborará como explico a continuación.

En esta sección encontrarán una descripción de las tareas que deben entregar. Habrá varios tipos de tareas; la mayoría de ellas implicarán la creación de una app de shiny. El objetivo es juntar todas las apps en un *shiny* formando un *showcase* de los temas aprendidos en el curso.

#### Instrucciones
Deberán crear un repositorio llamado `compstat2016`. Aquí, deberán tener un proyecto de shiny con archivos `ui.R` y `server.R` que contentan **una** aplicación en la que muestren **todas sus tareas**. Es importante que los arhicos del shiny **no** pueden estar en ninguna subcarpeta. Pueden tener subcarpetas dentro de su repositorio y tener otros archivos o datos ahí, pero el la app de shiny debe estar en la carpeta raíz.

Yo recomiendo que en su proyecto tengan la siguiente estructura, de manera que trabajen cada app de manera independiente y al final solo incluyan el mismo código en su showcase usando herramientos como `tabBox`, `conditionalPanel`, etc. La utilización de `shinydashboard` es decisión de ustedes.

<pre>
readme.md
ui.R
shiny.R // contiene en un showcase con la misma información que app1, app2, etc...
data/
|-- data.Rd // incluyan todos los archivos de datos que puedan necesitar sus apps.
|-- data.csv
</pre>
No importa que su proyecto tengo subcarpetas y archivos adicionales mientras tenga lo mínimo para que corra su app usando la función `shiny::runGithub`.

Noten que la *creatividad* e *iniciativa propia* son elementos importantes de este curso, por lo que los estudiantes que incluyan mejoras no incluidas inicialmente por el profesor serán recompensandos.


#### Tarea 1: Método de la Función Inversa

* **Forma de entrega**: Como una pestaña de su shiny app showcase
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

* **Forma de entrega**: Como una pestaña de su shiny app showcase
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

#### Tarea 3: MCMC, historia y avances
* **Forma de entrega**: Documento físico
* **Instrucciones**: Leer el artículo "The MCMC revolution" y hacer una síntesis de la lectura y su opinión sobre ella en máximo una cuartilla.


#### Tarea 4,5 y 6: Haciendo su propio Metropolis-Hastings
* **Forma de entrega**: Como una pestaña de su shiny app showcase
* **Fecha recomendada de terminación**:  octubre
* **Objetivo**: Esta tarea estará divida en varias tareas. El objetivo es hacer un análisis *regresión lineal simple bayesiana* usando Markov Chain Monte Carlo. El tipo de regresión es 'simple' porque solo vamos a usar una variable explicativa, pero si ustedes desean, pueden hacer todo para regresión múltiple.
El objetivo es *predecir* una variable *Y* usando otra variable aleatoria *X*. El *modelo* está dado por
<div align="center"><pre>
  Y = a + X*beta + eps      con       eps ~ N(0, sigma^2)
</pre></div>
Los parámetros desconocidos del modelo son theta=(`a`, `beta` y `sigma^2`). Los datos son `(X,Y)`. Si se fijan, en realidad la distribución está asumiendo sore los errores, así que en realidad el modelo está en función de los errores. Por lo tanto, la función de verosimilitud también queda en término de los errores. La función de verosimilitud del modelo es
<pre>
  L(theta) = f(e | theta) =
               = sqrt(2 pi sigma^ 2)^(-N/2)  exp(-e^te/(2 sigma^2))
               = sqrt(2 pi sigma^ 2)^(-N/2)  exp((Y-Xb-a)^t(Y-Xb-a)/(2 sigma^2))
</pre>
donde `e=Y-Xb-a=(e_1,...,e_N)` es el vector de errores. Asegúrense de entender de dónde viene este modelo y porque es como es la verosimilitud. Entenderlo es lo más importante. Si no no deben avanzar.

En un análisis bayesiano suponemos una distribución inicial para estos parámetros. La distribución inicial debe ser un reflejo de su certidumbre o incertidumbre de cierto valor que podría tomar. El usuario debe dar sus suposiciones iniciales.


##### Tarea 4: Diseño de interface y set up inicial

En la primera entrega de la app deben:
1. Escoger una base de datos que quieran usar para problemas de regresión. Pueden usar una base de su trabajo o de otro curso. Si no tienen alguna base que les interese, pueden entrar al repositorio de `UCL` para darse algunas ideas. Esta base la usaran para todas las siguientes tareas.
2. Crear una interface de shiny que utilice las funciones `DT::renderDataTable` y `DT::dataTableOutput` para mostrar su base de datos (vean el tutorial en `http://shiny.rstudio.com/gallery/basic-datatable.html`).
3. En su interface deben elegir dos variables, la variable independiente `Y` y la variable dependiente `X`. Para esto pueden usar la función `selectInput` de Shiny (en caso de que estén haciendo regresión múltiple, pueden usar `checkboxInput`).
4. Hagan un *scatterplot/gráfico de dispersión*. Pueden usar `plotly` o `ggplot2`.
5. Deben elegir una distribución *a priori* para los parámetros de su modelo. Los parámetros de su modelo son el vector `theta=(a, b, sigma^2)`. Ustedes pienses en cómo asignar a prioris.
6. Hagan una gráfica de la función de densidad de su a prioris (una por parámetro)!

##### Tarea 5: El MCMC

En esta fase de la tarea deben hacer el MCMC. Deben programar una serie de funciones usando el paquete `Rcpp` (go ahead si quieren hacerlo en C/C++ puro... it's up to you.. I would not): la verosimilitud, su a priori, su a posteriori o función objetivo para simular y el MCMC. La función debe regresar la simulación.

El shiny debe recibir como parámetros (inputs de shiny, vean funciones como `slideInput` y `numericInput`)
1. El número de cadenas que se quieren simular
2. La longitud de las cadenas

El output debe ser:
1. Las simulación de las cadenas. Una matriz numérica de número de filas el número objetivo de simulaciones y de número de columnas el número de cadenas que pidieron simular.
2. Deben hacer histogramas de las simulaciones de cada parámetro de su modelo.
3. En una gráfica deben comparar la densidad a priori que dieron con la posterior. Para esto, deben estimar la densidad posterior usando la función `density` de R. Aquí hay un ejemplo de como pueden graficar una densidad <a href="http://www.statmethods.net/graphs/density.html">click here</a>. Pero ustedes deben poner la a apriori y la posterior en la misma gráfica. Puede ser bastante laborioso atinarle a los límites de graficación; plotly o ggplot lo hacen por ustedes. Pueden hacer la paquetería de graficación que gusten. Sean creativos; ¡disfrútenlo!

*Una cosa más (por si creían que sería fácil...) Su cadena sólo debe calcularse cuándo precionen un boton*. Para incluir botones hay que usar las funciones `actionButton` y `observeEvent` o `eventReactive` de shiny. Pueden ver ejemplos en <a href="http://shiny.rstudio.com/articles/action-buttons.html">click here</a>.

Si quieren usar programación paralela pueden chechar `RcppParallel` o `doParallel`, en este caso lo dejaremos como optativo.

##### Tarea 6: Diagnósticos
En esta tarea deben mejorar su MCMC.


### Fecha de entrega de tareas:
Las tareas las voy a revisar el día siguiente del examen final. Pero si quieren feedback de sus tareas pueden entregarlas y mostrarlas en anticipado.




### Proyecto final
<a name="final"></a>

* **Instrucciones**: Deberán formar equipos de hasta 5 integrantes en los que deberán elegir un tema de su interés relacion con la clase. Su elección de temas puede estar relacionado con los siguientes temas: cadenas de Markov y sus aplicaciones, simulación por Monte Carlo, sucesiones de números aleatorios, bootstrapping y aplicaciones en estadística, teoría de MCMC, cualquier aplicación interesante de MCMC no vista en clase. <br/> Deberán elaborar un video de máximo 30min en el que expliquen el tema o teoría que les interesó. <br/> Noten que no es necesario gastar dinero en materiales para hacer un video profesional pues existen un gran número de herramientas gratuitas. En la evaluación se tomará en cuenta no sólo el contenido teórico de su proyecto, que es el más importante, sino también la calidad de la presentación y su habilidad de comunicación de un tema técnico. <br/> No se requiere entregar un proyecto escrito. No obstante, cualquier material adicional a la presentación que entreguen será tomado en cuenta positivamente para ayudar a la calificación. <br/> Tomen en cuenta que la creatividad es un factor importante.
* **Fechas importantes**
    + Propuesta de tema y definición de equipos: 31/10/2016 via correo electrónico. Un solo correo por equipo mencionando los integrantes.
    + Entrega de video: 10/12/2016


### Examen final presencial
<a name="final_presencial"></a>

Los detalles se darán más adelante cuando se publiquen las fechas de examenes.
