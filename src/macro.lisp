(in-package :au)

(defmacro define-printer ((object stream &key (type t) identity) &body body)
  (alexandria:with-gensyms (object-symbol)
    `(defmethod print-object ((,object-symbol ,object) ,stream)
       (print-unreadable-object (,object-symbol ,stream :type ,type :identity ,identity)
         ,@body))))

(defmacro eval-always (&body body)
  "Evaluate `BODY` always."
  `(eval-when (:compile-toplevel :load-toplevel :execute) ,@body))
