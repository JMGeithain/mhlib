# Änderungsprotokoll

## Version 0.7 – implementiert, Build-/Emulatortest offen

- Fallgeschwindigkeit für alle drei Hühner von 12 auf 18 Pixel pro Animationstakt erhöht (50 % mehr Weg pro Tick); Timerintervall bleibt unverändert.
- Während ein Huhn im Zustand FALLING ist, wird über dem normalen Moorhuhn-Sprite ein deutlich fetteres, vollständig schwarzes X aus jeweils fünf parallelen Strichen pro Diagonale gezeichnet (statt des zuvor zu schwach sichtbaren roten X mit Kontur). Beim Respawn verschwindet das Trefferzeichen automatisch, da das Huhn wieder den Zustand FLYING erhält.
- Der Anwender meldet, dass die v0.6-Treffer-/Fall-/Respawn-Funktion bereits recht gut funktioniert. Die beiden v0.7-Anpassungen müssen noch kompiliert und im Emulator geprüft werden.


## Version 0.6 – im Emulator funktionsfähig

- Trefferprüfung merkt sich, welches der drei fliegenden Hühner getroffen wurde.
- Nur das getroffene Huhn wechselt in den Zustand FALLING; fallende bzw. ausgeblendete Hühner können nicht erneut getroffen werden.
- Separater schneller GEOS-Timer animiert das Huhn nach unten, unabhängig von der 60-Sekunden-Spieluhr.
- Nach dem Aufkommen wird das Huhn fünf Animationstakte ausgeblendet und erscheint anschließend an einer anderen Startposition mit geänderter Flugrichtung wieder.
- Zwei Animationstakte nach dem Schuss wird ein synthetischer Stimmeffekt über `IP_CHOIR_AAHS` abgespielt, damit er das Schussgeräusch nicht überdeckt. Dies ist keine Sprachaufnahme.
- Der Falltimer wird beendet, wenn keine Hühner mehr in FALLING/WAITING sind, außerdem bei Spielende und beim Neustart.
- Versionsanzeige im Infofenster auf `Version 0.6` geändert.
- Erster Buildversuch: GOC meldete zwei Fehler wegen `retVal` im benutzerdefinierten `MSG_MOORGEOS_FALL_TICK`-Handler. Diese Timer-Nachricht besitzt keinen `MouseReturnParams`-Rückgabewert; die beiden unzulässigen `retVal->flags`-Zuweisungen wurden entfernt.
- Die Timer-Handler-Korrektur wurde anschließend erfolgreich in den laufenden Entwicklungsstand übernommen. Der Anwender bestätigt, dass Treffer-, Fall- und Respawn-Verhalten in v0.6 im Emulator bereits recht gut funktionieren.

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
