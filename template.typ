#import "tokens.typ": *
#import "components.typ": *

#let muse-doc(
  title: "",
  subtitle: none,
  client: none,
  recipient: none,
  date: none,
  version: "1.0",
  author: "Facile Studio",
  doc-type: "Étude de cadrage & Proposition",
  status: "Proposition",
  cover: true,
  body
) = {
  set document(
    title: title,
    author: author,
  )

  set page(
    paper: "a4",
    margin: (top: 2.4cm, bottom: 2.2cm, left: 2.2cm, right: 2.2cm),
    header: context {
      let page-num = counter(page).get().first()
      if cover and page-num == 1 {
        none
      } else {
        block(
          width: 100%,
          stroke: (bottom: 0.5pt + fc-border),
          inset: (bottom: 6pt),
          [
            #grid(
              columns: (1fr, auto),
              align: (left + horizon, right + horizon),
              [
                #text(size: 8pt, weight: "bold", fill: fc-fg, [FACILE])
                #h(3pt)
                #text(size: 8pt, fill: fc-fg-muted, [STUDIO])
                #h(6pt)
                #text(size: 8pt, fill: fc-border, [·])
                #h(6pt)
                #text(size: 8pt, fill: fc-fg-muted, doc-type)
              ],
              [
                #if client != none [
                  #text(size: 8pt, weight: "medium", fill: fc-fg, client)
                  #h(6pt)
                  #badge(status, tone: "neutral", size: "xs")
                ]
              ]
            )
          ]
        )
      }
    },
    footer: context {
      let page-num = counter(page).get().first()
      let total-pages = counter(page).final().first()
      if cover and page-num == 1 {
        none
      } else {
        block(
          width: 100%,
          stroke: (top: 0.5pt + fc-border),
          inset: (top: 6pt),
          [
            #grid(
              columns: (1fr, 1fr),
              align: (left, right),
              [
                #text(size: 8pt, fill: fc-fg-muted, [Facile Studio · Document de cadrage confidentiel])
              ],
              [
                #text(size: 8pt, fill: fc-fg-muted, [Page #page-num sur #total-pages])
              ]
            )
          ]
        )
      }
    }
  )

  set text(
    font: font-sans,
    size: 9pt,
    fill: fc-fg,
    lang: "fr",
    spacing: 100%,
  )

  set par(
    justify: true,
    leading: 0.58em,
  )

  show heading.where(level: 1): it => block(
    width: 100%,
    above: 1.4em,
    below: 0.8em,
    breakable: false,
    [
      #text(
        size: 14pt,
        weight: "bold",
        fill: fc-fg,
        it.body
      )
      #v(3pt)
      #line(length: 100%, stroke: 0.5pt + fc-border)
    ]
  )

  show heading.where(level: 2): it => block(
    above: 1.1em,
    below: 0.6em,
    breakable: false,
    [
      #text(
        size: 11pt,
        weight: "bold",
        fill: fc-fg,
        it.body
      )
    ]
  )

  show heading.where(level: 3): it => block(
    above: 0.9em,
    below: 0.5em,
    breakable: false,
    [
      #text(
        size: 10pt,
        weight: "semibold",
        fill: fc-fg,
        it.body
      )
    ]
  )

  show table: set table(
    stroke: (x, y) => if y == 0 { (bottom: 1pt + fc-fg) } else { (bottom: 0.5pt + fc-border-subtle) },
    fill: (x, y) => if y == 0 { fc-surface } else { none },
    inset: (x: 7pt, y: 5.5pt),
  )

  show raw.where(block: true): it => block(
    width: 100%,
    fill: fc-surface,
    radius: radius-sm,
    inset: 8pt,
    stroke: 0.5pt + fc-border,
    breakable: false,
    [
      #set text(font: font-mono, size: 8pt)
      #it
    ]
  )

  show raw.where(block: false): it => box(
    fill: fc-surface,
    radius: radius-xs,
    inset: (x: 3pt, y: 1.5pt),
    baseline: 0%,
    [
      #set text(font: font-mono, size: 8pt, fill: fc-fg)
      #it
    ]
  )

  if cover {
    v(2cm)
    
    grid(
      columns: (1fr, auto),
      align: (left + horizon, right + horizon),
      [
        #text(size: 14pt, weight: "bold", fill: fc-fg, [FACILE])
        #h(4pt)
        #text(size: 14pt, weight: "light", fill: fc-fg-muted, [STUDIO])
      ],
      [
        #badge(status, tone: "accent", size: "sm")
      ]
    )

    v(3cm)

    block(
      width: 100%,
      [
        #badge(doc-type, tone: "neutral", size: "sm")
        #v(10pt)
        #text(size: 24pt, weight: "bold", fill: fc-fg, tracking: -0.5pt, title)
        #if subtitle != none [
          #v(8pt)
          #text(size: 12pt, fill: fc-fg-muted, subtitle)
        ]
      ]
    )

    v(4.5cm)

    line(length: 100%, stroke: 0.5pt + fc-border)
    v(10pt)

    grid(
      columns: (1fr, 1fr, 1fr),
      gutter: 15pt,
      [
        #text(size: 8pt, weight: "bold", fill: fc-fg-muted, [DESTINATAIRE])
        #v(3pt)
        #text(size: 9.5pt, weight: "semibold", fill: fc-fg, if recipient != none { recipient } else { "David" }) \
        #if client != none [
          #text(size: 8.5pt, fill: fc-fg-muted, client)
        ]
      ],
      [
        #text(size: 8pt, weight: "bold", fill: fc-fg-muted, [ÉMIS PAR])
        #v(3pt)
        #text(size: 9.5pt, weight: "semibold", fill: fc-fg, author) \
        #text(size: 8.5pt, fill: fc-fg-muted, [facile.studio])
      ],
      [
        #text(size: 8pt, weight: "bold", fill: fc-fg-muted, [DATE & VERSION])
        #v(3pt)
        #text(size: 9.5pt, weight: "semibold", fill: fc-fg, if date != none { date } else { "Août 2026" }) \
        #text(size: 8.5pt, fill: fc-fg-muted, [Version #version])
      ]
    )

    pagebreak()
  }

  body
}
