/// Renders the appendix with custom sections and the AI tools table.
/// - labels (dict): UI label dictionary
/// -> none
#let appendix(labels: (:)) = {
  import "../user/ai-tools.typ": ai-tools

  [
    #heading(level: 1, numbering: none)[#labels.appendix]
    // ---- A1: Datenstrukturen ---- //
    #heading(level: 2, numbering: none)[A1: Verwendete Datenstrukturen]

    #figure(
      kind: table,
      supplement: labels.supplement-table,
      caption: [Übersicht der verwendeten Tabellen und ihrer Funktion im Datenmodell],
      table(
        columns: (3.8cm, 1fr),
        stroke: 0.5pt,
        inset: (x: 6pt, y: 5pt),
        align: (left + top, left + top),
        table.header(
          strong[Tabelle],
          strong[Funktion],
        ),
        [tbl\_Projekte],    [Stammdaten und Status der Projekte],
        [tbl\_Kosten],      [Plan-, Ist- und Forecast-Kosten],
        [tbl\_Kostenarten], [Zuordnung der Kostenarten],
        [tbl\_Meilensteine],[Projektmeilensteine und Termine],
        [tbl\_Projektleiter],[Zuordnung der Projektleiter],
        [tbl\_Ressourcen],  [Geplante und tatsächliche Ressourcen],
        [tbl\_Risiken],     [Projektrisiken],
        [tbl\_Szenarien],   [Plan-/Ist-/Forecast-Szenarien],
        [Kalender],         [Zeitliche Zuordnung und Auswertung],
      ),
    ) <tab-datenstrukturen>

    // ---- A2: Excel-Tabellenstruktur ---- //
    #heading(level: 2, numbering: none)[A2: Tabellenstruktur der Excel-Ausgangsdatenbasis]

    Die folgenden Abbildungen zeigen die Spaltenstruktur der neun Tabellenblätter der synthetischen Excel-Ausgangsdatenbasis der CamTech GmbH (jeweils Kopfzeile und Beispieldaten).

    #v(0.4em)
    *tbl\_Projekte*
    #image("../images/excel-tbl-projekte.png", width: 100%)
    #v(0.6em)
    *tbl\_Kosten*
    #image("../images/excel-tbl-kosten.png", width: 100%)
    #v(0.6em)
    *tbl\_Kostenarten*
    #image("../images/excel-tbl-kostenarten.png", width: 60%)
    #v(0.6em)
    #pagebreak()
    *tbl\_Meilensteine*
    #image("../images/excel-tbl-meilensteine.png", width: 100%)
    #v(0.6em)
    *tbl\_Projektleiter*
    #image("../images/excel-tbl-projektleiter.png", width: 60%)
    #v(0.6em)
    *tbl\_Ressourcen*
    #image("../images/excel-tbl-ressourcen.png", width: 100%)
    #v(0.6em)
    *tbl\_Risiken*
    #image("../images/excel-tbl-risiken.png", width: 100%)
    #v(0.6em)
    *tbl\_Szenarien*
    #image("../images/excel-tbl-szenarien.png", width: 80%)
    #v(0.6em)
    *Kalender*
    #image("../images/excel-kalender.png", width: 80%)

    // ---- A3: Datenmodell ---- //
    #heading(level: 2, numbering: none)[A3: Datenmodell]

    #figure(
      image("../images/anhang-beziehungen-liste.png", width: 80%),
      caption: [Beziehungsübersicht des Power-BI-Datenmodells],
    ) <fig-beziehungen-liste>

    // ---- A4: Measures ---- //
    #heading(level: 2, numbering: none)[A4: Übersicht der erstellten Measures]

    #figure(
      kind: table,
      supplement: labels.supplement-table,
      caption: [Übersicht aller zwölf erstellten DAX-Measures],
      table(
        columns: (4.5cm, 1fr),
        stroke: 0.5pt,
        inset: (x: 6pt, y: 5pt),
        align: (left + top, left + top),
        table.header(
          strong[Measure],
          strong[Funktion],
        ),
        [Gesamtbudget],                    [Summe der Projektbudgets],
        [Plan-Kosten],                     [Summe der PLAN-Kosten],
        [Ist-Kosten],                      [Summe der IST-Kosten],
        [Forecast-Kosten],                 [Summe der FORECAST-Kosten],
        [Kostenabweichung],                [Ist-Kosten minus Plan-Kosten],
        [Kostenabweichung %],              [Abweichung relativ zu den Plan-Kosten],
        [Budgetverbrauch %],               [Ist-Kosten relativ zum Gesamtbudget],
        [Anzahl Projekte],                 [Anzahl eindeutiger Projekte],
        [Kritische Projekte],              [Anzahl Projekte mit Status „kritisch"],
        [Durchschnittlicher Fortschritt],  [Durchschnittlicher Projektfortschritt in %],
        [Durchschn. Terminabweichung],     [Mittlere Abweichung der Endtermine in Tagen],
        [Verspätete Projekte],             [Projekte mit erwartetem Endtermin nach Plan],
      ),
    ) <tab-measures>
  ]
}

/// Renders the AI tools table (A5) as a standalone section after the AI declaration.
/// - labels (dict): UI label dictionary
/// -> none
#let ai-tools-section(labels: (:)) = {
  import "../user/ai-tools.typ": ai-tools
  pagebreak()
  set page(header: none)
  [
    #heading(level: 2, numbering: none)[#labels.appendix-ai-heading]
    #figure(
      kind: table,
      supplement: labels.supplement-table,
      caption: [#labels.appendix-ai-caption],
      table(
        columns: (3.8cm, 1fr),
        stroke: 0.5pt,
        inset: (x: 6pt, y: 5pt),
        align: (left + top, left + top),
        table.header(
          strong[#labels.appendix-ai-col1],
          strong[#labels.appendix-ai-col2],
        ),
        ..for (name, items) in ai-tools {
          (
            name,
            {
              set list(indent: 0pt, body-indent: 0.5em, spacing: 0.3em)
              set par(leading: 0.55em)
              list(..items)
            },
          )
        }
      ),
    ) <ai-tools>
  ]
}
