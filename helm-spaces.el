;;; helm-spaces.el --- helm sources for spaces

;; Copyright (C) 2013 Yasuyuki Oka

;; Author: Yasuyuki Oka <yasuyk@gmail.com>
;; Version: 0.1
;; URL: https://github.com/yasuyk/helm-spaces
;; Package-Requires: ((helm "1.0") (spaces "0.1.0"))
;; Keywords: helm frames convenience

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(require 'helm)
(require 'spaces)

(defgroup helm-spaces nil
  "Spaces related Applications and libraries for Helm."
  :group 'helm)

;;; Faces
(defface helm-spaces-current-space
    '((t (:foreground "green")))
  "Face used for current space."
  :group 'helm-spaces)

(defvar helm-source-space-create
  '((name . "Creates a new space")
    (persistent-action . t) ;; Disable persistent-action
    (persistent-help . "DoNothing")
    (dummy)
    (no-delay-on-input)
    (action . (lambda (candidate)
                (if (equal candidate "")
                    (sp-new-space)
                  (sp-new-space candidate)))))
  "Create a new space.")

(defun helm-spaces-candidates ()
  "Return a list of all spaces.
`sp-current-space' is colored by `helm-spaces-current-space'."
  (when sp-spaces
    (loop for sname in sp-spaces
          if (equal (car sname) sp-current-space)
          collect (propertize (car sname) 'face 'helm-spaces-current-space)
          else
          collect (car sname))))

(defvar helm-source-spaces
  '((name . "Spaces")
    (persistent-action . t) ;; Disable persistent-action
    (persistent-help . "DoNothing")
    (candidates . helm-spaces-candidates)
    (action . (("Switch space" . sp-switch-space)
               ("Kill space" . sp-kill-space)
               ("Kill all spaces" .
                (lambda (dummy) (sp-clear-spaces))))))
  "Show all spaces.")

(defun helm-spaces ()
  "Helm to list spaces and to create a new space."
  (interactive)
  (helm-other-buffer '(helm-source-spaces
                       helm-source-space-create)
                     "*helm spaces*"))

(provide 'helm-spaces)

;; Local Variables:
;; coding: utf-8
;; eval: (checkdoc-minor-mode 1)
;; End:

;;; helm-spaces.el ends here
