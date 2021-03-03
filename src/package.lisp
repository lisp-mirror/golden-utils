(in-package #:cl-user)

(uiop:define-package #:golden-utils
  (:use #:cl)
  (:mix-reexport #:alexandria)
  (:shadow
   #:make-keyword)
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
   #:while
   #:with-temp-package)
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
   #:b8a
   #:b16
   #:b16a
   #:b24
   #:b24a
   #:b32
   #:b32a
   #:b64
   #:b64a
   #:f32
   #:f32a
   #:f64
   #:f64a
   #:octet
   #:octet-vector
   #:ub8
   #:ub8a
   #:ub16
   #:ub16a
   #:ub24
   #:ub24a
   #:ub32
   #:ub32a
   #:ub64
   #:ub64a)
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
  ;; Arrays
  (:export
   #:make-b8-array
   #:make-b16-array
   #:make-b24-array
   #:make-b32-array
   #:make-f32-array
   #:make-f64-array
   #:make-ub8-array
   #:make-ub16-array
   #:make-ub24-array
   #:make-ub32-array)
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
