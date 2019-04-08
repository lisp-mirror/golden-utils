(in-package :au)

(defun %defunits-chaining (u units prev)
  (when (member u prev)
    (error "~{ ~a~^ depends on~}" (cons u prev)))
  (let ((spec (find u units :key #'car)))
    (if spec
        (let ((chain (cadr spec)))
          (if (listp chain)
              (* (car chain)
                 (%defunits-chaining
                  (cadr chain)
                  units
                  (cons u prev)))
              chain))
        (error "Unknown unit: ~a" u))))

(defmacro defunits (quantity base-unit &body units)
  `(defmacro ,(symbolicate 'unit-of- quantity) (value unit)
     `(* ,value
         ,(case unit
            ((,base-unit) 1)
            ,@(mapcar
               (lambda (x)
                 `((,(car x))
                   ,(%defunits-chaining
                     (car x)
                     (cons
                      `(,base-unit 1)
                      (batches units 2))
                     nil)))
               (batches units 2))))))
