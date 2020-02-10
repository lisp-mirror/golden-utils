(in-package #:golden-utils)

(deftype octet () '(unsigned-byte 8))

(deftype b8 () '(signed-byte 8))

(deftype b16 () '(signed-byte 16))

(deftype b24 () '(signed-byte 24))

(deftype b32 () '(signed-byte 32))

(deftype b64 () '(signed-byte 64))

(deftype ub8 () '(unsigned-byte 8))

(deftype ub16 () '(unsigned-byte 16))

(deftype ub24 () '(unsigned-byte 24))

(deftype ub32 () '(unsigned-byte 32))

(deftype ub64 () '(unsigned-byte 64))

(deftype fn-> (args values)
  `(function ,args ,values))
