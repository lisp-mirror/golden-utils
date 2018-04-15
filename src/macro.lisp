(in-package :au)

(defmacro define-printer ((object stream &key (type t) identity) &body body)
  (alexandria:with-gensyms (object-symbol)
    `(defmethod print-object ((,object-symbol ,object) ,stream)
       (print-unreadable-object (,object-symbol ,stream :type ,type :identity ,identity)
         ,@body))))

(defmacro eval-always (&body body)
  "Evaluate `BODY` always."
  `(eval-when (:compile-toplevel :load-toplevel :execute) ,@body))

(defmacro defun-inline (name &body body)
  `(progn
     (declaim (inline ,name))
     (defun ,name ,@body)
     ',name))

(defmacro when-found ((var lookup) &body body)
  (with-gensyms (found)
    `(multiple-value-bind (,var ,found) ,lookup
       (when ,found
         ,@body))))

(defmacro if-found ((var lookup) then else)
  (with-gensyms (found result)
    `(multiple-value-bind (,result ,found) ,lookup
       (if ,found
           (let ((,var ,result))
             ,then)
           ,else))))
