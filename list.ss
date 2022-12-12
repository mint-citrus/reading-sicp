(define nil '())

(define (map proc items)
	(if (null? items)
	  	nil
		(cons (proc (car items))
			  (map proc (cdr items)))))

(define (scale-list items factor)
	(map (lambda (x) (* x factor))
		 items))

(define (count-leaves x)
	(cond ((null? x) 0)
		  ((not (pair? x)) 1)
		  (else (+ (count-leaves (car x))
				   (count-leaves (cdr x))))))

(define (tree-map proc tree)
  	(write tree)
	(newline)
	(cond ((null? tree) nil)
		  ((not (pair? tree)) (proc tree))
		  (else (cons (tree-map proc (car tree))
					  (tree-map proc (cdr tree))))))

(define (square x)
	(* x x))

(define (square-tree tree)
	(tree-map square tree))

(write (square-tree (cons (list 1 2) (list 3 4))))
(newline)
