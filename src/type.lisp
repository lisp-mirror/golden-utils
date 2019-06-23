(in-package #:golden-utils)

(deftype b8 () '(signed-byte 8))

(deftype ub8 () '(unsigned-byte 8))

(deftype b16 () '(signed-byte 16))

(deftype ub16 () '(unsigned-byte 16))

(deftype b32 () '(signed-byte 32))

(deftype ub32 () '(unsigned-byte 32))

(deftype fn-> (args values)
  `(function ,args ,values))
