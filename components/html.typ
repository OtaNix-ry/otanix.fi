// HTML helper functions.

#let img(src, alt: "") = {
  html.elem("img", attrs: (src: src, alt: alt))
}
