(in-package #:golden-utils)

(defun make-b8-array (size &optional (initial-element 0))
  (make-array size :element-type 'b8 :initial-element initial-element))

(defun make-b16-array (size &optional (initial-element 0))
  (make-array size :element-type 'b16 :initial-element initial-element))

(defun make-b24-array (size &optional (initial-element 0))
  (make-array size :element-type 'b24 :initial-element initial-element))

(defun make-b32-array (size &optional (initial-element 0))
  (make-array size :element-type 'b32 :initial-element initial-element))

(defun make-ub8-array (size &optional (initial-element 0))
  (make-array size :element-type 'ub8 :initial-element initial-element))

(defun make-ub16-array (size &optional (initial-element 0))
  (make-array size :element-type 'ub16 :initial-element initial-element))

(defun make-ub24-array (size &optional (initial-element 0))
  (make-array size :element-type 'ub24 :initial-element initial-element))

(defun make-ub32-array (size &optional (initial-element 0))
  (make-array size :element-type 'ub32 :initial-element initial-element))

(defun make-f32-array (size &optional (initial-element 0f0))
  (make-array size :element-type 'f32 :initial-element initial-element))

(defun make-f64-array (size &optional (initial-element 0d0))
  (make-array size :element-type 'f64 :initial-element initial-element))
