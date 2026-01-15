#import "../template_report_thesis.typ": report

#show: report.with(
  title: [Master Thesis Report],
  report-type: "internship",
  authors: (
    "John Doe",
  ),
  program: "2nd year of MSc in Electronics Industrial Engineering",
  supervisor: "Dr. Smith",
  tutor: "Prof. Johnson",
  uni-logo: image("ECAM_logo.jpg"),
  uni-institution: "Haute École ICHEC - ECAM - ISFSC",
  company-logo: image("ECAM_logo.jpg"),
  company-name: "Company name Inc.",
  company-location: "Company City, Country",
  period: (
    start: datetime(day: 1, month: 2, year: 2025),
    end: datetime(day: 30, month: 6, year: 2025),
  ),
  language: "en",
)

= Section
This is an example document to demonstrate the ECAM report template.

== Subsection
Here is some sample content for the subsection.
