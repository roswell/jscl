(in-package :cl-user)

(defpackage roswell.install.jscl-asd
  (:use :cl :asdf))
(in-package :roswell.install.jscl-asd)

(defsystem roswell.install.jscl
  :version "0.0"
  :author "SANO Masatoshi"
  :license "MIT"
  :depends-on ()
  :components ((:file "install"))
  :description "install jscl")
