= Ausgangssituation und Anforderungen

#text(size: 13pt, weight: "bold")[Ausgangssituation]

Die CamTech GmbH wird im Rahmen dieser Arbeit als fiktiver Hersteller von Kameras betrachtet. Das Unternehmen führt parallel mehrere Projekte, beispielsweise zur Entwicklung neuer Kameramodelle, zur Weiterentwicklung bestehender Produkte oder zur Optimierung interner Prozesse.

Für das Projektcontrolling entstehen dabei unterschiedliche Informationsbedarfe. Neben allgemeinen Projektdaten müssen insbesondere geplante und tatsächlich angefallene Kosten, Forecast-Werte, Ressourcen, Meilensteine und Risiken berücksichtigt werden. Eine isolierte Betrachtung einzelner Tabellen oder Excel-Listen wäre für das Management nur eingeschränkt geeignet, da sich relevante Informationen über mehrere Quellen verteilen. Notwendig ist daher eine Zusammenführung und Aufbereitung der Daten, sodass Abweichungen und kritische Entwicklungen schnell erkannt werden können.

Das Dashboard soll insbesondere in der Lage sein, folgende Fragen zu beantworten. Wie hoch ist das Gesamtbudget der betrachteten Projekte? Wie hoch sind die bisher angefallenen Ist-Kosten? Wie entwickeln sich Plan-, Ist- und Forecast-Kosten über die Zeit? Welche Projekte weisen besonders hohe Kostenabweichungen auf, und wie viele Projekte sind aktuell als kritisch einzustufen?

Der Schwerpunkt liegt damit nicht auf einer möglichst großen Anzahl von Kennzahlen, sondern auf einer gezielten Auswahl von Informationen, die für eine Managementsicht auf das Projektportfolio relevant sind.

#pagebreak()
#text(size: 13pt, weight: "bold")[Anforderungen an das Dashboard]

Die Anforderungen wurden aus zwei Quellen abgeleitet. Zum einen ergibt sich aus der Aufgabenstellung die explizite Forderung nach einem operationellen IBCS-orientierten Schwarz/Weiß-Dashboard in Power BI, zum anderen ergeben sich weitere Anforderungen aus den typischen Informationsbedarfen eines Projektcontrollings. Ein Managementreport muss auf einen Blick zeigen, wie sich Kosten zu Plan und Forecast entwickeln, welche Projekte kritisch sind und wo die größten Abweichungen liegen. Daraus ergeben sich die in @tab-anforderungen zusammengefassten Anforderungen.

#figure(
  table(
    columns: (1fr, 1.5fr),
    table.header([*Anforderung*], [*Umsetzung*]),
    [Projektcontrolling],     [Projekte, Budgets und Kosten als zentrale Datenbasis],
    [Managementorientierung], [Kompakte KPI-Auswahl],
    [Plan/Ist-Vergleich],     [Plan-Kosten und Ist-Kosten],
    [Forecast-Betrachtung],   [Forecast-Kosten],
    [Abweichungsanalyse],     [Absolute Kostenabweichung],
    [Projektvergleich],       [Kostenabweichung je Projekt],
    [Zeitliche Entwicklung],  [Monatsbasierter Verlauf],
    [Kritische Projekte],     [KPI „Kritische Projekte"],
    [IBCS-Orientierung],      [Schwarz/Weiß-orientierte Visualisierung],
    [Power BI],               [Umsetzung des Datenmodells und Dashboards in Power BI],
  ),
  caption: [Abgeleitete Anforderungen an das Dashboard],
) <tab-anforderungen>

Die Umsetzungsentscheidungen orientieren sich dabei jeweils direkt an den Anforderungen. Für den Plan/Ist-Vergleich und die Forecast-Betrachtung wurde eine einheitliche Szenario-Logik in der Kostentabelle gewählt, die über das Feld Szenario filterbar ist. Für die Managementorientierung wurden bewusst nur fünf KPI-Karten ausgewählt, um die Übersicht zu wahren. Die IBCS-Orientierung wurde durch eine Schwarz/Weiß-Gestaltung und den Verzicht auf Standardfarben von Power BI umgesetzt. Diese Entscheidungen werden in den folgenden Kapiteln jeweils im Detail begründet.

= Konzeption und Vorbereitung der Datenbasis

#text(size: 13pt, weight: "bold")[Erstellung der synthetischen Datenbasis]

Für die Umsetzung stand keine reale Unternehmensdatenbasis zur Verfügung. Deshalb wurde eine synthetische Datenbasis für die CamTech GmbH erstellt. Zur Unterstützung bei der Erstellung der Excel-Ausgangsdatei wurde Claude eingesetzt. Dabei wurde nicht lediglich eine beliebige Beispieldatei erzeugt, sondern die Datenbasis gezielt auf die Anforderungen des späteren Power-BI-Dashboards ausgerichtet.

Die erzeugte Datenbasis umfasst Informationen zu Projekten, Kosten, Kostenarten, Meilensteinen, Ressourcen, Risiken, Projektleitern, Szenarien sowie Kalenderdaten. Die Verwendung eines KI-Systems ermöglichte insbesondere die Erzeugung einer größeren Anzahl synthetischer, miteinander verknüpfter Datensätze, wodurch eine realistischere Ausgangssituation geschaffen werden konnte als durch manuelle Eingabe weniger Beispieldatensätze.

Die KI-Unterstützung bezog sich dabei auf die Generierung der Ausgangsdaten. Die fachliche Modellierung, die Auswahl der für das Dashboard verwendeten Daten, die Definition der Kennzahlen, die Erstellung der Beziehungen sowie die Konzeption und Umsetzung der Visualisierungen wurden eigenständig in Power BI durchgeführt.

#text(size: 13pt, weight: "bold")[Auswahl der Datenstrukturen]

Für das Dashboard wurden neun Tabellen aus der Excel-Datenbasis verwendet. Die Auswahl erfolgte mit dem Ziel, einerseits die für das Management relevanten Informationen abzubilden und andererseits eine strukturierte Datenbasis für spätere Analysen bereitzustellen (siehe Anhang A1). Die ausgewählten Tabellen sind tbl_Projekte, tbl_Kosten, tbl_Kostenarten, tbl_Meilensteine, tbl_Projektleiter, tbl_Ressourcen, tbl_Risiken, tbl_Szenarien sowie eine Kalendertabelle.

Die zentrale Tabelle des Modells bildet tbl_Projekte. Sie enthält Informationen zur Projekt-ID, zum Projektstatus, zum Projektleiter, zum Budget sowie zu geplanten und erwarteten Endterminen und zum Projektfortschritt. Die Tabelle tbl_Kosten bildet die Grundlage für die Kostenanalyse und enthält neben Projekt-ID, Periode und Kostenart auch eine Szenario-Information, über die Plan-, Ist- und Forecast-Werte voneinander unterschieden werden können.

Ergänzend wurden Tabellen für Meilensteine, Ressourcen und Risiken aufgenommen. Die Tabelle tbl_Meilensteine erfasst geplante und tatsächliche Termine und bildet damit die Grundlage für eine Terminsteuerung auf Projektebene. tbl_Ressourcen enthält Informationen zum geplanten und tatsächlichen Personaleinsatz sowie zu den zugehörigen Kosten und ermöglicht dadurch eine ressourcenbezogene Kostenbetrachtung über die reinen Budgetwerte hinaus. tbl_Risiken enthält Angaben zum Risikostatus, zur Eintrittswahrscheinlichkeit und zu den vorgesehenen Maßnahmen und dient als Frühwarnindikator für kritische Entwicklungen im Projektportfolio. Diese Informationen wurden auf der ersten Managementseite bewusst nicht vollständig visualisiert, bilden jedoch eine wichtige Grundlage für weiterführende Detailanalysen.

#text(size: 13pt, weight: "bold")[Abwägung gegenüber einer flachen Tabellenstruktur]

Als Alternative wäre eine einzige flache Tabelle denkbar gewesen, in der sämtliche Projekt-, Kosten-, Ressourcen- und Statusinformationen zusammengeführt werden. Diese Variante wäre für einen einfachen Prototypen zunächst leichter zu erstellen gewesen.

Für das vorliegende Dashboard wurde dennoch bewusst eine relationale Struktur gewählt. Dadurch können Stammdaten und Bewegungsdaten getrennt gehalten und über eindeutige IDs miteinander verbunden werden. Dies reduziert redundante Informationen und ermöglicht gleichzeitig eine flexiblere Weiterverwendung der Daten. Besonders relevant ist dies für die Szenario-Logik des Dashboards. In einer flachen Tabelle müssten Plan-, Ist- und Forecast-Kosten entweder als separate Spalten oder durch Duplizierung aller Projektdaten abgebildet werden. Im relationalen Modell hingegen werden sie als eigene Zeilen in tbl_Kosten geführt und über die Verbindung zu tbl_Szenarien gezielt gefiltert, was die DAX-Berechnungen deutlich vereinfacht.

= Datenaufbereitung und Datenmodellierung in Power BI

#text(size: 13pt, weight: "bold")[Import und Datenaufbereitung]

Die Excel-Datei wurde zunächst in Power BI importiert, wobei nur die für das entwickelte Datenmodell relevanten Tabellen ausgewählt wurden. Im Anschluss daran wurden die Datentypen geprüft und angepasst. IDs wurden als Text definiert, da sie als Bezeichner dienen und keine arithmetischen Operationen darauf ausgeführt werden sollen. Datumsfelder wurden als Datumstyp gesetzt, damit Power BI sie korrekt für zeitliche Filterungen erkennt. Stunden und Mengen wurden als Ganzzahlen definiert, da keine Nachkommastellen benötigt werden. Geldbeträge wurden als Dezimalzahlen gespeichert.

Die Geldbeträge wurden bewusst zunächst als numerische Dezimalwerte gespeichert. Die Darstellung als Euro-Werte erfolgt erst auf Ebene der Visualisierung, damit die Werte für Berechnungen in DAX uneingeschränkt geeignet bleiben.

#text(size: 13pt, weight: "bold")[Aufbau der Beziehungen]

Nach dem Import wurden die Tabellen über Beziehungen miteinander verbunden. Alle Beziehungen folgen dabei dem Prinzip der 1:n-Kardinalität, bei dem ein Datensatz auf der Eins-Seite mehreren Datensätzen auf der n-Seite gegenübersteht. So ist beispielsweise ein Projekt in tbl_Projekte mit mehreren Einträgen in tbl_Kosten verknüpft, da für ein einzelnes Projekt unterschiedliche Perioden, Kostenarten und Szenarien erfasst werden. Die zentrale Beziehung zwischen Projekten und Kosten wurde über die Projekt-ID hergestellt. Dabei fungiert tbl_Projekte auf der Eins-Seite als Stammdatentabelle, während tbl_Kosten auf der n-Seite die zugehörigen Bewegungsdaten enthält.

Weitere Beziehungen wurden zwischen Kostenarten und Kosten, zwischen Szenarien und Kosten, zwischen Kalender und Kosten sowie zwischen Projektleitern und Projekten hergestellt. Zusätzlich wurden Projekten und den Tabellen für Meilensteine, Ressourcen und Risiken jeweils eigene Beziehungen zugewiesen. Durch diese Struktur können Filter aus den Stammdatentabellen auf die jeweiligen Bewegungsdaten übertragen werden. Eine tabellarische Übersicht aller neun Beziehungen findet sich in Anhang A3. @fig-datenmodell zeigt das vollständige Datenmodell mit allen Tabellen und Beziehungen.

#figure(
  image("../images/anhang-datenmodell-beziehungen.png", width: 100%),
  caption: [Datenmodell des Power-BI-Projektcontrollings der CamTech GmbH],
) <fig-datenmodell>

#text(size: 13pt, weight: "bold")[Verwendung einer Kalendertabelle]

Für die zeitliche Analyse wurde eine separate Kalendertabelle verwendet. Gegenüber einer direkten Ableitung von Zeitattributen aus den Bewegungsdaten bietet eine solche Tabelle den Vorteil, eine vollständige und lückenlose Zeitstruktur bereitzustellen. Dadurch lassen sich Monats-, Quartals- und Jahresauswertungen innerhalb des Datenmodells einheitlich und konsistent durchführen. Die Kalendertabelle enthält neben dem eigentlichen Datum auch Jahr, Monat, Monatsname, Quartal und Kalenderwoche. Auf dieser Grundlage konnte die Kostenentwicklung im Dashboard einheitlich auf Monatsebene dargestellt werden.

= Entwicklung der Kennzahlen

#text(size: 13pt, weight: "bold")[Auswahl und Definition der Kennzahlen]

Die Kennzahlen wurden nicht möglichst umfangreich gewählt, sondern auf die zentrale Managementfrage ausgerichtet, wie sich Budget, Kosten und Projektstatus entwickeln. Insgesamt wurden zwölf Measures in Power BI erstellt, eine vollständige Übersicht findet sich in Anhang A4.

Das *Gesamtbudget* ergibt sich aus der Summe aller für die Projekte vorgesehenen Budgets.

```dax
Gesamtbudget = SUM(tbl_Projekte[Budget])
```

Die *Plan-Kosten* bilden die geplanten Kosten ab, indem die Kostentabelle auf das Szenario „PLAN" gefiltert wird. Entsprechend zeigen die *Ist-Kosten* die tatsächlich erfassten Kosten auf Basis des Szenarios „IST".

```dax
Plan-Kosten =
CALCULATE(
    SUM(tbl_Kosten[Betrag_EUR]),
    tbl_Kosten[Szenario] = "PLAN"
)
```

```dax
Ist-Kosten =
CALCULATE(
    SUM(tbl_Kosten[Betrag_EUR]),
    tbl_Kosten[Szenario] = "IST"
)
```

Die *Kostenabweichung* stellt die absolute Differenz zwischen Ist- und Plan-Kosten dar. Um diese Abweichung ins Verhältnis zu setzen, wird ergänzend die *Kostenabweichung in Prozent* berechnet.

```dax
Kostenabweichung = [Ist-Kosten] - [Plan-Kosten]
```

```dax
Kostenabweichung % =
DIVIDE([Kostenabweichung], [Plan-Kosten])
```

Der *Budgetverbrauch* beschreibt den Anteil des Gesamtbudgets, der bereits durch Ist-Kosten beansprucht wurde.

```dax
Budgetverbrauch % =
DIVIDE([Ist-Kosten], [Gesamtbudget])
```

Die *Anzahl der Projekte* ermittelt über eine Zählung eindeutiger Projekt-IDs, wie viele Projekte insgesamt im Datenmodell erfasst sind. Davon abgeleitet zählt die Kennzahl *Kritische Projekte* ausschließlich jene Projekte, deren Status als „kritisch" eingestuft ist.

```dax
Anzahl Projekte =
DISTINCTCOUNT(tbl_Projekte[Projekt_ID])
```

```dax
Kritische Projekte =
CALCULATE(
    DISTINCTCOUNT(tbl_Projekte[Projekt_ID]),
    tbl_Projekte[Projektstatus] = "kritisch"
)
```

Der *durchschnittliche Fortschritt* ergibt sich aus dem Mittelwert des prozentualen Projektfortschritts über alle Projekte. Zur Terminbetrachtung kommt die *durchschnittliche Terminabweichung* hinzu, die die Differenz zwischen erwartetem und geplantem Projektende in Tagen misst. Für diese Berechnung wird AVERAGEX verwendet, da die Differenz zunächst für jedes einzelne Projekt berechnet und anschließend gemittelt werden muss. Eine einfache AVERAGE-Funktion würde hier nicht ausreichen, weil der Zugriff auf zwei verschiedene Datumsspalten derselben Tabelle eine zeilenweise Iteration erfordert.

```dax
Durchschnittlicher Fortschritt =
AVERAGE(tbl_Projekte[Fortschritt_Prozent])
```

```dax
Durchschnittliche Terminabweichung =
AVERAGEX(
    tbl_Projekte,
    DATEDIFF(
        tbl_Projekte[Plan_Enddatum],
        tbl_Projekte[Erwartetes_Enddatum],
        DAY
    )
)
```

Ergänzend dazu identifiziert *Verspätete Projekte* jene Projekte, deren erwartetes Ende nach dem ursprünglich geplanten Ende liegt. Da der Vergleich zweier Datumsspalten derselben Tabelle nicht als einfaches Filterargument in CALCULATE ausgedrückt werden kann, wird FILTER eingesetzt, das zeilenweise über tbl_Projekte iteriert und die Bedingung für jede Zeile einzeln prüft. Schließlich stellen die *Forecast-Kosten* die prognostizierten Kosten auf Basis des Szenarios „FORECAST" bereit.

```dax
Verspätete Projekte =
CALCULATE(
    DISTINCTCOUNT(tbl_Projekte[Projekt_ID]),
    FILTER(
        tbl_Projekte,
        tbl_Projekte[Erwartetes_Enddatum]
            > tbl_Projekte[Plan_Enddatum]
    )
)
```

```dax
Forecast-Kosten =
CALCULATE(
    SUM(tbl_Kosten[Betrag_EUR]),
    tbl_Kosten[Szenario] = "FORECAST"
)
```

#text(size: 13pt, weight: "bold")[Begründung der KPI-Auswahl]

Für die erste Managementseite wurden fünf Kennzahlen als prominente KPI-Karten ausgewählt, nämlich Gesamtbudget, Ist-Kosten, Forecast-Kosten, Kostenabweichung und die Anzahl kritischer Projekte. Diese Kennzahlen beantworten unmittelbar die zentralen Steuerungsfragen des Projektcontrollings. Welches Budget steht zur Verfügung? Wie hoch sind die tatsächlich angefallenen Kosten? Wie entwickeln sich die erwarteten Kosten laut Forecast? Wie groß ist die aktuelle Kostenabweichung, und wie viele Projekte sind bereits kritisch?

Weitere berechnete Measures wie Budgetverbrauch %, Durchschnittlicher Fortschritt, Durchschnittliche Terminabweichung oder Verspätete Projekte wurden bewusst nicht auf der Managementseite platziert. Sie liefern ergänzende Informationen, würden gleichzeitig jedoch die Übersichtlichkeit der ersten Managementebene erhöhen und sind eher für weiterführende Detailanalysen geeignet. Die Auswahl folgt damit dem Grundsatz, auf der Managementebene zunächst die wichtigsten Steuerungsinformationen bereitzustellen und Detailinformationen nicht mit der Gesamtübersicht zu vermischen.

= Umsetzung des Power-BI-Dashboards

#text(size: 13pt, weight: "bold")[Aufbau der Managementseite]

Die erste Berichtseite wurde als „Management Board" bezeichnet und trägt die Überschrift „PROJEKTCONTROLLING – CAMTECH GMBH". Die Seite wurde bewusst kompakt aufgebaut und besteht aus fünf KPI-Karten, einem zeitlichen Plan/Ist/Forecast-Vergleich sowie einem Balkendiagramm zur Kostenabweichung je Projekt. Auf eine umfangreiche Datentabelle wurde dabei verzichtet, um die Managementsicht nicht zu überlagern. @fig-dashboard zeigt die fertige Managementseite.

#figure(
  image("../images/anhang-dashboard.png", width: 100%),
  caption: [Management-Dashboard des Projektcontrollings der CamTech GmbH],
) <fig-dashboard>

*KPI-Karten*

Prominent dargestellt werden Gesamtbudget, Ist-Kosten, Forecast-Kosten, Kostenabweichung und die Anzahl kritischer Projekte. Für diese fünf Kennzahlen wurde bewusst das KPI-Karten-Visual gewählt, da es absolute Werte unmittelbar lesbar macht, ohne dass zunächst eine Achse oder ein Diagramm interpretiert werden muss. Die monetären Werte werden auf den Karten im Euro-Format angezeigt, wobei die Formatierung auf Ebene der Visualisierung erfolgt und die zugrundeliegenden Dezimalwerte für DAX-Berechnungen unverändert bleiben.

*Zeitliche Kostenentwicklung*

Für die zeitliche Analyse wurde ein Liniendiagramm eingesetzt, das Plan-Kosten, Ist-Kosten und Forecast-Kosten auf monatlicher Ebene darstellt. Die Entscheidung fiel zugunsten des Liniendiagramms, weil bei dieser Darstellung die Entwicklung über mehrere Perioden im Mittelpunkt steht. Linien unterstützen die Wahrnehmung von Verläufen und Veränderungen und ermöglichen dadurch eine schnelle Identifikation von Abweichungen zwischen Plan, Ist und Forecast. Ein Balkendiagramm wäre demgegenüber eher geeignet, wenn der Vergleich einzelner Perioden im Vordergrund stünde.

*Kostenabweichung je Projekt*

Das zweite Diagramm zeigt die Kostenabweichung aufgeschlüsselt nach Projektname. Hierfür wurde ein Balkendiagramm gewählt, da Unterschiede zwischen den einzelnen Projekten so direkt vergleichbar sind und insbesondere größere positive oder negative Abweichungen schnell erkannt werden können. Eine Tabelle wäre zwar für exakte Einzelwerte geeignet, würde jedoch den direkten visuellen Vergleich erschweren. Für die Managementübersicht wurde daher das Balkendiagramm bevorzugt.

*Schwarz/Weiß-Gestaltung*

Bei der Gestaltung wurde eine Schwarz/Weiß-orientierte Darstellung gewählt. Auf eine starke Nutzung von Standardfarben wie Blau wurde bewusst verzichtet, damit die Aufmerksamkeit stärker auf den dargestellten Daten und den Abweichungen liegt als auf einer dekorativen Farbgebung. Die Visualisierungen wurden entsprechend angepasst, sodass Linien und Balken in einer reduzierten Schwarz/Weiß-Darstellung erscheinen.

#text(size: 13pt, weight: "bold")[IBCS-orientierte Umsetzung]

*Grundgedanke*

Das Dashboard folgt einem IBCS-orientierten Gestaltungsansatz und orientiert sich dabei auch am Konzept des Reporting-Hauses von Horváth & Partner. Dieses Rahmenwerk beschreibt, wie Managementberichte hierarchisch aufgebaut sein sollten, von operativen Detaildaten bis zur strategischen Übersicht. Das entwickelte Management Board entspricht der obersten Ebene dieses Modells. Es liefert eine kompakte Übersicht für Entscheidungsträger, ohne operative Detaildaten einzubeziehen. Beim IBCS-Ansatz steht nicht die vollständige Einhaltung aller Regeln des International Business Communication Standards im Vordergrund, sondern die Anwendung ausgewählter Gestaltungsprinzipien, die sich auf die vorliegende Managementübersicht sinnvoll übertragen ließen. Im Vordergrund stehen eine reduzierte Farbgebung, der Verzicht auf dekorative Elemente sowie eine kompakte Seitenstruktur.

*Anwendung auf das entwickelte Dashboard*

Konkret wurde auf die Power-BI-Standardfarben wie Blau und Orange vollständig verzichtet. Alle Diagramme und KPI-Karten wurden in einer einheitlichen Schwarz/Weiß-Darstellung gestaltet, sodass die Aufmerksamkeit auf den dargestellten Werten und Abweichungen liegt und nicht auf der Farbgestaltung.

Darüber hinaus wurde auf dekorative Elemente wie Hintergrundfüllungen, Rahmen oder grafische Verzierungen verzichtet. Die Managementseite beschränkt sich bewusst auf die für die Steuerung relevanten Elemente, nämlich fünf KPI-Karten, das Liniendiagramm zur zeitlichen Kostenentwicklung und das Balkendiagramm zum Projektvergleich.

Damit wurde eine kompakte Managementübersicht geschaffen, die ohne Ablenkung durch Gestaltungselemente auskommt und sich an den Prinzipien einer reduzierten, informationsorientierten Darstellung orientiert.
