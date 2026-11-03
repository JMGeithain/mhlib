# GeoMoorhuhn lite – Entwicklungsdossier
## Nachtrag: Version 0.4 – Bitmapmasken, flackerfreie Darstellung und HUD-Abstände
**Stand:** 3. November 2026 (Plattformzuordnung korrigiert)  
**Projektbereich:** PC/GEOS 2.x und höher / FreeGEOS  
**Projektversion laut Programmfenster:** 0.4  
**Maßgebliches Repository:** `JMGeithain/mhlib`  
**Dokumentationsbranch:** `geomoorhuhn-lite-v0.1`

> Dieser Nachtrag ergänzt den vorherigen Stand vom 2. November 2026. Eine frühere Fassung bezeichnete die Zielplattform irrtümlich als GeoWorks 1.x; diese Zuordnung ist hier korrigiert. Er unterscheidet zwischen den vom Anwender bestätigten Laufzeitergebnissen und den technischen Änderungen am Quelltext.

## 1. Zusammenfassung des getesteten Ergebnisses

Der Anwender hat die Version 0.4 in PC/GEOS 2.x / FreeGEOS gestartet und mit Bildschirmaufnahmen vom 3. November 2026 bestätigt:

- Die drei Moorhuhn-Sprites werden vollständig und ohne horizontale Streifen dargestellt.
- Die schwarzen quadratischen Ecken des JM-Logos sind verschwunden; das kreisförmige Logo bleibt einschließlich seiner inneren schwarzen Konturen erhalten.
- Die Anzeige flackert während des Spiels nach Rückmeldung des Anwenders nicht mehr.
- Punkte-, Fehler- und Zeitanzeige funktionieren.
- Das Fadenkreuz ist während des Spiels sichtbar.
- Treffer-Rückmeldung und Spielende-Anzeige werden dargestellt.
- Die schwarzen Hintergründe der Textanzeigen wurden vergrößert, damit die Schrift mehr Abstand zum Rand hat.

**Status:** Version 0.4 wurde vom Anwender erfolgreich kompiliert und im laufenden Spiel visuell geprüft. Die genannten Bild- und Anzeigeprobleme gelten für diesen Teststand als behoben.

Die Bildschirmaufnahmen belegen den dargestellten Spielzustand und die Spielende-Anzeige. Sie ersetzen keine systematische Prüfung aller möglichen Spielabläufe oder Randfälle.

## 2. Korrektur der Moorhuhn-Bitmap

### 2.1 Ausgangsfehler

Die drei Vogelgrafiken wurden zunächst als horizontale Streifen bzw. Fragmente dargestellt. Die Bitmapdefinition verwendet:

- Abmessungen: 52 × 70 Pixel
- Farbtiefe: 4 Bit pro Pixel
- Maskierung: 1 Bit pro Pixel
- Bitmaptyp: `BMC_UNCOMPACTED`
- Flags: `BMT_MASK | BMF_4BIT`
- GString-Längenangabe: 2.316 Byte

### 2.2 Ursache und Korrektur

Die beiden Datenebenen waren im Quelltext zunächst vollständig hintereinander abgelegt: erst die gesamte Maske, dann die gesamte Pixelebene. Für das verwendete maskierte Bitmapformat müssen Maske und Bilddaten dagegen zeilenweise verschachtelt sein.

Die Daten sind jetzt pro Scanline angeordnet:

1. 7 Byte Maskendaten für eine Zeile (52 Pixel, auf Byte-Grenze aufgerundet).
2. 26 Byte 4-Bit-Pixeldaten für dieselbe Zeile.
3. Danach folgen Maske und Pixeldaten der nächsten Zeile.

Berechnung:
- Maske: 70 × 7 = 490 Byte
- Pixeldaten: 70 × 26 = 1.820 Byte
- Bitmapdaten gesamt: 490 + 1.820 = 2.310 Byte
- Bitmap-Header: 6 Byte
- GString-Längenangabe: 2.310 + 6 = 2.316 Byte

Die Bildpixel selbst wurden bei der Umordnung nicht absichtlich verändert; geändert wurde die Reihenfolge der Masken- und Pixeldaten.

**Laufzeitergebnis:** Nach dieser Korrektur werden alle drei Moorhühner vollständig dargestellt. Der Anwender bestätigt außerdem, dass das Flackern nicht mehr auftritt.

## 3. Transparenzmaske des JM-Logos

Das JM-Logo liegt in der separaten Include-Datei `moorgeosaboutlogo.goh` als 72 × 72 Pixel große, unkomprimierte 4-Bit-Bitmap vor.

Die ursprüngliche Bitmap hatte keine Transparenzmaske. Dadurch war der schwarze rechteckige Hintergrund sichtbar.

Für die korrigierte Bitmap wurde eine 1-Bit-Transparenzmaske ergänzt:
- Abmessungen: 72 × 72 Pixel
- Maske: 9 Byte pro Zeile
- Pixeldaten: 36 Byte pro Zeile
- Datenanordnung: Maske und Pixeldaten zeilenweise verschachtelt
- Maskendaten: 72 × 9 = 648 Byte
- Pixeldaten: 72 × 36 = 2.592 Byte
- Daten zusammen: 3.240 Byte
- Mit 6 Byte Bitmap-Header: 3.246 Byte

Die Maske macht nur die mit dem äußeren Bildrand verbundenen schwarzen Hintergrundbereiche transparent. Schwarze Innenflächen und Konturen des JM-Motivs bleiben erhalten.

**Laufzeitergebnis:** Im Info-Dialog ist das Logo rund dargestellt; die zuvor sichtbaren schwarzen quadratischen Ecken sind verschwunden.

## 4. Vergrößerte schwarze Text-Hintergründe

Die schwarzen Flächen hinter den Textanzeigen wurden erweitert. Die Textpositionen und Texte blieben unverändert.

| Anzeige | Rechteck vorher | Rechteck Version 0.4 |
|---|---|---|
| Punkte / Fehler / Zeit | (4, 4) bis (132, 55) | (0, 4) bis (132, 59) |
| „KLICK ZUM START“ | (100, 225) bis (300, 245) | (96, 225) bis (300, 249) |
| „TREFFER!“ / „DANEBEN“ | (142, 225) bis (258, 245) | (138, 225) bis (258, 249) |
| „SPIEL VORBEI“ | (130, 188) bis (270, 212) | (126, 188) bis (270, 216) |

Die Erweiterung erfolgt nach links und nach unten. Die Schrift wird dadurch nicht mehr so dicht am Rand der schwarzen Flächen dargestellt.

**Laufzeitergebnis:** Der Anwender hat die vergrößerten Flächen in den Screenshots der aktiven Runde und des Spielendes geprüft.

## 5. Build- und Compilerprotokoll für Version 0.4

**Build-Umgebung:**
- SDK: `C:\Geos\pcgeos`
- Projekt: `C:\Geos\pcgeos\Local\MOORGEOS`
- PMake: `C:\Geos\pcgeos\bin\pmake.exe`
- Open Watcom: `C:\WATCOM-V2`

Der vom Anwender verwendete Build-Aufruf lautet:

```bat
C:\Geos\pcgeos\bin\pmake.exe -n
```

**Wichtige Klarstellung zur PMake-Option:** In dieser PC/GEOS-PMake-Version bedeutet `-n` „Make non error checking geode“ und führt den Build aus. Die Option `-u` bedeutet dagegen, dass Befehle nur ausgegeben und nicht ausgeführt werden. Die frühere Deutung von `-n` als reiner Vorschau-/Trockenlauf war falsch.

### 5.1 Vom Anwender übermittelte Build-Ausgabe

- GOC-Ausgabe: `moorgeos.nc`
- GOC-Quelltext: 18.542 Zeilen
- inkludierte Zeilen: 53.807
- Compilerwarnungen: 0
- Compilerfehler: 0
- Codegröße: 2.861 Byte
- erzeugtes Objekt: `moorgeos.obj`
- Glue-Ausgabe: `moorgeos.geo`
- `CoreBlock`: 0 Byte
- `dgroup`: 240 Byte, 9 Relocations
- `moorgeos_TEXT`: 2.856 Byte, 73 Relocations
- `AppResource`: 416 Byte, 1 Relocation
- `AppMonikerResource`: 4.488 Byte, 1 Relocation
- `Interface`: 860 Byte, 1 Relocation
- `BoardBlock`: 2.540 Byte, 1 Relocation
- `CursorResource`: 92 Byte, 1 Relocation
- Glue-Gesamtgröße: 11.492 Byte
- uninitialisierte Daten/Stack: 2.000 Byte

**Build-Status:** Erfolgreich; 0 Warnungen und 0 Fehler. Die Ausgabe weist ausdrücklich `moorgeos.geo` aus.

## 6. Projekt- und Kompatibilitätsrahmen

Die hier dokumentierte Entwicklung bezieht sich auf PC/GEOS 2.x und höher bis hin zu FreeGEOS. GeoWorks 1.x / PC/GEOS 1.x ist ausdrücklich nicht die Zielplattform dieses Projekts.

Die wesentlichen Änderungen von Version 0.4 betreffen:
- `moorgeos.goc`: zeilenweise verschachtelte Masken- und Pixeldaten für die Vogelgrafik sowie vergrößerte HUD-/Text-Hintergründe.
- `moorgeosaboutlogo.goh`: Transparenzmaske für das JM-Logo.

## 7. Offene Prüfpunkte

- [ ] Rückwechsel vom Fadenkreuz zum Standardzeiger nach Ablauf der Runde ausdrücklich prüfen.
- [ ] Rückwechsel beim Neustart eines Spiels ausdrücklich prüfen.
- [ ] Weitere Spielrunden und unterschiedliche Treffer-/Fehlschussfolgen systematisch testen.
- [ ] Die vollständige Projektdateiliste und die Zuordnung der verwendeten Quell- und Include-Dateien im Repository konsolidieren.

## 8. Änderungsstatus Version 0.4

**Durch Anwender bestätigt:**
- Vogelgrafiken vollständig und ohne Streifen.
- JM-Logo ohne schwarze quadratische Ecken.
- Kein sichtbares Flackern im gezeigten Spieltest.
- Vergrößerte schwarze Text-Hintergründe.
- Punkte-, Fehler-, Zeit-, Treffer- und Spielende-Anzeigen im Screenshot sichtbar.
- Build von `moorgeos.geo` mit 0 Warnungen und 0 Fehlern.

**Nicht als abschließend geprüft deklarieren:** alle Randfälle des Mauszeigerwechsels, sämtliche Spielzustände und eine vollständige Langzeit-/Stabilitätsprüfung.

---
*Dokumentationsnachtrag vom 3. November 2026 auf Grundlage der vom Anwender übermittelten PMake-/Compiler-Ausgabe und der Bildschirmaufnahmen vom 3. November 2026.*
