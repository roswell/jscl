(in-package :cl-user)

(defpackage roswell.run.jscl-asd
  (:use :cl :asdf))
(in-package :roswell.run.jscl-asd)

(defsystem roswell.run.jscl
  :version "0.0"
  :author "SANO Masatoshi"
  :license "MIT"
  :depends-on ()
  :components ((:file "run"))
  :description "run jscl")
