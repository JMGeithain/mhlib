# MOORGEOS – Quellstand

## Aktueller Stand

- Native FreeGEOS-GOC-Anwendungsstruktur mit `.gp`, `.goh`, `.goc` und `local.mk` vorhanden.
- Die UI nutzt nun eine `GenViewClass` mit einer `VisContentClass`-Spielfläche, angelehnt an das offizielle SDK-Beispiel `Appl/SDK_C/TicTac/tictac.goc`.
- Die Spielfläche zeichnet eine einfache Landschaft und eine schematische Zielfigur.
- Ein erster `MSG_META_START_SELECT`-Handler prüft einen rechteckigen Trefferbereich. Bei Treffer werden intern 10 Punkte addiert und das Ziel auf eine von drei festen Positionen gesetzt; Fehlschüsse werden intern gezählt.
- `Spiel > Neues Spiel` setzt die internen Werte zurück.
- **Punktestand und Fehlschüsse werden noch nicht sichtbar angezeigt.** Ein Zeitlimit, Spielende und kontinuierliche Zielbewegung fehlen ebenfalls.
- **Noch nicht kompiliert oder ausgeführt.** Die tatsächliche Syntax, Event-Zustellung und Laufzeit müssen mit dem eingerichteten SDK verifiziert werden.
- Keine originalen Moorhuhn-Grafiken oder -Sounds enthalten.

## Nächste Schritte

1. Mit der realen FreeGEOS-Toolchain kompilieren und Compilerdiagnosen korrigieren.
2. Im Emulator prüfen, ob Ansicht und Spielfläche erscheinen.
3. Prüfen, ob Klicks an die Spielfläche gelangen und die Trefferposition korrekt ausgewertet wird.
4. Punktestand und Fehlschüsse sichtbar darstellen.
5. Zeitsteuerung und Rundenende ergänzen.
6. Erst danach Animation und weitere Ziele hinzufügen.

## Referenzen

- Offizieller FreeGEOS-Quellcode: https://github.com/bluewaysw/pcgeos
- TicTac-Beispiel (Mausereignisse und sichtbare Objektstruktur): https://github.com/bluewaysw/pcgeos/blob/master/Appl/SDK_C/TicTac/tictac.goc
- VisSamp-Beispiel: https://github.com/bluewaysw/pcgeos/blob/master/Appl/SDK_C/Vis/VisSamp/vissamp.goc
- Dokumentation: https://bluewaysw.github.io/pcgeos/

Die Beispiele sind eine belastbare Ausgangsbasis, ersetzen aber nicht den Build- und Laufzeittest mit der konkreten installierten SDK-Version.
