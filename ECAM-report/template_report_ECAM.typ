// This function generates a report titlepage for ECAM Brussels Engineering School work reports.
#let report(
  title: [Report Title],
  // The course, lab, project name.
  course-name: [Course Name],
  // An array of authors. For each author you can specify a first name,
  // last name and matricule.
  authors: (
    (
      first-name: "",
      last-name: "",
      matricule: "",
    ),
  ),
  // University logo file path (as a `image` type).
  logo: image,
  // The language of the report. Supports "en" (English) and "fr" (French).
  language: "en",
  // The paper's content.
  body,
) = {
  // Set document metadata.
  set document(title: title)

  set text(font: "New Computer Modern", lang: language)
  set par(justify: true, leading: 0.5em, spacing: 1em)
  set list(indent: 10pt)
  set enum(indent: 10pt)
  set figure(supplement: "Figure")

  set align(center)

  v(1cm)

  {
    set image(width: 60%)
    logo
  }

  v(2cm)

  {
    set par(spacing: 0.5cm)
    line(length: 100%, stroke: 0.4pt + black)
    smallcaps(text(title, weight: "bold", size: 22pt))
    line(length: 100%, stroke: 0.4pt + black)
  }

  v(0.4cm)

  smallcaps(text(course-name, size: 18pt))

  v(1.5cm)

  {
    // create a table with first name, last name, matricule columns and one row per author
    show table.cell.where(y: 0): strong
    set text(size: 12pt)
    table(
      columns: (auto, auto, auto),
      column-gutter: 1.5em,
      row-gutter: 0.4em,
      stroke: none,
      table.header(
        text(if language == "en" { "First Name" } else { "Prénom" } + " :"),
        text(if language == "en" { "Last Name" } else { "Nom" } + " :"),
        [Matricule :],
      ),
      ..for author in authors {
        (
          table.cell(author.first-name),
          table.cell(author.last-name),
          table.cell(author.matricule),
        )
      },
    )
  }

  v(1fr)

  text("Haute École ICHEC - ECAM - ISFSC", size: 12pt, weight: "bold")

  // Academic year helper (rolls over in September)
  let academic-year() = {
    let now = datetime.today()
    let year-one = now.year() - if now.month() < 9 { 1 } else { 0 }
    let year-two = year-one + 1
    [Academic year #year-one -- #year-two]
  }
  text(academic-year(), size: 12pt)

  // Display the paper's contents.
  pagebreak(weak: true)
  set align(left)
  set page(numbering: "1")
  counter(page).update(1)
  body
}
