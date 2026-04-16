// HTML helper functions.

#let img(src, alt: "", extra: (:)) = {
  html.elem("img", attrs: (src: src, alt: alt) + extra)
}
