// Event post template.

#import "/templates/tola.typ": wrap-page
#import "/components/layout.typ": page-layout

#let post = wrap-page(
  view: (body, meta) => {
    page-layout[
      #html.elem("article")[
        #html.elem("header")[
          #if meta.title != none {
            html.elem("h1")[#meta.title, posted on #if meta.date != none { meta.date.display("[year]-[month]-[day]") }]
          }
        ]
        #body
      ]
    ]
  },
)
