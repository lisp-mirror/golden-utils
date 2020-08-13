(in-package #:net.mfiano.lisp.golden-utils)

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

(defmacro mvlet* ((&rest bindings) &body body)
  (destructuring-bind (&optional car . cdr) bindings
    (typecase car
      (null
       `(locally ,@body))
      (list
       (case (length car)
         (0 (error "Missing variable in binding list."))
         ((1 2) `(let (,car) (mvlet* ,cdr ,@body)))
         (t `(multiple-value-bind ,(butlast car) ,(car (last car))
               (declare (ignorable ,@(butlast car)))
               (mvlet* ,cdr ,@body)))))
      (symbol
       `(let (,car)
          (declare (ignorable ,car))
          (mvlet* ,cdr ,@body))))))

(defmacro mvlet ((&rest bindings) &body body)
  (labels ((process-list-binding (table binding)
             (loop :for symbol :in (butlast binding)
                   :collect (setf (href table symbol)
                                  (gensym (symbol-name symbol)))
                     :into new-symbols
                   :finally (return (append new-symbols (last binding)))))
           (process-symbol-binding (table binding)
             (setf (href table binding) (gensym (symbol-name binding))))
           (transform-bindings (bindings)
             (loop :with table = (dict)
                   :for binding :in bindings
                   :collect (typecase binding
                              (list (process-list-binding table binding))
                              (symbol (process-symbol-binding table binding)))
                     :into new-bindings
                   :finally (return (values new-bindings table)))))
    (multiple-value-bind (bindings mapping) (transform-bindings bindings)
      (let (new-bindings)
        `(mvlet* (,@bindings)
           (let (,@(progn
                     (maphash
                      (lambda (k v)
                        (push (list k v) new-bindings))
                      mapping)
                     (nreverse new-bindings)))
             (declare (ignorable ,@(hash-keys mapping)))
             ,@body))))))

(defmacro eval-always (&body body)
  `(eval-when (:compile-toplevel :load-toplevel :execute)
     ,@body))
