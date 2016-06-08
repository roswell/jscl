(defpackage :jscl.3673977832
  (:use :cl :ros.install :ros.util))
(in-package :jscl.3673977832)

(defun run (system version program restart script verbose)
  (unless (zerop verbose)
    (format *error-output* "~S~%"
            (list :system system :version version
                  :program program :restart restart
                  :script script :verbose verbose)))
  (let* ((script (read-from-string (format nil "(~A)" script)))
         (argv0 (make-pathname :defaults (first script)))
         (name (pathname-name argv0)))
    (if (and (equal (namestring (make-pathname :defaults argv0 :name nil :type nil)) 
                    (ros.util:version "lispdir"))
             (equal (pathname-type argv0) "ros"))
        (cond ((equal name "dump")
               (print "dump!!"))
              ((equal name "build")
               (print "build!!")))
        (let ((node (ros.util:which "node")))
          (unless node
            (format *error-output* "node not found")
            (ros:quit 1))
          (format *error-output* "ros Options are not supported yet~%")
          (ros:exec `(,node ,(namestring (merge-pathnames "local-projects/davazp/jscl/repl-node.js" (homedir)))))))))

(setf ros:*main* #'run)
