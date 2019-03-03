(in-package :au)

(defmacro with-file-input ((stream path) &body body)
  "Open the file at location `PATH` as input and perform `BODY`."
  `(with-open-file (,stream ,path :direction :input
                                  :if-does-not-exist :error)
     ,@body))

(defmacro with-file-output ((stream path &optional append-p) &body body)
  "Open the file at location `PATH`, as output and perform `BODY`.
If the file already exists, it is overwritten.
If the file does not exist, it is created."
  `(with-open-file (,stream ,path :direction :output
                                  :if-exists ,(if append-p :append :supersede)
                                  :if-does-not-exist :create)
     ,@body))

(defmacro with-binary-input ((stream file) &body body)
  "Open the file at location `PATH` as binary input and perform `BODY`."
  `(with-open-file (,stream ,file :direction :input
                                  :if-does-not-exist :error
                                  :element-type 'octet)
     ,@body))

(defmacro with-binary-output ((stream file &optional append-p) &body body)
  "Open the file at location `PATH`, as binary output and perform `BODY`.
If the file already exists, it is overwritten.
If the file does not exist, it is created."
  `(with-open-file (,stream ,file :direction :output
                                  :if-exists ,(if append-p :append :supersede)
                                  :if-does-not-exist :create
                                  :element-type 'octet)
     ,@body))

(defun resolve-system-path (system &optional path)
  "Resolve the absolute path of the filesystem where `PATH` is located, relative to the ASDF system,
`SYSTEM`, or relative to the program location in the case of running a dumped Lisp image from the
command line.
Note: A dumped image must have either been created with UIOP:DUMP-IMAGE, or have manually set
UIOP/IMAGE:*IMAGE-DUMPED-P* prior to dumping."
  (if uiop/image:*image-dumped-p*
      (truename (uiop/pathname:merge-pathnames*
                 path
                 (uiop:pathname-directory-pathname (uiop:argv0))))
      (asdf/system:system-relative-pathname (asdf:find-system system) path)))

(defun map-files (path function &key (test (constantly t)) (recursive-p t))
  "Map over all files located in the directory of `PATH`, applying `FUNCTION` to each file's path.
`TEST` is a function that takes a file path and decides if `FUNCTION` should be applied to it.
`RECURSIVE-P`, when non-NIL will descend into sub-directories of `PATH` recursively."
  (labels ((process-files (dir)
             (map nil
                  (lambda (x)
                    (when (funcall test x)
                      (funcall function x)))
                  (uiop/filesystem:directory-files dir))))
    (uiop/filesystem:collect-sub*directories
     (uiop/pathname:ensure-directory-pathname path) t recursive-p #'process-files)))

(defun safe-read-file-form (path &key (package :cl))
  "Read the first form of the file located at `PATH`, with *PACKAGE* bound to `PACKAGE`."
  (with-standard-io-syntax
    (let ((*package* (find-package package))
          (*read-eval* nil))
      (with-open-file (in path)
        (read in)))))

(defun safe-read-file-forms (path &key (package :cl))
  "Read all forms of the file located at `PATH`, with *PACKAGE* bound to `PACKAGE`."
  (with-standard-io-syntax
    (let ((*package* (find-package package))
          (*read-eval* nil))
      (with-open-file (in path)
        (loop :for form = (read in nil in)
              :until (eq form in)
              :collect form)))))

(defun file->string (path)
  "Read the file located at `PATH` into a string."
  (with-file-input (in path)
    (let ((string (make-string (file-length in))))
      (read-sequence string in)
      string)))

(defun string->file (string path)
  "Write `STRING` to the file located at `PATH`."
  (with-file-output (out path)
    (format out string)))
