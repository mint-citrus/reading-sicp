(define (memq item x)
	(cond ((null? x) '())
		  ((eq? item (car x)) x)
		  (else (memq item (cdr x)))))

(write (memq 'apple '(banana)))
(newline)
(write (memq 'apple '(x (apple sause) apple pear)))
(newline)
