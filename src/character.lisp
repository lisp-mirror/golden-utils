(in-package :au)

(defun ascii-char? (char)
  "Check if the character `CHAR` is an ASCII character."
  (and (characterp char)
       (<= 0 (char-code char) 127)))

(defun ascii-lowercase? (char)
  "Check if the character `CHAR` is a lowercase ASCII character."
  (char<= #\a char #\z))

(defun ascii-uppercase? (char)
  "Check if the character `CHAR` is an uppercase ASCII character."
  (char<= #\A char #\Z))

(defun ascii-letter? (char)
  "Check if the character `CHAR` is an ASCII letter character."
  (or (ascii-lowercase? char)
      (ascii-uppercase? char)))

(defun ascii-number? (char)
  "Check if the character `CHAR` is an ASCII number character."
  (char<= #\0 char #\9))

(defun ascii-alphanumeric? (char)
  "Check if the character `CHAR` is an ASCII alpha-numeric character."
  (or (ascii-letter? char)
      (ascii-number? char)))

(defun ascii-control? (char)
  "Check if the character `CHAR` is an ASCII control character."
  (let ((code (char-code char)))
    (or (<= 0 code 31)
        (= code 127))))

(defun hex-char? (char)
  "Check if the character `CHAR` is a hexadecimal character."
  (or (ascii-number? char)
      (char<= #\A char #\F)))
