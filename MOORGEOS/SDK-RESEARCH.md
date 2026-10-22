# FreeGEOS SDK-Voruntersuchung

Stand: 2026-10-22

## Verifizierte Quellen

### PC/GEOS-Quellcode und SDK
Repository: https://github.com/bluewaysw/pcgeos

Das Upstream-README beschreibt das Repository als Quellcodebasis für PC/GEOS, SDK und Release-Builds. Als Basis nennt es Breadbox Ensemble 4.13 mit bestimmten aus Lizenzgründen entfernten Modulen. Das ist eine spätere PC/GEOS-Codebasis und darf nicht mit GeoWorks 1.2 gleichgesetzt werden.

Das README dokumentiert u. a. folgende Build-Abhängigkeiten und Umgebungsvariablen:
- Open Watcom (README nennt einen getesteten Snapshot vom 2020-12-01)
- `WATCOM`, `ROOT_DIR`, `LOCAL_ROOT`
- `sed` und `perl`
- optional `BASEBOX` für den BaseBox-Emulator
- SDK-/Target-Build über `pmake`

Quellen:
- https://github.com/bluewaysw/pcgeos/blob/master/README.md
- Entwicklerdokumentation: https://bluewaysw.github.io/pcgeos/

### Vorhandenes natives GEOS-Spiel als Beispiel
Repository: https://github.com/mgroeber9110/freegeos-raycast

Die README beschreibt Geo Raycast als natives GEOS-Programm. Das Repository enthält unter anderem:
- `raycast.gp`
- `raycast/raycast.goc`
- `render/render.goc`
- `raycast.goh`
- `local.mk`

README: https://github.com/mgroeber9110/freegeos-raycast/blob/main/README.md

Dieses Projekt ist ein sinnvoller Referenzpunkt, um die Struktur einer nativen GEOS-Anwendung, Build-Dateien und GOC-Code zu studieren. Es ist jedoch ein 3D-/Raycasting-Demo und kein Moorhuhn-Port.

### Dokumentationspfade im PC/GEOS-Repository
Die Quellcodeübersicht enthält u. a.:
- `TechDocs/Markdown/Concepts/cbuild.md`
- `TechDocs/Markdown/Ddk/ddkmouse.md`
- `TechDocs/Markdown/Routines/rgoc.md`

Diese Dokumente sollten vor Implementierung im Detail gelesen werden, insbesondere für Build, Mausereignisse und GOC-Routinen.

## Konsequenzen für MOORGEOS

1. Nicht von Rust/Godot nach FreeGEOS portieren; eine native GEOS-Anwendung mit GOC/GEOS-SDK entwickeln.
2. `freegeos-raycast` als Strukturbeispiel prüfen, ohne seinen Rendering-Code ungeprüft zu übernehmen.
3. Zuerst eine minimale Anwendung mit `.gp`, `local.mk` und `.goc` aufbauen und tatsächlich kompilieren.
4. Erst nach einem reproduzierbaren Build Spielfeld, Maussteuerung, Zielbewegung und Trefferprüfung ergänzen.
5. Die Kompatibilität mit FreeGEOS ist nicht automatisch gleichbedeutend mit Kompatibilität zu GeoWorks 1.2.

## Noch nicht verifiziert

- Dass die aktuelle lokale Toolchain des Nutzers installiert und lauffähig ist.
- Dass ein MOORGEOS-Prototyp bereits kompiliert oder im Emulator getestet wurde.
- Dass die Originalressourcen des ersten Moorhuhn-Spiels in einem für diesen Port nutzbaren Format vorliegen.
- Dass Originalgrafiken und Sounds ohne zusätzliche Rechte verwendet werden dürfen.

## Nächster technischer Schritt

Die Referenzdateien `raycast.gp`, `raycast/raycast.goc` und `local.mk` aus `freegeos-raycast` vergleichen und daraus die kleinste korrekte Projektstruktur für eine eigenständige GEOS-Anwendung ableiten. Danach eine minimale Anwendung erstellen und erst dann mit dem Spielfeld beginnen.
