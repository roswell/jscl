(defsystem roswell.install.jscl
  :version "0.0"
  :author "SANO Masatoshi"
  :license "MIT"
  :depends-on ()
  :components ((:file "install" :depends-on ("info"))
               (:file "info"))
  :description "install jscl")
