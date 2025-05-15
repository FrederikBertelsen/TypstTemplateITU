
# ITU Typst Academic Document Template

A professionally formatted template for academic documents at the IT University of Copenhagen, built with [Typst](https://typst.app/).

[View example PDF output](main.pdf)

## Features

- ITU-compliant styling with proper branding
- Customizable title page with department, course information, and document type
- Authors and advisers sections with configurable column layout
- Automatic header generation based on document structure
- Properly formatted abstract page
- Automatic table of contents
- Bibliography support
- Page numbering with Roman numerals for front matter and Arabic for main content
- Clean typography with the ITU-preferred Open Sans font

## Getting Started

1. **Font Note**
   - Open Sans (ITU's logo font) is used for the title page
   - The template will fall back to alternative fonts if Open Sans isn't installed
   - Optional download: [Open Sans on Google Fonts](https://fonts.google.com/specimen/Open+Sans)

2. **Configure your document**
   - Edit the project parameters in `main.typ` to set your details:
     - Department
     - Course name/code
     - Document type (Thesis, Assignment, etc.)
     - Document title
     - Author information (supports multiple authors with configurable column layout)
     - Academic advisers (optional, with configurable column layout)
     - Abstract

3. **Write your content**
   - Add your document content in `main.typ` following the template structure
   - Use standard Typst syntax for formatting and references

## Template Structure

The template automatically handles:
- Dynamic headers that show current sections
- Proper page numbering (Roman for front matter, Arabic for content)
- First-line indentation for paragraphs
- Bibliography formatting

