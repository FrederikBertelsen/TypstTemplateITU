#import "../template.typ": read-glossary-entries
#import "@preview/glossarium:0.5.6": register-glossary
#register-glossary(read-glossary-entries("glossary.yaml"))

#show ref: it => {
  let el = it.element
  if el != none and el.func() == figure and el.kind == "glossarium_entry" {
    // Make the glossarium entry references dark blue
    text(fill: blue.darken(60%), it)
  } else {
    // Other references as usual.
    it
  }
}