
# ITU Typst Academic Document Template

A professionally formatted template for academic documents at the IT University of Copenhagen, built with [Typst](https://typst.app/).

[View example PDF output](main.pdf)

## Features

- Clean, modular code structure with consistent naming conventions
- ITU-compliant styling with proper branding
- Customizable title page with department, course information, and document type
- Authors and advisers sections with configurable column layout
- Automatic dynamic headers that adapt based on document structure
- Properly formatted abstract page
- Automatic table of contents
- Page numbering with Roman numerals for front matter and Arabic for main content
- Bibliography support
- Clean typography with the ITU-preferred Open Sans font

## Getting Started

1. **Font Installation**
   - The template uses Open Sans (ITU's logo font) for the title page
   - The template will fall back to system fonts if Open Sans isn't installed
   - Download from [Google Fonts](https://fonts.google.com/specimen/Open+Sans) if needed

2. **Configure your document**
   - Edit the project parameters in [`main.typ`](main.typ) to set your details:
     ```typst
     #show: project.with(
       department: "Department of Computer Science",
       course_name: "Course Name",
       course_code: "Course Code",
       document_type: "Document Type",
       title: "Your Document Title",
       authors: (...),
       max_author_columns: 2,
       advisers: (...),
       abstract: lorem(200),
     )
     ```

3. **Write your content**
   - Add your document content in [`main.typ`](main.typ) after the configuration
   - Use standard Typst syntax for formatting and references
   - Level 1 headings (`= Heading`) automatically create page breaks

## Template Components

The modular template separates functionality into clear components:

- `build_main_header` / `build_secondary_header` - Create page headers
- `create_dynamic_header` - Generates headers based on document position
- `create_title_page` - Formats the title page with all metadata
- `create_abstract_page` - Sets up the abstract with proper formatting
- `create_toc_page` - Generates the table of contents
- `setup_section_page_breaks` - Manages section-based page breaks

## Customization

The template provides several customization options:
- Configure multiple authors with `max_author_columns` 
- Add optional advisers with `max_adviser_columns`
- Customize department, course details, and document type
- Adjust logo size and placement
- Change the default font if needed
