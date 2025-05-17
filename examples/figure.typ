#import "@preview/cetz:0.3.4"

= Figure Examples

== Basic Image Figures

// Basic figure with image
#figure(
  image("../figures/Business.jpg", width: 70%),
  caption: "Basic image figure with caption.",
) <basic-fig>

You can reference figures like this: @basic-fig

== Figure Alignment

// Left-aligned figure
#figure(
  align: left,
  image("../figures/Business.jpg", width: 40%),
  caption: "Left-aligned figure.",
)

Some text between figures to show text flow around left and right aligned figures.

// Right-aligned figure
#figure(
  align: right,
  image("../figures/Business.jpg", width: 40%),
  caption: "Right-aligned figure.",
)

#clearpage()

== Table Figures

// Table as a figure
#figure(
  table(
    columns: (auto, auto, auto),
    inset: 10pt,
    align: center,
    ["Name"], ["Value"], ["Description"],
    "Alpha", "10", "First value",
    "Beta", "20", "Second value",
    "Gamma", "30", "Third value",
  ),
  caption: "Table as a figure.",
) <table-fig>

See @table-fig for the data values.

== Code Block Figures

// Code block as a figure
#figure(
  ```python
  def hello_world():
      print("Hello, world!")
      return True
  ```
  ,
  caption: "Code example as a figure.",
) <code-fig>

== Diagram Figures

// Using CeTZ for diagrams
#figure(
  cetz.canvas({
    cetz.draw.rect((0,0), (4,3))
    cetz.draw.circle((2,1.5), 1)
  }),
  caption: "A simple diagram created with CeTZ.",
) <diagram-fig>

== Subfigures

// Multiple subfigures in a grid
#figure(
  grid(
    columns: 2,
    gutter: 1em,
    figure(
      image("../figures/Business.jpg", width: 100%),
      caption: "First subfigure",
    ),
    figure(
      image("../figures/Business.jpg", width: 100%),
      caption: "Second subfigure",
    ),
  ),
  caption: "A figure containing two subfigures.",
) <subfig>

== Custom Styling

// Custom styling for figures
#set figure(
  supplement: "Fig.",
  numbering: "I",
)

#figure(
  image("../figures/Business.jpg", width: 50%),
  caption: "Figure with custom styling.",
)

// Reset to default
#set figure(
  supplement: auto,
  numbering: "1",
)