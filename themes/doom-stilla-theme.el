;;; doom-stilla-theme.el --- custom theme by jakeisnt -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Added: January 10, 2023
;; Author: jakeisnt <https://github.com/jakeisnt>
;; Maintainer:
;; Source: https://github.com/stilla-theme
;;
;;; Commentary:
;;; Code:

(require 'doom-themes)


;;
;;; Variables

(defgroup doom-stilla-theme nil
  "Options for the `stilla' theme."
  :group 'doom-themes)

(defcustom doom-stilla-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-stilla-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme doom-stilla
  "Stilla minimal theme"

  ;; name        default   256       16
  ((bg         '("#ODODOD" nil       nil))
   (bg-alt     '("#121414" nil       nil))
   (base0      '("#121414" "black"   "black"))
   (base1      '("#BA8082" "#262626" "brightblack"))
   (base2      '("#A19C9A" "#303030" "brightblack"))
   (base3      '("#E9B872" "#3A3A3A" "brightblack"))
   (base4      '("#ADB2BA" "#444444" "brightblack"))
   (base5      '("#CD96B3" "#585858" "brightblack"))
   (base6      '("#88B6D0" "#626262" "brightblack"))
   (base7      '("#FAFAFA" "#767676" "brightblack"))
   (base8      '("#4C566A" "#a8a8a8" "white"))
   (fg         '("#F2F2F2" "#e4e4e4" "brightwhite"))
   (fg-alt     '("#BFC7D5" "#bcbcbc" "white"))

   (grey '("#4C566A" nil nil))

   (red         '("#BA8082" "#ff0000" "red"))
   (orange      '("#D99962" "#ff5f00" "brightred"))
   (green       '("#A19C9A" "#afff00" "green"))
   (teal        '("#6D96A5" "#00d7af" "brightgreen"))
   (yellow      '("#E9B872" "#ffd700" "brightyellow"))
   (blue        '("#ADB2BA" "#5fafff" "brightblue"))
   (dark-blue   '("#68809A" "#d7ffff" "blue"))
   (magenta     '("#CD96B3" "#d787d7" "brightmagenta"))
   (violet      '("#CD96B3" "#d787af" "magenta"))
   (cyan        '("#B29E75" "#5fd7ff" "brightcyan"))
   (dark-cyan   '("#6D96A5" "#00d7af" "cyan"))

   ;; face categories -- required for all themes
   (highlight      magenta)
   (vertical-bar   base2)
   (selection      base4)
   (builtin        blue)
   (comments       base6)
   (doc-comments   base6)
   (constants      orange)
   (functions      blue)
   (keywords       cyan)
   (methods        blue)
   (operators      cyan)
   (type           magenta)
   (strings        green)
   (variables      yellow)
   (numbers        orange)
   (region         base3)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    blue)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (modeline-bg     base2)
   (modeline-bg-alt (doom-darken bg 0.01))
   (modeline-fg     base8)
   (modeline-fg-alt comments)

   (-modeline-pad
    (when doom-stilla-padded-modeline
      (if (integerp doom-stilla-padded-modeline) doom-stilla-padded-modeline 4))))

;;;; Base theme face overrides
  (;;;; emacs
   (lazy-highlight :background (doom-darken green 0.5) :foreground green :weight 'bold)
   (minibuffer-prompt :foreground yellow)
   (region :background (doom-darken dark-cyan 0.5) :foreground dark-cyan :distant-foreground (doom-darken fg 0.2) :extend t)
   (hl-line :background base2 :foreground nil)
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-alt :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-alt)))
   (tooltip :background (doom-darken bg-alt 0.2) :foreground fg)
   (cursor :background yellow)
   (line-number-current-line
    :inherit '(hl-line default)
    :foreground cyan :distant-foreground nil
    :weight 'normal :italic nil :underline nil :strike-through nil)
   (completions-first-difference :foreground yellow)
   (icomplete-first-match :foreground green :underline t :weight 'bold)

;;;; doom-modeline
   (doom-modeline-buffer-path       :foreground green :weight 'bold)
   (doom-modeline-buffer-major-mode :inherit 'doom-modeline-buffer-path)
;;;; highlight-thing highlight-symbol
   (highlight-symbol-face :background region :distant-foreground fg-alt)
;;;; highlight-thing
   (highlight-thing :background region :distant-foreground fg-alt)
;;;; man <built-in>
   (Man-overstrike :inherit 'bold :foreground magenta)
   (Man-underline :inherit 'underline :foreground blue)
;;;; org <built-in>
   ((org-block &override) :background base2)
   ((org-block-background &override) :background base2)
   ((org-block-begin-line &override) :background base2)
;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)
;;;; dired-k
   (dired-k-commited :foreground base4)
   (dired-k-modified :foreground vc-modified)
   (dired-k-ignored :foreground cyan)
   (dired-k-added    :foreground vc-added)
;;;; ivy
   (ivy-current-match :background base3)
   (ivy-minibuffer-match-face-2
    :inherit 'ivy-minibuffer-match-face-1
    :foreground dark-cyan :background base1 :weight 'semi-bold)
;;;; js2-mode
   (js2-jsdoc-tag              :foreground magenta)
   (js2-object-property        :foreground yellow)
   (js2-object-property-access :foreground cyan)
   (js2-function-param         :foreground violet)
   (js2-jsdoc-type             :foreground base8)
   (js2-jsdoc-value            :foreground cyan)
;;;; lsp
   (lsp-headerline-breadcrumb-symbols-face :foreground base7)
;;;; rainbow-delimiters
   (rainbow-delimiters-depth-1-face :foreground magenta)
   (rainbow-delimiters-depth-2-face :foreground orange)
   (rainbow-delimiters-depth-3-face :foreground green)
   (rainbow-delimiters-depth-4-face :foreground cyan)
   (rainbow-delimiters-depth-5-face :foreground violet)
   (rainbow-delimiters-depth-6-face :foreground yellow)
   (rainbow-delimiters-depth-7-face :foreground blue)
   (rainbow-delimiters-depth-8-face :foreground teal)
   (rainbow-delimiters-depth-9-face :foreground dark-cyan)
;;;; rjsx-mode
   (rjsx-tag :foreground red)
   (rjsx-attr :foreground yellow :slant 'italic :weight 'medium)
   (rjsx-tag-bracket-face :foreground cyan)
;;;; Magit
   (magit-header-line :background (doom-lighten modeline-bg 0.2) :foreground green :weight 'bold
                      :box `(:line-width 3 :color ,(doom-lighten modeline-bg 0.2)))
;;;; Treemacs
   (treemacs-git-modified-face :foreground vc-modified)
;;;; Web Mode
   (web-mode-html-tag-face :foreground red)
   (web-mode-html-attr-equal-face :foreground cyan)
;;;; Org Mode
   (org-level-1 :foreground green)
   (org-level-2 :foreground yellow)
   (org-level-3 :foreground red)
   (org-level-4 :foreground cyan)
   (org-level-5 :foreground blue)
   (org-level-6 :foreground magenta)
   (org-level-7 :foreground teal)
   (org-level-8 :foreground violet)
   (org-todo :foreground orange)
;;;; css
   (css-property :foreground orange)
   (css-proprietary-property :foreground magenta)
   (css-selector :foreground yellow)))

;;; doom-stilla-theme.el ends here
