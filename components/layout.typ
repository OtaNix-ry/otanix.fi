// Shared layout: header, main content area, footer.

#let page-layout(body) = {
  html.elem("main", attrs: (class: "main"))[
    #html.elem("header")[
      #html.elem("h1")[
        #html.elem("a", attrs: (href: "/"))[OtaNix Ry]
      ]
    ]
    #body
  ]
  html.elem("footer")[
    #html.elem("div", attrs: (class: "footer-left"))[
      #html.elem("p")[© 2026 OtaNix ry]
    ]
    #html.elem("div", attrs: (class: "footer-right"))[
      // Built in code mode ({ ... }) so Typst doesn't insert whitespace text
      // nodes between the elements — those render as empty spans and, in a
      // flex column, add a full blank line between the logo and the caption.
      #html.elem("div", attrs: (class: "nixos-support"), {
        html.elem("a", attrs: (href: "https://nixos.org", class: "nixos-logo-link"), {
          html.elem("img", attrs: (
            src: "/assets/nixos-logo.svg",
            alt: "NixOS Logo",
            class: "nixos-logo light-mode-logo",
          ))
          html.elem("img", attrs: (
            src: "/assets/nixos-logo-dark.svg",
            alt: "NixOS Logo",
            class: "nixos-logo dark-mode-logo",
          ))
        })
        html.elem("span", attrs: (class: "support-caption"), [Sponsored by])
      })
    ]
  ]
}
