/**
 * Creates a centered main header with a horizontal line underneath.
 * @param mainHeadingContent - The content to display in the header
 */
#let buildMainHeader(mainHeadingContent) = {
  align(center, smallcaps(mainHeadingContent))
  line(length: 100%)
}

/**
 * Creates a header with main content on the left and secondary content (italicized) on the right.
 * @param mainHeadingContent - The primary heading content (left-aligned)
 * @param secondaryHeadingContent - The secondary heading content (right-aligned, italicized)
 */
#let buildSecondaryHeader(mainHeadingContent, secondaryHeadingContent) = {
  smallcaps(mainHeadingContent)
  h(1fr)
  emph(secondaryHeadingContent)
  line(length: 100%)
}

/**
 * Determines if a secondary heading appears after a main heading in the document flow.
 * Used to decide which heading to display in the header.
 * 
 * @param secondaryHeading - The secondary heading to check
 * @param mainHeading - The main heading to compare against
 * @returns boolean - True if secondary heading appears after main heading
 */
#let isAfter(secondaryHeading, mainHeading) = {
  let secHeadPos = secondaryHeading.location().position()
  let mainHeadPos = mainHeading.location().position()
  if secHeadPos.at("page") > mainHeadPos.at("page") {
    true
  } else if secHeadPos.at("page") == mainHeadPos.at("page") {
    secHeadPos.at("y") > mainHeadPos.at("y")
  } else {
    false
  }
}

/**
 * Dynamically generates the page header based on document headings.
 * 
 * Algorithm:
 * 1. Check if a level 1 heading exists on the current page
 * 2. If not, find the most recent level 1 heading
 * 3. Then check if there's a secondary heading after that main heading
 * 4. Construct appropriate header based on these findings
 * 
 * @returns The appropriate header content for the current page
 */
#let getHeader() = {
  let loc = here()
  // Try to use level 1 heading from current page if it exists
  let nextMainHeading = query(selector(heading).after(loc)).find(headIt => (
    headIt.location().page() == loc.page() and headIt.level == 1
  ))
  if (nextMainHeading != none) {
    buildMainHeader(nextMainHeading.body)
  } else {
    // Fall back to the most recent level 1 heading
    let lastMainHeading = query(selector(heading).before(loc)).filter(headIt => headIt.level == 1).last()
    
    // Find the most recent secondary heading
    let previousSecondaryHeadingArray = query(selector(heading).before(loc)).filter(headIt => headIt.level > 1)
    let lastSecondaryHeading = if (previousSecondaryHeadingArray.len() != 0) {
      previousSecondaryHeadingArray.last()
    } else {
      none
    }
    
    // Determine which header format to use based on heading positions
    if (lastSecondaryHeading != none and isAfter(lastSecondaryHeading, lastMainHeading)) {
      buildSecondaryHeader(lastMainHeading.body, lastSecondaryHeading.body)
    } else {
      buildMainHeader(lastMainHeading.body)
    }
  }
}

/**
 * Main project template function that defines the document structure.
 * Creates a complete academic paper with title page, abstract, TOC, and formatted body.
 *
 * @param logo - Path to main logo image
 * @param logo_width - Width of the main logo (as percentage)
 * @param logo_small - Path to small logo variant
 * @param department - Department name
 * @param course_name - Name of the course
 * @param course_code - Course code identifier
 * @param title - Document title
 * @param abstract - Content for the abstract section
 * @param authors - Array of author objects with name and email fields
 * @param font - Font family to use (defaults to "New Computer Modern")
 * @param body - The main content of the document
 */
#let project(
  logo: "logo/logo.svg",
  logo_width: 80%,
  logo_small: "logo/logo_small.png",
  department: none,
  course_name: none,
  course_code: none,
  title: "",
  abstract: [],
  authors: (),
  font: "New Computer Modern",
  body,
) = {
  // Configure document metadata and basic styling
  set document(author: authors.map(a => a.name), title: title)
  show math.equation: it => set text(weight: 400)
  set heading(numbering: "1.1")
  set par(justify: true)

  v(0.03fr)

  set text(font: ("Open Sans", font), lang: "en")

  // Display institution logo
  if logo != none {
    align(center, image(logo, width: logo_width))
  }

  // Format department and course information
  if department != none {
    align(center, text(1.6em, department))
  }
  
  // Build course display string with appropriate fallbacks
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
      v(-0.5em)  // Reduce spacing if department is also present
    }
    align(center, text(1.6em, course))
  }

  v(0.1fr)

  set text(font: font, lang: "en")

  // Title page content
  align(center, text(3em, weight: "bold", title))

  align(center, text(1.2em, "By"))
  
  // Format and display author information
  pad(
    top: 0.7em,
    grid(
      columns: 1fr,
      gutter: 1em,
      ..authors.map(author => align(
        center,
        text(1.6em, [
          *#author.name* \
          #author.email \
        ]),
      ))
    ),
  )
  v(0.2fr)

  set text(font: "New Computer Modern", lang: "en")

  pagebreak()

  // Abstract page with Roman numeral pagination
  set page(numbering: "I", number-align: center, margin: 10em)
  v(1fr)
  align(center, heading(outlined: false, numbering: none, text(0.85em, smallcaps[Abstract])))
  abstract
  v(1.618fr)  // Golden ratio spacing

  // Table of contents with reset page counter
  counter(page).update(1)
  pagebreak()

  outline(depth: 3)
  pagebreak()

  // Main document body with Arabic numeral pagination
  set page(numbering: "1", number-align: center, margin: auto)
  set par(first-line-indent: 20pt)
  set page(header: context getHeader())
  counter(page).update(1)
  body
}