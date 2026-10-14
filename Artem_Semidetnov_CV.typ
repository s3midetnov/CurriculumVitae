
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Artem Semidetnov"
#let locale-catalog-page-numbering-style = context { "Artem Semidetnov - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Oct 2026"
#let locale-catalog-language = "en"
#let design-page-size = "us-letter"
#let design-section-titles-font-size = 1.4em
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 79, 144)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 79, 144)
#let design-colors-connections = rgb(0, 79, 144)
#let design-colors-links = rgb(0, 79, 144)
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.4em
#let design-section-titles-type = "with-parial-line"
#let design-section-titles-vertical-space-above = 0.5cm
#let design-section-titles-vertical-space-below = 0.3cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = true
#let design-text-font-size = 10pt
#let design-text-leading = 0.6em
#let design-text-font-family = "Source Sans 3"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = true
#let design-header-name-font-size = 30pt
#let design-header-name-bold = true
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = ""
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "•"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0.4cm
#let design-highlights-vertical-space-between-highlights = 0.25cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.5em
#let design-entries-vertical-space-between-entries = 1.2em
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = false
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0.2cm
#let design-page-top-margin = 2cm
#let design-page-bottom-margin = 2cm
#let design-page-left-margin = 2cm
#let design-page-right-margin = 2cm
#let design-page-show-last-updated-date = false
#let design-page-show-page-numbering = true
#let design-links-underline = false
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-bullet,
  spacing: 0pt,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #it.body
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-parial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  set text(fill: design-colors-connections)
  set par(leading: design-text-leading*1.7, justify: false)
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= Artem Semidetnov

// Print connections:
#let connections-list = (
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)Geneva, Switzerland],
  [#box(original-link("mailto:artemsemidetnov@gmail.com")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)artemsemidetnov\@gmail.com])],
  [#box(original-link("https://artem.semidetnov.com/")[#fa-icon("link", size: 0.9em) #h(0.05cm)artem.semidetnov.com])],
)
#connections(connections-list)



== Education

// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[MSc]],
  middle-content: [
    #strong[University of Geneva], Mathematics \(expected\)
  ],
  right-content: [
    2025 – 2027
  ],
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[BSc]],
  middle-content: [
    #strong[Saint Petersburg State University], Mathematics
  ],
  right-content: [
    2021 – 2025
  ],
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[BSc]],
  middle-content: [
    #strong[Neapolis University Pafos], Applied Computer Science, JetBrains Program
  ],
  right-content: [
    2022 – 2024
  ],
)



== Research Interests

#one-col-entry(
  content: [- Categorical homotopy theory; simplicial methods and operads; homotopy type theory and computer-formalized approaches; geometric and combinatorial group theory.],
)


== Publications and Preprints

#two-col-entry(
  left-content: [
    #link("https://arxiv.org/abs/2609.04275")[#strong[An explicit non-elementary matrix over a bivariate Laurent polynomial ring]]
  ],
  right-content: [
    Sept 2026
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Vasily Ionin, #strong[#emph[Artem Semidetnov]] · #link("https://arxiv.org/abs/2609.04275")[arXiv:2609.04275]])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #link("https://arxiv.org/abs/2608.29219")[#strong[On Some More Problems from the Kourovka Notebook]]
  ],
  right-content: [
    Aug 2026
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Vasily Ionin, #strong[#emph[Artem Semidetnov]] · #link("https://arxiv.org/abs/2608.29219")[arXiv:2608.29219]])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #link("https://arxiv.org/abs/2608.21465")[#strong[The stable commutator length of a relator is not a one-relator group invariant]]
  ],
  right-content: [
    Aug 2026
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [#strong[#emph[Artem Semidetnov]] · #link("https://arxiv.org/abs/2608.21465")[arXiv:2608.21465]])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #link("https://arxiv.org/abs/2512.14498")[#strong[The operad associated to a crossed simplicial group]]
  ],
  right-content: [
    Dec 2025
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [#strong[#emph[Artem Semidetnov]] · #link("https://arxiv.org/abs/2512.14498")[arXiv:2512.14498]])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #link("https://arxiv.org/abs/2106.00095")[#strong[On the geometry of free nilpotent groups]]
  ],
  right-content: [
    May 2021
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [#strong[#emph[Artem Semidetnov]], Ruslan Magdiev · #link("https://arxiv.org/abs/2106.00095")[arXiv:2106.00095]])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[AI-assisted research note]

    #v(-design-text-leading)
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [LLM tools were used in the research process for the three 2026 preprints listed above.])], column-gutter: 0cm)
  ],
)



== Research Experience / Projects


#one-col-entry(
  content: [
    #strong[Operadic double dual]

    #v(-design-text-leading)
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Preprint in preparation with Arshak Aivazian, Emmanuel Farjoun, and Vasily Ionin.])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #link("https://artem.semidetnov.com/projects/on-simplicial-resolutions-for-link-groups.pdf")[#strong[On Simplicial Resolutions for Link Groups]]
  ],
  right-content: [
    Oct 2026
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Independent mathematical note presenting two proofs of the Lei-Li-Wu theorem on a simplicial resolution of link groups.])], column-gutter: 0cm)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[JetBrains - Research Intern, HoTT and Dependent Types Lab]
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Developed the official Arend library and formalized results in algebra and homotopy type theory.],[Formalized the Eckmann-Hilton argument, Eilenberg-Mac Lane spaces, homology of types, group automorphisms, Schur's lemma, Maschke's lemma, and characterizations of group actions; selected contributions shipped in #link("https://arend-lang.github.io/2024/07/05/Arend-1.10.0-released.html")[Arend 1.10].],)
  ],
  right-content: [
    Pafos, Cyprus

June 2024 - Sept 2024
  ],
)



== Selected Talks

#two-col-entry(
  left-content: [
    #link("https://www.math.ku.dk/english/calendar/events/ytm26/YTM_2026_no_friday_closing.pdf")[#strong[The operad associated to a crossed simplicial group]]
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Young Topologists Meeting 2026],)
  ],
  right-content: [
    Copenhagen, Denmark

July 2026
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #link("https://cs.hse.ru/mirror/pubs/share/1075346122")[#strong[Plus construction and simplicial methods]]
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([#link("https://cs.hse.ru/ata-lab/atgcda25")[Conference \"Algebraic Topology, Geometry, Combinatorics, and Data Analysis\"]],)
  ],
  right-content: [
    Pushkin, Russia

Aug 2025
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #link("https://disk.yandex.ru/i/52gkQhVjjRravA")[#strong[Twisting numbers on braid and Thompson groups]]
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Topological Methods in Dynamics and Related Topics VII],)
  ],
  right-content: [
    Nizhny Novgorod, Russia

2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #link("https://m.mathnet.ru/php/seminars.phtml?option_lang=rus&presentid=34355")[#strong[On the Poisson boundary of lamplighter groups]]
  ],
  right-content: [
    Saint Petersburg, Russia
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([St. Petersburg Seminar on Representation Theory and Dynamical Systems],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[On the geometry of free nilpotent groups]
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Siberian Summer Conference],)
  ],
  right-content: [
    Novosibirsk, Russia

2021
  ],
)



== Honors and Awards

#two-col-entry(
  left-content: [
    #link("https://www.unige.ch/sciences/en/enseignements/formations/masters/excellencemasterfellowships/winners-2025")[#strong[Excellence Master Fellowship, University of Geneva]]
  ],
  right-content: [
    2025 – 2027
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Rodnye Goroda Scholarship]
  ],
  right-content: [
    2023 – 2024
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[JetBrains Scholarship, Neapolis University Pafos]
  ],
  right-content: [
    2022 – 2024
  ],
)
#one-col-entry(
  content: [
    
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #link("https://math.hse.ru/announcements/981291875.html")[#strong[Chebyshev Laboratory Travel Grant, Winter School in Mathematics and Theoretical Computer Science]]
  ],
  right-content: [
    2025
  ],
)
#one-col-entry(
  content: [
    
  ],
)



== Teaching Experience

#two-col-entry(
  left-content: [
    #strong[Sirius Educational Center], Teaching Assistant, #link("https://sochisirius.ru/obuchenie/nauka/smena1783/8258")[Groups of Intermediate Growth]

    
  ],
  right-content: [
    Sochi, Russia

Apr 2024 – May 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Mathematics and Computer Science Faculty Program for Prospective Students], Teaching Assistant, Braid and Knot Theory

    
  ],
  right-content: [
    Saint Petersburg, Russia

June 2023
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Laboratory for Continuous Mathematical Education], Mathematics Teacher for Gifted Students

    
  ],
  right-content: [
    Saint Petersburg, Russia

2021 – 2023
  ],
)



== Work Experience

#two-col-entry(
  left-content: [
    #strong[JetBrains], Research Intern, HoTT and Dependent Types Lab
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Designed and developed an MCP server for the Arend proof assistant, exposing typechecking and IDE functionality to AI coding agents.],[Integrated the MCP server with the Arend plugin for IntelliJ IDEA and built an experimental Arend coding agent using Koog.],[Fine-tuned models for Arend code completion.],)
  ],
  right-content: [
    Remote

Nov 2025 – Apr 2026
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[IPONWEB \(acquired by Criteo\)], Machine Learning Intern
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Reverse-engineered the behavior of a Criteo ML system that analyzes websites and produces word2vec representations; evaluated potential applications.],)
  ],
  right-content: [
    Pafos, Cyprus

May 2023 – Sept 2023
  ],
)



== Workshops, Service and Additional Information

#two-col-entry(
  left-content: [
    #link("https://icerm.brown.edu/program/topical_workshop/tw-26-thc")[#strong[Teaching Higher Category Theory with Computers]]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Funded participant.])], column-gutter: 0cm)
  ],
  right-content: [
    ICERM, Brown University, Providence, RI

Aug 2026
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[Academic Service and Outreach]

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([Organizer of the #link("https://indico.eimi.ru/category/102/")[Euler International Mathematical Institute Functional Analysis Seminar].],[Invited judge, Saint Petersburg Tournament of Young Mathematicians \(since 2021\) and International Tournament of Young Mathematicians \(2024, 2025\).],[#link("https://drive.google.com/file/d/1d4dqKrTKG6MI_cYQwnos8iDJWCuVIs4I/view")[Problem author], ITYM 2024; #link("https://eteam.tfjm.org/about-us-2025/")[Scientific Organizing Committee], ETEAM 2025.],)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[Additional Information]

    #v(-design-text-leading)
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Intel ISEF finalist \(2020\); English C1 \(IELTS 8.0/9, taken in 2020 and 2024\).])], column-gutter: 0cm)
  ],
)



