// Regular page template.

#import "/templates/tola.typ": wrap-page
#import "/components/layout.typ": page-layout

#let page = wrap-page(
  view: (body, meta) => {
    page-layout(body)
  },
)
