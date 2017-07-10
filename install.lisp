(progn
  (roswell:include "util")
  (roswell:include "util-install"))

(defpackage :roswell.install.jscl
  (:use :cl :roswell.install :roswell.util))
(in-package :roswell.install.jscl)

(defun jscl-get (argv)
  (clone-github "davazp" "jscl" :path "local-projects")
  (cons t argv))

(defun jscl-install (argv)
  (let ((*standard-output* (make-broadcast-stream))
        (*default-pathname-defaults* (merge-pathnames "local-projects/davazp/jscl/" (homedir))))
    (load (merge-pathnames "jscl.lisp" *default-pathname-defaults*))
    (format *error-output* "jscl load done.~%")
    (funcall (read-from-string "jscl:bootstrap")))
  (cons t argv))

(defun jscl (type)
  (case type
    (:help '(jscl-help)) ;; not yet
    (:install (list 'jscl-get
                    'jscl-install))
    (:list 'jscl-get-version))) ;; not yet
