(in-package #:net.mfiano.lisp.golden-utils)

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

(defun make-keyword (object)
  "Interns `OBJECT`, a string designator or number, into the keyword package."
  (values
   (alexandria:make-keyword
    (etypecase object
      ((or string symbol)
       object)
      (number
       (format nil "~a" object))))))
