# MOORGEOS – FreeGEOS-Prototyp und technische Leitlinie

## Ziel

MOORGEOS wird als eigenständige, native FreeGEOS/PC-GEOS-Anwendung entwickelt. Das Ziel ist ein Moorhuhn-artiges Zielschießspiel, nicht das unveränderte Ausführen des originalen Windows-Spiels. Originalgrafiken, Originalsounds und sonstige geschützte Spieldaten werden nicht vorausgesetzt.

Dieses Dokument bezieht sich ausdrücklich auf die FreeGEOS-Quell-/SDK-Basis von bluewaysw/pcgeos. Es ist keine Aussage über Kompatibilität mit GeoWorks 1.2 oder PC/GEOS 1.x.

## Auswertung des vorhandenen FreeGEOS-Beispiels

Als Referenz wurde das Projekt [freegeos-raycast](https://github.com/mgroeber9110/freegeos-raycast) untersucht:

- `raycast.gp` definiert eine Anwendung mit `type appl, process, single`, einer Prozessklasse, einem Anwendungsobjekt und den Bibliotheken `geos`, `ui` und `ansic`.
- `raycast/raycast.goc` zeigt die GOC-Klassen-/Nachrichtenstruktur, eine `GenApplicationClass`, ein `GenPrimaryClass`-Fenster und UI-Trigger, die Nachrichten an den Prozess senden.
- `raycast.goh` deklariert eigene Klassen, Instanzfelder und Nachrichten.
- `local.mk` bindet mit `#include <$(SYSMAKEFILE)>` die Standard-Buildregeln ein.
- `render/render.goc` demonstriert GEOS-Zeichenaufrufe wie `GrSetAreaColor`, `GrFillRect`, `GrDrawLine` und die Arbeit mit einem Offscreen-Bitmap. Das ist eine nützliche Referenz für eine einfache Spielszene, aber kein fertiges Moorhuhn-Spiel.

Quellen:
- https://github.com/mgroeber9110/freegeos-raycast/blob/main/raycast.gp
- https://github.com/mgroeber9110/freegeos-raycast/blob/main/raycast/raycast.goc
- https://github.com/mgroeber9110/freegeos-raycast/blob/main/raycast.goh
- https://github.com/mgroeber9110/freegeos-raycast/blob/main/local.mk
- https://github.com/mgroeber9110/freegeos-raycast/blob/main/render/render.goc

## Entwicklungsstrategie

### Phase 1 – minimales, baubares Grundgerüst
1. Eigenständiges App-Projekt mit eigener `.gp`-Datei, GOC-Quelldatei, Headern und `local.mk` anlegen.
2. Zunächst nur ein Fenster mit Hintergrund, Statusanzeige und einem einfachen gezeichneten Ziel darstellen.
3. Mit dem offiziellen FreeGEOS-SDK bauen und in der vorgesehenen GEOS-/Basebox-Umgebung starten.
4. Erst nach erfolgreichem Build und Start die nächste Funktion ergänzen.

### Phase 2 – Spielmechanik
1. Mausposition und Mausklick über die für die gewählte FreeGEOS-SDK-Version dokumentierten Eingabe-/UI-Mechanismen erfassen.
2. Ein einfaches Ziel mit Position und Bewegungszustand zeichnen.
3. Treffererkennung, Punkte, Zeitlimit und Neustart ergänzen.
4. Animationen und mehrere Ziele erst danach hinzufügen.

### Phase 3 – Ressourcen und Feinschliff
1. Eigene oder nachweislich frei nutzbare Grafiken und Sounds verwenden.
2. Ressourcenverbrauch und Bildwiederholrate in der tatsächlichen Zielumgebung messen.
3. Auflösungs- und Eingabevarianten testen.

## Technische Leitplanken

- Keine Annahme, dass Windows-, SDL-, Godot- oder Rust-Komponenten direkt in GEOS laufen.
- Das MHLIB-Projekt und seine Engine-Neuimplementierung dienen höchstens als Hintergrundinformation; das native Spiel erhält eine eigene GEOS-Anwendungsstruktur.
- Keine Original-Moorhuhn-Ressourcen ohne geklärte Rechte übernehmen.
- Keine Behauptung eines erfolgreichen Builds, solange ein Build nicht tatsächlich mit dem FreeGEOS-SDK ausgeführt wurde.
- Vor der Implementierung von Maus-/Zeitsteuerung sind die APIs der konkret verwendeten FreeGEOS-Version zu prüfen; Dokumentation aus anderen GEOS-Versionen darf nicht ungeprüft als identisch vorausgesetzt werden.

## Nächster konkreter Schritt

Das minimale Anwendungsgerüst aus dem Raycast-Beispiel ableiten und dabei die Projektstruktur so klein wie möglich halten. Als erste Abnahme gelten: erfolgreiches Kompilieren, Start in der Zielumgebung, sichtbares Fenster und ein gezeichnetes Testziel. Erst danach wird die Trefferlogik implementiert.
