#let build_main_header(content) = {
  align(center, smallcaps(content))
  line(length: 100%)
}

#let build_secondary_header(main_content, secondary_content) = {
  smallcaps(main_content)
  h(1fr)
  emph(secondary_content)
  line(length: 100%)
}

#let is_after(secondary_heading, main_heading) = {
  let sec_pos = secondary_heading.location().position()
  let main_pos = main_heading.location().position()

  if sec_pos.at("page") > main_pos.at("page") {
    true
  } else if sec_pos.at("page") == main_pos.at("page") {
    sec_pos.at("y") > main_pos.at("y")
  } else {
    false
  }
}

#let create_dynamic_header() = {
  let loc = here()

  // Try to use level 1 heading from current page
  let next_main_heading = query(selector(heading).after(loc)).find(h => (
    h.location().page() == loc.page() and h.level == 1
  ))

  if next_main_heading != none {
    build_main_header(next_main_heading.body)
  } else {
    // Fall back to most recent level 1 heading
    let last_main_heading = query(selector(heading).before(loc)).filter(h => h.level == 1).last()

    // Find most recent secondary heading
    let previous_secondary_headings = query(selector(heading).before(loc)).filter(h => h.level > 1)

    let last_secondary_heading = if previous_secondary_headings.len() != 0 {
      previous_secondary_headings.last()
    } else {
      none
    }

    // Choose header format based on heading positions
    if last_secondary_heading != none and is_after(last_secondary_heading, last_main_heading) {
      build_secondary_header(last_main_heading.body, last_secondary_heading.body)
    } else {
      build_main_header(last_main_heading.body)
    }
  }
}

#let create_footer(logo_small, show_page_total: true) = {
  line(length: 100%)
  place(center + horizon)[
    #text(
      1.2em,
      counter(page).display(
        "1 / 1",
        both: show_page_total,
      ),
    )
  ]
  place(right + horizon, image(logo_small, width: 10%))
}

// Document component functions
#let setup_section_page_breaks(body) = {
  let section_counter = counter("section-counter")

  show heading: it => {
    if it.level == 1 {
      let count = section_counter.get().at(0, default: 0)
      section_counter.step()

      if count > 0 {
        pagebreak(weak: true)
      }

      it
    } else {
      it
    }
  }

  body
}

#let create_title_page(
  logo,
  logo_width,
  department,
  course_name,
  course_code,
  document_type,
  title,
  authors,
  max_author_columns,
  advisers,
  max_adviser_columns,
  font,
  date,
) = {
  v(1em)
  set text(font: ("Open Sans", font), lang: "en")

  // Logo
  if logo != none {
    align(center, image(logo, width: logo_width))
  }

  // Department and course information
  if department != none {
    align(center, text(1.4em, department))
  }

  let course = if course_name != none and course_code != none {
    course_name + " - " + course_code
  } else if course_code != none {
    course_code
  } else if course_name != none {
    course_name
  } else {
    ""
  }

  if course != "" {
    if department != none {
      v(-0.5em)
    }
    align(center, text(1.4em, course))
  }

  v(4em)
  set text(font: font, lang: "en")

  // Document type and title
  if document_type != none {
    align(center, text(1.6em, document_type))
    v(1em)
  } else {
    v(4em)
  }

  align(center, text(2.6em, weight: "bold", title))

  // Authors section
  align(
    center,
    [
      #line(length: 60%, stroke: 0.5pt + gray)
      #v(1em)
      #text(1.2em, smallcaps[Authors])
      #v(1em)
    ],
  )

  let author_columns = calc.min(max_author_columns, authors.len())
  grid(
    columns: (1fr,) * author_columns,
    gutter: 2em,
    ..authors.map(author => align(
      center,
      text(
        1.2em,
        [
          *#author.name* \
          #author.email
        ],
      ),
    ))
  )

  v(8em)

  // Advisers section (if any)
  if advisers.len() > 0 {
    align(center, text(1.2em, "Advised by"))
    v(0.8em)

    let adviser_columns = calc.min(max_adviser_columns, advisers.len())
    grid(
      columns: (1fr,) * adviser_columns,
      gutter: 2em,
      ..advisers.map(adviser => align(
        center,
        text(
          1.2em,
          [
            *#adviser.name* \
            #adviser.email
          ],
        ),
      ))
    )
  }

  v(8em)
  align(center, text(1.2em, date))

  pagebreak()
}

#let create_abstract_page(abstract) = {
  set page(numbering: "I", number-align: center, margin: 10em)
  v(1fr)
  align(center, heading(outlined: false, numbering: none, text(0.85em, smallcaps[Abstract])))
  abstract
  v(1.618fr)

  counter(page).update(1)
  pagebreak()
}

#let create_toc_page() = {
  outline(depth: 3)
  pagebreak()
}

// Main project function
// This function is the main entry point for the document template.
#let project(
  logo: "logo/logo.svg",
  logo_width: 70%,
  logo_small: "logo/logo_small.png",
  document_type: none,
  department: none,
  course_name: none,
  course_code: none,
  title: "",
  abstract: [],
  authors: (),
  max_author_columns: 3,
  advisers: (),
  max_adviser_columns: 3,
  font: "New Computer Modern",
  show_page_total: true,
  date: datetime.today().display("[month repr:long] [day], [year]"),
  body,
) = {
  // Document metadata and basic styling
  set document(author: authors.map(a => a.name), title: title)
  show math.equation: it => set text(weight: 400)
  set heading(numbering: "1.1")
  set par(justify: true)

  // Create title page
  create_title_page(
    logo,
    logo_width,
    department,
    course_name,
    course_code,
    document_type,
    title,
    authors,
    max_author_columns,
    advisers,
    max_adviser_columns,
    font,
    date,
  )

  // Create abstract page
  create_abstract_page(abstract)

  // Create table of contents
  create_toc_page()

  // Configure main content
  set par(first-line-indent: 20pt)
  set page(
    header: context create_dynamic_header(),
    footer: context create_footer(logo_small, show_page_total: show_page_total),
  )


  counter(page).update(1)

  // Apply section page breaks and render body
  setup_section_page_breaks(body)
}
