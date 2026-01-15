# Thesis / Internship Report Template

A clean and professional thesis or internship report titlepage template.

## Usage

You can use this template by simply downloading the [`template_report_thesis.typ`](template_report_thesis.typ) file and including it in your Typst project with the following line at the beginning of your document:

```typ
#import "template_report_thesis.typ": report
```

> [!NOTE]
> Make sure to set the university and company logo image to the one you want.
> ECAM's logo is provided in the [`example`](example) folder as `ECAM_logo.jpg`.

## Configuration

This template exports the `report` function with the following named arguments:

-   `title`: The title of the report.
-   `report-type`: The type of the report, either `"thesis"` or `"internship"`. Default is `"thesis"`.
-   `authors`: An array of authors names.
-   `program`: Student program and year (e.g., "2nd year MSc in Industial Engineering").
-   `supervisor`: Company thesis supervisor name.
-   `tutor`: University tutor name.
-   `uni-logo`: The image element with the path to the university logo.
-   `uni-institution`: If university is part of a larger institution, you can add its name here.
-   `company-logo`: The image element with the path to the company logo.
-   `company-name`: The name of the company.
-   `company-location`: Company location.
-   `period`: Period of the internship/thesis. Provide `start` and `end` `datetime` elements.
-   `language`: The language of the report, either `"en"` for English or `"fr"` for French. Default is `"en"`.

Initializing the report template with those arguments is done using a `#show` rule with the `with` method, as shown in the example below:

```typ
#import "template_report_thesis.typ": report

#show: report.with(
  title: [Report Title],
  report-type: "thesis",
  authors: (
    "Author One",
    "Author Two",
  ),
  program: "2nd year of MSc in Industrial Engineering",
  supervisor: "Dr. Smith",
  tutor: "Prof. Johnson",
  uni-logo: image("ECAM_logo.jpg"),
  uni-institution: "Higher Institution Name",
  company-logo: image("ECAM_logo.jpg"),
  company-name: "Company name Inc.",
  company-location: "Company City, Country",
  period: (
    start: datetime(day: 1, month: 2, year: 2025),
    end: datetime(day: 30, month: 6, year: 2025),
  ),
  language: "en",
)

// Your content goes below.
```
