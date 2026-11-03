# GeoMoorhuhn lite

Eigenständiges natives GOC-Spielprojekt für **PC/GEOS 2.x und höher bis FreeGEOS**.

**Letzter bestätigter Release-Stand:** Version 0.4. Version 0.5 ist im Entwicklungszweig und wurde mit der neuen Schuss-Soundfunktion erfolgreich im Emulator getestet.

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

## Build- und Teststatus

Der Anwender hat den Build mit seiner PC/GEOS-/FreeGEOS-Entwicklungsumgebung erfolgreich ausgeführt. Die zuvor gemeldete Compilerdiagnose zeigte:

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
