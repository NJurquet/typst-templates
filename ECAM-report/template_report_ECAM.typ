// This function generates a report titlepage for ECAM Brussels Engineering School work reports.
#let report(
  title: [Report Title],
  // The course, lab, project name.
  course-name: [Course Name],
  // An array of authors. For each author you can specify a first name,
  // last name and matricule (optional).
  authors: (
    (
      first-name: "",
      last-name: "",
      matricule: none,
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

  set text(lang: language)
  set par(justify: true, leading: 0.5em, spacing: 1em)
  set list(indent: 10pt)
  set enum(indent: 10pt)
  set figure(supplement: "Figure")

  set align(center)

  v(1cm)

  let img = {
    set image(width: 60%)
    logo
  }
  img

  v(3cm)

  smallcaps(text(title, weight: "bold", size: 2em))

  // Display the paper's contents.
  pagebreak(weak: true)
  set align(left)
  set page(numbering: "1")
  counter(page).update(1)
  body
}
