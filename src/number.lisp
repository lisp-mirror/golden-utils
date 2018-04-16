(in-package :au)

(defun count-digits (integer)
  (if (zerop integer)
      1
      (values (ceiling (log (abs integer) 10)))))
