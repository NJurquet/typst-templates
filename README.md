# typst-templates

This repository contains some custom non-published templates for [**Typst**](https://typst.app/), the new modern open source foundation for document creation.

## Structure

Each template lives in its own directory and includes:

-   `template.typ`: the main file to import into your document.
-   A `.png` preview showing an example of the template in use.
-   `README.md`: instructions for usage, options, and any prerequisites.
-   `example/`: a minimal working example with `main.typ` and any required assets (e.g., images).

## Usage

To use a template, simply copy the `template.typ` file into your Typst project and import it at the beginning of your document.
Refer to the individual template's `README.md` for specific instructions and options.

```typ
#import "path/to/template.typ": template

#show: template.with(
    argument1: [value1],
    argument2: [value2a, value2b],
    argument3: [value3],
)

= Section
This is where your content begins.

== Subsection
Some text.
```
