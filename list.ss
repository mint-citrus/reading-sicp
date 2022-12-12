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

(write (count-leaves (cons (list 1 2 3) (list 4 5))))
(newline)
