(in-package #:golden-utils)

(defun noop (&rest args)
  "Do nothing."
  (declare (ignore args))
  (values))
