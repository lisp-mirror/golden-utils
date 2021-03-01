(in-package #:golden-utils)

(deftype octet () '(unsigned-byte 8))

(deftype f32 (&optional low high) `(single-float ,low ,high))

(deftype f32a (&optional length) `(simple-array f32 (,length)))

(deftype f64 (&optional low high) `(double-float ,low ,high))

(deftype f64a (&optional length) `(simple-array f64 (,length)))

(deftype b8 () '(signed-byte 8))

(deftype b8a (&optional length) `(simple-array b8 (,length)))

(deftype b16 () '(signed-byte 16))

(deftype b16a (&optional length) `(simple-array b16 (,length)))

(deftype b24 () '(signed-byte 24))

(deftype b24a (&optional length) `(simple-array b24 (,length)))

(deftype b32 () '(signed-byte 32))

(deftype b32a (&optional length) `(simple-array b32 (,length)))

(deftype b64 () '(signed-byte 64))

(deftype b64a (&optional length) `(simple-array b64 (,length)))

(deftype ub8 () '(unsigned-byte 8))

(deftype ub8a (&optional length) `(simple-array ub8 (,length)))

(deftype ub16 () '(unsigned-byte 16))

(deftype ub16a (&optional length) `(simple-array ub16 (,length)))

(deftype ub24 () '(unsigned-byte 24))

(deftype ub24a (&optional length) `(simple-array ub24 (,length)))

(deftype ub32 () '(unsigned-byte 32))

(deftype ub32a (&optional length) `(simple-array ub32 (,length)))

(deftype ub64 () '(unsigned-byte 64))

(deftype ub64a (&optional length) `(simple-array ub64 (,length)))

(deftype fn-> (args values)
  `(function ,args ,values))
