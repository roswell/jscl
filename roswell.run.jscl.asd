(defsystem roswell.run.jscl
  :version "0.0"
  :author "SANO Masatoshi"
  :license "MIT"
  :depends-on ()
  :components ((:file "run" :depends-on ("info"))
               (:file "info"))
  :description "run jscl")
