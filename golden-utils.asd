(asdf:defsystem #:golden-utils
  :description "Auxiliary utilities (AU)."
  :author ("Michael Fiano <mail@michaelfiano.com>")
  :maintainer "Michael Fiano <mail@michaelfiano.com>"
  :license "MIT"
  :homepage "https://github.com/mfiano/golden-utils"
  :bug-tracker "https://github.com/mfiano/golden-utils/issues"
  :source-control (:git "https://github.com/mfiano/golden-utils.git")
  :version "0.1.0"
  :encoding :utf-8
  :long-description #.(uiop:read-file-string (uiop/pathname:subpathname *load-pathname* "README.md"))
  :depends-on (#:alexandria
               #:serapeum
               #:arrow-macros
               #:split-sequence
               #:cl-pcg
               #:defpackage-plus)
  :pathname "src"
  :serial t
  :components
  ((:file "package")
   (:file "macro")
   (:file "type")
   (:file "symbol")
   (:file "number")
   (:file "character")
   (:file "string")
   (:file "sequence")
   (:file "list")
   (:file "list-alist")
   (:file "list-plist")
   (:file "hash-table")
   (:file "filesystem")
   (:file "math")
   (:file "random")
   (:file "units")
   (:file "misc")))
