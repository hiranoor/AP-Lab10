(define zero (lambda (f) (lambda (x) x)))
(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))
(define three (lambda (f) (lambda (x) (f (f (f x))))))
(define four (lambda (f) (lambda (x) (f(f (f (f x)))))))

(define evalnum (lambda (e) ((e (lambda (x) (+ x 1))) 0)))

(define pred 
(lambda (n) (((n (lambda (g) (lambda (k) (((g one) (lambda (u) (plus (g k) one))) k)))) (lambda (v) zero)) zero)))

;addition
(define addition (lambda (m n)
             	(lambda (f) 
             		(lambda (x)
             			((m f) ((n f) x))))))
             		

             		
;multiplication            		
(define mult 
	(lambda (m n) 
		(lambda (f) 
			(m (n f)))))


;subtraction λmn.n predecessor m
(define sub
	(lambda (m n) n pred m))

;AND λM N. λa b. N a (M a b) 
(define AND
	 (lambda (m n) 
	 	(lambda (a b) (n (m a b) b))))
	 
;OR 
(define OR (lambda (m n) (lambda (a b) (n a(m a b) ))))

;NOT	
(define NOT(lambda (m) (lambda (a b) (m b a ))))

;LEQ
(define LEQ(lambda (m n) (IsZero ( subtraction m n) )))

;GEQ
(define GEQ(lambda (m n) (IsZero ( subtraction n m) )))
	 
	


	
(evalnum (addition four two ))