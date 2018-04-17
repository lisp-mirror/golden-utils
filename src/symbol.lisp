(in-package :au)

(defun find-keyword (name)
  "Find the keyword symbol denoted by `NAME`."
  (if (keywordp name)
      name
      (find-symbol (string name) :keyword)))

(defun collect-symbols (&optional (package *package*))
  "Collect a list of all symbols of `PACKAGE`."
  (collecting
    (do-symbols (symbol package)
      (collect symbol))))

(defun collect-external-symbols (&optional (package *package*))
  "Collect a list of all external symbols of `PACKAGE`."
  (collecting
    (do-external-symbols (symbol package)
      (collect symbol))))