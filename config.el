;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.










;; performance
(setq company-idle-delay 0)
(setq display-line-numbers-type nil)
;; (after! org
;;   (setq org-fontify-quote-and-verse-blocks nil
;;         org-fontify-whole-heading-line nil
;;         org-hide-leading-stars nil
;;         ))
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb
(setq lsp-idle-delay 0)

;;doom
;; (setq doom-font (font-spec :family "Fira Code" :size 17))
;; (setq doom-font (font-spec :family "Monospace" :size 15))
(remove-hook 'doom-first-input-hook #'evil-snipe-mode)
(setq confirm-kill-emacs nil)
(global-set-key "\C-x\C-b" 'ibuffer)
(global-unset-key "\C-k")

;; shell
(define-key key-translation-map (kbd "C-h") (kbd "DEL"))
(define-key key-translation-map (kbd "C-j") (kbd "RET"))
(define-key minibuffer-mode-map (kbd "C-k") 'kill-line)
(define-key minibuffer-local-completion-map (kbd "C-k") 'kill-line)

;; emacs
(define-key evil-insert-state-map (kbd "C-d") 'delete-char)
(define-key evil-insert-state-map (kbd "C-p") 'previous-line)
(define-key evil-insert-state-map (kbd "C-n") 'next-line)
(define-key evil-insert-state-map (kbd "C-k") 'kill-line)
(define-key evil-insert-state-map (kbd "C-f") 'forward-char)
(define-key evil-insert-state-map (kbd "C-b") 'backward-char)
(define-key evil-insert-state-map (kbd "C-a") 'move-beginning-of-line)
(define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)
(after! evil
  (map! :map evil-normal-state-map  "s" #'evil-avy-goto-char-timer))
(after! evil
  (map! :map evil-insert-state-map  "C-y" #'yank))

;;vim
(setq-default scroll-margin 8)
(define-key evil-normal-state-map (kbd "<") 'evil-shift-left-line)
(define-key evil-normal-state-map (kbd ">") 'evil-shift-right-line)
(after! evil
  (map! :map evil-insert-state-map  "M-o" #'evil-open-below))
(after! evil
  (map! :map evil-normal-state-map  "M-o" #'evil-open-below))

;;M-n
(define-key evil-insert-state-map (kbd "M-0") 'digit-argument)
(define-key evil-insert-state-map (kbd "M-1") 'digit-argument)
(define-key evil-insert-state-map (kbd "M-2") 'digit-argument)
(define-key evil-insert-state-map (kbd "M-3") 'digit-argument)
(define-key evil-insert-state-map (kbd "M-4") 'digit-argument)
(define-key evil-insert-state-map (kbd "M-5") 'digit-argument)
(define-key evil-insert-state-map (kbd "M-6") 'digit-argument)
(define-key evil-insert-state-map (kbd "M-7") 'digit-argument)
(define-key evil-insert-state-map (kbd "M-8") 'digit-argument)
(define-key evil-insert-state-map (kbd "M-9") 'digit-argument)

;;python
(with-eval-after-load
    'python
  (define-key python-mode-map (kbd "<f5>")
    'run-buffer-with-python3-interpreter))
(defun run-buffer-with-python3-interpreter ()
  (interactive)
  (save-buffer)
  (shell-command (format "python3 %s" (file-name-nondirectory buffer-file-name)))
)

;; yank
;; (defun backward-copy-word ()
;;   (interactive)
;;   (save-excursion
;;     (copy-region-as-kill (point) (progn (backward-sexp) (point)))))
;; (define-key evil-insert-state-map (kbd "C-y") 'backward-copy-word)
;; (define-key evil-insert-state-map (kbd "M-p") 'yank)

;; Org-mode
(map! :after evil-org
      :map evil-org-mode-map
      :m "gj" nil
      :m "gk" nil)

;; M-x
;; (map! :map 'override "C-v" #'vertico-scroll-up)

;; keyd
(after! evil
  (map! :map evil-normal-state-map  "<left>" #'scroll-down-command))
(after! evil
  (map! :map evil-normal-state-map  "<right>" #'scroll-up-command))
(after! evil
  (map! :map evil-normal-state-map  "<next>" #'evil-visual-block))
;; vertico
(map! :map 'override "<next>" #'vertico-scroll-up)
(map! :map 'override "<prior>" #'vertico-scroll-down)

;; test chang C-v in vertico-mode
;; (after! vertico
  ;; (map! :map evil-normal-state-map  "<next>" #'vertico-scroll-down))
;; (after! org
;;   (map! :map evil-normal-state-map  "C-c <up>" #'outline-previous-visible-heading))


(define-key evil-normal-state-map (kbd "C-c <up>") 'outline-previous-visible-heading)
(define-key evil-normal-state-map (kbd "C-c <down>") 'outline-next-visible-heading)
(define-key evil-normal-state-map (kbd "C-c <right>") 'org-forward-heading-same-level)
(define-key evil-normal-state-map (kbd "C-c <left>") 'org-backward-heading-same-level)
(define-key evil-insert-state-map (kbd "C-c <up>") 'outline-previous-visible-heading)
(define-key evil-insert-state-map (kbd "C-c <down>") 'outline-next-visible-heading)

(after! evil
  (map! :map evil-insert-state-map "C-t" #'transpose-chars))

;; (map! :after evil-org
;;       :map evil-insert-state-map
;;       :m "C-t" #'transpose-chars)


;; (after! org
;; (evil-define-key 'insert evil-org-mode-map
;;   (kbd "C-t") nil))

;; (after! evil
;; (evil-define-key 'insert evil-org-mode-map
;;   (kbd "C-t") nil))

(after! evil-org
(evil-define-key 'insert evil-org-mode-map
  (kbd "C-d") nil
  (kbd "C-t") nil
  ))

(after! evil-org
(evil-define-key 'normal evil-org-mode-map
  (kbd "RET") nil
  (kbd "<return>") nil
  ))
(define-key evil-normal-state-map (kbd "RET") 'er/expand-region)

;; (with-eval-after-load 'org
;;   (evil-define-key 'normal evil-org-mode-map
;;     (kbd "RET") nil
;;     (kbd "<return>") nil))

;; test A-d map C-delete
;; (define-key key-translation-map (kbd "C-<delete>") (kbd "A-d"))
;; (define-key vterm-mode-map (kbd "A-d") 'vterm--self-insert-meta)
