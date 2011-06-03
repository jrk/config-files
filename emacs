; -*- emacs-lisp -*-
;; el-get ;;
; load el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
; install if unavailable...
(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))
;; /el-get ;;

; where to put stuff for customize
(setq custom-file "~/.emacs.gnu.custom")

(load "~/.emacs.gnu.custom")
(load "~/.emacs.mac-stuff")

; Add tuareg mode
(add-to-list 'load-path "~/.emacs.d/vendor/tuareg-mode")
(require 'tuareg)
;(tuareg-mode)

; Add textmate.el mode
;(add-to-list 'load-path "~/.emacs.d/vendor/textmate.el")
;(require 'textmate)
;(textmate-mode)
