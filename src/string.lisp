(in-package :au)

(defun string-merge (&rest strings)
  "Merge `STRINGS` into a single string."
  (apply #'concatenate 'string strings))

(defun string-trim-whitespace (string)
  "Trim leading and trailing whitespace characters from `STRING`."
  (let ((chars '(#\space #\tab #\linefeed #\return #\newline #\page)))
    (string-trim chars string)))

(defun string-explode (string)
  "Explode `STRING` into a list of its characters."
  (map 'list #'identity string))

(defun string-split (string &optional (delimiter #\Space))
  "Split `STRING` into a list of sub-strings on `DELIMITER`."
  (split-sequence:split-sequence delimiter string :remove-empty-subseqs t))

(defun string-starts-with-p (string prefix)
  "Check if `STRING` starts with `PREFIX`."
  (let ((prefix-length (length prefix)))
    (when (<= prefix-length (length string))
      (string= prefix (subseq string 0 prefix-length)))))

(defun string-ends-with-p (string suffix)
  "Check if `STRING` ends with `SUFFIX`."
  (let ((length (length string))
        (suffix-length (length suffix)))
    (when (<= suffix-length length)
      (string= suffix (subseq string (- length suffix-length) length)))))
