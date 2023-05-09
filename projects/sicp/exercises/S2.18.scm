;;; return th last element of a list
;; raise error for empty list ()
;;; base case: list has one element, return it
;;; recusion: return last element of cdr

(define (last-element mylist)
  (cond
   (( = (length mylist) 0)
   (display "Null list not acceptable"))
   ((= 1 (length mylist))
   (car mylist))
   ((> (length mylist) 1)
   (last-element (cdr mylist)))))
 
;;; reversing

(define (reverse-list mylist)
  (let ((list-length (length mylist)))

  (cond
   (( = list-length 0)
   (display "Null list not acceptable"))
   ((= 1 list-length)
    mylist)
   ((> list-length 1)
   (append (reverse-list  (cdr mylist)) (list (car mylist)) )))))

