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

(defun do-hash-keys (fn table)
  (do-hash (k v table)
    (declare (ignore v))
    (funcall fn k)))

(defun do-hash-values (fn table)
  (do-hash (k v table)
    (declare (ignore k))
    (funcall fn v)))

(defun hash-keys (table)
  (collecting (do-hash-keys #'collect table)))

(defun hash-values (table)
  (collecting (do-hash-values #'collect table)))
