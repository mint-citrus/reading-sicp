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

(define (filter proc seq)
	(cond ((null? seq) nil)
		  ((proc (car seq))
		   (cons (car seq)
				 (filter proc (cdr seq))))
		  (else (filter proc (cdr seq)))))

(define (accumulate op init seq)
	(if (null? seq)
		init
		(op (car seq)
			(accumulate op init (cdr seq)))))

(define (fib-iter a b count)
	(if (= count 0)
		b
		(fib-iter (+ a b) a (- count 1))))

(define (fib x)
	(fib-iter 1 0 x))
	

(write (fib 3))
(newline)
