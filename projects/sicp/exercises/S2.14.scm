

 (import (srfi 216))


(define (make-interval a b) (cons a b))

(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))


(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x 
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))


 ;;Ex.2.14


(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1))) 
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))


;;; Experiment with intervals where width is a small percentage of center

(define A1 (make-interval 0.5 1.5)) 
(define A2 (make-interval 0.75 1.25)) 
(define A3 (make-interval 0.9 1.1)) 
(define A4 (make-interval 0.99 1.01))

(div-interval A1 A1) ;;; (0.333333333333333 . 3.0)
(div-interval A2 A2) ;;; (0.6 . 1.66666666666667)
(div-interval A3 A3) ;;;  (0.818181818181818 . 1.22222222222222)
(div-interval A4 A4) ;;; (0.98019801980198 . 1.02020202020202)
(par1 A1 A1)  ;;;(0.0833333333333333 . 2.25)
(par2 A1 A1)  ;;; (0.25 . 0.75)


(par1 A2 A2)  ;;; (0.225 . 1.04166666666667)
(par2 A2 A2)  ;;; (0.375 . 0.6255)


(par1 A3 A3)  ;;; (0.368181818181818 . 0.672222222222222)
(par2 A3 A3)  ;;; (0.45 . 0.55)

(par1 A4 A4) ;;;(0.48519801980198 . 0.51520202020202)
(par2 A4 A4) ;;;(0.495 . 0.505)


