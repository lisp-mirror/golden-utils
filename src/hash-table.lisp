(in-package #:golden-utils)

(defmacro do-hash ((key value table &optional result) &body body)
  "Iterates over hash table `TABLE`, binding each key to `KEY`, and its value to
`VALUE`."
  (alexandria:with-gensyms (block-name)
    (multiple-value-bind (body decls) (alexandria:parse-body body)
      `(block ,block-name
         (maphash
          (lambda (,key ,value)
            ,@decls
            ,@body)
          ,table)
         ,(when result
            `(let (,key ,value)
               ,result))))))

(defmacro do-hash-keys ((key table) &body body)
  "Iterate over hash table `TABLE`, binding each key to `KEY`."
  (alexandria:with-gensyms (value)
    `(do-hash (,key ,value ,table)
       (declare (ignore ,value))
       ,@body)))

(defmacro do-hash-values ((value table) &body body)
  "Iterate over hash table `TABLE`, binding each value to `VALUE`."
  (alexandria:with-gensyms (key)
    `(do-hash (,key ,value ,table)
       (declare (ignore ,key))
       ,@body)))

(defun hash->alist (table)
  "Convert the keys and values of the hash table `TABLE` to an association
list."
  (let (result)
    (do-hash (key value table)
      (push (cons key value) result))
    result))

(defun hash->plist (table)
  "Convert the keys and values of the hash table `TABLE` to a property list."
  (let (result)
    (do-hash (key value table)
      (setf result (list* key value result)))
    result))

(defun maphash-keys (fn table)
  "Iterate over the keys of the hash table `TABLE`, calling the function `FN` on
each."
  (do-hash (key value table)
    (declare (ignore value))
    (funcall fn key)))

(defun maphash-values (fn table)
  "Iterate over the values of the hash table `TABLE`, calling the function `FN`
on each."
  (do-hash (key value table)
    (declare (ignore key))
    (funcall fn value)))

(defun hash-keys (table)
  "Collect a list of all keys in the hash table `TABLE`."
  (let (keys)
    (maphash-keys
     (lambda (x)
       (push x keys))
     table)
    (nreverse keys)))

(defun hash-values (table)
  "Collect a list of all values in the hash table `TABLE."
  (let (values)
    (maphash-values
     (lambda (x)
       (push x values))
     table)
    (nreverse values)))
