# ECAM Report Template

A clean and professional report titlepage template for ECAM Brussels Engineering School reports.

## Usage

You can use this template by simply downloading the [`template_report_ECAM.typ`](template_report_ECAM.typ) file and including it in your Typst project with the following line at the beginning of your document:

```typ
#import "template_report_ECAM.typ": report
```

> [!NOTE]
> Make sure to set the university logo image to the one you want.
> ECAM's logo is provided in the [`example`](example) folder as `ECAM_logo.jpg`.

## Configuration

This template exports the `report` function with the following named arguments:

-   `title`: The title of the report.
-   `course-name`: The name of the course, lab, project, etc.
-   `authors`: An array of authors, each represented by a `first-name`, `last-name`, and `matricule`.
-   `logo`: The image element with the path to the university logo.
-   `language`: The language of the report, either `"en"` for English or `"fr"` for French. Default is `"en"`.

Initializing the report template with those arguments is done using a `#show` rule with the `with` method, as shown in the example below:

```typ
#import "template_report_ECAM.typ": report

#show: report.with(
  title: [Report Title],
  course-name: [Course Name],
  authors: (
    (
      first-name: "John",
      last-name: "Doe",
      matricule: "12345",
    ),
    (
      first-name: "Jane",
      last-name: "Doe",
      matricule: "67890",
    ),
  ),
  logo: image("ECAM_logo.jpg"),
  language: "en",
)

// Your content goes below.
```
