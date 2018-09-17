(in-package :au)

(defmacro do-hash ((key value table &optional result) &body body)
  "Iterates over hash table `TABLE`, binding each key to `KEY`, and its value to `VALUE`."
  (with-unique-names (block-name)
    (multiple-value-bind (body decls) (alexandria:parse-body body)
      `(block ,block-name
         (maphash
          (lambda (,key ,value)
            ,@decls
            (tagbody ,@body))
          ,table)
         ,(when result
            `(let (,key ,value)
               ,result))))))

(defmacro do-hash-keys ((key table) &body body)
  "Iterate over hash table `TABLE`, binding each key to `KEY`."
  (with-unique-names (value)
    `(do-hash (,key ,value ,table)
       (declare (ignore ,value))
       ,@body)))

(defmacro do-hash-values ((value table) &body body)
  "Iterate over hash table `TABLE`, binding each value to `VALUE`."
  (with-unique-names (key)
    `(do-hash (,key ,value ,table)
       (declare (ignore ,key))
       ,@body)))

(defun hash->alist (table)
  "Convert the keys and values of the hash table `TABLE` to an association list."
  (let (result)
    (do-hash (key value table)
      (push (cons key value) result))
    result))

(defun hash->plist (table)
  "Convert the keys and values of the hash table `TABLE` to a property list which has keys being
keyword symbols."
  (let (result)
    (do-hash (key value table)
      (setf result (list* (make-keyword key) value result)))
    result))

(defun maphash-keys (fn table)
  "Iterate over the keys of the hash table `TABLE`, calling the function `FN` on each."
  (do-hash (key value table)
    (declare (ignore value))
    (funcall fn key)))

(defun maphash-values (fn table)
  "Iterate over the values of the hash table `TABLE`, calling the function `FN` on each."
  (do-hash (key value table)
    (declare (ignore key))
    (funcall fn value)))

(defun hash-keys (table)
  "Collect a list of all keys in the hash table `TABLE`."
  (collecting (maphash-keys #'collect table)))

(defun hash-values (table)
  "Collect a list of all values in the hash table `TABLE."
  (collecting (maphash-values #'collect table)))
