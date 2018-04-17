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
                 #:ensure-gethash
                 #:ensure-list
                 #:ensure-symbol
                 #:format-symbol
                 #:if-let
                 #:iota
                 #:length=
                 #:lerp
                 #:make-keyword
                 #:map-combinations
                 #:map-product
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
                 #:unique-name
                 #:unsplice)
  (:inherit #:arrow-macros)

  ;; Macros
  (:export
   #:defun-inline
   #:define-printer
   #:fn->
   #:if-found
   #:unless-found
   #:when-found
   #:while)

  ;; Constants
  (:export
   #:+day-names+
   #:+day-names/short+
   #:+days/week+
   #:+hours/day+
   #:+hours/week+
   #:+minutes/day+
   #:+minutes/hour+
   #:+minutes/week+
   #:+month-names+
   #:+month-names/short+
   #:+seconds/day+
   #:+seconds/minute+
   #:+seconds/hour+
   #:+seconds/week+)

  ;; Types
  (:export
   #:b8
   #:b16
   #:b32
   #:octet
   #:octet-vector
   #:ub8
   #:ub16
   #:ub32)

  ;; Symbols
  (:export
   #:collect-external-symbols
   #:collect-symbols
   #:find-keyword)

  ;; Numbers
  (:export
   #:count-digits)

  ;; Characters
  (:export
   #:ascii-alphanumeric?
   #:ascii-char?
   #:ascii-control?
   #:ascii-letter?
   #:ascii-lowercase?
   #:ascii-number?
   #:ascii-uppercase?
   #:hex-char?)

  ;; Strings
  (:export
   #:string-ends-with?
   #:string-explode
   #:string-merge
   #:string-split
   #:string-starts-with?
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
   #:zip)

  ;; Association lists
  (:export
   #:alist
   #:alist?
   #:alist-get
   #:alist-keys
   #:alist-remove
   #:alist-removef
   #:alist-rget
   #:alist-values
   #:alist->hash
   #:alist->plist)

  ;; Property lists
  (:export
   #:plist
   #:plist?
   #:plist-get
   #:plist-keys
   #:plist-remove
   #:plist-removef
   #:plist-values
   #:plist->alist
   #:plist->hash)

  ;; Arrays
  (:export
   #:make-octet-vector)

  ;; Hash tables
  (:export
   #:do-hash
   #:do-hash-keys
   #:do-hash-values
   #:hash-keys
   #:hash-values
   #:hash->alist
   #:hash->plist)

  ;; Filesystem
  (:export
   #:file->string
   #:map-files
   #:resolve-path
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
   #:flip
   #:noop))
