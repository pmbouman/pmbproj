;;; how to read tree data structuee and transfirm into output form


;;base case (interior-node 'foo):  (foo)
;;; look at two "children": if one begins with "leaf", append its value at the 'foo level
;; If either one not, generate the subtree and append it

(define tree1 '(foo))

;;;'''   (display (car tree))
;;
;;))

(define display-tree (lambda (tree)
    (let (base '())
      (cond
         ((equals? (quote (car tree)) "leaf") (cdr tree))))))        



