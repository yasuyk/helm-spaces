# helm-spaces.el [![melpa badge][melpa-badge]][melpa-link] [![melpa stable badge][melpa-stable-badge]][melpa-stable-link]

## Introduction

`helm-spaces.el` is [helm][helm] sources for [spaces][spaces].

## Requirements

- Emacs 23 or higher.
- helm 1.0 or higher.
- spaces 0.1.0 or higher.

## Installation

If you choose not to use one of the convenient packages in
[Melpa][melpa], you'll need to add the
directory containing `helm-spaces.el` to your `load-path`, and then `(require 'helm-spaces)`.

## Basic Usage

### `helm-spaces`

Helm to list spaces and to create a new space.

## Customize

### `helm-spaces-new-space-query`

Non-nil means ask user before `sp-new-space`, If a space with same name already exists.

### `helm-spaces-current-space`

Face used for current space.

## Sample configuration

Add the following to your emacs init file:

    (require 'helm-spaces)  ;; Not necessary if using ELPA package
    (global-set-key (kbd "C-c s") 'helm-spaces)
    (setq helm-spaces-new-space-query nil)

[melpa]: http://melpa.milkbox.net
[spaces]:https://github.com/chumpage/chumpy-windows#spaces
[helm]:https://github.com/emacs-helm/helm
[melpa-link]: http://melpa.org/#/helm-spaces
[melpa-stable-link]: http://stable.melpa.org/#/helm-spaces
[melpa-badge]: http://melpa.org/packages/helm-spaces-badge.svg
[melpa-stable-badge]: http://stable.melpa.org/packages/helm-spaces-badge.svg
