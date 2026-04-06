;; Actividad desarrollada en clases, en base a ejercicio propuesto en el libro
;; Programming Languages: Concepts and Constructs. 2nd Edition. Sathi R.

#lang racket
(require 2htdp/image)

;: ASSIGNMENT:
;; 1. Una expresion ´<E>´ se define como un rectangulo ´<a>´ o ´<b>´, ademas
;;    de la rotacion de una expresion o la union de dos expresiones.
;;       <E> ::= <a>
;;               | <b>
;;               | r-right(<E>)
;;               | stich(<E> <E>)
;; 2. ´<a>´ se define como un rectangulo con tres lineas curvas en su
;;    esquina superior derecha.
;;
;; 3. ´<b>´ se define como un rectangulo con tres lineas rectas en su
;;    esquina superior derecha.
;;
;; 4. ´r-right(<E>)´ se define como la rotacion hacia la derecha de una
;;    expresion ´<a>´ o ´<b>´.
;;
;; 5. ´stitch(<E> <E>)´ se define como la union (costura) de dos
;; expresiones ´<E>´.

;; 1. Definir ´<a>´ y ´<b>´
(define a
  (add-curve
   (add-curve
    (add-curve
     (square 50 "outline" "black")
     40 0 0 1/2 50 10 0 0 "red")
   30 0 0 1/2 50 20 0 0 "red")
   20 0 0 1/2 50 30 0 0 "red"))
    
(define b
  (add-line
   (add-line
    (add-line
     (square 50 "outline" "black")
     40 0 50 10 "red")
   30 0 50 20 "red")
   20 0 50 30 "red"))

;; 2. Definir ´<r-right>´
(define r-right
  (lambda (E) (rotate -90 E)))

;; 3. Definir ´<stich>´
(define stitch
  (lambda (E1 E2) (beside E1 E2)))

;; Ejemplo.
;; Cuadro ´<b>´ orientado hacia la izquierda superior sobre cuadro ´<a>´ orientado
;; a la derecha inferior de forma vertical.
(printf "Ejemplo 1.\n")

(r-right
 (stitch
  (r-right
   (r-right b))
  a))


;; Ampliamiento de las funcionalidades

;; Rotacion a la izquierda (esta vez definida sin lambda)
(define (r-left E)
  (r-right
   (r-right
    (r-right E))))

;; Apilar
(define (stack E1 E2)
  (r-right
   (stitch (r-left E2) (r-left E1))))