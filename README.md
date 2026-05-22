# Evidencia-Demonstracion-de-un-Paradigma-de-Programacion

## PROBLEMA A RESOLVER 
Para esta evidencia escogí resolver un problema de programación competitiva de la plataforma Leetcode el cual se muestra a continuación:

<img width="image" height="3328" alt="image" src="https://github.com/user-attachments/assets/cfe255fb-5852-41ec-b144-aa6d0a349b8f" />

El problema seleccionado consiste en determinar si existe un camino entre dos nodos dentro de un grafo. 
El programa recibe como entrada:
- La cantidad de nodos del grafo
- Una lista de conexiones entre ellos
- Un nodo de inicio (source)
- Un nodo destino (destination).

A partir de esta información, el algoritmo debe explorar las conexiones disponibles para verificar si es posible llegar desde el nodo inicial hasta el nodo destino siguiendo las rutas existentes.

El resultado esperado es un valor booleano, en otras palabras true o false, será "true" en caso de que exista al menos un camino válido entre ambos nodos, o "false" si no existe ninguna forma de llegar al destino. 

El problema resulta interesante porque trabaja con la idea de conectividad entre nodos, y el algoritmo detrás de su solución, Depth-First Search (DFS), es un concepto que aparece constantemente en aplicaciones reales. Esta misma lógica puede utilizarse para determinar si existe un camino entre dos puntos en sistemas GPS para encontrar rutas, en redes sociales para analizar conexiones entre usuarios o incluso en videojuegos para que un personaje encuentre un camino dentro de un mapa, por mencionar algunos ejemplos. 
De esta manera, el problema no solo es útil para practicar algoritmos de búsqueda y recorridos en grafos, sino que también ayuda a comprender cómo conceptos  básicos pueden escalar hasta convertirse en la base de aplicaciones mucho más complejas e importantes que utilizamos diariamente como Google Maps, sistemas de navegación o plataformas digitales que dependen de este tipo de algoritmos para funcionar, por lo que comenzar a entenderlos mediante problemas de programación es una forma de comenzar a comprender cómo se construyen soluciones reales a partir de fundamentos computacionales aparentemente simples.

## PARADIGMAS 

### Functional - Racket 


Para poder resolver este problema es necesario recorrer los grafos que se van a proporcionan en el input para después explorar las conexiones entre sus nodos hasta determinar si existe un camino válido entre el nodo inicial y el nodo destino y para lograr esto voy a utilizar un algoritmo conocido como Depth-First Search (DFS).

De acuerdo con el libro Introduction to Algorithms de Cormen et al. (2009), el algoritmo Depth-First Search (DFS) sigue una estrategia de exploración en profundidad, intentando avanzar lo más posible a través de un camino antes de regresar y explorar otras alternativas. El algoritmo revisa primero las conexiones de los nodos descubiertos más recientemente y, cuando ya no existen caminos nuevos por explorar, realiza un proceso de backtracking para regresar a nodos anteriores y continuar la búsqueda desde ellos. Este procedimiento se repite hasta recorrer todos los nodos alcanzables dentro del grafo.

La primera solución para este problema será implementada en el entorno de desarrollo DrRacket utilizando el lenguaje Racket el cual es un lenguaje derivado de Scheme que se caracteriza por trabajar bajo el paradigma funcional.

El **paradigma funcional** tiene como objetivo aproximarse lo más posible al comportamiento de las funciones matemáticas. A diferencia de los lenguajes imperativos, donde el programa constantemente modifica variables y estados en memoria mediante asignaciones, la programación funcional busca minimizar este tipo de cambios y centrarse principalmente en la evaluación de funciones. En un lenguaje puramente funcional, las variables no se actualizan continuamente durante la ejecución del programa, sino que las funciones reciben datos de entrada y producen resultados sin alterar el estado general del sistema. En este paradigma, la repetición normalmente se implementa mediante recursión en lugar de ciclos iterativos, y una función debe producir siempre el mismo resultado cuando recibe los mismos parámetros, característica conocida como **referential transparency**. 
Este paradigma constituye una de las bases más importantes de los estilos de programación no imperativos y es un enfoque ganó gran relevancia gracias a las ideas propuestas por John Backus en su conferencia del Premio Turing de 1977, donde argumentó que los lenguajes puramente funcionales podían producir programas más legibles, confiables y con mayores probabilidades de ser correctos en comparación con los lenguajes imperativos (Sebesta, 2012).





### Logic - Prolog
## Comparación de propuestas de solución

## IMPLEMENTACIÓN
## PRUEBAS 
## ANÁLISIS
## REFERENCIAS 
- Cormen, T. H., Leiserson, C. E., Rivest, R. L., & Stein, C. (2009). Introduction to algorithms (3rd ed.). MIT Press.
- Sebesta, R. W. (2012). Concepts of programming languages (10th ed.). Pearson.


