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

El paradigma funcional tiene como objetivo aproximarse lo más posible al comportamiento de las funciones matemáticas. A diferencia de los lenguajes imperativos, donde el programa constantemente modifica variables y estados en memoria mediante asignaciones, la programación funcional busca minimizar este tipo de cambios y centrarse principalmente en la evaluación de funciones. En un lenguaje puramente funcional, las variables no se actualizan continuamente durante la ejecución del programa, sino que las funciones reciben datos de entrada y producen resultados sin alterar el estado general del sistema. En este paradigma, la repetición normalmente se implementa mediante recursión en lugar de ciclos iterativos, y una función debe producir siempre el mismo resultado cuando recibe los mismos parámetros, característica conocida como referential transparency.
Este paradigma constituye una de las bases más importantes de los estilos de programación no imperativos y es un enfoque que ganó gran relevancia gracias a las ideas propuestas por John Backus en su conferencia del Premio Turing de 1977, donde argumentó que los lenguajes puramente funcionales podían producir programas más legibles, confiables y con mayores probabilidades de ser correctos en comparación con los lenguajes imperativos (Sebesta, 2012).

Para poder resolver este problema es necesario recorrer los grafos que se van a proporcionan en el input para después explorar las conexiones entre sus nodos hasta determinar si existe un camino válido entre el nodo inicial y el nodo destino y para lograr esto voy a utilizar un algoritmo conocido como Depth-First Search (DFS) con listas de adyacencia.

De acuerdo con el libro Introduction to Algorithms de Cormen et al. (2009), el algoritmo Depth-First Search (DFS) sigue una estrategia de exploración en profundidad, intentando avanzar lo más posible a través de un camino antes de regresar y explorar otras alternativas. El algoritmo revisa primero las conexiones de los nodos descubiertos más recientemente y, cuando ya no existen caminos nuevos por explorar, realiza un proceso de backtracking para regresar a nodos anteriores y continuar la búsqueda desde ellos. Este procedimiento se repite hasta recorrer todos los nodos alcanzables dentro del grafo. 

Por otro lado la representación de un grafo (***G = (V E)***) mediante una lista de adyacencia consiste en un arreglo *Adj* de *|V|* listas, donde *V* representa el conjunto de vértices o nodos del grafo y cada posición del arreglo corresponde a un vértice específico *u ∈ V*. Para cada vértice *u*, la lista *Adj[u]* contiene todos los vértices *v* tales que existe una conexión o arista *(u,v) ∈ E*, donde *E* representa el conjunto de aristas o conexiones del grafo. 

En otras palabras, cada lista almacena todos los vecinos de un nodo determinado, y en un grafo no dirigido, si existe una arista *(u,v)*, entonces el vértice *u* aparece en la lista de adyacencia de *v* y viceversa.

Además de DFS y listas de adyacencia, la implementación utiliza hash tables para almacenar tanto el grafo como los nodos visitados durante el recorrido. Según Cormen et al. (2009), una hash table es una estructura de datos eficiente para implementar asociaciones entre claves y valores, donde el índice utilizado para acceder a la información se calcula a partir de una función hash. En esta solución, cada nodo del grafo funciona como una clave y el valor asociado corresponde a la lista de vecinos conectados a dicho nodo, lo cual nos permitirá acceder rápidamente a los vecinos de cada vértice durante la exploración realizada por DFS.

La primera solución para este problema será implementada usando estos conceptos en el entorno de desarrollo DrRacket utilizando el lenguaje Racket, el cual es un lenguaje derivado de Scheme, que se caracteriza por trabajar bajo el paradigma funcional.

El código en Racket se desarrolló utilizando varias funciones pequeñas que se encargan de tareas específicas dentro del recorrido DFS. Para representar el grafo se utilizó una estructura conocida como lista de adyacencia, explicada anteriormente, donde cada nodo almacena directamente una lista con sus vecinos o nodos conectados y en esta implementación, dichas listas de adyacencia se almacenan mediante hash tables, donde cada nodo funciona como una clave y el valor asociado corresponde a la lista de vecinos conectados a dicho nodo.

La función principal, **valid-path**, recibe los parámetros proporcionados por LeetCode los cuales son el número de nodos, la lista de conexiones, el nodo inicial y el nodo destino. Dentro de esta función se construye el grafo utilizando la función **build-graph**, la cual recorre todas las conexiones que se dieron en el input para generar el grafo completo.

Para construir la lista de adyacencia se utiliza la función **add-edge**, la cual recibe una conexión entre dos nodos y la agrega dentro de la hash table del grafo y debido a que el problema trabaja con un grafo no dirigido, cada conexión se almacena en ambos sentidos, eso quiere decir que si existe una conexión entre los nodos *u* y *v*, entonces *v* aparece como vecino de *u* y *u* aparece como vecino de *v*. La función **add-neighbor** se encarga específicamente de agregar vecinos a cada nodo sin modificar el estado original de la estructura, lo cual mantiene un enfoque alineado con la programación funcional pura donde las variables no se actualizan continuamente durante la ejecución del programa.

Una vez construido el grafo, la función **find-path** implementa la lógica principal del algoritmo DFS de manera recursiva. Esta función revisa si el nodo actual corresponde al destino, si ya fue visitado anteriormente o si debe continuar explorando sus vecinos. Para registrar los nodos que ya fueron visitados se utiliza otra hash table llamada **visited**, la cual evita ciclos infinitos durante el recorrido.

La función **check-neighbors** es la encargada de revisar recursivamente la lista de vecinos del nodo actual, donde si alguno de ellos logra llegar al destino, la función regresa #true y en caso contrario, continúa explorando el resto de vecinos hasta haber revisado todos los caminos posibles.

Dentro de la implementación también se utilizaron funciones características de Racket como first, rest, cons y cond.
**-first:**- obtiene el primer elemento de una lista.
**-rest:**- obtiene el resto de la lista excluyendo el primer elemento.
**-cons:**- agrega un elemento al inicio de una lista.
**-cond:**- permite evaluar múltiples casos dentro del algoritmo, es como el equivalente de if / if else.

Así mismo, se utilizaron funciones relacionadas con hash tables como hash, hash-ref, hash-set y hash-has-key?, las cuales, aunque no se vieron  durante la clase, tuve que investigarlas para poder realizar una implementación que fuera más eficiente mientras mantenia un estilo de programación funcional pura, lo cual no logré con las funciones de vectores.

**-hash:** crea una hash table vacía o con valores iniciales.
**-hash-ref:** obtiene el valor asociado a una clave dentro de la hash table.
**-hash-set:** crea una nueva versión de la hash table con un valor agregado o actualizado sin modificar la original.
**-hash-has-key?:** verifica si una clave existe dentro de la hash table.

Como se menciono anteriormente, una de las características principales de la solución funcional es el uso de recursión en lugar de ciclos iterativos, lo cual podemos observar en la exploración del grafo, la cual se realiza mediante llamadas recursivas hasta encontrar el destino o determinar que no existe un camino válido entre los nodos indicados, además, la implementación evita modificar directamente las estructuras principales del programa, ya que hash-set genera nuevas versiones actualizadas de las hash tables en lugar de alterar las originales, manteniendo así el estilo funcional que busca minimizar ese tipo de cambios.

De esta manera se elaboró la solución en Racket y el código completo se encuentra en el archivo "find_path.rkt".

**DIAGRAMA**

<img width="2860" height="image" alt="Screen Recording 2026-05-25 at 11 45 54 a m" src="https://github.com/user-attachments/assets/c4d4695c-103f-44f2-8815-86c7de38d8ab" />


### Logic - Prolog

El paradigma lógico surgió a partir de investigaciones relacionadas con la demostración automática de teoremas. Inicialmente, los programas de demostración de teoremas eran muy lentos debido a que exploraban exhaustivamente todas las posibles pruebas, sin embargo, durante la década de 1960, gracias al desarrollo del algoritmo de unificación y el principio de resolución, este tipo de búsquedas lógicas se hiceron más eficientes.
Pero el paradigma se terminó de consolidar a inicios de los setenta cuando se unieron dos trabajos clave, por un lado, Alain Colmerauer desarrolló el lenguaje Prolog para procesar reglas del lenguaje humano y por el otro, Robert Kowalski descubrió que ejecutar los programas de Prolog era lo mismo que demostrar teoremas usando cláusulas de Horn, las cuales son instrucciones lógicas simples con una sola conclusión (del tipo "si ocurre A y B, entonces ocurre C"), y fue la unión de estas dos ideas lo que dio origen a la programación lógica tal como la conocemos (Abelson & Sussman, 1996).

Para explicar cómo funciona la programación lógica se utilizará como referencia el libro "The Art of Prolog". De acuerdo con este libro, un programa lógico es un conjunto de reglas y relaciones entre objetos, donde la ejecución del programa consiste en deducir consecuencias lógicas a partir de esas reglas, por lo que el significado del programa depende de las conclusiones que pueden obtenerse de él, asimismo, este paradigma utiliza construcciones heredadas de la lógica formal, donde las principales estructuras son hechos, reglas y consultas, mientras que la estructura básica de datos utilizada son los términos lógicos (Sterling & Shapiro, 1994).

- **Hechos:** los hechos permiten expresar que una relación existe entre ciertos objetos.
  - Por ejemplo, una expresión como father(abraham, isaac). indica que la relación father se cumple entre Abraham e Isaac. En programación lógica, a este tipo de relaciones también se les conoce como predicados, mientras que los nombres utilizados para representar individuos específicos se conocen como átomos.
- **Consultas o query:** las consultas se utilizan para recuperar información del programa lógico y permiten preguntar si una relación determinada es verdadera.
  - Por ejemplo, una consulta como father(abraham, isaac)? pregunta si la relación father realmente se cumple entre Abraham e Isaac. Aunque sintácticamente los hechos y las consultas son similares, normalmente se distinguen porque los hechos terminan con un punto y las consultas con un signo de interrogación.
- **Variables:** las variables en programación lógica funcionan de manera distinta a las variables utilizadas en lenguajes imperativos, ya que en lugar de representar una posición de memoria cuyo valor puede modificarse constantemente, una variable en Prolog normalmente comienza como  desconocida y el programa intenta encontrar un valor que permita satisfacer las reglas y relaciones lógicas definidas dentro del programa

Ahora que ya se entiende un poco mejor la sintaxis que se usa en la programación lógica, se pueden explicar algunos de los conceptos más importantes que permiten el funcionamiento del código que se desarrolló en Prolog, como la unificación, las listas, la recursión y el backtracking, los cuaales son fundamentales dentro de la implementación, ya que son los que permiten explorar el grafo y encontrar un posible camino entre los nodos indicados.

- **Unificación (unification) :** es considerada como una de las bases principales de la programación lógica y consiste en hacer que dos expresiones se vuelvan iguales encontrando valores para las variables que permitan que ambas coincidan correctamente. Cuando dos términos pueden hacerse idénticos mediante este proceso, se dice que unifican. Este mecanismo es fundamental en Prolog, ya que es el que permite que el programa compare patrones, relacione variables y determine si una regla o consulta puede cumplirse correctamente.
  - Por ejemplo, dentro del código se utiliza "member([NodeA, NodeB], Edges)" y supongamos que dentro de la lista Edges existe la conexión [3,7], aquí Prolog intentará comparar esa conexión con [NodeA, NodeB]:
    - member([NodeA, NodeB], Edges) = member([3,7], Edges)
- **Listas:** una lista se construye de manera recursiva, donde el primer elemento almacena un valor y el segundo elemento representa el resto de la lista, por ejemplo, en una lista como [3,2,5,6] se dividiria en dos partes principales: X, conocido como el head, que representa el primer elemento de la lista, mientras que Y, conocido como tail, es todo lo que resta y se representa asi: [3 | [2,5,6]]
Es gracias a esta estructura recursiva que las listas pueden utilizarse para representar estructuras mucho más complejas y son suficientes para realizar gran parte de los cálculos y manipulaciones de datos dentro de la programación lógica. Además, el libro también menciona que las listas necesitan una forma de terminar la recursión, por lo que se utiliza una lista vacía representada como [], la cual funciona como el caso final que indica que ya no existen más elementos dentro de la estructura.
- **Recursión**: es cuando una función se llama a sí mismo para resolver un problema paso a paso, normalmente se divide en un caso base, que detiene la recursión, y un caso recursivo, que continúa el proceso utilizando una versión más pequeña del problema original. En este proyecto, la recursión se utiliza en el recorrido DFS para continuar explorando nodos hasta encontrar el destino.
- **Backtracking**: es un mecanismo utilizado por Prolog para probar diferentes posibles soluciones automáticamente. Cuando Prolog intenta una opción y esta falla, el lenguaje retrocede al último punto válido y prueba una alternativa diferente, es gracias a esto que el programa puede explorar distintos caminos dentro del grafo hasta encontrar una ruta válida o determinar que no existe conexión entre los nodos indicados

La implementación en Prolog comienza con el predicado principal **valid_path**, el cual recibe como parámetros la cantidad de nodos, la lista de conexiones del grafo, el nodo inicial y el nodo destino, se piden estas cuatro cosas porque viene directamente del input que tenía el problema de LeetCode. En este predicado es donde comienza el DFS llamando a **find_path** y también manda una lista vacía que es donde se van a registrar los nodos visitados durante la búsqueda.

**find_path** es la función que contiene la lógica principal del algoritmo DFS, aquí primero se verifica el caso base, donde el nodo actual y el nodo destino son iguales, si esto ocurre, significa que sí existe un camino válido y la búsqueda termina, y en caso de que no, el programa revisa que el nodo actual no haya sido visitado previamente para evitar ciclos infinitos, después **connected** busca nodos vecinos dentro de la lista de conexiones del grafo y debido a que el grafo es no dirigido, se revisan las conexiones en ambos sentidos y una vez encontrado un vecino válido, **find_path** se llama nuevamente de manera recursiva para continuar explorando el grafo desde ese nuevo nodo.

Gracias a la recursión y al backtracking de Prolog, es que el programa puede probar diferentes caminos hasta encontrar una ruta válida entre los nodos indicados o determinar que la ruta no existe.

De esta manera se elaboró la solución en Prolog y el código completo se encuentra en el archivo "find_path.pl".

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

Para poder correr el programa en Prolog siga las siguientes instrucciones:

1. Primero se necesita tener instalado SWI-Prolog, de no tenerlo se puede descargar desde la página oficial de SWI-Prolog.
2. Guardar ambos archivos del proyecto, *"find_path.pl"* y *"find_path_tests.pl"*, dentro de la misma carpeta.
3. Abrir SWI-Prolog o ejecutarlo desde la terminal.
4. Cargar el archivo de pruebas escribiendo en la terminal: ['find_path_tests.pl'].
   - Si el archivo se carga correctamente, Prolog mostrará  *'true'*.
5. **Verificar que el archivo de pruebas si contenga la línea *" :- consult('find_path.pl'). "* ya que esto es lo que va a permitir que las pruebas puedan utilizar la función principal valid_path.**
6. Ejecutar las pruebas escribiendo en la terminal: run_path_tests.
7. En la consola deberá mostrarse el output correspondiente a cada caso de prueba junto con su resultado, ya sea True o False, dependiendo de si se logro encontrar o no un camino válido entre los nodos indicados.


## PRUEBAS 

**Pruebas en Racket - Paradigma Funcional**

Si escogiamos un problema de programación competitiva se nos solicitó que ocuparamos los casos de prueba qe la misma plataforma utilizaba para aceptar nuestra solución pero, debido a que LeetCode no permite visualizar todos los casos de prueba que se utilizan para validar un problema, únicamente se utilizarán como referencia los test cases que la plataforma si dejaba consultar, sin embargo, aunque no todos los casos de prueba son visibles, la implementación logró pasar correctamente la validación completa de la plataforma, obteniendo un resultado de "35/35 testcases passed", como se muestra en la siguiente evidencia.

<img width="700" height="image" alt="image" src="https://github.com/user-attachments/assets/cd34c1f8-255d-4b53-b838-0be24ad2375a" />

Estos son los caminos que probaremos en el archivo "find_path_tests.rkt" :

<img width="700" height="image" alt="image" src="https://github.com/user-attachments/assets/267f2378-fa54-46a3-bd44-9b0a22a394c8" />


**Pruebas en Prolog - Paradigma Lógico**

En cuanto a las pruebas de la implementación en Prolog se utilizaron inicialmente los mismos casos de prueba proporcionados por LeetCode y que utilicé anteriormente en la solución de Racket, con el objetivo de mantener consistencia entre ambas implementaciones y comprobar que ambas soluciones produjeran los mismos resultados esperados, sin embargo, al ejecutar el caso de prueba más grande de LeetCode, el cual era un grafo de 100 nodos, se observó que la implementación no funcionaba de manera particularmente eficiente y el tiempo de ejecución aumentaba considerablemente debido al backtracking de Prolog y a la gran cantidad de posibles caminos dentro del grafo.

Al investigar posibles formas de optimizar la solución, comenzaron a aparecer predicados y técnicas más avanzadas propias de Prolog como aggregate, assert, retract, límites de profundidad y manejo de estado global utilizando nb_getval/nb_setval, pero, además de que no comprendía completamente como funcionaban esas herramientas, la implementación ya se alejaba bastante de la solución realizada previamente en Racket, dificultando así la comparación entre ambos paradigmas, debido a que el código ya involucraba conceptos y mecanismos muy distintos.

Por esto, se decidió conservar una implementación más cercana conceptualmente a la desarrollada en Racket y para compensar por el tercer testcase de LeetCode que no funcionaba bien se complemento agregando 14 casos adicionales, los cuales fueron generados con ayuda de la inteligencia artificial ChatGPT (OpenAI). Estas pruebas fueron diseñadas para "incrementar progresivamente la dificultad de los grafos, incluyendo ciclos, múltiples rutas, componentes separados y tamaños cada vez mayores", llegando finalmente hasta grafos de 100 nodos, esto con el objetivo de probar que el código si funcionaba con grafos de distinto tamaño y complejidad.

Estos son los caminos que probaremos en el archivo "find_path_tests.pl" :

<img width="700" height="image" alt="image" src="https://github.com/user-attachments/assets/74321a6e-48e0-4202-ab6a-6b50b64dadd5" />


## ANÁLISIS
### Complejidad espacial y temporal

**Paradigma Funcional - Racket**

Según Cormen et al. (2009) en el libro Introduction to Algorithms, al analizar la complejidad de algoritmos sobre grafos, el tamaño de la entrada normalmente se mide utilizando dos parámetros: el número de vértices (V) y el número de aristas o conexiones (E) presentes en el grafo. Por esta razón, la complejidad de este tipo de algoritmos suele expresarse utilizando ambas cantidades dentro de la notación asintótica.

En la implementación realizada la complejidad temporal es ***O(V + E)***, ya que primero se construye la lista de adyacencia recorriendo las conexiones del grafo una sola vez mediante las hash tables y después el algoritmo DFS visita cada vértice y cada arista como máximo una vez durante la exploración, por esto, el tiempo de ejecución depende tanto de la cantidad de nodos como de la cantidad de conexiones presentes en el grafo, donde *(V)* representa el número total de vértices o nodos del grafo y *(E)* representa el número total de aristas o conexiones entre esos nodos.

Por otro lado, la complejidad espacial también resulta ser ***O(V + E)***, debido a que el programa necesita almacenar la lista de adyacencia del grafo dentro de las hash tables, la cual ocupa memoria proporcional tanto a la cantidad de vértices *(V)* como de aristas *(E)*, y además de esto, el algoritmo DFS también utiliza memoria adicional que ocupa para registrar los nodos que ya fueron visitados y para las llamadas recursivas realizadas durante la exploración. En el peor de los casos, la profundidad de la recursión puede llegar a ser proporcional al número total de nodos que haya en el grafo.

**Paradigma Lógico - Prolog**

En cuanto a la solución de Prolog, la complejidad temporal en el peor caso es aproximadamente ***O(VE)***, donde (V) representa el número de nodos y (E) el número de conexiones del grafo como se explicó anteriormente con la referencia del libro "Introduction to Algorithms". Esto se debe a que, a diferencia de la implementación de Racket no utilicé la lista de adyacencia, por lo cual al utilizar solo el algoritmo DFS este puede visitar hasta todos los nodos del grafo O(V), además, para buscar los vecinos de cada nodo se utiliza "member" sobre la lista completa de conexiones, por lo que cada búsqueda puede recorrer hasta todas las aristas del grafo. Debido a esto, el costo de la búsqueda de vecinos puede ser O(E) por cada nodo visitado, dando como resultado una complejidad de O(VE) en el peor caso.

La complejidad espacial es ***O(V)***, ya que el programa solo va a almacenar la lista de nodos visitados y las llamadas recursivas generadas durante el recorrido DFS, y en el peor caso estas dos cosas pueden crecer hasta el número total de nodos que existan en el grafo.

### Comparación de propuestas de solución

- Tanto la implementación en Racket como la de Prolog utilizan el algoritmo DFS (Depth First Search) para explorar el grafo y determinar si existe un camino válido entre dos nodos, y en ambos casos, la búsqueda se realiza de manera recursiva hasta encontrar el nodo destino o terminar de explorar las posibles rutas.
- Una de las principales diferencias entre ambas implementaciones es que en Racket se construyó una lista de adyacencia para almacenar los vecinos de cada nodo y así optimizar el código para que LeetCode aceptara la solución, en cambio, la implementación en Prolog trabajó directamente sobre la lista original de aristas proporcionada por el problema, lo cual hace la solución menos eficiente en comparación con la de Racket.
  - La razón por la que en Prolog no implementé una lista de adyacencia fue porque la programación lógica y su sintaxis me resultaban más complicadas de entender al momento de crear el código. Inicialmente hice una primera versión utilizando únicamente DFS pero al observar que el test case 3 de LeetCode no corría adecuadamente, pensé que el problema probablemente se debía a que la implementación no era lo suficientemente eficiente, por esta razón, consulté a una inteligencia artificial para que me explicara cómo podría adaptarse la solución que ya tenía pero  sumando una lista de adyacencia para así intentar optimizar el programa en Prolog. Pensé que esta solución funcionaría porque algo similar ya me había ocurrido anteriormente en Racket, ya que la primera versión que desarrollé en ese lenguaje también utilizaba únicamente DFS sin lista de adyacencia pero cuando la ejecuté en LeetCode, no logró pasar todas las pruebas debido a su complejidad temporal, lo cual me obligó a implementar una lista de adyacencia en Racket, gracias a la cual el código logro ser aceptado. Por esta razón, asumí que implementar la misma optimización en Prolog permitiría que el caso de prueba 3 también funcionara correctamente, sin embargo, incluso después de implementar la versión con lista de adyacencia en Prolog, el caso de prueba más grande seguía sin producir un resultado adecuado y por esto opté por conservar la solución basada únicamente en DFS, ya que era la versión cuyo funcionamiento comprendía mejor y podía explicar con mayor claridad dentro de la evidencia.
- Debido a esta diferencia, la implementación en Racket obtuvo una mejor complejidad temporal, ya que acceder a los vecinos de un nodo era más eficiente gracias a la lista de adyacencia, en cambio, en Prolog era necesario recorrer la lista de conexiones utilizando "member" cada vez que se buscaban vecinos, lo que incrementaba la complejidad de búsqueda durante el recorrido DFS.
- Otro contraste importante es justamente el paradigma que utiliza cada cada lenguaje. En Racket, se usa el paradigma funcional, donde el control del flujo del programa y las llamadas recursivas se realizan de manera más explícita mediante funciones y estructuras condicionales, y por otro lado, en Prolog el programa se construye principalmente mediante reglas lógicas y relaciones entre los datos.
- Durante las pruebas realizadas, ambas implementaciones lograron resolver correctamente la mayoría de los casos de prueba, pero en grafos grandes y con muchas conexiones, la solución en Racket mostró un mejor rendimiento debido principalmente al uso de hash tables y al menor impacto del backtracking en comparación con Prolog, que incluso con listas de adyacencia, no mostraba el resultado.


## REFERENCIAS 
- Cormen, T. H., Leiserson, C. E., Rivest, R. L., & Stein, C. (2009). Introduction to algorithms (3rd ed.). MIT Press.
- Sebesta, R. W. (2012). Concepts of programming languages (10th ed.). Pearson.
- Abelson, H., & Sussman, G. J. (1996). Structure and Interpretation of Computer Programs (2nd ed.). MIT Press.
- Sterling, L., & Shapiro, E. (1994). The Art of Prolog: Advanced Programming Techniques (2nd ed.). MIT Press.
- 4.15 hash tables. (n.d.). https://docs.racket-lang.org/reference/hashtables.html

