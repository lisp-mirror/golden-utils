(in-package :au)

(defmacro define-printer ((object stream &key (type t) identity) &body body)
  "Define a PRINT-OBJECT method for `OBJECT`."
  `(defmethod print-object ((,object ,object) ,stream)
     (print-unreadable-object (,object ,stream :type ,type :identity ,identity)
       ,@body)))

(defmacro defun-inline (name &body body)
  "Conveniently define the function `NAME` and also inline it."
  `(progn
     (declaim (inline ,name))
     (defun ,name ,@body)
     ',name))

(defmacro when-found ((var lookup) &body body)
  "If `LOOKUP` is successful, perform `BODY` with `VAR` bound to the result.
`LOOKUP` is an expression that returns two values, with the second value
indicating if the lookup was successful, such as with GETHASH."
  (with-unique-names (found)
    `(multiple-value-bind (,var ,found) ,lookup
       (declare (ignorable ,var))
       (when ,found
         ,@body))))

(defmacro unless-found ((var lookup) &body body)
  "If `LOOKUP` is unsuccessful, perform `BODY` with `VAR` bound to the result.
`LOOKUP` is an expression that returns two values, with the second value
indicating if the lookup was successful, such as with GETHASH."
  (with-unique-names (found)
    `(multiple-value-bind (,var ,found) ,lookup
       (declare (ignorable ,var))
       (unless ,found
         ,@body))))

(defmacro if-found ((var lookup) then else)
  "Depending if `LOOKUP` is successful or not, perform `THEN` or `ELSE` with
`VAR` bound to the result. `LOOKUP` is an expression that returns two values,
with the second value indicating if the lookup was successful, such as with
GETHASH."
  (with-unique-names (found result)
    `(multiple-value-bind (,result ,found) ,lookup
       (let ((,var ,result))
         (if ,found
             ,then
             ,else)))))

(defmacro fn-> (function args values)
  "Declaim the `FTYPE` of function from `ARGS` to `VALUES`."
  `(declaim (ftype (function ,args ,values) ,function)))

(defmacro while (predicate &body body)
  "Loop until `PREDICATE` returns NIL."
  `(loop :while ,predicate
         :do ,@body))
