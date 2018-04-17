(in-package :au)

(defun make-octet-vector (length)
  "Create an octet vector of length `LENGTH`."
  (make-array length :element-type 'octet))
