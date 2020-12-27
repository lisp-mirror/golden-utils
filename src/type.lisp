(in-package #:golden-utils)

(deftype octet () '(unsigned-byte 8))

(deftype f32 () 'single-float)

(deftype f64 () 'double-float)

(deftype b8 () '(signed-byte 8))

(deftype b8-array (size) `(simple-array (signed-byte 8) (,size)))

(deftype b16 () '(signed-byte 16))

(deftype b16-array (size) `(simple-array (signed-byte 16) (,size)))

(deftype b24 () '(signed-byte 24))

(deftype b24-array (size) `(simple-array (signed-byte 24) (,size)))

(deftype b32 () '(signed-byte 32))

(deftype b32-array (size) `(simple-array (signed-byte 32) (,size)))

(deftype b64 () '(signed-byte 64))

(deftype b64-array (size) `(simple-array (signed-byte 64) (,size)))

(deftype ub8 () '(unsigned-byte 8))

(deftype ub8-array (size) `(simple-array (unsigned-byte 8) (,size)))

(deftype ub16 () '(unsigned-byte 16))

(deftype ub16-array (size) `(simple-array (unsigned-byte 16) (,size)))

(deftype ub24 () '(unsigned-byte 24))

(deftype ub24-array (size) `(simple-array (unsigned-byte 24) (,size)))

(deftype ub32 () '(unsigned-byte 32))

(deftype ub32-array (size) `(simple-array (unsigned-byte 32) (,size)))

(deftype ub64 () '(unsigned-byte 64))

(deftype ub64-array (size) `(simple-array (unsigned-byte 64) (,size)))

(deftype fn-> (args values)
  `(function ,args ,values))
