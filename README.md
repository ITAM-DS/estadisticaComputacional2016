# **Estadística Computacional**
## **Otoño 2016**
## **Instituto Tecnológico Autómo de México**

<div style = "height: 40px;"></div>

Curso para las Maestrías en Ciencias de Datos y Ciencias en Computación. Aquí encontrarán código y materiales del curso.

### Contenido
1. <a href="#temario">Temario</a>
2. <a href="#calificacion">Sistema de calificación</a>
3. <a href="#tareas">Descripción de las tareas</a>
4. <a href="#tareas">Descripción del ensayo</a>
5. <a href="#tareas">Descripción del proyecto final</a>



### Temario
<a name="calificacion"></a>



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
shinyapps/
  app1/
  app2/
  etc....
</pre>
La *creatividad* e *iniciativa propia* son elementos importantes de este curso, por lo que los estudiantes que incluyan mejoras no incluidas inicialmente por el profesor serán recompensandos.


#### Tarea 1: Método de la Función Inversa

* **Forma de entrega**: Shiny app
* **Fecha recomendada de terminación**: durante Agosto
* **Objetivo**: Crear una app simple para familiarizarse con shiny y reforzar el método de la función inversa como una técnica para simular variables aleatorias independientes.
