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


Para poder resolver este problema es necesario recorrer los grafos que se van a proporcionan en el input para después explorar las conexiones entre sus nodos hasta determinar si existe un camino válido entre el nodo inicial y el nodo destino y para lograr esto voy a utilizar un algoritmo conocido como Depth-First Search (DFS) con listas de adyacencia.

De acuerdo con el libro Introduction to Algorithms de Cormen et al. (2009), el algoritmo Depth-First Search (DFS) sigue una estrategia de exploración en profundidad, intentando avanzar lo más posible a través de un camino antes de regresar y explorar otras alternativas. El algoritmo revisa primero las conexiones de los nodos descubiertos más recientemente y, cuando ya no existen caminos nuevos por explorar, realiza un proceso de backtracking para regresar a nodos anteriores y continuar la búsqueda desde ellos. Este procedimiento se repite hasta recorrer todos los nodos alcanzables dentro del grafo. 

Por otro lado la representación de un grafo (***G = (V E)***) mediante una lista de adyacencia consiste en un arreglo *Adj* de *|V|* listas, donde *V* representa el conjunto de vértices o nodos del grafo y cada posición del arreglo corresponde a un vértice específico *u ∈ V*. Para cada vértice *u*, la lista *Adj[u]* contiene todos los vértices *v* tales que existe una conexión o arista *(u,v) ∈ E*, donde *E* representa el conjunto de aristas o conexiones del grafo. 

En otras palabras, cada lista almacena todos los vecinos de un nodo determinado, y en un grafo no dirigido, si existe una arista *(u,v)*, entonces el vértice *u* aparece en la lista de adyacencia de *v* y viceversa

La primera solución para este problema será implementada usando estos conceptos en el entorno de desarrollo DrRacket utilizando el lenguaje Racket, el cual es un lenguaje derivado de Scheme, que se caracteriza por trabajar bajo el paradigma funcional.

El **paradigma funcional** tiene como objetivo aproximarse lo más posible al comportamiento de las funciones matemáticas. A diferencia de los lenguajes imperativos, donde el programa constantemente modifica variables y estados en memoria mediante asignaciones, la programación funcional busca minimizar este tipo de cambios y centrarse principalmente en la evaluación de funciones. En un lenguaje puramente funcional, las variables no se actualizan continuamente durante la ejecución del programa, sino que las funciones reciben datos de entrada y producen resultados sin alterar el estado general del sistema. En este paradigma, la repetición normalmente se implementa mediante recursión en lugar de ciclos iterativos, y una función debe producir siempre el mismo resultado cuando recibe los mismos parámetros, característica conocida como **referential transparency**. 
Este paradigma constituye una de las bases más importantes de los estilos de programación no imperativos y es un enfoque ganó gran relevancia gracias a las ideas propuestas por John Backus en su conferencia del Premio Turing de 1977, donde argumentó que los lenguajes puramente funcionales podían producir programas más legibles, confiables y con mayores probabilidades de ser correctos en comparación con los lenguajes imperativos (Sebesta, 2012).

La solución en Racket se desarrolló utilizando varias funciones pequeñas que se encargan de tareas específicas dentro del recorrido DFS. Para representar el grafo se utilizó una estructura conocida como lista de adyacencia,la cual se explico anteriormente, donde cada nodo almacena directamente una lista con sus vecinos o nodos conectados lo cual nos permite acceder a las conexiones del grafo de manera más eficiente durante la búsqueda.

La función principal, **valid-path**, recibe los parámetros proporcionados por LeetCode: el número de nodos, la lista de conexiones, el nodo inicial y el nodo destino y dentro de esta función se crea un vector llamado graph, donde cada posición representa un nodo del grafo y contiene una lista con sus vecinos.

Para construir la lista de adyacencia se utiliza la función **add-edge**, la cual recibe una conexión entre dos nodos y la agrega dentro del vector del grafo, debido a que el problema trabaja con un grafo no dirigido, cada conexión se almacena en ambos sentidos, eso quiere decir que si existe una conexión entre los nodos u y v, entonces v aparece como vecino de u y u aparece como vecino de v.

Una vez construido el grafo, el programa crea un vector llamado visited, el cual se utiliza para registrar los nodos que ya fueron visitados durante el recorrido y evitar ciclos infinitos,posteriormente, la función **find-path** implementa la lógica principal del algoritmo DFS de manera recursiva, esta función revisa si el nodo actual corresponde al destino, si ya fue visitado anteriormente o si debe continuar explorando sus vecinos.

La función **check-neighbors** es la que se encarga de revisar recursivamente la lista de vecinos del nodo actual, si alguno de ellos logra llegar al destino, la función regresa #true y en caso de que no continúa explorando el resto de vecinos hasta haber revisado todos.

Dentro de la implementación también utilicé funciones características de Racket como **first, rest, cons y cond** y algunas nuevas que no vi directamente en clase como **make-vector, vector-ref, vector-set!, for-each** pero que se utilizaban para realizar la solución con una menor complejidad y así fuera aceptada por LeetCode.

Los vectores son los que permitieron almacenar de manera eficiente tanto la lista de adyacencia como los nodos visitados, mientras que funciones como first, rest, cons facilitaron el manejo de listas dentro del programa y cond es lo que permitio evaluar diferentes casos dentro del algoritmo, como el equivalente de if de los lenguajes imperativos que normalmente usamos.

Una de las características principales de la solución funcional es el uso de recursión en lugar de ciclos iterativos, por lo que la exploración del grafo se realiza mediante llamadas recursivas hasta encontrar el destino o determinar que no existe un camino válido entre los nodos indicados.

De esta manera se elaboró la solución en Racket y el código completo se encuentra en el archivo "find_path.rkt".

### Logic - Prolog



## IMPLEMENTACIÓN

**Implementación en Racket - Paradigma Funcional**

Para ejecutar el programa se deben seguir las siguientes instrucciones:

  1. Primero se necesita tener instalado DrRacket, lo cual se puede hacer desde la página oficial de Racket.
  2. Guardar ambos archivos del proyecto (find_path.rkt y find_path_tests.rkt) dentro de la misma carpeta.
  3. Abrir el archivo find_path_tests.rkt en DrRacket.
  4. **Verificar que el archivo principal find_path.rkt SI contenga la línea (provide valid-path) para permitir que las pruebas puedan utilizar la función principal.**
  5. Ejecutar el programa presionando el botón Run dentro de DrRacket.
  6. Los resultados de las pruebas aparecerán en la consola inferior de DrRacket mostrando #true o #false dependiendo de si existe un camino válido entre los nodos indicados en cada caso de prueba.

**Implementación en Prolog - Paradigma Lógico**


## PRUEBAS 

**Pruebas en Racket - Paradigma Funcional**

Debido a que LeetCode no permite visualizar todos los casos de prueba que se utilizan para validar un problema, únicamente se utilizarán como referencia los test cases que la plataforma si permite consultar, sin embargo, aunque no todos los casos de prueba son visibles, la implementación logró pasar correctamente la validación completa de la plataforma, obteniendo un resultado de "35/35 testcases passed", como se muestra en la siguiente evidencia.

<img width="700" height="image" alt="image" src="https://github.com/user-attachments/assets/cd34c1f8-255d-4b53-b838-0be24ad2375a" />

Estos son los caminos que probaremos en el archivo "find_path_tests.rkt" :

<img width="700" height="image" alt="image" src="https://github.com/user-attachments/assets/267f2378-fa54-46a3-bd44-9b0a22a394c8" />


**Pruebas en Prolog - Paradigma Lógico**


## ANÁLISIS
### Complejidad espacial y temporal

**Paradigma Funcional - Racket**

Según Cormen et al. (2009) en el libro Introduction to Algorithms, al analizar la complejidad de algoritmos sobre grafos, el tamaño de la entrada normalmente se mide utilizando dos parámetros: el número de vértices (V) y el número de aristas o conexiones (E) presentes en el grafo. Por esta razón, la complejidad de este tipo de algoritmos suele expresarse utilizando ambas cantidades dentro de la notación asintótica.

En la implementación realizada, la complejidad temporal es ***O(V + E)***, ya que primero se construye la lista de adyacencia recorriendo las conexiones del grafo una sola vez y después el algoritmo DFS visita cada vértice y cada arista como máximo una vez durante la exploración y así, el tiempo de ejecución depende tanto de la cantidad de nodos como de la cantidad de conexiones presentes en el grafo, donde (V) representa el número total de vértices o nodos del grafo y (E) representa el número total de aristas (conexiones) entre dichos nodos. 

Por otro lado, tenemos la complejidad espacial la cual también resulta ser O(V + E), esto se debe a que el programa necesita almacenar la lista de adyacencia del grafo, que va a ocupar memoria proporcional a la cantidad de vértices (V) asi como de aristas (E), y la que también va a utilizar el algoritmo DFS para registrar los nodos ya visitados y para las llamadas recursivas realizadas durante la exploración.


**Paradigma Lógico - Prolog**


### Comparación de propuestas de solución


## REFERENCIAS 
- Cormen, T. H., Leiserson, C. E., Rivest, R. L., & Stein, C. (2009). Introduction to algorithms (3rd ed.). MIT Press.
- Sebesta, R. W. (2012). Concepts of programming languages (10th ed.). Pearson.
- 4.12 vectors. (n.d.). https://docs.racket-lang.org/reference/vectors.html


