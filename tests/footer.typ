#import "../lib.typ": *

#let mode = sys.inputs.at("footer", default: "default")

#let doc = if mode == "none" {
  muse-doc.with(title: "Footer test", cover: false, footer: none)
} else if mode == "custom" {
  muse-doc.with(title: "Footer test", cover: false, footer: [Custom footer])
} else {
  muse-doc.with(title: "Footer test", cover: false)
}

#show: doc

= Footer

The footer mode is #mode.
