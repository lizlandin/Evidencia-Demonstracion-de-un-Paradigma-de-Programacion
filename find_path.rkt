#lang racket

;; -----------------------------------------
;; PROBLEMA DE PRGRAMACION: FIND IF PATH EXISTS 
;; Paradigma funcional en Racket
;; -----------------------------------------

;; -----------------------------------------
;; neighbors: 
;; Esta funcion va a regresar a todos los vecinos de un nodo.
;; -----------------------------------------

(define (neighbors current-node edges)
  (cond
    [(empty? edges) empty]

    [else
     (define current-edge (first edges))
     (define node-a (first current-edge))
     (define node-b (first (rest current-edge)))

     (cond
       [(= current-node node-a)
        (cons node-b
              (neighbors current-node (rest edges)))]

       [(= current-node node-b)
        (cons node-a
              (neighbors current-node (rest edges)))]

       [else
        (neighbors current-node (rest edges))])]))

;; -----------------------------------------
;; visited?: 
;; Va a revisar si un nodo ya fue visitado.
;; -----------------------------------------

(define (visited? node visited-nodes)
  (cond
    [(empty? visited-nodes) #false]

    [(= node (first visited-nodes)) #true]

    [else
     (visited? node (rest visited-nodes))]))

;; -----------------------------------------
;; check-neighbors
;; Aqui se revisa recursivamente si alguno de los vecinos puede llegar al destino.
;; -----------------------------------------

(define (check-neighbors neighbors-list edges destination visited-nodes)

  (cond
    [(empty? neighbors-list) #false]

    [else
     (or (find-path (first neighbors-list) destination edges visited-nodes)

         (check-neighbors (rest neighbors-list)edges destination visited-nodes))]))

;; -----------------------------------------
;; find-path
;; Es la funcion que va a realizar el DFS recursivo principal que nos va a decir si hay un camino de source a destination.
;; -----------------------------------------

(define (find-path current-node destination edges visited-nodes)

  (cond
    ;; Si llegamos al destino
    [(= current-node destination) #true]

    ;; Si ya visitamos el nodo
    [(visited? current-node visited-nodes) #false]

    ;; Si no se busca en vecinos
    [else

     ;; Agregar el nodo actual a visitados
     (define new-visited
       (cons current-node visited-nodes))

     ;; Obtenemos a los vecinos
     (define neighbors-list
       (neighbors current-node edges))

     ;; Se explora si los vecinos pueden llegar al destino final 
     (check-neighbors neighbors-list edges destination new-visited)]))

;; -----------------------------------------
;; valid-path
;; Es la función principal con los parametros que pide el input de leetcode que va a llamar a "find-path" para iniciar la búsqueda desde source hasta destination.
;; empty es una lista vacia que representa que todavia no se visita ningun nodo
;; -----------------------------------------

(define (valid-path n edges source destination)

  (find-path source destination edges empty))

;; -----------------------------------------
;; PRUEBA 
;; -----------------------------------------

(define test-1
  '((0 1) (1 2) (2 0)))

;; displayln es como print 
(displayln (valid-path 3 test-1 0 2))
;; Resultado esperado:
;; #t

