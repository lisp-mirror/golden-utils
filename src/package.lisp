(in-package #:cl-user)

(defpackage #:golden-utils
  (:use #:cl)

  ;; Macros
  (:export
   #:define-printer
   #:defun-inline
   #:eval-always
   #:fn->
   #:if-found
   #:mvlet
   #:mvlet*
   #:unless-found
   #:until
   #:when-found
   #:while)

  ;; Closures
  (:export
   #:define-pfun
   #:dlambda
   #:plambda
   #:self
   #:this
   #:with-pvars)

  ;; Types
  (:export
   #:b8
   #:b16
   #:b24
   #:b32
   #:b64
   #:octet
   #:ub8
   #:ub16
   #:ub24
   #:ub32
   #:ub64)

  ;; Symbols
  (:export
   #:collect-external-symbols
   #:collect-symbols
   #:make-keyword)

  ;; Numbers
  (:export
   #:count-digits)

  ;; Characters
  (:export
   #:ascii-alphanumeric-p
   #:ascii-char-p
   #:ascii-control-p
   #:ascii-letter-p
   #:ascii-lowercase-p
   #:ascii-number-p
   #:ascii-uppercase-p
   #:hex-char-p
   #:null-char-p)

  ;; Strings
  (:export
   #:string->keyword
   #:string-ends-with-p
   #:string-explode
   #:string-merge
   #:string-starts-with-p
   #:string-trim-whitespace)

  ;; Sequences
  (:export
   #:do-seq
   #:enumerate
   #:flatten-tree
   #:flatten-numbers)

  ;; Lists
  (:export
   #:combinations/repetition
   #:interleave
   #:tree-leaves
   #:zip)

  ;; Association lists
  (:export
   #:alist
   #:alist-p
   #:alist-get
   #:alist-keys
   #:alist-remove
   #:alist-removef
   #:alist-rget
   #:alist-values
   #:alist->hash
   #:alist->plist
   #:do-alist
   #:do-alist-keys
   #:do-alist-values
   #:map-alist
   #:map-alist-keys
   #:map-alist-values)

  ;; Property lists
  (:export
   #:do-plist
   #:do-plist-keys
   #:do-plist-values
   #:map-plist
   #:map-plist-keys
   #:map-plist-values
   #:plist
   #:plist-p
   #:plist-get
   #:plist-keys
   #:plist-remove
   #:plist-removef
   #:plist-values
   #:plist->alist
   #:plist->hash)

  ;; Hash tables
  (:export
   #:dict
   #:do-hash
   #:do-hash-keys
   #:do-hash-values
   #:href
   #:hash-keys
   #:hash-merge
   #:hash-values
   #:hash->alist
   #:hash->plist)

  ;; Filesystem
  (:export
   #:file->string
   #:map-files
   #:safe-read-file-form
   #:safe-read-file-forms
   #:string->file
   #:with-binary-input
   #:with-binary-output
   #:with-file-input
   #:with-file-output)

  ;; Math
  (:export
   #:average
   #:degrees->radians
   #:map-domain
   #:radians->degrees)

  ;; Misc
  (:export
   #:noop))
