(in-package :au)

(defun count-digits (integer)
  (check-type integer integer)
  (if (zerop integer)
      1
      (1+ (floor (log (abs integer) 10)))))
