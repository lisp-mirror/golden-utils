;;;; Property lists
;;;; Various functions dealing with property lists.
;;;; Note: Property lists in the context of this library are defined as a list
;;;; of an even number of elements, where even indices hold keyword symbols.

(in-package :au)

(deftype plist () '(satisfies plist-p))

(defun plist-p (item)
  "Check whether or not `ITEM` is a property list."
  (and (listp item)
       (evenp (length item))
       (every #'keywordp
              (loop :for element :in item :by #'cddr
                    :collect element))))

(defun plist-get (plist key)
  "Get the value associated with `KEY` in `PLIST`."
  (getf plist key))

(defun plist-remove (plist &rest keys)
  "Remove all `KEYS` and their associated values from `PLIST`. Non-destructive."
  (if (plist-p plist)
      (loop :for (key value) :on plist :by #'cddr
            :unless (member key keys :test #'eq)
              :append (list key value))
      (error "~a is not a property list." plist)))

(define-modify-macro plist-removef (&rest keys) plist-remove
  "Place-modifying macro for PLIST-REMOVE.")

(defun plist-keys (plist)
  "Get a list of all keys in `PLIST`."
  (if (plist-p plist)
      (loop :for (key nil) :on plist :by #'cddr
            :collect key)
      (error "~a is not a property list." plist)))

(defun plist-values (plist)
  "Get a list of all values in `PLIST`."
  (if (plist-p plist)
      (loop :for (nil value) :on plist :by #'cddr
            :collect value)
      (error "~a is not a property list." plist)))

(defun plist->alist (plist)
  "Convert `PLIST` to an association list."
  (if (plist-p plist)
      (loop :for (key value) :on plist :by #'cddr
            :collect (cons key value))
      (error "~a is not a property list." plist)))

(defun plist->hash (plist &rest args)
  "Convert `PLIST` to a hash table."
  (if (plist-p plist)
      (let ((table (apply #'make-hash-table args)))
        (loop :for (key value) :on plist :by #'cddr
              :do (setf (href table key) value))
        table)
      (error "~a is not a property list." plist)))

(defmacro do-plist ((key value plist) &body body)
  `(loop :for (,key ,value) :on ,plist :by #'cddr
         :do (tagbody ,@body)))

(defmacro do-plist-keys ((key plist) &body body)
  (with-unique-names (value)
    `(do-plist (,key ,value ,plist)
       ,@body)))

(defmacro do-plist-values ((value plist) &body body)
  (with-unique-names (key)
    `(do-plist (,key ,value ,plist)
       ,@body)))

(defun map-plist (fn plist)
  (do-plist (key value plist)
    (funcall fn key value)))

(defun map-plist-keys (fn plist)
  (do-plist (key value plist)
    (funcall fn key)))

(defun map-plist-values (fn plist)
  (do-plist (key value plist)
    (funcall fn value)))
