(in-package #:net.mfiano.lisp.golden-utils)

(defun make-ub8-array (size)
  (make-array size :element-type 'ub8 :initial-element #x00))
