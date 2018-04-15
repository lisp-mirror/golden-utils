;;;; Association lists.
;;;; Various functions dealing with association lists.

(in-package :au)

(deftype alist () '(satisfies alist?))

(defun alist-get (alist key &rest args)
  "Get the value associated with `KEY` in `ALIST`."
  (let ((cell (apply #'assoc key alist args)))
    (values (cdr cell) cell)))

(defun alist-rget (alist value &rest args)
  "Get the key associated with `VALUE` in `ALIST`."
  (let ((cell (apply #'rassoc value alist args)))
    (values (car cell) cell)))

(defun alist-remove (alist &rest keys)
  "Remove all `KEYS` and their associated values from `ALIST`. Non-destructive."
  (remove-if
   (lambda (x)
     (find (car x) keys :test #'eq))
   alist))

(define-modify-macro alist-removef (&rest keys) alist-remove
  "Place-modifying macro for ALIST-REMOVE.")

(defun alist-keys (alist)
  "Get a list of all keys in `ALIST`."
  (mapcar #'car alist))

(defun alist-values (alist)
  "Get a list of all values in `ALIST`."
  (mapcar #'cdr alist))

(defun alist->plist (alist)
  "Convert `ALIST` to a property list. A property list in this context has keyword symbols for its odd
elements."
  (mapcan
   (lambda (x)
     (list (make-keyword (car x)) (cdr x)))
   alist))

(defun alist->hash (alist &rest args)
  "Convert `ALIST` to a hash table."
  (let ((table (apply #'make-hash-table args)))
    (dolist (cell alist)
      (setf (gethash (car cell) table) (cdr cell)))
    table))

(defun alist? (item)
  "Check whether or not `ITEM` is an association list."
  (and (listp item)
       (every #'consp item)))
