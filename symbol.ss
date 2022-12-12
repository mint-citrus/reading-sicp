(define (memq item x)
	(cond ((null? x) '())
		  ((eq? item (car x)) x)
		  (else (memq item (cdr x)))))

(define (variable? x)
	(symbol? x))

(define (same-variable? v1 v2)
	(and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (make-sum a1 a2) 
	(list '+ a1 a2))

(define (make-product a1 a2)
	(list '* a1 a2))

(define (sum? x)
	(and (pair? x) (eq? (car x) '+)))

(define (addend s)
	; 二つ目の項
	(cadr s))

(define (augend s)
	(caddr s))

(define (product? x)
	(and (pair? x) (eq? (car x) '*)))

(define (multiplier p)
	(cadr p))

(define (multiplicand p)
	(caddr p))

(define (deriv e v)
	(cond ((number? e) 0)
		  ((variable? e)
		   (if (same-variable? e v) 1 0))
		  ((sum? e) (make-sum (deriv (addend e) v)
							  (deriv (augend e) v)))
		  ((product? e)
		   (make-sum
			 (make-product (multiplier e)
						   (deriv (multiplicand e) v))
			 (make-product (deriv (multiplier e) v)
						   (multiplicand e))))
		  (else
			(error "unknown type"))))

(write (deriv '(+ x 3) 'x))
(newline)
