(in-package :au)

(defun make-keyword (name)
  (etypecase name
    ((or symbol string number)
     (alexandria:format-symbol :keyword "~:@(~a~)" name))))
