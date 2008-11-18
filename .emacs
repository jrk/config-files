; -*- emacs-lisp -*-
; where to put stuff for customize
(setq custom-file "~/.emacs.gnu.custom")
(defun address-book () "Opens .addressbook with goto address support"
  (interactive)
  (find-file "~/.addressbook")
  (goto-address))
(defun my-kill-buffer () "Kills the current buffer ; mostly for keymap support"
  (interactive)
  (kill-buffer nil))



(put 'eval-expression 'disabled nil)

(global-set-key [home] 'beginning-of-line)
(global-set-key [end] 'end-of-line)
(global-set-key [f6] 'other-window)
(global-set-key [f2] 'save-buffer)
(global-set-key [f3] 'find-file)
(global-set-key [f4] 'compile)
(global-set-key [f5] 'switch-to-buffer)
(global-set-key [f7] 'gud-step)
(global-set-key [f8] 'gud-next)
(global-set-key [f9] 'gud-cont)
(global-set-key [f10] 'tmm-menubar)
(global-set-key [f11] 'list-buffers)
(global-set-key [f12] 'split-window-vertically)
(global-set-key [C-f1] 'man)
(global-set-key [C-f2] 'make-frame)
(global-set-key [C-f4] 'delete-window)
(global-set-key [C-f3] 'my-kill-buffer)
(global-set-key [C-f5] 'delete-other-windows)
(global-set-key [C-f6] 'other-frame)
(global-set-key [C-end] 'end-of-buffer)
(global-set-key [C-home] 'beginning-of-buffer)

(global-set-key "\C-xf" 'set-fill-column)

(defconst my-c-style
  '((c-tab-always-indent        . t)
    (c-comment-only-line-offset . 4)
    (c-hanging-braces-alist '((defun-open   before   after)
			      (defun-close  before  after)  
			      (class-open before  after)  
			      (class-close before  after) 
			      (block-open  before after)
			      (block-close . c-snug-do-while)
			      (substatement-open  before after)
			      (statement-case-open  before after)
			      (extern-lang-open  before   after)
			      (extern-lang-close  before  after)
			      (brace-list-open)
			      (brace-list-close    after)    
			      (brace-list-intro)
			      (brace-list-entry)))

    (c-offsets-alist     . ((string . -1000)
			    (c . c-lineup-C-comments)
			    (defun-open . 0)
			    (defun-close . 0)
			    (defun-block-intro . +)
			    (class-open . 0)
			    (class-close . 0)
			    (inline-open . 0)
			    (inline-close . 0)
			    (topmost-intro . 0)
			    (topmost-intro-cont . 0)
			    (member-init-intro . +)
			    (member-init-cont . 0)
			    (inher-intro . +)
			    (inher-cont . 0)
			    (block-open . 0)
			    (block-close . 0)
			    (brace-list-open . +)
			    (brace-list-close . 0)
			    (brace-list-intro . +)
			    (brace-list-entry . 0)
			    (statement . 0)
			    (statement-cont . +)
			    (statement-block-intro . +)
			    (statement-case-intro . +)
			    (statement-case-open . +)
			    (substatement . +)
			    (substatement-open . 0)
			    (case-label . 0)
			    (access-label . -)
			    (label . -1000)
			    (do-while-closure . 0)
			    (else-clause . 0)
			    (comment-intro . 0)
			    (arglist-intro . +)
			    (arglist-cont . 0)
			    (arglist-cont-nonempty . c-lineup-arglist)
			    (arglist-close . 0)
			    (stream-op . +)
			    (inclass . +)
			    (cpp-macro . -1000)
			    (friend . 0)
			    (objc-method-intro . 0)
			    (objc-method-args-cont . 0)
			    (objc-method-call-cont . 0)))
    (c-echo-syntactic-information-p . t)
    (c-basic-offset . 4)
    )
  "My C Programming Style")

;; Customizations for all of c-mode, c++-mode, and objc-mode
(defun my-c-mode-common-hook ()
  ;; add my personal style and set it for the current buffer
  (c-add-style "user" my-c-style t)
  ;; other customizations
  (setq tab-width 8
	;; this will make sure spaces are used instead of tabs
	indent-tabs-mode nil)
  ;; we like auto-newline and hungry-delete
  (c-toggle-auto-hungry-state 1)
  ;; keybindings for all supported languages.  We can put these in
  ;; c-mode-base-map because c-mode-map, c++-mode-map, objc-mode-map,
  ;; java-mode-map, and idl-mode-map inherit from it.
  (define-key c-mode-base-map "\C-m" 'newline-and-indent)
  (define-key c-mode-base-map ";" 'self-insert-command)
  (define-key c-mode-base-map "," 'self-insert-command)
  )

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)


(put 'downcase-region 'disabled nil)

(put 'upcase-region 'disabled nil)

(auto-compression-mode)

; Fix a stupidity from emacs
(setq user-mail-address "bgoudem@axess.com")
(setq mail-default-reply-to "bgoudem@axess.com")
; add signature automagically
(setq mail-signature t)

; Fix another dumb emacs behavior (i.e., button 2 pastes at cursor, not Point
(setq mouse-yank-at-point t)

; hooks for filling in text and (la)tex mode
(toggle-text-mode-auto-fill)

; fixing unibyte support
(set-language-environment "Latin-1")
(set-terminal-coding-system 'iso-latin-1)
(setq unibyte-display-via-language-environment t)

(load "~/.emacs.gnu.custom")

; start emacsclient server
(server-start)

; enable pc-select
(pc-selection-mode)

; hide the tool bar
(tool-bar-mode -1)
