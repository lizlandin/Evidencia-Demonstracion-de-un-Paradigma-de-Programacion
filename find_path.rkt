#lang racket

(provide valid-path)

;; -----------------------------------------
;; PROBLEMA DE PROGRAMACION: FIND IF PATH EXISTS
;; Paradigma funcional en Racket
;; -----------------------------------------


;; -----------------------------------------
;; add-neighbor: agrega un vecino a un nodo.
;; -----------------------------------------

(define (add-neighbor graph node neighbor)

  ;; hash-ref: obtiene el valor asociado a una clave, en este caso obtiene la lista de vecinos del nodo.
  ;; Si el nodo todavía no existe en el hash, regresa empty.

  (define current-neighbors
    (hash-ref graph node empty))
  

  ;; hash-set: crea una nueva versión del hash con el valor actualizado.

  (hash-set graph node
            (cons neighbor current-neighbors)))


;; -----------------------------------------
;; add-edge
;; Construye el grafo agregando conexiones entre nodos dentro de la lista de adyacencia y como en el problema de Leetcode menciona " a bi-directional graph" se agrega en ambas direccione
;; -----------------------------------------

(define (add-edge graph edge)

  ;; first: obtiene el primer elemento de una lista.
  ;; rest: obtiene el resto de la lista.
  ;; En este caso se usan para obtener los dos nodos de una conexión.

  (define node-a (first edge))
  (define node-b (first (rest edge)))

  ;; Agregar node-b como vecino de node-a.

  (define new-graph
    (add-neighbor graph node-a node-b))

  ;; Agregar node-a como vecino de node-b.

  (add-neighbor new-graph node-b node-a))


;; -----------------------------------------
;; build-graph: recorre todas las conexiones para construir el grafo.
;; -----------------------------------------

(define (build-graph edges graph)

  ;; cond: permite evaluar varios casos, que es parecido a if / else if.
  ;; empty?: revisa si una lista está vacía.

  (cond
    [(empty? edges) graph]

    [else
     (build-graph (rest edges)
                  (add-edge graph (first edges)))]))


;; -----------------------------------------
;; make-result
;; Guarda dos valores:
;; 1. Si se encontró o no un camino.
;; 2. La versión actualizada de visited.
;; -----------------------------------------

(define (make-result found? visited)
  (list found? visited))


;; -----------------------------------------
;; result-found?: obtiene el resultado true o false almacenado en result.
;; -----------------------------------------

(define (result-found? result)
  (first result))


;; -----------------------------------------
;; result-visited: obtiene la hash table de nodos visitados que esta almacenada en result.
;; -----------------------------------------

(define (result-visited result)
  (first (rest result)))


;; -----------------------------------------
;; valid-path: es la función principal con los parámetros que pide LeetCode.
;; -----------------------------------------

(define (valid-path n edges source destination)

  ;; Construir el grafo como lista de adyacencia.
  ;; hash: crea una hash table vacía.
  ;; En este caso el hash guarda: nodo -> lista de vecinos.

  (define graph
    (build-graph edges (hash)))


  ;; -----------------------------------------
  ;; find-path: aqui se realiza el DFS.
  ;; -----------------------------------------

  (define (find-path current-node visited)

    (cond
      ;; Si llegamos al destino, sí existe camino.
      [(= current-node destination)
       (make-result #true visited)]

      ;; Si ya visitamos este nodo, no lo repetimos.
      ;; hash-has-key?: revisa si una clave existe dentro del hash.

      [(hash-has-key? visited current-node)
       (make-result #false visited)]

      [else
       ;; Agregar el nodo actual a visitados.
       ;; hash-set crea una nueva versión de visited,

       (define new-visited
         (hash-set visited current-node #true))

       ;; Obtener los vecinos del nodo actual.
       ;; Si el nodo no tiene vecinos, regresa empty.

       (define node-neighbors
         (hash-ref graph current-node empty))

       ;; Revisar si algún vecino puede llegar al destino final.

       (check-neighbors node-neighbors new-visited)]))


  ;; -----------------------------------------
  ;; check-neighbors: va a revisar recursivamente la lista de vecinos.
  ;; -----------------------------------------

  (define (check-neighbors neighbors visited)

    (cond
      ;; Si ya no hay vecinos por revisar,
      ;; no existe camino por esta ruta.

      [(empty? neighbors)
       (make-result #false visited)]

      [else
       ;; Revisar el primer vecino.

       (define first-result
         (find-path (first neighbors) visited))

       ;; Si ya encontramos camino, regresar el resultado.
       ;; Si no, revisar el resto de vecinos.

       (if (result-found? first-result)

           first-result

           (check-neighbors (rest neighbors)
                            (result-visited first-result)))]))


  ;; Iniciar búsqueda desde source.
  ;; hash va a crear un hash vacío para comenzar la lista de los nodos visitados.

  (result-found?
   (find-path source (hash))))