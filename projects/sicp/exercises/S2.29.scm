;;; Problem 2.29 in SICP
;;; Today's lesson: always carefully specify functions' inputs. outputs
;;; Errors in this exercise arose from not testing the branch and weight functions
;;; In particular, should define the "mobile" data structure


;;;; Might not be bad to start with the production rules a la EOPL and then write the functions
#lang racket
(require sicp)

(define (make-mobile left right) 
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cdr branch))

(define (single-element? lst)
  (null? (cdr lst)))

(define (total-weight mobile)
  (letrec
   (( tree-weight
      (lambda (tree)
	(begin
	  (displayln tree)
	( + (branch-weight (left-branch tree))
	  (branch-weight (right-branch tree))))))
	
    ( branch-weight
      (lambda (branch)
	(begin
	  (displayln branch)
	(let ((construct (cdr branch)))
	  (begin
	    (displayln construct)
	  (cond
	   ((single-element? construct) (car construct))
					
	   (tree-weight construct))))))
	
     )
    )
   (tree-weight mobile)))


(define x (make-mobile
	   (make-branch 1 5)
	   (make-branch 3 2)))

(total-weight x)


