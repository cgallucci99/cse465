; NO OUTPUT SHOULD BE PRODUCED IN THIS FILE

; Returns the roots of the quadratic formula, given
; ax^2+bx+c=0. Return only real roots. The list will
; have 0, 1, or 2 roots. The list of roots should be
; sorted in ascending order.
; a is guaranteed to be non-zero.
; Use the quadratic formula to solve this.
; (quadratic 1.0 0.0 0.0) --> (0.0)
; (quadratic 1.0 3.0 -4.0) --> (-4.0 1.0)
(define (quadratic a b c)
	(define det (- (* b b) (* 4 a c)))
	(cond 
		((< det 0) '())
		((= det 0) (list (/ (+ (- 0 b) det) (* 2 a))))
		(else (list (/ (- (- 0 b) (sqrt det)) (* 2 a)) (/ (+ (- 0 b) (sqrt det)) (* 2 a))))
	)
)


; Determines if the volume of one cube is larger than the second.
; (isLargerCube 1 3 4 2 2 2) --> #t
; (isLargerCube 2 2 2 1 3 4) --> #f
(define (isLargerCube length1 width1 depth1 length2 width2 depth2)
	(define Vol1 (* length1 width1 depth1))
	(define Vol2 (* length2 width2 depth2))
	(if (> Vol1 Vol2) #t #f)
)
; 
; Ensures that a numeric value stays within a specified range. Values
; that are are within [lowest, highest] are kept. Values that are less
; than the lowest value are clamped to the lowest value. Values that
; exceed the highest value are clamped back to the highest possible.
; value.
; (clamp 0.5 0.0 1.0) --> 0.5
; (clamp -0.5 0.0 1.0) --> 0.0
; (clamp 1.5 0.0 1.0) --> 1.0
(define (clamp value lowest highest)
	(cond
		((< value lowest) lowest)
		((> value highest) highest)
		(else value)
	)
)

; Determines if a year is considered a leap year. A leap year is evenly
; divisible by 4, but not 100 (unless it is divisible by 400).
; (isLeapYear 2020) --> #t
; (isLeapYear 2021) --> #f
; (isLeapYear 2100) --> #f
; (isLeapYear 2200) --> #f
; (isLeapYear 2300) --> #f
; (isLeapYear 2400) --> #t
(define (isLeapYear year)
	(if (OR (AND (= 0 (modulo year 4)) (< 0 (modulo year 100))) (= 0 (modulo year 400))) #t #f)
)

; Accepts a simple list of numbers and returns the list containing only
; the positive numbers, in the order in which they originally appeared.
; (positives '(1 2 9 -2 0 -3 4)) --> (1 2 9 4)
; (positives '()) --> ()
(define (positives lst)
	(cond
		((NULL? lst) '())
		((> (CAR lst) 0) (cons (CAR lst) (positives (CDR lst))))
		((<= (CAR lst) 0) (positives (CDR lst)))
	)
)	

; Accepts a flat list of numbers and returns the numbers that
; fall in the range [low, high]. The values will appear in the
; same order that they were in the original list.
; (numsInRange '(1 2 3 4 8 10 -9 8 5) 3 8) --> (3 4 8 8 5)
(define (numsInRange lst low high)
	(cond
		((NULL? lst) '())
		((AND (>= (CAR lst) low) (<= (CAR lst) high)) (cons (CAR lst) (numsInRange (CDR lst) low high)))
		(else (numsInRange (CDR lst) low high))
	)
)

; The parameters are two lists. The result should contain the "zip"
; between the two lists. That is, all elements of the first list are paired
; with the corresponding element in the second lists. The result is a
; list of pairs. Assume the two lists are the same length.
; (zip '(1 2 3) '(a b c)) --> ((1 a) (2 b) (3 c))
(define (zip lst1 lst2)
	(cond
		((= (length lst1) 1) (list (list (CAR lst1) (CAR lst2))))
		(else (cons (list (CAR lst1) (CAR lst2)) (zip (CDR lst1) (CDR lst2))))
	)
)

(define (transpose2 mat mat2)
	(cond 
		((= (length (CAR mat)) 0) mat2)
		((= (length (CAR mat)) 1) (transpose2 (list (CDAR mat) (CDADR mat) (CDADDR mat)) (append mat2 (list (list (CAAR mat) (CAADR mat) (CAADDR mat)) ) ) ))
		((= (length (CAR mat)) 2) (transpose2 (list (CDAR mat) (CDADR mat) (CDADDR mat)) (list mat2 (list (CAAR mat) (CAADR mat) (CAADDR mat)))))
		(else (transpose2 (list (CDAR mat) (CDADR mat) (CDADDR mat)) (list (CAAR mat) (CAADR mat) (CAADDR mat)) ))
	)
)

; Returns the transposition of a 3x3 matrix, where the matrix
; 1 2 3
; 4 5 6
; 7 8 9
; is represented as: ((1 2 3)(4 5 6)(7 8 9))
;(transpose '((1 2 3)(4 5 6)(7 8 9))) --> ((1 4 7)(2 5 8)(3 6 9))
(define (transpose mat)
	;(cons (list (CAAR mat) (CADR mat) (CADDR mat)) (list (CADAR mat) (CADADR mat) CAR((CDADDR mat))))
	; TODO <----------------------------------------------------------------------------------------------------------------------
	;(cond 
	;	((= (length (CAR mat)) 1)  (list (CAAR mat) (CAADR mat) (CAADDR mat)))
	;	((= (length (CAR mat)) 2)  (append (list (CAAR mat) (CAADR mat) (CAADDR mat)) (transpose (list (CDAR mat) (CDADR mat) (CDADDR mat)))))
	;	(else (list (list (CAAR mat) (CAADR mat) (CAADDR mat)) (transpose (list (CDAR mat) (CDADR mat) (CDADDR mat)))))
	;)
	(transpose2 mat '())
)

(define (flatten2 lst lst2)
	(cond
		((NULL? lst) lst2)
		((NOT (LIST? (CAR lst))) (flatten2 (CDR lst) (append lst2 (cons (CAR lst) '()))))
		(else (flatten2 (CDR lst) (append lst2 (flatten2 (CAR lst) '()))))
	)
)

; Returns the list of atoms that appear anywhere in the list,
; including sublists.
; (flatten '(1 2 3)) --> (1 2 3)
; (flatten '(a (b c) ((d e) f))) --> (a b c d e f)
(define (flatten lst)
	(flatten2 lst '())
)

(define (fwtrHelper n s)
	(if (= n 0)
		s
		(fwtrHelper (- n 1) (+ n s))
	)
)

; Rewrite this functions using tail recursion. Your function must
; be equivalent to this original one, which does not use tail
; recursion.
; (funcWithTailRecursion 10) --> 55
(define (funcWithTailRecursion n)
	;(if (= n 0)
	;	0
	;	(+ n (funcWithTailRecursion (- n 1)))
	;)
	(fwtrHelper n 0)
)

; Determines if the BST contains the given value. Use an efficient
; algorithm.
;                       4
;(BSTContainsValue '(() 4 ()) 4)  --> #t
;(BSTContainsValue '(() 4 ()) 10) --> #f
;(BSTContainsValue '((() 4 ()) 6 (((() 8 ()) 9 (() 10 ())) 12 ())) 10) --> #t
;(BSTContainsValue '((() 4 ()) 6 (((() 8 ()) 9 (() 10 ())) 12 ())) 100) --> #f
;(BSTContainsValue '((() 4 ()) 6 (((() 8 ()) 9 (() 10 ())) 12 ())) 6) --> #t
(define (BSTContainsValue bst value)
	(cond
		((NULL? bst) #f)
		((EQUAL? (CADR bst) value) #t)
		; if greater, search right subtree, if less search left subtree
		((> value (CADR bst)) (BSTContainsValue (CADDR bst) value))
		((< value (CADR bst)) (BSTContainsValue (CAR bst) value))
	)
)

; Determines the height of a tree. You may assume the input is a
; legal binary tree.
;(treeHeight '(() 4 ())) --> 1
;(treeHeight '((() 4 ()) 6 (((() 8 ()) 9 (() 10 ())) 12 ()))) --> 4
(define (treeHeight tree)
	0
	; DONT NEED TO DO
)

; Returns the new BST that results from adding the new value to the
; tree. You may assume the input is a legal binary tree and the value
; does not appear already in the BST.
;(addToBST '(() 8 ()) 10)) --> (() 8 (() 10 ())) 
;(addToBST '(() 8 ()) 6)) --> ((() 6 ()) 8 ()) 
;(addToBST '(() 8 (() 10())) 9)) --> (() 8 ((() 9 ()) 10 ()))
(define (addToBST bst value)
	bst
	; DONT NEED TO DO
)

; Determines if the binary tree is a BST. You may assume the
; input is a legal binary tree.
;(isBST '(() 8 ())) --> #t
;(isBST '((() 4 ()) 8 (() 10 ()))) --> #t
;(isBST '((() 4 ()) 8 (() 0 ()))) --> #f
;(isBST '(() 8 (() 10())))) --> #t
;(isBST '((() 4 ()) 6 (((() 8 ()) 9 (() 10 ())) 12 ()))) --> #t
;(isBST '((() 4 ()) 6 (((() 8 ()) 9 (() 10 ())) 120 ()))) --> #t
;(isBST '((() 4 ()) 6 (((() 8 ()) 9 (() 7 ())) 120 ()))) --> #f
(define (isBST tree)
	#f
	; DONT NEED TO DO
)

; Returns the value that results from:
; item1 OP item2 OP .... itemN, evaluated left to right:
; ((item1 OP item2) OP item3) OP ...
; You may assume the list is a flat list that has at least
; one element.
; OP - the operation to be performed
; (accumulate '(1 2 3 4) (lambda (x y) (+ x y))) --> 10
; (accumulate '(1 2 3 4) (lambda (x y) (* x y))) --> 24
; (accumulate '(1) (lambda (x y) (+ x y))) --> 1
(define (accumulate lst OP)
	(cond 
		((= 1 (length lst)) (CAR lst))
		(else (OP (CAR lst) (accumulate (CDR lst) OP)))
	)
)

(define (conditionalApplyAll2 lst pred func lst2)
	(cond
		((NULL? lst) lst2)
		((= 1 (length lst)) (if (pred (CAR lst)) (append lst2 (cons (func (CAR lst)) '())) (append lst2 (cons (CAR lst) '()))))
		((pred (CAR lst)) (conditionalApplyAll2 (CDR lst) pred func (append lst2 (cons (func (CAR lst)) '()))))
		(else (conditionalApplyAll2 (CDR lst) pred func (append lst2 (cons (CAR lst) '()))))
	)
)


; Similar to apply to all but only the values that satisfy the
; predicate are transformed.
; (conditionalApplyAll '(1 2 3 4 5 6) EVEN? sqr) --> (1 4 3 16 5 36)
(define (conditionalApplyAll lst pred func)
	;(DISPLAY (CAR lst))
	;(DISPLAY (CDR lst))
	;(NEWLINE)
	;(cond
	;	;((NOT (LIST? lst)) lst)
	;	((= 1 (length lst)) (if (pred (CAR lst)) (func (CAR lst)) (CAR lst)))
	;	((pred (CAR lst)) (cons (func (CAR lst)) (conditionalApplyAll (CDR lst) pred func)))
	;	(else (cons (CAR lst) (conditionalApplyAll (CDR lst) pred func)))
	;)
	(conditionalApplyAll2 lst pred func '())
)

; Returns a function of one parameter (i.e., x) that is equivalent to
; the equation of a line. The function is to be compiled and determined
; by two points (x1, y1) and (x2, y2). It should work like:
;(define L1 (eqOfLine 0.0 0.0 3.0 4.0))
;(L1 0.0) --> 0.0
;(L1 3.0) --> 4.0
;(L1 9.0) --> 12.0
(define (eqOfLine x1 y1 x2 y2)
	(eval '(lambda (x) x) (interaction-environment))
	; DONT NEED TO DO
)
