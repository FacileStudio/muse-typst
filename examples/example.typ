#import "../lib.typ": *

#show: muse-doc.with(
  title: "Document Title",
  subtitle: "Subtitle description",
  client: "Client Name",
  recipient: "Recipient",
  date: "August 2026",
  version: "1.0",
  author: "Facile Studio",
  doc-type: "Technical Report",
  status: "Draft",
  cover: true,
)

= Executive Summary

This is a generic technical document rendered with the Muse Typst design system adapter.

#v(4pt)

#metric-grid(
  columns: (1fr, 1fr, 1fr),
  metric("100%", "Coverage", sub: "Design token alignment", tone: "accent"),
  metric("< 0.5s", "Compile time", sub: "Fast PDF generation", tone: "neutral"),
  metric("0.1.0", "Release", sub: "Initial library cut", tone: "info"),
)

#v(8pt)

#alert([
  This is a status callout using the standard Muse token palette and semantic styling.
], tone: "info", title: "Information")

= 1. Core Principles

- Chroma-zero structure with semantic status tones.
- Component styling adhering to the Facile design contract.
- Pure Typst layout functions without external dependencies.
