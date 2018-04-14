(in-package :au)

(defun split-string (string delimiter)
  "Split `STRING` into 2 values on the boundary `DELIMITER`."
  (let ((pos (position delimiter string)))
    (values (subseq string 0 pos)
            (subseq string (1+ pos)))))
