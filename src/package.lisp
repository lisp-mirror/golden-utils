(in-package :cl-user)

(defpackage+-1:defpackage+ #:golden-utils
  (:nicknames #:au)
  (:use #:cl)

  ;; Third-party libraries
  (:inherit-from
   #:alexandria
   #:appendf
   #:clamp
   #:compose
   #:conjoin
   #:copy-hash-table
   #:copy-sequence
   #:define-constant
   #:deletef
   #:disjoin
   #:ensure-gethash
   #:ensure-list
   #:ensure-symbol
   #:format-symbol
   #:hash-table-keys
   #:hash-table-values
   #:if-let
   #:iota
   #:length=
   #:lerp
   #:make-keyword
   #:map-combinations
   #:map-product
   #:mappend
   #:once-only
   #:parse-body
   #:removef
   #:reversef
   #:rotate
   #:shuffle
   #:switch
   #:symbolicate
   #:type=
   #:with-unique-names
   #:when-let
   #:when-let*)
  (:inherit-from
   #:serapeum
   #:assort
   #:batches
   #:class-name-of
   #:collecting
   #:defalias
   #:defplace
   #:dict
   #:dict*
   #:drop
   #:eval-always
   #:file=
   #:file-size
   #:filter
   #:filter-map
   #:flip-hash-table
   #:fmt
   #:halves
   #:href
   #:href-default
   #:merge-tables
   #:mvlet
   #:mvlet*
   #:nlet
   #:octet
   #:op
   #:partial
   #:partition
   #:path-join
   #:repeat-sequence
   #:split-sequence
   #:string-contains-p
   #:take
   #:throttle
   #:unique-name
   #:unsplice)

  ;; Macros
  (:export
   #:define-printer
   #:defun-inline
   #:defunits
   #:fn->
   #:if-found
   #:unless-found
   #:until
   #:when-found
   #:while)

  ;; Closures
  (:export
   #:define-pfun
   #:dlambda
   #:hotpatch
   #:plambda
   #:self
   #:this
   #:with-pvars)

  ;; Types
  (:export
   #:b8
   #:b16
   #:b32
   #:ub8
   #:ub16
   #:ub32)

  ;; Symbols
  (:export
   #:collect-external-symbols
   #:collect-symbols)

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
   #:flatten
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
   #:do-hash
   #:do-hash-keys
   #:do-hash-values
   #:maphash-keys
   #:maphash-values
   #:hash-keys
   #:hash-values
   #:hash->alist
   #:hash->plist)

  ;; Filesystem
  (:export
   #:file->string
   #:map-files
   #:resolve-system-path
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

  ;; Random
  (:export
   #:make-rng
   #:random-boolean
   #:random-int
   #:random-float
   #:random-element)

  ;; Misc
  (:export
   #:noop))
