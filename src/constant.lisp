(in-package :au)

(define-constant +seconds/minute+ 60)

(define-constant +minutes/hour+ 60)

(define-constant +hours/day+ 24)

(define-constant +seconds/hour+ (* +seconds/minute+ +minutes/hour+))

(define-constant +seconds/day+ (* +seconds/hour+ +hours/day+))

(define-constant +minutes/day+ (* +minutes/hour+ +hours/day+))

(define-constant +days/week+ 7)

(define-constant +hours/week+ (* +hours/day+ +days/week+))

(define-constant +minutes/week+ (* +minutes/hour+ +hours/week+))

(define-constant +seconds/week+ (* +seconds/minute+ +minutes/week+))

(define-constant +day-names+
    '("Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday" "Sunday")
  :test #'equal)

(define-constant +day-names/short+ '("Mon" "Tue" "Wed" "Thu" "Fri" "Sat" "Sun")
  :test #'equal)

(define-constant +month-names+
    '("January" "February" "March" "April" "May" "June" "July" "August"
      "September" "October" "November" "December")
  :test #'equal)

(define-constant +month-names/short+
    '("Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov" "Dec")
  :test #'equal)
