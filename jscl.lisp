(let* ((* (make-pathname :defaults
                         (or #.*compile-file-pathname* *load-pathname*)
                         :type nil
                         :name nil))
       (* (merge-pathnames "../../davazp/jscl/" *))
       (* (probe-file *)))
  (unless *
    (roswell:roswell '("install jscl") :interactive nil)))
