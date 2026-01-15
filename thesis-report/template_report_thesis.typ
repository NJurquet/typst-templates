// This function generates a thesis titlepage for internship or thesis reports.
#let report(
  title: [Report Title],
  // The type of report. Either "thesis" or "internship". Default is "thesis".
  report-type: "thesis",
  // An array of authors name.
  authors: (),
  // Student program and year (e.g., "2nd year MSc in Industial Engineering").
  program: "",
  // Company thesis supervisor name.
  supervisor: "",
  // University tutor name.
  tutor: "",
  // University logo file path (as a `image` type).
  uni-logo: image,
  // If university is part of a larger institution, you can add its name here.
  uni-institution: "",
  // Company logo file path (as a `image` type).
  company-logo: image,
  // Company name.
  company-name: "",
  // Company location.
  company-location: "",
  // Period of the internship/thesis.
  period: (
    // Start date.
    start: datetime,
    // End date.
    end: datetime,
  ),
  // The language of the report. Supports "en" (English) and "fr" (French).
  language: "en",
  // The paper's content.
  body,
) = {
  // Set document metadata.
  set document(title: title, author: authors)

  show heading: set block(above: 1.5em, below: 0.8em)
  set text(font: "New Computer Modern", lang: language, size: 14pt, weight: "medium")
  set par(justify: true, leading: 0.5em, spacing: 1em)
  set list(indent: 10pt)
  set enum(indent: 10pt)
  set figure(supplement: "Figure")
  set align(center)

  v(1cm)

  {
    set image(width: 50%)
    uni-logo
  }

  v(0.4cm)

  // Title with horizontal lines above and below
  {
    set par(spacing: 0.5cm)
    line(length: 100%, stroke: 0.4pt + black)
    smallcaps(text(title, weight: "bold", size: 22pt))
    line(length: 100%, stroke: 0.4pt + black)
  }

  v(0.5cm)

  // Authors information
  text(if language == "en" { "Presented by" } else { "Présenté par" })
  linebreak()
  for author in authors {
    text(author)
    linebreak()
  }

  v(0.6cm)

  // Program information
  if program != "" {
    text(if language == "en" { "Student in" } else { "Étudiant en" })
    linebreak()
    text(program, weight: "bold")
    v(0.6cm)
  }

  // Master thesis / Internship context
  text(
    if language == "en" {
      (
        "In the context of the "
          + { if report-type == "thesis" { "Master's Thesis" } else { "Internship" } }
          + " carried out at"
      )
    } else {
      (
        "Dans le cadre du " + { if report-type == "thesis" { "TFE" } else { "stage" } } + " réalisé au sein de"
      )
    },
  )

  v(0cm)

  // Company logo and name
  {
    set image(height: 2.5cm)
    company-logo
    text(company-name, weight: "bold")
  }

  v(0cm)

  // Location & period information
  text(
    if language == "en" { "in " } else { "à " } + company-location,
  )
  linebreak()
  text(if language == "en" { "from " } else { "du " })
  period.start.display("[day] [month repr:short] [year]")
  text(if language == "en" { " to " } else { " au " })
  period.end.display("[day] [month repr:short] [year]")

  v(1cm)

  // Supervisor and tutor information
  text(
    if report-type == "thesis" {
      if language == "en" { "Promoter:" } else { "Promoteur :" }
    } else {
      if language == "en" { "Supervisor:" } else { "Superviseur :" }
    },
  )
  h(1fr)
  text(if language == "en" { "Tutor:" } else { "Tuteur :" })
  linebreak()
  text(supervisor)
  h(1fr)
  text(tutor)

  v(1fr)

  if uni-institution != "" { text(uni-institution, weight: "bold") }

  parbreak()

  // Academic year helper (rolls over in September)
  let academic-year() = {
    let now = datetime.today()
    let year-one = now.year() - if now.month() < 9 { 1 } else { 0 }
    let year-two = year-one + 1
    return [Academic year #year-one -- #year-two]
  }
  text(academic-year())

  // Display the paper's contents.
  pagebreak(weak: true)
  set text(size: 11pt)
  set align(left)
  set page(numbering: "1")
  counter(page).update(1)
  body
}
