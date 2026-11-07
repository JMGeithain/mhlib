# GeoMoorhuhn lite

Eigenständiges natives GOC-Spielprojekt für **PC/GEOS 2.x und höher bis FreeGEOS**.

**Zuletzt vom Anwender im Emulator bestätigt:** Version 0.7 wurde erfolgreich gebaut und getestet. Das schnellere Fallen (18 statt 12 Pixel pro Animationstakt) und das kräftige schwarze X als Trefferzeichen funktionieren im Emulator. Die Treffer-/Fall-/Respawn-Funktion aus v0.6 war bereits zuvor im Emulator geprüft.

> Dieses Projekt ist nicht für GeoWorks 1.x / PC/GEOS 1.x bestimmt.

## Version 0.4 – bestätigter Funktionsstand

- Spielfläche mit Himmel, Boden und Sonne.
- Drei Moorhuhn-Sprites als 52 × 70 Pixel große, unkomprimierte 4-bpp-Bitmaps mit 1-bpp-Maske.
- Maske und Pixeldaten sind zeilenweise verschachtelt (pro Zeile 7 Byte Maske, danach 26 Byte Pixeldaten).
- Drei bewegte Vögel mit individuellen X-/Y-Positionen und Bewegungsrichtungen.
- Mausgesteuertes Zielen mit Fadenkreuz.
- Treffer- und Fehlschusszählung, Punkteanzeige und 60-Sekunden-Runde.
- Treffer-/Daneben-Rückmeldung und Anzeige „Spiel vorbei“.
- JM-Logo im Info-Dialog mit transparenter 1-bpp-Maske.
- Vergrößerte schwarze Text-Hintergründe für bessere Abstände.
- Flackerfreie Darstellung im bestätigten Spieltest.

## Version 0.5 – erfolgreich getestete Erweiterung

- Versionsanzeige im Infofenster auf `Version 0.5` geändert.
- Schussgeräusch beim linken Mausklick über das GEOS-Instrument `IP_GUNSHOT`.
- Das Instrument wird mit `SoundAllocMusicNote()` vorbereitet und über `UserStandardSound(SST_CUSTOM_SOUND, ...)` wiedergegeben.
- Die GEOS-Sound-Bibliothek ist in `src/moorgeos.gp` mit `library sound` eingebunden.
- Der Anwender hat den Build nach Ergänzung der Sound-Bibliothek erfolgreich ausgeführt und den Klang im Emulator geprüft. Rückmeldung: Das Geräusch klingt wie ein Schuss und funktioniert einwandfrei.

## Version 0.6 – im Emulator funktionsfähig

- Beim Treffer wird genau das getroffene, gerade fliegende Huhn in den Zustand „fallend“ versetzt. Fallende und kurzzeitig ausgeblendete Hühner können nicht erneut getroffen werden.
- Ein eigener schneller GEOS-Timer bewegt das Huhn sichtbar nach unten bis in den Wiesenbereich. Die unabhängige 60-Sekunden-Spieluhr bleibt davon unberührt.
- Nach dem Aufkommen verschwindet das Huhn kurz und erscheint anschließend an einer anderen Startposition mit geänderter Flugrichtung wieder.
- Kurz nach dem Schuss ertönt zusätzlich ein kurzer synthetischer Stimmeffekt über das General-MIDI-Instrument `IP_CHOIR_AAHS`; die kleine Verzögerung soll verhindern, dass der Schrei das Schussgeräusch überdeckt. Das ist ein instrumentell erzeugter Stimmeffekt, keine Sprachaufnahme.
- Die Zustände und der zusätzliche Animationstimer werden bei „Neues Spiel“ zurückgesetzt und bei Spielende gestoppt.
- Der Anwender bestätigt, dass diese Trefferreaktion im Emulator bereits recht gut funktioniert.

## Version 0.7 – implementiert, Test noch offen

- Das getroffene Huhn fällt mit 18 statt 12 Pixeln pro Animationstakt (50 % schneller bei unverändertem Timerintervall).
- Während des Falls erhält es ein rotes X mit dunkler Kontur als gut sichtbares Treffer-Symbol; beim Respawn wird wieder das normale fliegende Sprite gezeigt.
- **Noch offen:** v0.7 bauen und im Emulator Falltempo, Sichtbarkeit/Position des Treffer-X und das Zurückschalten auf das normale Sprite beim Respawn prüfen.

## Build- und Teststatus

Der Anwender hat Version 0.4 erfolgreich gebaut und im Emulator geprüft; Version 0.5 wurde nach Ergänzung der Sound-Bibliothek ebenfalls erfolgreich gebaut und mit Schussgeräusch getestet. Die neue Version 0.6 ist davon zu unterscheiden und wurde inzwischen vom Anwender im Emulator als bereits recht gut funktionierend bestätigt; v0.7 wartet auf den Test. Die zuvor gemeldete Compilerdiagnose zeigte:

- GOC: 0 Warnungen, 0 Fehler
- Open Watcom: erfolgreich
- Der erste Linkversuch scheiterte mit `SOUNDALLOCMUSICNOTE undefined2`, weil `library sound` in der Geode-Definition fehlte.
- Nach Ergänzung von `library sound` wurde die Anwendung erfolgreich gebaut und im Emulator mit funktionierendem Schussgeräusch getestet.

Der Build-Befehl in der verwendeten Umgebung lautet:

```bat
C:\Geos\pcgeos\bin\pmake.exe -n
```

**Hinweis zu PMake:** In dieser Umgebung bedeutet `-n` „Make non error checking geode“ und führt den Build aus. `-u` gibt Befehle nur aus, ohne sie auszuführen.

Die konkreten lokalen SDK-Pfade können je nach Installation abweichen.

## Quellstruktur

- `src/moorgeos.goc` – Hauptprogramm und Spiel-/Zeichenlogik
- `src/moorgeos.goh` – Klassen-, Nachrichten- und Instanzdefinitionen
- `src/moorgeos.gp` – Geode-/Ressourcendefinition einschließlich GEOS-Sound-Bibliothek
- `src/moorgeosicons.goh` – Anwendungsicons
- `src/moorgeosaboutlogo.goh` – JM-Logo für den Info-Dialog
- `src/local.mk` – lokale Build-Konfiguration

## Versionshinweise

Details zu den Änderungen und den noch offenen Prüfpunkten stehen in [CHANGELOG.md](CHANGELOG.md).

## Abgrenzung und Rechte

GeoMoorhuhn lite ist ein eigenständiges Spielprojekt. Die Verwendung von Moorhuhn-Motiven oder -Ressourcen setzt voraus, dass deren Nutzungsrechte geklärt sind. Die im Projekt enthaltenen selbst erstellten Grafiken und das JM-Logo sind getrennt von etwaigen Rechten an Marken oder Original-Spielinhalten zu betrachten.
