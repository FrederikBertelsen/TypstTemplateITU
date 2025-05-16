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

  abstract: include "sections/0_abstract.typ",
)

// import sections
#include "sections/1_terms_abbreviations.typ"
#include "sections/2_introduction.typ"
#include "sections/3_background.typ"
#include "sections/4_analysis.typ"
#include "sections/5_discussion.typ"
#include "sections/6_conclusion.typ"
#include "sections/7_future_work.typ"

// Bibliography section
#pagebreak(weak: true)
#set page(header: [])
= Bibliography
#bibliography("bib.yaml", style: "apa", title: none)
