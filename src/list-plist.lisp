;;;; Property lists
;;;; Various functions dealing with property lists.
;;;; Note: Property lists in the context of this library are defined as a list of an even number of
;;;; elements, where even indices hold keyword symbols.

(in-package :au)

(deftype plist () '(satisfies plist?))

(defun plist-get (plist key)
  "Get the value associated with `KEY` in `PLIST`."
  (getf plist key))

(defun plist-remove (plist &rest keys)
  "Remove all `KEYS` and their associated values from `PLIST`. Non-destructive."
  (loop :for (key value) :on plist :by #'cddr
        :unless (member key keys :test #'eq)
          :append (list key value)))

(define-modify-macro plist-removef (&rest keys) plist-remove
  "Place-modifying macro for PLIST-REMOVE.")

(defun plist-keys (plist)
  "Get a list of all keys in `PLIST`."
  (loop :for (key value) :on plist :by #'cddr
        :collect key))

(defun plist-values (plist)
  "Get a list of all values in `PLIST`."
  (loop :for (key value) :on plist :by #'cddr
        :collect value))

(defun plist->alist (plist)
  "Convert `PLIST` to an association list."
  (loop :for (key value) :on plist :by #'cddr
        :collect (cons key value)))

(defun plist->hash (plist &rest args)
  "Convert `PLIST` to a hash table."
  (let ((table (apply #'make-hash-table args)))
    (loop :for (key value) :on plist :by #'cddr
          :do (setf (gethash key table) value))
    table))

(defun plist? (item)
  "Check whether or not `ITEM` is a property list."
  (and (listp item)
       (evenp (length item))
       (every
        #'keywordp
        (loop :for element :in item :by #'cddr
              :collect element))))
