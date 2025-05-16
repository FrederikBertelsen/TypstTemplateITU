#import "template.typ": project

#show: project.with(
  department: "Department of Computer Science",
  course_name: "Course Name",
  course_code: "Course Code",
  document_type: "Document Type",

  title: "A Typst Template for ITU",

  authors: (
    (
      name: "John Smith",
      email: "josm@itu.dk",
    ),
    (
      name: "Jane Doe",
      email: "jado@itu.dk",
    ),
    (
      name: "James Johnson",
      email: "jajo@itu.dk",
    ),
    (
      name: "Jennifer Brown",
      email: "jebr@itu.dk",
    ),
  ),
  max_author_columns: 2,

  advisers: (
    (
      name: "Dr. Jane Smith",
      email: "jsmi@itu.dk",
    ),
    (
      name: "Prof. John Doe",
      email: "jdoe@itu.dk",
    ),
    (
      name: "Prof. Robert Wilson",
      email: "rowi@itu.dk",
    ),
  ),
  max_adviser_columns: 3,

  abstract: lorem(200),
)

= Terms & Abbreviations


= Introduction
#lorem(400) @feminism

== Motivation
#lorem(300) @dependence

== Research Questions
#lorem(200)
#parbreak()
#list(
  lorem(10),
  lorem(15),
  lorem(20),
  lorem(7),
  lorem(18),
  lorem(22),
  lorem(10),
)


= Background
#lorem(200)
== Related Work
#lorem(500)

== More related work
#lorem(100)
#figure(
  image("Business.jpg", width: 70%),
  caption: "Serious Business.",
)

= Analysis
#lorem(150)
#parbreak()
#lorem(150)
#parbreak()
#lorem(200)

= Discussion
#lorem(100)
#parbreak()
#lorem(500)


= Conclusion
#lorem(150)
#parbreak()
#lorem(150)

= Future Work
#lorem(50)
#parbreak()
#lorem(60)
#parbreak()
#lorem(40)
#parbreak()
#lorem(70)

// Bibliography section
#pagebreak(weak: true)
#set page(header: [])
= Bibliography
#bibliography("bib.yaml", style: "apa", title: none)
