;;; early-init.el --- Early Initialization -*- lexical-binding: t; -*-

;;; Provide an easy way to toggle debug mode which will set certain variables
;;; to produce more informative output. It can be set either by providing the
;;; environment variable DEBUG or start Emacs with --debug-init.
(when (getenv "DEBUG") (setq init-file-debug t))
(setq debug-on-error (and (not noninteractive) init-file-debug))

;;; Time the startup and display the startup time after completed.
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Loaded Emacs in %.03fs"
                     (float-time (time-subtract after-init-time before-init-time)))))

;;; Temporarily reduce garbage collection to gain some performance boost during startup.
(let ((normal-gc-cons-threshold gc-cons-threshold)
      (normal-gc-cons-percentage gc-cons-percentage)
      (normal-file-name-handler-alist file-name-handler-alist)
      (init-gc-cons-threshold most-positive-fixnum)
      (init-gc-cons-percentage 0.6))
  (setq gc-cons-threshold init-gc-cons-threshold
        gc-cons-percentage init-gc-cons-percentage
        file-name-handler-alist nil)
  (add-hook 'after-init-hook
            `(lambda ()
               (setq gc-cons-threshold ,normal-gc-cons-threshold
                     gc-cons-percentage ,normal-gc-cons-percentage
                     file-name-handler-alist ',normal-file-name-handler-alist))))

(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)

;; disable toolbar
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(setq display-line-numbers 'relative)

;;; Performance tweaks. Don't load default library and use fundamental-mode to reduce amount of hooks.
(setq inhibit-default-init t)
(setq initial-major-mode 'fundamental-mode)

(add-to-list 'load-path "~/.config/emacs/lisp/")
(add-to-list 'custom-theme-load-path "~/.config/emacs/themes/")

(setq package-enable-at-startup nil)
