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

La solución en Racket se hizo mediante varias funciones pequeñas que se encargaban de tareas específicas dentro del recorrido DFS. 

La función principal, **valid-path**, recibe los parámetros proporcionados por el problema de acuerdo a leetcode e inicia la búsqueda llamando a **find-path**, la cual implementa la lógica principal del algoritmo DFS de manera recursiva.

***Función valid-path:***

<img width="450" height="image" alt="image" src="https://github.com/user-attachments/assets/c835aba9-15c5-47ad-96a5-41a9fc485a37" />


***Función find-path:***

<img width="600" height="image" alt="image" src="https://github.com/user-attachments/assets/eecd8f86-947c-4701-80b1-9b9cda2334fb" />

Dentro de la implementación también se utilizaron listas para representar las conexiones entre los nodos del grafo, así como funciones características de Racket y de la programación funcional, como **first, rest, cons y cond**. 

La estructura **cond** permite evaluar diferentes casos dentro del algoritmo, mientras que **cons** se utiliza para construir nuevas listas agregando elementos al inicio de ellas.

Una de las características principales de la solución mediante programación funcional es el uso de recursión en lugar de los ciclos iterativos tradicionales, por lo cual la función **find-path** explora recursivamente los vecinos de cada nodo hasta encontrar el destino o agotar todos los caminos posibles. 

Para evitar ciclos infinitos, el programa mantiene una lista de nodos visitados mediante la función **visited?**, mientras que **neighbors** obtiene los nodos conectados al nodo actual y **check-neighbors** va a revisar recursivamente si alguno de ellos puede llegar al destino final.

De esta manera se elaboró la solución en Racket y el código completo se encuentra en el archivo **"find_path.rkt"**.

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

Según Cormen et al. (2009) en e libro "Introduction to Algorithms", al analizar la complejidad de algoritmos sobre grafos, el tamaño de la entrada normalmente se mide utilizando dos parámetros: el número de vértices *(V)* y el número de aristas o conexiones *(E)* presentes en el grafo. Por esta razón, la complejidad de este tipo de algoritmos suele expresarse utilizando ambas cantidades dentro de la notación asintótica. 
Por ejemplo, una complejidad *O(VE)* indica que el tiempo de ejecución depende tanto de la cantidad de nodos como de la cantidad de conexiones existentes dentro del grafo y en la implementación que se realizó, la complejidad temporal es justamente esa misma, *O(VE)*, ya que por cada nodo visitado durante el recorrido DFS se recorre nuevamente la lista completa de conexiones para encontrar a sus vecinos.

Por otro lado la complejidad espacial de la solución sería *O(V)*, donde *"V"* representa el número de vértices que tiene el grafo. Esto se debe a que el algoritmo necesita almacenar en memoria los nodos que ya fueron visitados para evitar ciclos infinitos durante el recorrido y al tratarse de una implementación recursiva de DFS, en el peor de los casos la profundidad de las llamadas recursivas puede llegar a ser equivalente al número total de nodos que hay en el grafo en otras palabras *"V"*.



**Paradigma Lógico - Prolog


### Comparación de propuestas de solución


## REFERENCIAS 
- Cormen, T. H., Leiserson, C. E., Rivest, R. L., & Stein, C. (2009). Introduction to algorithms (3rd ed.). MIT Press.
- Sebesta, R. W. (2012). Concepts of programming languages (10th ed.). Pearson.


