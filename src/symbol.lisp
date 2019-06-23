(in-package #:golden-utils)

(defun collect-symbols (&optional (package *package*))
  "Collect a list of all symbols of `PACKAGE`."
  (let (symbols)
    (do-symbols (symbol package)
      (push symbol symbols))
    (nreverse symbols)))

(defun collect-external-symbols (&optional (package *package*))
  "Collect a list of all external symbols of `PACKAGE`."
  (let (symbols)
    (do-external-symbols (symbol package)
      (push symbol symbols))
    (nreverse symbols)))
