# Änderungsprotokoll

## Version 0.6 – implementiert, Build-/Emulatortest offen

- Trefferprüfung merkt sich, welches der drei fliegenden Hühner getroffen wurde.
- Nur das getroffene Huhn wechselt in den Zustand FALLING; fallende bzw. ausgeblendete Hühner können nicht erneut getroffen werden.
- Separater schneller GEOS-Timer animiert das Huhn nach unten, unabhängig von der 60-Sekunden-Spieluhr.
- Nach dem Aufkommen wird das Huhn fünf Animationstakte ausgeblendet und erscheint anschließend an einer anderen Startposition mit geänderter Flugrichtung wieder.
- Treffer lösen zusätzlich zum Schuss-Sound einen synthetischen Stimmeffekt über das General-MIDI-Instrument `IP_VOICE_OOHS` aus. Dies ist keine Sprachaufnahme.
- Der Falltimer wird beendet, wenn keine Hühner mehr in FALLING/WAITING sind, außerdem bei Spielende und beim Neustart.
- Versionsanzeige im Infofenster auf `Version 0.6` geändert.
- **Teststatus:** Quellcode und Dokumentation aktualisiert; v0.6 wurde noch nicht neu kompiliert oder im Emulator geprüft. Die v0.5-Build- und Soundtests bleiben der letzte bestätigte Stand.

## Version 0.5 – im Entwicklungszweig getestet

- Versionsanzeige im Infofenster auf `Version 0.5` geändert.
- Schussgeräusch auf das GEOS-Instrument `IP_GUNSHOT` umgestellt.
- Das Instrument wird mit `SoundAllocMusicNote(IP_GUNSHOT, 0, MIDDLE_C, DYNAMIC_FFFF, SSDTT_TEMPO, QUARTER, ...)` vorbereitet und bei Mausklicks über `UserStandardSound(SST_CUSTOM_SOUND, ...)` abgespielt.
- `library sound` in `src/moorgeos.gp` ergänzt. Damit wird `SoundAllocMusicNote` beim Linken aufgelöst; zuvor trat `SOUNDALLOCMUSICNOTE undefined2` auf.
- Anwender bestätigt erfolgreichen Build nach Ergänzung der Sound-Bibliothek.
- Anwender bestätigt den Emulator-Test: Der Klang funktioniert und klingt wie ein Schuss.

## Version 0.4 – 3. November 2026

### Grafik und Darstellung
- Masken- und Pixeldaten der 52 × 70 Pixel großen Vogel-Bitmap zeilenweise verschachtelt: je Scanline 7 Byte Maske plus 26 Byte 4-bpp-Pixeldaten.
- Dadurch werden die drei Moorhuhn-Sprites vollständig statt als horizontale Streifen dargestellt.
- Transparenzmaske für das 72 × 72 Pixel große JM-Logo ergänzt. Äußerer schwarzer Hintergrund ist transparent; innere schwarze Motivteile bleiben erhalten.
- Schwarze Hintergründe der HUD- und Statusmeldungen vergrößert, damit die Schrift mehr Abstand zum Rand hat.
- Anwender bestätigt, dass die Darstellung im Emulator nicht mehr flackert.

### Spielablauf und Anzeige
- Drei bewegte Vogel-Sprites.
- Fadenkreuz während des Spiels.
- Punkte-, Fehler- und Zeitanzeige.
- 60-Sekunden-Runde, Treffer-/Daneben-Anzeige und Spielende-Meldung.

### Build und Test
- Anwender meldet erfolgreichen Build der `moorgeos.geo` mit 0 Compilerwarnungen und 0 Compilerfehlern.
- Version 0.4 wurde im Emulator gestartet und anhand von Bildschirmaufnahmen geprüft.

### Noch offen
- Mauszeiger-Rückwechsel bei Spielende und Neustart gezielt in weiteren Randfällen testen.
- Weitere Spielrunden und unterschiedliche Treffer-/Fehlschussfolgen prüfen.
- Reproduzierbaren Build mit den konkreten SDK-Versionen und vollständigen Toolchain-Informationen dokumentieren.

## Frühere Entwicklungsstände

Die ältere Prototyp-Fassung unter `src/` wurde zunächst als nicht kompilierter FreeGEOS-Entwurf dokumentiert. Version 0.4 ersetzt diesen Funktionsstand. Die Versionshistorie bleibt im Git-Verlauf nachvollziehbar.
