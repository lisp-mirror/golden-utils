(in-package :golden-utils)

(defun make-seed ()
  (values
   (parse-integer
    (au:shuffle
     (format nil "~d~d"
             (get-universal-time)
             (get-internal-real-time))))))

(defun make-rng (&optional (seed (make-seed)))
  (pcg:make-pcg :seed seed))

(defun random-boolean (generator &optional (probability 0.5))
  (declare (type single-float probability))
  (< (pcg:pcg-random-float% generator) probability))

(defun random-int (generator &key (min 0) (max 1) parity-p)
  (declare (type (unsigned-byte 32) min max)
           (type boolean parity-p))
  (if parity-p
      (+ min (* 2 (pcg:pcg-random-bounded% generator (1+ (floor (- max min) 2)))))
      (+ min (pcg:pcg-random-bounded% generator (1+ (- max min))))))

(defun random-float (generator &key (min 0.0) (max 1.0))
  (declare (type single-float min max))
  (+ min (* (- max min) (pcg:pcg-random-float% generator))))

(defun random-element (generator sequence)
  (declare (type sequence sequence))
  (let ((len (length sequence)))
    (when (plusp len)
      (elt sequence (pcg:pcg-random-bounded% generator len)))))
