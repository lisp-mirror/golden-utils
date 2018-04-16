(in-package :au)

(defun noop (&rest args)
  "Do nothing."
  (declare (ignore args))
  (values))

(defun flip (function)
  "Return a function with the order of the arguments of the binary function `FUNCTION` reversed."
  (lambda (x y)
    (funcall function y x)))
