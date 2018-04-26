(in-package :au)

(defun noop (&rest args)
  "Do nothing."
  (declare (ignore args))
  (values))
