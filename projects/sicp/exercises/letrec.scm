(define (countdown n)
  (letrec 
      ((g
	(lambda (n)
	  (if (= n 0)
	      '()
	      (begin
		(displayln (list "calling f at" (- n 1)))
 		(f ( - n 1))))))

       (f
	(lambda (n)
	  (if (= n 0)
	      '()
	      (begin
		(displayln (list "calling g at" (- n 1)))
 		(g ( - n 1)))))))

  (f n)))
