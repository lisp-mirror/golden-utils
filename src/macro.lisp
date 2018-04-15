(in-package :au)

(defmacro define-printer ((object stream &key (type t) identity) &body body)
  (alexandria:with-gensyms (object-symbol)
    `(defmethod print-object ((,object-symbol ,object) ,stream)
       (print-unreadable-object (,object-symbol ,stream :type ,type :identity ,identity)
         ,@body))))

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

(defmacro fn-> (function args values)
  `(declaim (ftype (function ,args ,values) ,function)))

(set-macro-character #\λ (lambda (s c) (declare (ignore s c)) 'lambda))
