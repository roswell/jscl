(defpackage :roswell.run.jscl
  (:use :cl :roswell.util :roswell.jscl.info))
(in-package :roswell.run.jscl)

(defun jscl (script rest)
  (let* ((script (read-from-string (format nil "(~A)" script)))
         (argv0 (make-pathname :defaults (first script)))
         (name (pathname-name argv0)))
    (if (and (equal (namestring (make-pathname :defaults argv0 :name nil :type nil))
                    (roswell:opt "lispdir"))
             (equal (pathname-type argv0) "ros"))
        (cond ((equal name "dump")
               (print "dump!!"))
              ((equal name "build")
               (print "build!!")))
        (let ((node (roswell.util:which "node")))
          (unless node
            (format *error-output* "node not found")
            (ros:quit 1))
          (format *error-output* "ros Options are not supported yet~%")
          (ros:exec `(,node ,(namestring (merge-pathnames (format nil "local-projects/~A/~A/repl-node.js"
                                                                  *user* *repo*)
                                                          (homedir)))))))))
