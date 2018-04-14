(in-package :au)

(defun flatten (sequence)
  (let ((list))
    (labels ((traverse (sub-tree)
               (when sub-tree
                 (typecase sub-tree
                   (cons
                    (traverse (car sub-tree))
                    (traverse (cdr sub-tree)))
                   (vector
                    (map nil #'traverse sub-tree))
                   (t (push sub-tree list))))))
      (traverse sequence))
    (nreverse list)))

(defun flatten-numbers (sequence &key (type 'single-float))
  (flet ((%coerce (sequence)
           (mapcar (lambda (x) (coerce x type))
                   (remove-if (complement #'realp) (flatten sequence)))))
    (let ((sequence (%coerce sequence)))
      (make-array (length sequence) :element-type type :initial-contents sequence))))
