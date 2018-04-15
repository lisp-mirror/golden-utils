(in-package :au)

(defun-inline degrees->radians (degrees)
  (* degrees (/ pi 180)))

(defun-inline radians->degrees (radians)
  (* radians (/ 180 pi)))

(defun-inline map-domain (source-min source-max dest-min dest-max value)
  "Map `VALUE` from the domain denoted by `SOURCE-MIN` and `SOURCE-MAX` to the domain denoted by
`DEST-MIN` and `DEST-MAX`."
  (alexandria:lerp (/ (- value source-min)
                      (- source-max source-min))
                   dest-min
                   dest-max))
