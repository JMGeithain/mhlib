# MOORGEOS – Spielkonzept für den ersten spielbaren Prototyp

## Ziel des Prototyps

Ein kleines natives FreeGEOS-Zielschießspiel mit eigener, einfacher Grafik. Der erste spielbare Stand soll beweisen, dass die Anwendung startet, ein Ziel darstellt, Mausklicks verarbeitet und Treffer/Punkte sichtbar macht. Er soll noch keine originalgetreue Moorhuhn-Kopie sein.

## Runde

- Eine Runde dauert zunächst 60 Sekunden.
- Es gibt zunächst genau ein Ziel auf einer statischen Wiese.
- Ein Klick innerhalb der Trefferfläche zählt als Treffer und bringt 10 Punkte.
- Ein Klick außerhalb des Ziels zählt als Fehlschuss.
- Nach einem Treffer wird das Ziel an eine andere, vorab definierte Position versetzt.
- Die Runde endet, wenn die Zeit abgelaufen ist; danach bleiben Punktestand und Endstatus sichtbar.
- „Neues Spiel“ setzt Zeit, Punktestand und Zielposition zurück.

## Reihenfolge der Umsetzung

1. **Startfähige App:** Fenster und sichtbare Spielszene; mit dem tatsächlichen FreeGEOS-SDK kompilieren.
2. **Mausereignis:** Klick auf dem sichtbaren Spielfeld empfangen und die Position in Spielkoordinaten prüfen.
3. **Trefferlogik:** Rechteck-/Ellipse-Trefferfläche, Punktestand und Fehlschusszähler.
4. **Neustart:** Spielzustand zuverlässig initialisieren.
5. **Zeitlimit:** GEOS-Timer-/Nachrichtenmechanismus passend zur installierten SDK-Version verwenden.
6. **Bewegung:** Erst nach stabiler Trefferlogik ein Ziel in festen Schritten bewegen.
7. **Politur:** Eigene Grafiken, Geräusche und mehrere Ziele nur nach Messung der Leistungsfähigkeit.

## Einfaches Zustandsmodell

- READY: Runde noch nicht gestartet oder zurückgesetzt.
- PLAYING: Klicks werden ausgewertet; Punkte werden gezählt.
- FINISHED: Zeit abgelaufen; Treffer verändern den Punktestand nicht mehr.

Für den ersten Build sollte die Spielmechanik nicht an Echtzeitbewegung gekoppelt werden. Das hält die Fehlersuche überschaubar und erlaubt zunächst einen reproduzierbaren Test.

## Testfälle

- Start: Fenster und Spielfeld sind sichtbar.
- Klick in die Zielfläche: genau 10 Punkte hinzugefügt.
- Klick außerhalb der Zielfläche: kein Punkt hinzugefügt.
- Mehrere schnelle Klicks: kein Absturz und keine doppelte Auswertung eines einzelnen Klickereignisses.
- Neustart: Punktestand und Rundenstatus zurückgesetzt.
- Ende der Runde: weitere Klicks verändern den Endpunktestand nicht.
- Fenster verdecken und wieder freilegen: die Szene wird vollständig neu gezeichnet.

## Technische Referenz für Mausereignisse

Die offizielle FreeGEOS-Quelle enthält die Beispiele Appl/SDK_C/Vis/VisSamp und Appl/SDK_C/TicTac. Insbesondere demonstriert TicTac MSG_META_START_SELECT, MSG_VIS_GRAB_MOUSE und die Rückgabe von MRF_PROCESSED. Das ist ein belastbarer Ausgangspunkt für die Mausbehandlung, aber die konkrete Integration muss mit der installierten FreeGEOS-SDK-Version gebaut und getestet werden.

- https://github.com/bluewaysw/pcgeos/blob/master/Appl/SDK_C/Vis/VisSamp/vissamp.goc
- https://github.com/bluewaysw/pcgeos/blob/master/Appl/SDK_C/TicTac/tictac.goc
- https://bluewaysw.github.io/pcgeos/concepts.html

## Abgrenzung

- Zielplattform: FreeGEOS / die dazugehörige PC-GEOS-SDK-Basis.
- Keine Zusage für GeoWorks 1.2 oder PC/GEOS 1.x.
- Keine Originalgrafiken oder -sounds des kommerziellen Moorhuhn-Spiels.
- Ein erfolgreicher Build gilt erst als bestätigt, wenn er auf der eingerichteten Toolchain tatsächlich ausgeführt wurde.
