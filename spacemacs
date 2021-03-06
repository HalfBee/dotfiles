;; -*- mode: dotspacemacs -*-
;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     ;; better-defaults
     emacs-lisp
     ;; git
     markdown
     ;; org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     spell-checking
     syntax-checking
     osx
     version-control
     html
     purescript
     javascript
     ;; this breaks tests?
     ;; psc-ide
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     flycheck
     flycheck-purescript
     company-flow
     flycheck-flow
     ;; flycheck-css-color
     ;; flycheck-json
     nyan-mode
     rainbow-identifiers
     graphviz-dot-mode

     ;; hopefully managed by a spacemacs layer
     ;; company-mode
     )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages nil))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update nil
   ;; dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'random
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               ;; :size 13
                               :size 11
                               :weight normal
                               :width normal
                               :powerline-scale 1)
                               ;; :powerline-scale 1.1)
                               ;; :powerline-scale 1.5)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put almost
any user code here.  The exception is org related code, which should be placed
in `dotspacemacs/user-config'."
  )

;; flycheck
(defun my/init-flycheck ()
  (use-package "flycheck"
    ;; :defer t
    :ensure t
    :init
    ;; turn on flychecking globally
    ;; (add-hook 'after-init-hook #'global-flycheck-mode)
    ;; (add-hook 'js-mode-hook 'flycheck-mode)
    ;; (add-hook 'flycheck-mode-hook #'flycheck-purescript-setup)
    ;; (add-hook 'prog-mode #'flycheck-mode)
    ;; (global-flycheck-mode)
    (add-hook 'prog-mode-hook #'flycheck-mode)
    (setq-default syntax-checking-enable-by-default t)
    :config
    ;; node-modules support shamelessly lifted from here
    ;; https://github.com/lunaryorn/.emacs.d/blob/master/lisp/lunaryorn-flycheck.el#L62
    (add-hook 'flycheck-mode-hook #'my/use-node-modules-bin)
    ;; can't use flycheck-syntax-check-failed-hook because it's for
    ;; when flycheck itself has an error
    (add-hook 'flycheck-after-syntax-check-hook #'my/flycheck-list-errors-only-when-errors)
    ;; (add-hook 'flycheck-mode-hook #'my/flycheck-list-errors-only-when-errors)
    ;; (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)
    (add-hook 'flycheck-mode-hook (apply-partially #'my/use-checker-from-node-modules "flow"))
    (add-hook 'flycheck-mode-hook (apply-partially #'my/use-checker-from-node-modules "eslint"))

    ;; use the npm version for the check
    ;; this breaks flycheck when we enter json-mode and perhaps others
    ;; an update seems to replace this anyways
    (setq-default flycheck-disabled-checkers
                  (append flycheck-disabled-checkers
                          '(javascript-jshint)))
    ;; use eslint with web-mode for jsx files
    (flycheck-add-mode 'javascript-eslint 'web-mode)
    (flycheck-add-mode 'javascript-jshint 'web-mode)

    ;; purescript
    ;; (setq-default flycheck-purescript-compile-output-dir "output")
    (paradox-require 'flycheck-flow)
    (use-package "flycheck-flow"
      :init
      (flycheck-add-mode 'javascript-flow 'js-mode)
      (flycheck-add-mode 'javascript-flow 'web-mode)
      :config
      ;; (add-hook 'flycheck-mode-hook #'my/use-flow-from-node-modules)
      (message "added flow to flycheck")
      )
    )
  ;; (setq flycheck-check-syntax-automatically '(mode-enabled save idle-change new-line))
  )

(defun my/use-checker-from-node-modules (checker-name)
  (message "setting %s exec for mode %s" checker-name major-mode )
  (setq path "invalid")
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (path (and root
                     (expand-file-name (concat "node_modules/.bin/" checker-name)
                                       root))))
    (message "path is %s" path)
    (if path
        ;; (when (file-executable-p path)
        (let ((checker-exec-sym (intern (concat "flycheck-javascript-" checker-name "-executable"))))
             (make-local-variable checker-exec-sym)
             (set checker-exec-sym path)
             (message "flow exec is %s" flycheck-javascript-flow-executable)
             )
      (message "checker %s not available for mode %s with file %s"
               checker-name major-mode buffer-file-name)
      ;; )
      )
    )
  )

;; I don't get how this can work yet - need time to grok - unused
(defun my/use-node-modules-bin ()
  "Set executables of JS checkers from local node modules."
  (message "using node_modules/.bin for JS local linting/checking")
  (-when-let* ((file-name (buffer-file-name))
               (root (locate-dominating-file file-name "node_modules"))
               (module-directory (expand-file-name "node_modules" root)))
    (pcase-dolist (`(,checker . ,module) '((javascript-jshint . "jshint")
                                           (javascript-eslint . "eslint")
                                           (javascript-jscs   . "jscs")
                                           (javascript-flow   . "flow")))
      (let ((package-directory (expand-file-name module module-directory))
            (executable-var (flycheck-checker-executable-variable checker)))
        (when (file-directory-p package-directory)
          (set (make-local-variable executable-var)
               (expand-file-name (concat ".bin/" module)
                                 package-directory)))))))

(defun my/flycheck-list-errors-only-when-errors ()
  (message "checking for current errors")
  (if flycheck-current-errors
      (flycheck-list-errors)
    (-when-let (buffer (get-buffer flycheck-error-list-buffer))
      (dolist (window (get-buffer-window-list buffer))
        (quit-window nil window)))))

(defun my/fix-js2-rainbow-identifiers ()
  (message "HACK: turning off rainbow-identifiers-mode")
  (rainbow-identifiers-mode 0)
  (message "HACK: turning back on rainbow-identifiers-mode")
  (rainbow-identifiers-mode 1)
  )

(defun my/highlight-gt-80-columns ()
  (require 'font-lock)
  (defface my-tab-face '((t . (:background "gray10"))) "wide line tab face")
  ;; TODO: figure out why this breaks rainbow identifiers
  ;; (defface my-long-line-face '((t . (:background "gray10"))) "wide line face")
  (defface my-trailing-space-face '((t . (:background "red"))) "trailing space")
  (defface my-post-long-line-face '((t . (:underline "red"))) "post 80 face")

  (font-lock-add-keywords nil
   '(("\t+" (0 'my-tab-face append))
     ("[ \t]+$"      (0 'my-trailing-space-face append))
     ;; ("^.\\{81,\\}$" (0 'my-long-line-face append))
     ("^.\\{80\\}\\(.+\\)$" (1 'my-post-long-line-face append))
     )
   )
  (message "applied > 80 column highlighting")
  )

(defun dotspacemacs/user-config ()
  ;; add load-path for packages not in the melpa database
  (add-to-list 'load-path "~/dev/dotfiles/lisp")

  ;; debug
  ;; (setq-default tramp-verbose 6)
  ;; fixes tramp startup times
  (eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))

  ;; encryption
  (require 'epa-file)
  (epa-file-enable)
  (paradox-require 'pinentry)
  (setf epa-pinentry-mode 'loopback)

  ;; org-mode settings
  ;; shrink inline images see:
  ;; http://lists.gnu.org/archive/html/emacs-orgmode/2012-08/msg01388.html
  (setq-default org-image-actual-width '(400))
  (add-hook 'org-mode-hook 'auto-fill-mode)

  ;; turn off the menu bar so we can see things like the time on small screens
  (menu-bar-mode -1)

  ;; modeline settings
  ;; (paradox-require 'diminish nil t)
  ;; (setq-default diminish-mode-alist '(company-mode))
  ;; (eval-after-load "company-mode" '(diminish 'company-mode 'auto-complete-mode))
  ;; (eval-after-load 'yas-minor-mode '(diminish 'yas-minor-mode nil))
  ;; (with-eval-after-load 'company-mode
  ;;   (spacemacs|diminish 'company-mode nil))
  ;; (spacemacs|diminish 'yas-minor-mode nil)
  ;; (spacemacs|diminish 'flyspell-mode nil)
  ;; (spacemacs|diminish 'which-key-mode nil)
  ;; (spacemacs|diminish 'smartparens-mode nil)
  ;; (require 'delight)
  ;; (delight 'yas-minor-mode)
  ;; (require 'delight-powerline)
  ;; (when (paradox-require 'dim nil t)
  ;;                    (dim-minor-names '((
  ;;                                        yas-minor-mode "foo"
  ;;                                        company-mode ""
  ;;                                        flycheck-mode ""
  ;;                                        flyspell-mode "")))
  ;;                    )

  ;; turning off individual lighters doesn't work using the "blessed"
  ;; spacemacs|diminish function (see commented code above)
  ;; so just turn the damn thing off entirely
  (spaceline-toggle-minor-modes-off)
  ;; (setq-default spaceline-separator-dir-left '(left . left))
  ;; (setq-default spaceline-separator-dir-right '(right . right))
  (setq-default powerline-default-separator nil)
  (spaceline-compile)

  ;; osx settings
  (setq-default mac-command-key-is-meta t)
  (setq-default mac-option-modifier 'alt)
  (setq-default osx-use-option-as-meta nil)
  (setq-default mac-option-key-is-meta nil)
  (setq-default mac-command-modifier 'meta)

  ;; web-mode
  (paradox-require 'web-mode)
  (defun my-web-mode-hook ()
    "Hooks for Web mode."
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-code-indent-offset 2)
    )
  (add-hook 'web-mode-hook  'my-web-mode-hook)

  ;; indentation
  (setq-default css-indent-offset 2)
  ;; prevent indentation from lining up with a prior line's glyph
  ;; this will make it so fighting is less necessary to appease linters
  (setq-default js2-pretty-multiline-declarations nil)
  (paradox-require 'cc-mode)
  (add-to-list 'c-offsets-alist '(arglist-close . c-lineup-close-paren))


  ;; company-mode (for auto-complete)
  (global-company-mode 1)
  ;; fast auto-complete
  (setq-default company-idle-delay 0.2)
  (setq-default company-minimum-prefix-length 1)
  (global-set-key (quote [(ctrl return)]) 'company-complete)
  (setq-default company-auto-complete t)
  ;; (define-key company-active-map [tab] 'company-select-next)
  (setq-default company-auto-complete-chars [41 46])
  ;; keep evil mode and company mode from conflicting
  ;; see https://github.com/company-mode/company-mode/issues/383
  (evil-declare-change-repeat 'company-complete)
  (with-eval-after-load 'company
    (define-key company-active-map (kbd "RET") nil)
    (define-key company-active-map [12] nil)
    (define-key company-active-map [return] nil)
    (define-key company-active-map (kbd "TAB") 'company-complete-selection)
    (define-key company-active-map [tab] 'company-complete-selection)
    )

  ;; non-nil indicates spacemacs should start with fullscreen
  (setq-default dotspacemacs-fullscreen-at-startup t)
  (setq paradox-github-token '663d5d3c21b2c6a716848fa00653bb92e6aeee68)
  (global-linum-mode) ; show line numbers by default
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 2)
  (setq-default js-indent-level 2)

  ;; rainbow identifiers (aka semantic syntax highlighting)
  (use-package "rainbow-identifiers"
    :ensure t
    :init
    (add-hook 'prog-mode-hook 'rainbow-identifiers-mode)
    ;; (add-hook 'js2-mode-hook #'my/fix-js2-rainbow-identifiers)
    :config
    (setq-default rainbow-identifiers-faces-to-override
                  '(font-lock-type-face font-lock-variable-name-face))
    :diminish 'rainbow-identifiers-mode
  )

  ;; highlight lines longer than 80 chars
  ;; (require 'whitespace)
  ;; (setq whitespace-style '(tabs face empty lines-tail trailing))
  ;; (global-whitespace-mode t)
  ;; taken from https://www.emacswiki.org/emacs/EightyColumnRule
  ;; (add-hook 'font-lock-mode-hook #'my/highlight-gt-80-columns)
  (add-hook 'prog-mode-hook #'my/highlight-gt-80-columns)
  (add-hook 'text-mode-hook #'my/highlight-gt-80-columns)

  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
  ;; show 80 column rule
  (require 'fill-column-indicator)
  ;; (define-globalized-minor-mode global-fci-mode
  ;;   fci-mode (lambda ()
  ;;              (when (not (memq major-mode
  ;;                               (list 'web-mode)))
  ;;                (fci-mode 1))))
  ;; (global-fci-mode 1)
  (add-hook 'prog-mode-hook 'fci-mode)
  (add-hook 'text-mode-hook 'fci-mode)
  (add-hook 'web-mode-hook (lambda () (fci-mode 0)))

  ;; handle long lines
  (require 'so-long)
  (add-to-list 'so-long-minor-modes 'rainbow-delimiters-mode)
  (add-to-list 'so-long-minor-modes 'rainbow-identifiers-mode)
  (add-to-list 'so-long-minor-modes 'flycheck-mode)
  (add-to-list 'so-long-target-modes 'json-mode)
  (so-long-enable)
  (setq-default so-long-threshold 500)
  (message "so-long watching enabled")

  ;; (add-hook 'buffer-list-update-hook 'turn-on-fci-mode)
  (paradox-require 'markdown-mode)
  (add-hook 'markdown-mode-hook 'auto-fill-mode)
  (add-hook 'markdown-mode-hook 'flyspell-mode)
  ;; (add-hook 'markdown-mode-hook (lambda () (auto-fill-mode)))
 ;;(setq-default fci-rule-width 1)
  ;;(setq-default fci-rule-color "darkblue")

  ;; javascript-mode
  ;; js2-mode doesn't play nice with things like flow and es6 features
  (rassq-delete-all 'js2-mode auto-mode-alist)
  (add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))

  (setq-default js2-strict-missing-semi-warning nil)
  (setq-default js2-strict-trailing-comma-warning nil)
  ;; (setq-default js2-mode-toggle-warnings-and-errors 0)

  (add-hook 'js2-mode 'js2-mode-toggle-warnings-and-errors)

  ;; purescript-mode
  (setq-default psc-ide-client-executable "/usr/local/bin/psc-ide-client")
  (setq-default psc-ide-server-executable "/usr/local/bin/psc-ide-server")
  (setq-default psc-ide-rebuild-on-save t)
  (add-hook 'purescript-mode-hook 'turn-on-purescript-indentation)

  ;; graphviz dot support
  (package-initialize)
  (paradox-require 'graphviz-dot-mode)
  (setq-default graphviz-dot-preview-extension "svg")
  (defun compile-dot ()
    "compile a graphviz dot file"
    ;; (compile graphviz-dot-dot-program))
    (compile (concat graphviz-dot-dot-program
            " -T" graphviz-dot-preview-extension " "
            (shell-quote-argument buffer-file-name)
            " -o "
            (shell-quote-argument
             (concat (file-name-sans-extension buffer-file-name)
                     "." graphviz-dot-preview-extension))))
    )
  (add-hook 'graphviz-dot-mode-hook
            (lambda ()
             (add-hook 'after-save-hook 'compile-dot nil 'make-it-local)))

  ;; compilation
  ;; no need to show compile window on success - just interested in errors
  (defun compilation-exit-autoclose (STATUS code msg)
    "Close the compilation window if there was no error at all."
    ;; If M-x compile exists with a 0
    (when (and (eq STATUS 'exit) (zerop code))
      ;; then bury the *compilation* buffer, so that C-x b doesn't go there
      (bury-buffer)
      ;; and delete the *compilation* window
      (delete-window (get-buffer-window (get-buffer "*compilation*"))))
    ;; Always return the anticipated result of compilation-exit-message-function
    (cons msg code))
  (setq compilation-exit-message-function 'compilation-exit-autoclose)

  ;; git gutter
  (setq-default git-gutter-fr+-side 'left-fringe)

  ;; fun!
  (paradox-require 'nyan-mode)
  (setq-default nyan-wavy-trail t)
  (setq-default nyan-animate-nyancat t)
  (setq-default nyan-animation-frame-interval 0.075)
  (setq-default nyan-bar-length 16)
  ;; as of spacemacs 0.200 this eats a ton of cpu time
  ;; (add-hook 'nyan-mode 'nyan-start-animation)
  ;; (add-hook 'change-major-mode-hook 'nyan-start-animation)

  ;; da faq?
  ;; animate letters inwards to the cursor point as you type
  ;; left for reference and not actual use - only works at top of file
  (defun animated-self-insert ()
    (let* ((undo-entry (car buffer-undo-list))
           (beginning (and (consp undo-entry) (car undo-entry)))
           (end (and (consp undo-entry) (cdr undo-entry)))
           (str (when (and (numberp beginning)
                           (numberp end))
                  (buffer-substring-no-properties beginning end)))
           (animate-n-steps 3))
      (when str
        (delete-region beginning end)
        (animate-string str (1- (line-number-at-pos)) (current-column)))))

  ;; (add-hook 'post-self-insert-hook 'animated-self-insert)

  (my/init-flycheck)

  ;; (if (locate-library "flycheck-purescript-mode")
  ;;     (autoload "flycheck-purescript-mode" "flycheck-purescript-mode" "checker for purescript" t)
  ;;   ;; TODO: make this a mode hook for purescript-mode
  ;;   (eval-after-load 'flycheck
  ;;     '(flycheck-purescript-setup))
  ;;   )

  ;; old flycheck settings - didn't work
  ;; (paradox-require 'flycheck)
  ;; disable jshint since we prefer eslint checking
;;  (setq-default flycheck-disabled-checkers
;;    (append flycheck-disabled-checkers
;;      '(javascript-jshint)))
  ;; (eval-after-load
  ;;     'flycheck
  ;;   (lambda ()
  ;;     (flycheck-add-mode 'javascript-eslint 'js2-mode)
  ;;     ;; Disable jshint
  ;;     ;; wait, why are we doing this?
  ;;     (setq-default
  ;;      flycheck-disabled-checkers
  ;;      (append flycheck-disabled-checkers
  ;; 	     '(javascript-jshint)))))

)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
