(define double-any
  (lambda (f x)
    (f x x)))

(define length1
  (lambda (ls)
    (if (null? ls)
        0
        (+ 1 (length (cdr ls))))))

(define list-copy
  (lambda (ls)
    (if (null? ls)
        '()
        (cons (car ls)
              (list-copy
               (cdr ls))))))

(define memv
  (lambda (x ls)
    (cond ((null? ls) #f)
          ((eqv? x (car ls)) ls)
          (else (memv x (cdr ls))))))

(define remv
  (lambda (x ls)
    (cond ((null? ls) '())
          ((eqv? x (car ls)) (remv x (cdr ls)))
          (else (cons (car ls) (remv x (cdr ls)))))))

;; 2.8.3
;; (make-list 7 '())
(define make-list
  (lambda (n x)
    (cond ((= n 0) '())
          (else (cons x (make-list (- n 1) x))))))

;; 2.8.4
;; (list-ref '(a short (nested) list) 2)
;; (list-ref '(1 2 3 4) 0)
(define list-ref
  (lambda (ls n)
    (cond
     ((null? ls) '())
     ((= n 0) (car ls))
     (else (list-ref (cdr ls) (- n 1)))
     )))

;; (list-tail '(a short (nested) list) 2)
(define list-tail
  (lambda (ls n)
    (cond
     ((null? ls) '())
     ((= n 0) (cdr ls))
     (else (list-tail (cdr ls) (- n 1))))))

;; 2.8.6
;; (even1? 3)
;; (odd1? 3)
(define even1?
  (lambda (x)
    (or )))

(define odd1?
  (lambda (x)
    ((even1? (- x 1)))))
