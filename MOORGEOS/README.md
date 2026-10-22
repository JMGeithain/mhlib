# MOORGEOS

**Ein eigenständiges natives Spielprojekt für FreeGEOS, inspiriert vom klassischen Moorhuhn.**

Status: Quellgerüst und erste Spielkonzeption liegen vor. Noch kein nachweislich kompiliertes oder lauffähiges Spiel.

## Ziel
Ein kleines 2D-Zielschießspiel mit beweglichen Zielen, Maussteuerung, Treffererkennung, Zeitlimit und Punktestand für FreeGEOS. Originalgetreue Gestaltung ist erst möglich, wenn die technischen Voraussetzungen und die Nutzungsrechte an Originalressourcen geklärt sind.

## Warum eigenständig?
Die Referenz [Theaninova/mhlib](https://github.com/Theaninova/mhlib) verwendet Rust und Godot. Diese Engine kann nicht direkt als native GEOS-Anwendung laufen. MHLIBs Code kann als technische Referenz für Datenformate dienen, wo passend; der GEOS-Port muss seine eigene Anwendung und Grafik-/Eingabelogik erhalten.

## Projektregeln
- Zielplattform ist FreeGEOS; GeoWorks 1.2-Kompatibilität wird nicht ungeprüft vorausgesetzt.
- Keine Original-Spieldateien, Sounds oder geschützten Grafiken ohne geklärte Nutzungsrechte einchecken.
- Quellcode von MHLIB steht laut Upstream unter MIT-Lizenz; diese Lizenz deckt nicht automatisch Moorhuhn-Inhalte ab.
- Keine Behauptung eines erfolgreichen Builds, bis tatsächlich mit dem passenden SDK kompiliert und getestet wurde.

## Meilensteine
1. **SDK verifizieren:** FreeGEOS-Version, Compiler, GOC/GEOS-SDK, verfügbare Beispielanwendungen und Emulator festhalten.
2. **Grafik-Prototyp:** Native Anwendung starten und Hintergrund-/Zielfläche zeichnen.
3. **Maus-Eingabe:** Cursor-/Schussposition und Klicks erfassen.
4. **Spielablauf:** Zielbewegung, Trefferprüfung, Punkte und Rundenzeit.
5. **Ressourcen:** Formate eigener oder rechtlich freigegebener Grafiken untersuchen; optional Originalressourcen-Import dokumentieren.
6. **Tests:** Buildschritte reproduzierbar dokumentieren und in einem FreeGEOS-Emulator prüfen.

## Aktueller Stand
Das Verzeichnis `src/` enthält inzwischen ein natives GOC-Anwendungsgerüst mit einer einfachen Testszene (Himmel, Wiese, schematische Zielfigur) sowie `.gp`- und Build-Dateien. Das ist noch kein spielbarer Prototyp und wurde noch nicht kompiliert. Die Spielregeln und Testfälle stehen in [GAMEPLAY-SPEC.md](GAMEPLAY-SPEC.md). Die offizielle FreeGEOS-Beispielanwendung `TicTac` wurde als Referenz für die Mausereignisse untersucht; die Integration muss mit der tatsächlichen SDK-Toolchain gebaut und geprüft werden.

## Referenzen
- MHLIB: https://github.com/Theaninova/mhlib
- MHLIB-README: https://github.com/Theaninova/mhlib/blob/main/README.md
- MHLIB-Lizenz: https://github.com/Theaninova/mhlib/blob/main/LICENSE
