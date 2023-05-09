(require sicp)

(define (square x) ( * x x))


(define (sqlst1 items)
  (if (null? items)
      nil
      (cons (square (car items)) (sqlst1 (cdr items)))))

(define (sqlst2 items) (map square items))


(define (show x)
  (and (newline) (display x)))

;;; for-each invokes function on each member of list
(define (for-each procedure items)
  (if (null? items) #t
  (and (procedure (car items))
       (for-each procedure (cdr items)))))
		 
;;;;;;;;;;;;;;;;;;; deep-reverse

(define (deep-reverse tree)
  (cond ((null? tree) nil)
	((not (pair? tree)) tree)
	((null? (cdr tree)) (deep-reverse (car tree)))
      (else (list (deep-reverse (cdr tree))
	    (deep-reverse (car tree))))))

;;;;;;;;;;;; Fringe


(define (fringe lst)
  (cond ((null? lst) '())
        ((pair? lst)
         (append (fringe (car lst)) (fringe (cdr lst))))
        (else (list lst))))



(display (fringe '(1 (2 3) (5 (6 7)))))
