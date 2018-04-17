(in-package :au)

(defun count-digits (integer)
  (check-type integer integer)
  (if (zerop integer)
      1
      (values (ceiling (log (1+ (abs integer)) 10)))))
