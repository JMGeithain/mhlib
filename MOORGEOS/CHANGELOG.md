# Änderungsprotokoll

## Version 0.5 – in Entwicklung

- Versionsanzeige im Infofenster auf `Version 0.5` geändert.
- Ersten Schusston beim linken Mausklick ergänzt: `UserStandardSound(SST_CUSTOM_NOTE, HIGH_E, 20)`.
- Der Ton ist zunächst ein kurzer GEOS-Standardton (20 ms), noch kein speziell gesampelter Schussklang. Klang und Funktion müssen im Emulator geprüft werden.


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
