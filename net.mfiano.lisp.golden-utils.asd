(asdf:defsystem #:net.mfiano.lisp.golden-utils
  :description "A utility library."
  :author ("Michael Fiano <mail@mfiano.net>")
  :license "MIT"
  :homepage "https://mfiano.net/projects/golden-utils"
  :bug-tracker "https://github.com/mfiano/golden-utils/issues"
  :source-control (:git "https://github.com/mfiano/golden-utils")
  :encoding :utf-8
  :depends-on (#:alexandria
               #:uiop)
  :pathname "src"
  :serial t
  :components
  ((:file "package")
   (:file "macro")
   (:file "closure")
   (:file "type")
   (:file "symbol")
   (:file "number")
   (:file "character")
   (:file "array")
   (:file "string")
   (:file "sequence")
   (:file "list")
   (:file "list-alist")
   (:file "list-plist")
   (:file "hash-table")
   (:file "filesystem")
   (:file "math")
   (:file "misc")))
