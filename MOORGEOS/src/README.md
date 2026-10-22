# MOORGEOS – Quellstand

## Aktueller Stand

- Native FreeGEOS-GOC-Anwendungsstruktur mit `.gp`, `.goh`, `.goc` und `local.mk` vorhanden.
- Die UI nutzt eine `GenViewClass` mit einer `VisContentClass`-Spielfläche, angelehnt an das offizielle SDK-Beispiel `Appl/SDK_C/TicTac/tictac.goc`.
- Die Spielfläche zeichnet eine einfache Landschaft und eine schematische Zielfigur.
- Klicks prüfen einen rechteckigen Trefferbereich. Treffer zählen 10 Punkte und versetzen das Ziel auf eine von drei Positionen; Fehlschüsse werden gezählt.
- Eine einfache Statusleiste zeigt Punkte und Fehlschüsse über farbige Markierungen.
- **Neu vorbereitet:** Beim ersten Klick startet eine 60-Sekunden-Runde. Der Timer verwendet `TimerStart(TIMER_EVENT_CONTINUAL, ...)` aus dem offiziellen `timer.h`; bei null wird der Timer gestoppt und die Runde als beendet markiert; weitere Klicks sollen bis „Neues Spiel“ ignoriert werden. `Spiel > Neues Spiel` setzt Zähler und Rundenstatus zurück.
- Die Zeit wird in der Statusleiste vorerst als Balken dargestellt (ein Abschnitt je sechs Sekunden); eine ausgeschriebene Zahl ist noch nicht umgesetzt.
- **Wichtig: Noch nicht kompiliert oder ausgeführt.** GOC-Syntax, Einbindung von `timer.h`, Event-Zustellung, Timer-Einheiten und Lebenszyklus müssen mit der konkreten SDK-Version geprüft werden. Dies ist ein Entwicklungsentwurf, kein getesteter Build.
- Keine originalen Moorhuhn-Grafiken oder -Sounds enthalten.

## Timer-Referenz

- `CInclude/timer.h`: `TimerStart` erhält Typ, Zielobjekt, erste Verzögerung, Nachrichten-ID, Wiederholintervall und Zeiger auf Timer-ID.
- Offizielle Beispiele verwenden `TIMER_EVENT_CONTINUAL` mit einer Objekt-Nachricht und beenden Timer mit `TimerStop(handle, id)`.
- Quellen: [timer.h](https://github.com/bluewaysw/pcgeos/blob/master/CInclude/timer.h), [Magic-Content-Beispiel](https://github.com/bluewaysw/pcgeos/blob/master/Appl/Breadbox/EntPak/Magic/content.goc), [Muncher's TNT](https://github.com/bluewaysw/pcgeos/blob/master/Appl/Breadbox/Arcade/munch/munch.goc).

## Nächste Schritte

1. Mit der realen FreeGEOS-Toolchain kompilieren und Compilerdiagnosen korrigieren.
2. Im Emulator prüfen, ob Ansicht, Statusleiste und Spielfläche erscheinen.
3. Prüfen, ob Klicks ankommen und Timer-Ticks wirklich im Sekundenabstand ausgelöst werden.
4. Prüfen, dass Rundenende Klicks sperrt und ein neues Spiel keinen alten Timer zurücklässt.
5. Danach Zielbewegung und bessere Treffergeometrie ergänzen.

## Referenzen

- Offizieller FreeGEOS-Quellcode: https://github.com/bluewaysw/pcgeos
- TicTac-Beispiel (Mausereignisse und Objektstruktur): https://github.com/bluewaysw/pcgeos/blob/master/Appl/SDK_C/TicTac/tictac.goc
- Dokumentation: https://bluewaysw.github.io/pcgeos/

Die Beispiele sind eine Ausgangsbasis, ersetzen aber nicht den Build- und Laufzeittest mit der konkreten installierten SDK-Version.
