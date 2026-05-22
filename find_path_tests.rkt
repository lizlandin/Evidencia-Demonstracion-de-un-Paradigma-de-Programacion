#lang racket
(require "find_path.rkt")


;; Este archivo es unicamente de pruebas las cuales estan divididas en 5 que debrian ser TRUE y 5 FALSE
;; El primer #t que sale en el output es la prueba del codigo original del ejemplo de leetcode  


;; -----------------------------------------
;; PRUEBAS TRUE
;; -----------------------------------------

;; TEST 1
;; Existe camino?: 0 -> 1
(define test-1
  '((0 1)))

(displayln (valid-path 2 test-1 0 1))
;; Esperado: #true


;; TEST 2
;; Existe camino?: 0 -> 1 -> 2 -> 3
(define test-2
  '((0 1)
    (1 2)
    (2 3)))

(displayln (valid-path 4 test-2 0 3))
;; Esperado: #true


;; TEST 3
;; Existe camino?: 0 -> 1 -> 2
(define test-3
  '((0 1)
    (1 2)))

(displayln (valid-path 3 test-3 0 2))
;; Esperado: #true


;; TEST 4
;; Existe camino?: 3 -> 2 -> 1 -> 0
(define test-4
  '((0 1)
    (1 2)
    (2 3)))

(displayln (valid-path 4 test-4 3 0))
;; Esperado: #true


;; TEST 5
;; Existe camino?: 0 -> 2 -> 4
(define test-5
  '((0 2)
    (2 4)))

(displayln (valid-path 5 test-5 0 4))
;; Esperado: #true



;; -----------------------------------------
;; PRUEBAS FALSE
;; -----------------------------------------

;; TEST 6
;; Existe camino?: 0 -> 3
(define test-6
  '((0 1)
    (1 2)))

(displayln (valid-path 4 test-6 0 3))
;; Esperado: #false


;; TEST 7
;; Existe camino?: 1 -> 4
(define test-7
  '((0 1)
    (2 3)
    (3 4)))

(displayln (valid-path 5 test-7 1 4))
;; Esperado: #false


;; TEST 8
;; Existe camino?: 0 -> 5
(define test-8
  '((0 1)
    (1 2)
    (3 4)
    (4 5)))

(displayln (valid-path 6 test-8 0 5))
;; Esperado: #false


;; TEST 9
;; Existe camino?: 2 -> 5
(define test-9
  '((0 1)
    (1 2)
    (3 4)
    (4 5)))

(displayln (valid-path 6 test-9 2 5))
;; Esperado: #false


;; TEST 10
;; Existe camino?: 0 -> 4
(define test-10
  '((0 1)
    (1 2)
    (2 3)))

(displayln (valid-path 5 test-10 0 4))
;; Esperado: #false