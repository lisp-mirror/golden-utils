(in-package :cl-user)

(defpackage+-1:defpackage+ #:golden-utils
    (:nicknames #:au)
  (:use #:cl)

;;; Third-party utilities

  ;; cl-arrows
  (:inherit #:cl-arrows)
  ;; alexandria
  (:import-except #:alexandria
                  #:make-keyword
                  #:flatten
                  #:remove-from-plistf
                  #:plist-hash-table
                  #:alist-hash-table
                  #:hash-table-alist
                  #:hash-table-plist)

;;; Macros

  (:export-only
   #:define-printer
   #:eval-always
   #:defun-inline
   #:when-found
   #:if-found)

;;; Types

  (:export-only
   #:octet
   #:b8
   #:ub8
   #:b16
   #:ub16
   #:b32
   #:ub32)

;;; Sequences

  (:export-only
   #:flatten
   #:flatten-numbers
   #:enumerate
   #:doseq)

;;; Lists

  (:export-only
   #:interleave
   #:combinations/repetition)

;;; Association lists

  (:export-only
   #:alist
   #:alist-get
   #:alist-rget
   #:alist-remove
   #:alist-removef
   #:alist-keys
   #:alist-values
   #:alist->plist
   #:alist->hash
   #:alist?)

;;; Property lists

  (:export-only
   #:plist
   #:plist-get
   #:plist-remove
   #:plist-removef
   #:plist-keys
   #:plist-values
   #:plist->alist
   #:plist->hash
   #:plist?)

;;; Strings

  (:export-only
   #:split-string)

;;; Hash tables

  (:export-only
   #:do-hash
   #:hash->alist
   #:hash->plist)

  ;; Filesystem

  (:export-only
   #:with-binary-input
   #:with-binary-output
   #:resolve-path
   #:map-files
   #:safe-read-file-form
   #:safe-read-file)

  ;; Math
  (:export-only
   #:degrees->radians
   #:radians->degrees
   #:map-domain))
