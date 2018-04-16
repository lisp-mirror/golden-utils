(in-package :au)

(defun ascii-char? (char)
  (and (characterp char)
       (<= 0 (char-code char) 127)))

(defun ascii-lowercase? (char)
  (char<= #\a char #\z))

(defun ascii-uppercase? (char)
  (char<= #\A char #\Z))

(defun ascii-letter? (char)
  (or (ascii-lowercase? char)
      (ascii-uppercase? char)))

(defun ascii-number? (char)
  (char<= #\0 char #\9))

(defun ascii-alphanumeric? (char)
  (or (ascii-letter? char)
      (ascii-number? char)))

(defun ascii-control? (char)
  (let ((code (char-code char)))
    (or (<= 0 code 31)
        (= code 127))))

(defun hex-char? (char)
  (or (ascii-number? char)
      (char<= #\A char #\F)))
