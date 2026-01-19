
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Artem Semidetnov"
#let locale-catalog-page-numbering-style = context { "Artem Semidetnov - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Jan 2025"
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
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0.2cm
#let design-page-top-margin = 2cm
#let design-page-bottom-margin = 2cm
#let design-page-left-margin = 2cm
#let design-page-right-margin = 2cm
#let design-page-show-last-updated-date = true
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
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)Geneve, Switzerland],
  [#box(original-link("mailto:artemsemidetnov@gmail.com")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)artemsemidetnov\@gmail.com])],
)
#connections(connections-list)



== Education

// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[BSc]],
  middle-content: [
    #strong[Saint-Petersburg State University], Mathematics
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
    #strong[Neapolis University Of Pafos], Applied Computer Science JetBrains Program
  ],
  right-content: [
    2022 – 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[MSc]],
  middle-content: [
    #strong[Geneva University], Mathematics
  ],
  right-content: [
    2025 – 2027
  ],
)



== Work Experience

#two-col-entry(
  left-content: [
    #strong[JetBrains], Research Intern in HoTT and Dependent Types Lab

    
  ],
  right-content: [
    Remote

Nov 2025 – present
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[JetBrains], Research Intern in HoTT and Dependent Types Lab
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([I was developing the official library in the Arend language. I formalized different results in algebra and homotopy type theory, including following.],[Formalized Eckmann-Hilton argument, Eilenberg-Maclane spaces, Homologies of types.],[Formalized automorphisms of groups, Schur's Lemma, Maschke's Lemma, Group actions characterizations. \(Some of these results are in the #link("https://arend-lang.github.io/2024/07/05/Arend-1.10.0-released.html")[1.10 release]\).],)
  ],
  right-content: [
    Pafos, Cyprus

June 2024 – Sept 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[IPONWEB \(acquired by Criteo\)], Machine Learning Intern
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Criteo has a ML tool that analyzes sites and produces word-2-vec representations. In IPONWEB I was trying to reverse-engineer the behaviour of this tool and analyze its possible applications.],)
  ],
  right-content: [
    Pafos, Cyprus

May 2023 – Sept 2023
  ],
)



== Publications

#two-col-entry(
  left-content: [
    #link("https://arxiv.org/pdf/2106.00095")[#strong[On the geometry of free nilpotent groups]]

  ],
  right-content: [
    May 2021
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);#strong[#emph[Artem Semidetnov]], Ruslan Magdiev

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/https://doi.org/10.48550/arXiv.2106.00095")[https://doi.org/10.48550/arXiv.2106.00095]])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #link("https://arxiv.org/pdf/2512.14498")[#strong[The operad associated to a crossed simplicial group]]

  ],
  right-content: [
    Dec 2025
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);#strong[#emph[Artem Semidetnov]]

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/https://doi.org/10.48550/arXiv.2512.14498")[https://doi.org/10.48550/arXiv.2512.14498]])



== Awards and Scholarships

#one-col-entry(
  content: [Scholarship by \"Rodnye Goroda\" \(a social investment program of PJSC \"Gazprom neft\"\), 2023-2024]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [JetBrains Scholarship in Neapolis University]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [Travel grant of Chebyshev laboratory for #link("https://math.hse.ru/announcements/981291875.html?_r=27960661733829961.43133&t=8136581&r=OK")[Winter student school in mathematics and CS of HSE and MCS], Moscow]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#link("https://www.unige.ch/sciences/en/enseignements/formations/masters/excellencemasterfellowships/winners-2025")[Excellence Master Fellowship at Geneva University]]
)


== Teaching Experience

#two-col-entry(
  left-content: [
    #strong[Sirius educational center], Teaching assistant on the course #link("https://sochisirius.ru/obuchenie/nauka/smena1783/8258")[\"Groups of intermediate growth\"]

    
  ],
  right-content: [
    Sochi, Russia

Apr 2024 – May 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Laboratory for continuous mathematical education], mathematics teacher for gifted students

    
  ],
  right-content: [
    Saint-Petersburg, Russia

2021 – 2023
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Mathematics and Computer Science faculty program for prospective students], Teaching assistant on the course Braid and knot theory

    
  ],
  right-content: [
    Saint-Petersburg, Russia

June 2023
  ],
)



== Selected Talks

#two-col-entry(
  left-content: [
    #strong[On the geometry of free nilpotent groups]
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Siberian summer conference],)
  ],
  right-content: [
    Novosibirsk, Russia

2021
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #link("https://m.mathnet.ru/php/seminars.phtml?option_lang=rus&presentid=34355")[#strong[\"On the Poisson boundary of lamplighter groups\"]]
  ],
  right-content: [
    Saint-Petersburg, Russia
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
    #link("https://disk.yandex.ru/i/52gkQhVjjRravA")[#strong[\"Twisting numbers on braid and Thompson’s groups\"]]
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Topological Methods in Dynamics and Related Topics VII],)
  ],
  right-content: [
    N.Novgorod, Russia

2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #link("https://cs.hse.ru/mirror/pubs/share/1075346122")[#strong[\"Plus construction and simplicial methods\"]]
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([#link("https://cs.hse.ru/ata-lab/atgcda25")[Conference \"Algebraic Topology, geometry, combinatorics, and data analysis\"]],)
  ],
  right-content: [
    Pushkin, Russia

Aug 2025
  ],
)



== Miscellaneous

#one-col-entry(
  content: [- Finalist of 2020 Intel ISEF],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Intel ISEF alumni],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Winner of 2019 Baltic SEF, PDMI special prize in 2019 Baltic SEF],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- 3rd team place in 2019 #link("https://www.itym.org")[International Tournament of Young Mathematicians] in Barcelona, Spain],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Organizer of the #link("https://indico.eimi.ru/category/102/")[Euler International Mathematical Institute's functional analysis seminar]],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- English level C1 \(IELTS 8.0/9, taken in 2020, 2024\)],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Invited judge in Saint-Petersburg Tournament of Young Mathematicians \(since 2021\)],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Created mathematical problem for 2024 International Tournament of Young Mathematicians #link("https://drive.google.com/file/d/1d4dqKrTKG6MI_cYQwnos8iDJWCuVIs4I/view")[10th in here]],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Invited judge in International Tournament of Young Mathematicians 2024, 2025],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #link("https://eteam.tfjm.org/about-us-2025/")[A member of Scientific Organization Committee in ETEAM 2025]],
)


