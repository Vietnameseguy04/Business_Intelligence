// ---- AI Tools ---- //
// Each entry: ("Tool name", ((prompt, purpose, pages), ...))
#let ai-tools = (
  ("Claude (Anthropic)",
    (
      (
        [Erstelle eine synthetische Excel-Ausgangsdatenbasis für die CamTech GmbH mit neun Tabellenblättern (Projekte, Kosten, Kostenarten, Meilensteine, Projektleiter, Ressourcen, Risiken, Szenarien, Kalender) für ein Power-BI-Projektcontrolling-Dashboard.],
        [Erstellung synthetischer Daten],
        [Kap. 3.1],
      ),
      (
        [Formuliere folgenden Satz wissenschaftlicher: [Satz einfügen]],
        [Wissenschaftliches Formulieren],
        [Durchgehend],
      ),
      (
        [Erstelle folgende Inhalte als Typst-Tabelle: [Inhalt einfügen]],
        [Erstellen von Tabellen],
        [Durchgehend],
      ),
    ),
  ),
  ("ChatGPT (OpenAI)",
    (
      (
        [Überprüfe dieses DAX-Measure auf Korrektheit: [Measure einfügen]],
        [Entwicklung und Überprüfung von DAX-Measures],
        [Kap. 5],
      ),
      (
        [Wie gehe ich in Power BI vor, um [Schritt] durchzuführen?],
        [Anleitung zu Power BI],
        [Kap. 4–6],
      ),
    ),
  ),
)
