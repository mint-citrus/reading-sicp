(define balance 100)

(define (withdraw amount)
  	(if (>= balance amount)
	  	(begin (set! balance (- balance amount))
			   balance)
		"Insufficient funds"))

(define (new-withdraw amount)
  	(let ((balance 100))
	  (if (>= balance amount)
			(begin (set! balance (- balance amount))
				   balance)
			"Insufficient funds")))
