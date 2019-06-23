(in-package #:golden-utils)

(defmacro define-printer ((object stream &key (type t) identity) &body body)
  "Define a PRINT-OBJECT method for `OBJECT`."
  `(defmethod print-object ((,object ,object) ,stream)
     (print-unreadable-object (,object ,stream :type ,type :identity ,identity)
       ,@body)))

(defmacro defun-inline (name args &body body)
  "Conveniently define the function `NAME` and also inline it."
  (multiple-value-bind (body decls doc)
      (alexandria:parse-body body :documentation t)
    `(progn
       (declaim (inline ,name))
       (defun ,name ,args
         ,@(when doc `(,doc))
         ,@decls
         ,@body))))

(defmacro when-found ((var lookup) &body body)
  "If `LOOKUP` is successful, perform `BODY` with `VAR` bound to the result.
`LOOKUP` is an expression that returns two values, with the second value
indicating if the lookup was successful, such as with GETHASH."
  (alexandria:with-gensyms (found)
    `(multiple-value-bind (,var ,found) ,lookup
       (declare (ignorable ,var))
       (when ,found
         ,@body))))

(defmacro unless-found ((var lookup) &body body)
  "If `LOOKUP` is unsuccessful, perform `BODY` with `VAR` bound to the result.
`LOOKUP` is an expression that returns two values, with the second value
indicating if the lookup was successful, such as with GETHASH."
  (alexandria:with-gensyms (found)
    `(multiple-value-bind (,var ,found) ,lookup
       (declare (ignorable ,var))
       (unless ,found
         ,@body))))

(defmacro if-found ((var lookup) then else)
  "Depending if `LOOKUP` is successful or not, perform `THEN` or `ELSE` with
`VAR` bound to the result. `LOOKUP` is an expression that returns two values,
with the second value indicating if the lookup was successful, such as with
GETHASH."
  (alexandria:with-gensyms (found result)
    `(multiple-value-bind (,result ,found) ,lookup
       (let ((,var ,result))
         (if ,found ,then ,else)))))

(defmacro fn-> (function args values)
  "Declaim the `FTYPE` of function from `ARGS` to `VALUES`."
  `(declaim (ftype (function ,args ,values) ,function)))

(defmacro while (predicate &body body)
  "Loop while `PREDICATE` is satisfied."
  `(loop :while ,predicate
         :do ,@body))

(defmacro until (predicate &body body)
  "Loop until `PREDICATE` is satisfied."
  `(loop :until ,predicate
         :do ,@body))
