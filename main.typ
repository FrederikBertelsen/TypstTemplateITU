#import "template.typ": project, read-glossary-entries, read-glossary-entries
#import "@preview/glossarium:0.5.6": *
#show: make-glossary
#register-glossary(read-glossary-entries("glossary.yaml"))

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
  author_columns: 2,

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
  adviser_columns: 3,

  abstract: include "sections/0_abstract.typ",
)



// import sections from the sections folder
#include "sections/1_introduction.typ"
#include "sections/2_background.typ"
#include "sections/3_analysis.typ"
#include "sections/4_discussion.typ"
#include "sections/5_conclusion.typ"
#include "sections/6_future_work.typ"



// Back matter
#set page(header: [])

// Glossary section
#pagebreak(weak: true)
= Glossary
#print-glossary(
  read-glossary-entries("glossary.yaml"),
  show-all: true, // enable this to show all entries
)

// Bibliography section
#pagebreak(weak: true)
= Bibliography
#bibliography(
  "bib.yaml",
  style: "ieee",
  title: none,
  full: true, // enable this to show all references
)
