#import "/templates/page.typ": page
#import "@tola/pages:0.0.0": pages

#show: page.with(title: "Events, past and future")

#{
  let event-pages = pages()
    .filter(p => p.permalink != "/events/" and "/events/" in p.permalink)
    .filter(p => p.date != none)
    .sorted(key: p => p.date)
    .rev()

  html.elem("article")[
    #html.elem("h1")[Events, past and future]
  ]

  for event in event-pages {
    html.elem("article", attrs: (class: "post-entry"))[
      #html.elem("header", attrs: (class: "entry-header"))[
        #html.elem("h3", attrs: (style: "position: relative; float: right;"))[
          #event.date
        ]
        #html.elem("h2")[
          #html.elem("a", attrs: (href: event.permalink))[#event.title]
        ]
      ]
    ]
  }
}
