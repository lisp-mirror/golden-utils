(in-package :au)

(defun make-keyword (name)
  (etypecase name
    ((or symbol string number)
     (alexandria:format-symbol :keyword "~:@(~a~)" name))))

(defun find-keyword (name)
  (if (keywordp name)
      name
      (find-symbol (string name) :keyword)))

(defun collect-symbols (&optional (package *package*))
  (collecting
    (do-symbols (symbol package)
      (collect symbol))))

(defun collect-external-symbols (&optional (package *package*))
  (collecting
    (do-external-symbols (symbol package)
      (collect symbol))))
