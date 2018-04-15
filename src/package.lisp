(in-package :cl-user)

(defpackage+-1:defpackage+ #:golden-utils
  (:nicknames #:au)
  (:use #:cl)

  ;; Third-party utilities
  (:inherit-from #:alexandria
                 #:appendf
                 #:clamp
                 #:compose
                 #:conjoin
                 #:copy-sequence
                 #:define-constant
                 #:deletef
                 #:disjoin
                 #:ensure-list
                 #:ensure-symbol
                 #:format-symbol
                 #:if-let
                 #:iota
                 #:length=
                 #:lerp
                 #:map-combinations
                 #:once-only
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
  (:inherit-from #:serapeum
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
                 #:op
                 #:partial
                 #:partition
                 #:path-join
                 #:repeat-sequence
                 #:take
                 #:throttle
                 #:unsplice)
  (:inherit #:arrow-macros)

  ;; Macros
  (:export
   #:define-printer
   #:defun-inline
   #:when-found
   #:if-found
   #:fn->)

  ;; Constants
  (:export
   #:+seconds/minute+
   #:+minutes/hour+
   #:+hours/day+
   #:+seconds/hour+
   #:+seconds/day+
   #:+minutes/day+)

  ;; Types
  (:export
   #:octet
   #:octet-vector
   #:b8
   #:ub8
   #:b16
   #:ub16
   #:b32
   #:ub32)

  ;; Symbols
  (:export
   #:make-keyword
   #:find-keyword)

  ;; Sequences
  (:export
   #:flatten
   #:flatten-numbers
   #:enumerate
   #:do-seq)

  ;; Lists
  (:export
   #:interleave
   #:combinations/repetition)

  ;; Association lists
  (:export
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

  ;; Property lists
  (:export
   #:plist
   #:plist-get
   #:plist-remove
   #:plist-removef
   #:plist-keys
   #:plist-values
   #:plist->alist
   #:plist->hash
   #:plist?)

  ;; Hash tables
  (:export
   #:do-hash
   #:hash->alist
   #:hash->plist
   #:do-hash-keys
   #:do-hash-values
   #:hash-keys
   #:hash-values)

  ;; Filesystem
  (:export
   #:with-binary-input
   #:with-binary-output
   #:resolve-path
   #:map-files
   #:safe-read-file-form
   #:safe-read-file)

  ;; Math
  (:export
   #:degrees->radians
   #:radians->degrees
   #:map-domain))
