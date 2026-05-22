#lang racket
(provide valid-path)


(define (valid-path n edges source destination)

  ;; Crear un vector donde cada posición representa un nodo.
  
  ;; FUNCIONES:
  ;; make-vector: funcion de racket que crea un vector (arreglo) con cierta cantidad de posiciones (n).
  ;; Cada nodo va a empezar con una lista vacía de vecinos (empty)

  (define graph (make-vector n empty))



  ;; La función add-edge se encarga de construir el grafo agregando conexiones entre nodos dentro de la lista de adyacencia. 
  ;; Como el grafo es no dirigido (el problema menciona a bidirectional graph), agregamos ambos sentidos.
  
  ;;FUNCIONES:
  ;; vector-ref: obtiene el valor almacenado en una posición específica del vector.
  ;; vector-set!: modifica el valor almacenado en una posición del vector.
  
  (define (add-edge edge)
    (define node-a (first edge))
    (define node-b (first (rest edge)))

    ;; Agregar node-b como vecino de node-a
    
    (vector-set! graph node-a
                 (cons node-b (vector-ref graph node-a)))

    ;; Agregar node-a como vecino de node-b
    (vector-set! graph node-b
                 (cons node-a (vector-ref graph node-b))))



  
  ;; Recorrer todas las conexiones para construir el grafo.
  ;; FUNCIONES:
  ;; for-each: recorre todos los elementos de una lista y ejecuta una función sobre cada uno.
  (for-each add-edge edges)



  
  ;; Vector para saber qué nodos ya visitamos.
  ;; FUNCIONES:
  ;; make-vector: funcion de racket que crea un vector (arreglo) con cierta cantidad de posiciones (n).

  (define visited (make-vector n #false))



  ;; DFS recursivo
  ;;FUNCIONES:
  ;; vector-ref: obtiene el valor almacenado en una posición específica del vector.
  ;; vector-set!: modifica el valor almacenado en una posición del vector.
  
  (define (find-path current-node)
    (cond
      ;; Si llegamos al destino, sí existe camino.
      [(= current-node destination) #true]

      ;; Si ya visitamos este nodo, no lo repetimos.
      [(vector-ref visited current-node) #false]

      [else
       ;; Marcar el nodo actual como visitado.
       (vector-set! visited current-node #true)

       ;; Revisar si algún vecino puede llegar al destino.
       (check-neighbors (vector-ref graph current-node))]))




  ;; Revisa recursivamente la lista de vecinos.
  (define (check-neighbors neighbors-list)
    (cond
      [(empty? neighbors-list) #false]

      [else
       (or (find-path (first neighbors-list))
           (check-neighbors (rest neighbors-list)))]))

  

  ;; Iniciar búsqueda desde source
  (find-path source))