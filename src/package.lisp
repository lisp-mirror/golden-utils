(in-package :cl-user)

(defpackage+-1:defpackage+ #:golden-utils
  (:nicknames #:au)
  (:use #:cl)
  (:inherit #:arrow-macros)
  (:inherit-except
   #:alexandria
   #:flatten
   #:maphash-keys
   #:maphash-values)
  (:inherit-except
   #:serapeum
   #:->
   #:plist-keys
   #:plist-values)

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

  ;; Hash tables
  (:export
   #:do-hash
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

  ;; Misc
  (:export
   #:noop))
