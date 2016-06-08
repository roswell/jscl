(progn
  (ros:include "util")
  (ros:include "util-install"))

(defpackage :jscl.3673977832
  (:use :cl :ros.install :ros.util))
(in-package :jscl.3673977832)

(defun jscl-get (argv)
  (format *error-output* "install from github~%")
  (clone-github "davazp" "jscl" :path "local-projects")
  (cons t argv))

(defun jscl-install (argv)
  (let ((*standard-output* (make-broadcast-stream))
        (*default-pathname-defaults* (merge-pathnames "local-projects/davazp/jscl/" (homedir))))
    (load (merge-pathnames "jscl.lisp" *default-pathname-defaults*))
    (format *error-output* "jscl load done.~%")
    (funcall (read-from-string "jscl:bootstrap")))
  (cons t argv))

(push `("jscl" . ,(list 'jscl-get
                        'jscl-install))
      ros.install::*install-cmds*)
