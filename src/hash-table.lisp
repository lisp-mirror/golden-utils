(in-package :au)

(defmacro do-hash ((key value table &optional result) &body body)
  "Iterates over hash table `TABLE`, binding each key to `KEY`, and its value to `VALUE`."
  (multiple-value-bind (body decls) (alexandria:parse-body body)
    `(block nil
       (maphash
        (lambda (,key ,value)
          ,@decls
          (tagbody ,@body))
        ,table)
       ,(when result
          `(let ((,key ,value))
             ,result)))))

(defmacro do-hash-keys ((key table) &body body)
  "Iterate over hash table `TABLE`, binding each key to `KEY`."
  `(do-hash (,key v ,table)
     (declare (ignore v))
     ,@body))

(defmacro do-hash-values ((value table) &body body)
  "Iterate over hash table `TABLE`, binding each value to `VALUE`."
  `(do-hash (k ,value ,table)
     (declare (ignore k))
     ,@body))

(defun hash->alist (table)
  "Convert the keys and values of the hash table `TABLE` to an association list."
  (let ((result))
    (do-hash (k v table)
      (push (cons k v) result))
    result))

(defun hash->plist (table)
  "Convert the keys and values of the hash table `TABLE` to a property list which has keys being
keyword symbols."
  (let ((result))
    (do-hash (k v table)
      (setf result (list* (make-keyword k) v result)))
    result))

(defun maphash-keys (fn table)
  "Iterate over the keys of the hash table `TABLE`, calling the function `FN` on each."
  (do-hash (k v table)
    (declare (ignore v))
    (funcall fn k)))

(defun maphash-values (fn table)
  "Iterate over the values of the hash table `TABLE`, calling the function `FN` on each."
  (do-hash (k v table)
    (declare (ignore k))
    (funcall fn v)))

(defun hash-keys (table)
  "Collect a list of all keys in the hash table `TABLE`."
  (collecting (maphash-keys #'collect table)))

(defun hash-values (table)
  "Collect a list of all values in the hash table `TABLE."
  (collecting (maphash-values #'collect table)))
