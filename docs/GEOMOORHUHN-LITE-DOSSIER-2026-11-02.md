# GeoMoorhuhn lite – Entwicklungsdossier
## Nachtrag: Fadenkreuz-Mauszeiger und Laufzeittest
**Stand:** 2. November 2026  
**Projektbereich:** PC/GEOS 1.x / GeoWorks 1.x  
**Projektversion laut Programmfenster:** 0.3

> Dieser Nachtrag dokumentiert den aktuellen, vom Anwender getesteten Stand. Er trennt ausdrücklich zwischen erfolgreich kompilierten Artefakten, beobachtetem Laufzeitverhalten und noch offenen Arbeiten.

## 1. Ergebnis des Fadenkreuz-Updates

Das Spiel zeigt während einer aktiven Runde einen eigenen Fadenkreuz-Mauszeiger. Der Anwender hat die neue Version in GeoWorks/PC/GEOS gestartet und mit zwei Bildschirmaufnahmen bestätigt:

- Vor Spielbeginn erscheint der normale Mauszeiger; die Spielfläche zeigt „KLICK ZUM START“.
- Nach dem Start der Runde ist das Fadenkreuz im Spielfeld sichtbar.
- Die Anzeige für Punkte, Fehler und Zeit bleibt während des Spiels aktiv.
- Das Spiel läuft während des Tests weiter; die Fehleranzeige reagiert auf Fehlschüsse.

**Status:** Fadenkreuz sichtbar und Spielablauf im Anwender-Test funktionsfähig.

Der Test belegt das Erscheinen des Fadenkreuzes und den fortgesetzten Spielablauf. Eine vollständige Prüfung sämtlicher Randfälle (z. B. Ende exakt bei Zeitablauf, Neustart nach Ablauf und Wechsel aus dem Spielfenster) ist in diesem Nachtrag nicht dokumentiert.

## 2. Technische Umsetzung

### 2.1 Pointer-Ressource

Der Fadenkreuzzeiger wird als 16×16-Pixel-Pointerdefinition bereitgestellt:

- Datentyp: `PointerDef16`
- Abmessungen: 16×16 Pixel
- Hotspot: (7, 7)
- Pointerdaten: 32 Byte Maske und 32 Byte Bilddaten
- Ressource: `CursorResource`, als `data shared` deklariert
- Chunk: `MoorGEOSCrosshair`

Die Ressource wird über `OptrToHandle(@MoorGEOSCrosshair)` gesperrt, während der Pointer gesetzt wird. Anschließend wird der Handle wieder entsperrt.

### 2.2 GenView-Nachricht

Die Pointerumschaltung erfolgt über:

`MSG_GEN_VIEW_SET_PTR_IMAGE`

mit der Pointer-Ebene `PIL_WINDOW`.

Beim Start der Runde wird `@MoorGEOSCrosshair` gesetzt. Für den Rückwechsel zum Standardzeiger wird `NullOptr` übergeben.

### 2.3 Zustandsübergänge

Im Spielablauf sind folgende Übergänge vorgesehen:

1. Erster Mausklick startet die 60-Sekunden-Runde und aktiviert den Fadenkreuzzeiger.
2. Beim Ende der Runde wird der aktive Spielzustand beendet und der Standardzeiger wiederhergestellt.
3. Beim Start eines neuen Spiels wird der Standardzustand hergestellt; beim erneuten Start der Runde wird das Fadenkreuz wieder aktiviert.

Die Laufzeitaufnahmen bestätigen das Fadenkreuz während des Spiels. Die genaue Prüfung des automatischen Rückwechsels nach Ablauf und beim Neustart bleibt als separater Testpunkt offen.

## 3. Build- und Compilerprotokoll

**Build-Umgebung laut Projektangaben:**

- SDK: `C:\\Geos\\pcgeos`
- Projekt: `C:\\Geos\\pcgeos\\Local\\MOORGEOS`
- PMake: `C:\\Geos\\pcgeos\\bin\\pmake.exe`
- Watcom: `C:\\WATCOM-V2`

Aufruf in der DOS-Eingabeaufforderung:

```bat
cd /d C:\\Geos\\pcgeos\\Local\\MOORGEOS
C:\\Geos\\pcgeos\\bin\\pmake.exe
```

### 3.1 Nachgewiesenes Build-Ergebnis

Der vom Anwender übermittelte Buildlauf endete ohne Compilerfehler:

- `moorgeos.ec`: 18.364 Zeilen, 53.807 inkludierte Zeilen
- Warnungen: 0
- Fehler: 0
- Codegröße: 3.050 Byte
- Glue-Ausgabe: `moorgeosec.geo`
- Glue-Ressource `CursorResource`: 92 Byte, 1 Relocation
- gemeldete Gesamtgröße: 10.514 Byte
- uninitialisierte Daten/Stack: 2.000 Byte

Damit ist belegt, dass die Cursor-Ressource in `moorgeosec.geo` eingebunden wurde und der Build erfolgreich durchlief.

**Wichtig:** Die erfolgreiche Kompilierung von `moorgeosec.geo` ist kein Nachweis, dass eine eigenständige zweite Datei `moorgeos.geo` bereits erzeugt wurde. Diese zweite Variante soll separat gelinkt und anschließend ebenfalls geprüft werden.

## 4. Projektdateien und Varianten

| Datei | Bedeutung / Status |
|---|---|
| `moorgeos.goc` | GOC-Quelltext mit Spiel- und Pointerimplementierung |
| `moorgeos.goh` | Headerdatei |
| `moorgeos.gp` | Projekt-/Glue-Konfiguration |
| `moorgeosec.geo` | Nach dem dokumentierten Build erzeugtes Programm mit CursorResource |
| `moorgeos.geo` | Eigenständige zweite Variante; separater Build und Test noch zu bestätigen |

Die Varianten dürfen nicht allein durch Umbenennen gleichgesetzt werden. Für die zweite Variante ist der tatsächliche Glue-Aufruf bzw. das Ausgabefile im Buildprotokoll zu prüfen.

## 5. PC/GEOS-Kompatibilitätsrahmen

Die Implementierung und dieses Dossier beziehen sich auf PC/GEOS 1.x / GeoWorks 1.x. PC/GEOS 2.x bzw. FreeGEOS ist keine Grundlage für die hier dokumentierte Implementierung.

## 6. Offene Prüfpunkte

- [ ] Automatischen Rückwechsel zum Standardzeiger nach Ablauf der 60 Sekunden ausdrücklich testen.
- [ ] Rückwechsel beim Neustart eines Spiels ausdrücklich testen.
- [ ] Eigenständige Variante `moorgeos.geo` separat linken; Glue-Ausgabe kontrollieren.
- [ ] Zweite Variante in GeoWorks/PC/GEOS 1.x starten und Laufzeitverhalten prüfen.
- [ ] Beide Varianten und die zugehörigen Quellstände eindeutig versionieren.

## 7. Änderungsstatus

**Erledigt:** Pointer-Ressource eingebunden, Build von `moorgeosec.geo` erfolgreich, Fadenkreuz im laufenden Spiel durch Anwender sichtbar getestet.

**Noch nicht als erledigt zu deklarieren:** separater Build und Laufzeittest von `moorgeos.geo`; vollständiger Test der Zeitschranke und des automatischen Pointer-Rückwechsels.

---
*Dokumentationsnachtrag erstellt auf Grundlage des übermittelten Buildprotokolls, der Projektangaben und der Laufzeit-Rückmeldung des Anwenders vom 2. November 2026.*
