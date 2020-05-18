(in-package #:net.mfiano.lisp.golden-utils)

(defun noop (&rest args)
  "Do nothing."
  (declare (ignore args))
  (values))
