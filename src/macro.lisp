(in-package :au)

(set-macro-character #\λ (lambda (s c) (declare (ignore s c)) 'lambda))

(defmacro define-printer ((object stream &key (type t) identity) &body body)
  "Define a PRINT-OBJECT method for `OBJECT`."
  (with-unique-names (object-symbol)
    `(defmethod print-object ((,object-symbol ,object) ,stream)
       (print-unreadable-object (,object-symbol ,stream :type ,type :identity ,identity)
         ,@body))))

(defmacro defun-inline (name &body body)
  "Conveniently define the function `NAME` and also inline it."
  `(progn
     (declaim (inline ,name))
     (defun ,name ,@body)
     ',name))

(defmacro when-found ((var lookup) &body body)
  "If `LOOKUP` is successful, perform `BODY` with `VAR` bound to the result.
`LOOKUP` is an expression that returns two values, with the second value indicating if the lookup
was successful, such as with GETHASH."
  (with-unique-names (found)
    `(multiple-value-bind (,var ,found) ,lookup
       (when ,found
         ,@body))))

(defmacro if-found ((var lookup) then else)
  "Depending if `LOOKUP` is successful or not, perform `THEN` or `ELSE` with `VAR` bound to the
result. `LOOKUP` is an expression that returns two values, with the second value indicating if the
lookup was successful, such as with GETHASH."
  (with-unique-names (found result)
    `(multiple-value-bind (,result ,found) ,lookup
       (if ,found
           (let ((,var ,result))
             ,then)
           ,else))))

(defmacro fn-> (function args values)
  "Declaim the `FTYPE` of function from `ARGS` to `VALUES`."
  `(declaim (ftype (function ,args ,values) ,function)))

(defmacro while (predicate &body body)
  "Loop until `PREDICATE` returns NIL."
  `(loop :while ,predicate
         :do ,@body))