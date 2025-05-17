= Table Examples

== Basic Tables

// Simple table using the built-in table function
#table(
  columns: (1fr, auto, auto),
  inset: 10pt,
  align: center,
  [*Name*], [*Age*], [*Role*],
  [Alice], [28], [Designer],
  [Bob], [34], [Developer],
  [Charlie], [45], [Manager],
)

== Table Styling

// Table with custom styling
#table(
  columns: (1fr, auto, auto),
  inset: 8pt,
  fill: (_, row) => if row == 0 { rgb("#dfebf6") } else if calc.odd(row) { rgb("#f7f7f7") } else { white },
  stroke: 0.7pt + rgb("#5c8db7"),
  [*Product*], [*Price*], [*Quantity*],
  [Laptop], [$999], [5],
  [Mouse], [$25], [10],
  [Keyboard], [$85], [7],
  [Monitor], [$249], [3],
)

== Column Sizing

// Control column widths
#table(
  columns: (30%, 40%, 30%),
  inset: 10pt,
  [*Column 1*], [*Column 2*], [*Column 3*],
  [This is some text in the first column],
  [This column is wider and has more space for content],
  [Back to a narrower column],
)
