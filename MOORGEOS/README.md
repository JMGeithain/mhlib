# GeoMoorhuhn lite

Eigenständiges natives GOC-Spielprojekt für **PC/GEOS 2.x und höher bis FreeGEOS**.

**Letzter bestätigter Release-Stand:** Version 0.4. Version 0.5 befindet sich in Entwicklung.

> Dieses Projekt ist nicht für GeoWorks 1.x / PC/GEOS 1.x bestimmt.

## Version 0.4 – bestätigter Funktionsstand

Die nachfolgenden v0.5-Erweiterungen sind noch in Entwicklung und noch nicht im Emulator bestätigt.

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

## Geplante/aktuelle v0.5-Erweiterung

- Versionsanzeige im Infofenster auf `Version 0.5` geändert.
- Schussklang beim linken Mausklick auf das GEOS-Instrument `IP_GUNSHOT` umgestellt. Der Klang wird mit `SoundAllocMusicNote()` einmalig vorbereitet und anschließend über `UserStandardSound(SST_CUSTOM_SOUND, ...)` wiedergegeben. Die tatsächliche Klangqualität hängt vom Soundtreiber bzw. der Soundhardware ab und muss im Emulator geprüft werden.

## Build- und Teststatus

Der Anwender hat den Build mit seiner PC/GEOS-/FreeGEOS-Entwicklungsumgebung erfolgreich ausgeführt. Übermittelte Compilerdiagnose:

- GOC: 0 Warnungen, 0 Fehler
- Open Watcom: erfolgreich
- Glue: `moorgeos.geo` erzeugt
- Die resultierende Anwendung wurde im Emulator gestartet und visuell getestet.

Der Build-Befehl in der verwendeten Umgebung lautet:

```bat
C:\Geos\pcgeos\bin\pmake.exe -n
```

**Hinweis zu PMake:** In dieser Umgebung bedeutet `-n` „Make non error checking geode“ und führt den Build aus. `-u` gibt Befehle nur aus, ohne sie auszuführen.

Die konkreten lokalen SDK-Pfade können je nach Installation abweichen.

## Quellstruktur

- `src/moorgeos.goc` – Hauptprogramm und Spiel-/Zeichenlogik
- `src/moorgeos.goh` – Klassen-, Nachrichten- und Instanzdefinitionen
- `src/moorgeos.gp` – Geode-/Ressourcendefinition
- `src/moorgeosicons.goh` – Anwendungsicons
- `src/moorgeosaboutlogo.goh` – JM-Logo für den Info-Dialog
- `src/local.mk` – lokale Build-Konfiguration

## Versionshinweise

Details zu den Änderungen und den noch offenen Prüfpunkten stehen in [CHANGELOG.md](CHANGELOG.md).

## Abgrenzung und Rechte

GeoMoorhuhn lite ist ein eigenständiges Spielprojekt. Die Verwendung von Moorhuhn-Motiven oder -Ressourcen setzt voraus, dass deren Nutzungsrechte geklärt sind. Die im Projekt enthaltenen selbst erstellten Grafiken und das JM-Logo sind getrennt von etwaigen Rechten an Marken oder Original-Spielinhalten zu betrachten.
