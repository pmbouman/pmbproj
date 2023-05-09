
		       

(define (parity x)
  (remainder x 2))


(define (filtered-parity x)
  (if
   ((= 0 (length x)) '())
   let ((p (parit (car x
   ((= 0 (remainder (car x) 2))
      (cons (car x) (filtered-parity (cdr x))))

   (#t (filtered-parity (cdr x)))))
