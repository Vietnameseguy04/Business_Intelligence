// ================================ //
//         CONFIGURATION            //
// Edit this file to customise the  //
// template for your document.      //
// ================================ //

// ---- Language ---- //
// Options: "DE", "EN"
#let lang = "DE"

// ---- Document type ---- //
// Options: "project", "project-doc", "term-paper", "bachelor", "seminar"
#let doc-type = "seminar"

#assert(
  ("seminar", "project", "project-doc", "term-paper", "bachelor").contains(doc-type),
  message: "config.typ: doc-type must be one of: project, project-doc, term-paper, bachelor, seminar",
)

// ---- Show confidentiality notice ---- //
#let show-confidentiality-notice = false

// ---- Show company supervisor on title page ---- //
#let show-company-supervisor = false

// ---- Document metadata ---- //
#let config = (
  doc-type:          doc-type,
  title:             "Operationelles IBCS-Dashboard mit Power BI",
  subtitle:          "Projektcontrolling eines Kameraproduzenten",
  author:            "Anton Nguyen",
  mat-number:        "5282932",
  course:            "WWIBE224",
  study-program:     "Wirtschaftsinformatik - Business Engineering",
  company:           "SAP SE, 88677 Markdorf",
  company-supervisor:"[Projektbetreuer]",
  supervisor:        "Prof. Dr. Kirchberg",
  submission-date:   "27.11.2026",

  // Seminar paper only
  lecture:           "Business Intelligence (BI)",

  // Project work only
  project-number:    "1",   // 1, 2
)
