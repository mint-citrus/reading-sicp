(define (make-rat n d)
	(cons n d))

(define (number x)
	(car x))

(define (denom x)
	(cdr x))

(define (print-rat x)
	(display (number x))
	(display "/")
	(display (denom x))
	(newline))

(define (add-rat x y)
	(make-rat (+ (* (number x) (denom y))
				 (* (number y) (denom x)))
			  (* (denom x) (denom y))))

(define (sub-rat x y)
	(make-rat (- (* (number x) (denom y)) 
				 (* (number y) (denom x)))
			  (* (denom x) (denom y))))

(define (mul-rat x y)
	(make-rat (* (number x) (number y))
			  (* (denom x) (denom y))))

(define (div-rat x y)
	(make-rat (* (number x) (denom y))
			  (* (number y) (denom x))))

(define onehalf (make-rat 1 2))
(define onethird (make-rat 1 3))

(print-rat (mul-rat onehalf onehalf))
(print-rat (add-rat onethird onethird))
