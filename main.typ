#import "template.typ": project

#show: project.with(
  department: "Department of Computer Science",
  course_name: "Course Name",
  course_code: "Course Code",

  title: "Typst Template for ITU",

  authors: (
    (
      name: "Frederik Bjerre Bertelsen",
      email: "frbb@itu.dk",
    ),
  ),

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
#lorem(300)

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
