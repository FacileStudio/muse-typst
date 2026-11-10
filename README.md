# muse-typst

Typst adaptation of the Facile Studio design system (Muse).

It exports tokens, layout utilities, cards, callouts, metric blocks, badges, tables, and document templates to compile PDFs aligned with the studio visual identity.

## Features

- Exact Muse OKLCH-mapped token palette (chroma-zero neutral structure, semantic status tones, chart slots).
- Clean typographical hierarchy with system fonts and tight tracking.
- Pre-built components: metric cards, status badges, alert callouts, step workflows, and member cards.
- Complete document layout template with automatic running headers, footers, and cover page.

## Usage

Import the library in your `.typ` document:

```typst
#import "../lib.typ": *

#show: muse-doc.with(
  title: "Document Title",
  subtitle: "Subtitle description",
  client: "Client Name",
  recipient: "Recipient",
  date: "August 2026",
  version: "1.0",
)

= 1. Introduction

#metric("100%", "Status", sub: "Operational")

#alert([
  This is a critical note about project scope.
], tone: "warning", title: "Notice")
```

`muse-doc` prints `Facile Studio · Document de cadrage confidentiel` at the left of every footer.
Pass `footer: [Other text]` to change it, or `footer: none` to keep only the page number.

## Compilation

Compile using `mise` or the `typst` CLI:

```bash
mise run build
# or
typst compile --root . examples/example.typ examples/example.pdf
```
