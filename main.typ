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


= Terms and Abbreviations


= Introduction
#lorem(400) @feminism

== Motivation
#lorem(200) @dependence

== Research Questions
#lorem(20)
#list(
  "What is the impact of X on Y?",
  "How does A affect B?",
  "What are the implications of C for D?",
)


= Background
#lorem(100)
== Related Work
#lorem(100)

== More related work
#lorem(100)
#figure(
  image("Business.jpg", width: 70%),
  caption: "Serious Business.",
)

= Analysis
#lorem(700)

= Discussion
#lorem(20)
#parbreak()
#lorem(500)

= Conclusion
#lorem(150)
#lorem(150)

= Future Work
#lorem(300)

// Bibliography section
#pagebreak(weak: true)
#set page(header: [])
= Bibliography
#bibliography("bib.yaml", style: "apa", title: none)
