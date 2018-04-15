(in-package :au)

(define-constant +seconds/minute+ 60)
(define-constant +minutes/hour+ 60)
(define-constant +hours/day+ 24)
(define-constant +seconds/hour+ (* +seconds/minute+ +minutes/hour+))
(define-constant +seconds/day+ (* +seconds/hour+ +hours/day+))
(define-constant +minutes/day+ (* +minutes/hour+ +hours/day+))
