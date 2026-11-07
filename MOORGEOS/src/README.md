# GeoMoorhuhn lite – Quellstand

## Plattform und bestätigter Ausgangsstand

- Eigenständige native GOC-Anwendung für PC/GEOS 2.x und FreeGEOS; keine Kompatibilitätszusage für GeoWorks 1.x / PC/GEOS 1.x.
- Das Projekt besitzt eine `GenViewClass` mit einer `VisContentClass`-Spielfläche.
- Der bisherige Stand v0.5 wurde mit der vorhandenen FreeGEOS-Toolchain erfolgreich kompiliert und im Emulator gestartet. Der Schuss-Sound über `IP_GUNSHOT` wurde dort ebenfalls geprüft.
- Die neue Trefferreaktion in v0.6 ist im Quellcode umgesetzt, aber noch nicht neu kompiliert oder im Emulator getestet.

## Spielszene und bisherige Funktionen

- Spielfläche mit Himmel, Wiese, Sonne und drei bewegten 52 × 70 Pixel großen Vogel-Sprites.
- Mausgesteuertes Fadenkreuz.
- Treffer- und Fehlschusszähler, Punkteanzeige und 60-Sekunden-Runde.
- Schussgeräusch über das GEOS-Instrument `IP_GUNSHOT`.
- Die GEOS-Sound-Bibliothek ist über `library sound` in der Geode-Definition eingebunden.

## Version 0.6 – Trefferreaktion

Jedes der drei Hühner besitzt einen eigenen Zustand:

- `0`: fliegend und treffbar.
- `1`: getroffen und fallend.
- `2`: am Boden angekommen und während der kurzen Respawn-Pause ausgeblendet.

Beim Treffer:

1. Die Trefferprüfung merkt sich die Nummer des tatsächlich getroffenen Huhns.
2. Nur dieses Huhn wechselt in den Fallzustand; die anderen fliegen weiter.
3. Ein kurzer synthetischer Stimmeffekt wird mit `IP_CHOIR_AAHS` angefordert. Es handelt sich um einen General-MIDI-Instrumentklang, nicht um eine echte Sprachaufnahme.
4. Ein separater schneller Timer bewegt das Huhn nach unten. Die reguläre Spieluhr läuft unabhängig davon weiter.
5. Nach dem Erreichen der Wiese wird das Huhn für fünf Animationstakte ausgeblendet.
6. Danach erscheint es an einer anderen Startposition und mit geänderter Flugrichtung wieder.

Fallende oder ausgeblendete Hühner sind nicht erneut treffbar. Der Animationstimer wird beendet, sobald kein Huhn mehr fällt oder auf seinen Wiedereintritt wartet. Bei Spielende und bei „Neues Spiel“ wird er ebenfalls gestoppt.

## Teststatus und offene Prüfungen

**Noch nicht bestätigt für v0.6:** Der Quellcode wurde geändert und dokumentiert; ein erfolgreicher Build oder Emulatorlauf dieser Version liegt noch nicht vor.

Beim nächsten Build-/Emulatortest gezielt prüfen:

1. Kompilierung und Linken mit der vorhandenen `C:\\Geos\\pcgeos`-Toolchain.
2. Ob `IP_CHOIR_AAHS` auf dem installierten Soundtreiber hörbar ist und nicht den Schuss-Sound unerwünscht abschneidet.
3. Ob das getroffene Huhn sichtbar bis in die Wiese fällt.
4. Ob nach kurzer Pause genau dieses Huhn wieder erscheint.
5. Ob die anderen Hühner währenddessen normal weiterfliegen und treffbar bleiben.
6. Ob mehrere Treffer kurz hintereinander mehrere unabhängige Fall-/Respawn-Abläufe korrekt verarbeiten.
7. Ob Spielende und „Neues Spiel“ beide Timer zuverlässig beenden bzw. zurücksetzen.

## Relevante Dateien

- `moorgeos.goc` – Zeichen-, Treffer-, Sound- und Timerlogik.
- `moorgeos.goh` – Nachrichten und Instanzvariablen, einschließlich Zuständen und Respawn-Zählern je Huhn.
- `moorgeos.gp` – Geode- und Bibliotheksdefinition.
- `local.mk` – Build-Konfiguration.

## Technische Referenzen

- [FreeGEOS sound.h](https://github.com/bluewaysw/pcgeos/blob/master/CInclude/sound.h) – Instrumente und Sound-API.
- [FreeGEOS timer.h](https://github.com/bluewaysw/pcgeos/blob/master/CInclude/timer.h) – Timer-API.
- [FreeGEOS-Quellcode](https://github.com/bluewaysw/pcgeos)
- [TicTac-Beispiel](https://github.com/bluewaysw/pcgeos/blob/master/Appl/SDK_C/TicTac/tictac.goc)

Die SDK-Referenzen erklären die verwendeten APIs; sie ersetzen nicht den Build- und Laufzeittest mit der konkreten installierten Umgebung.
