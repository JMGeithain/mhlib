# MOORGEOS – Vorschlag für einen nativen FreeGEOS-Port

## Ziel
Ein eigenständiges Projekt `MOORGEOS` entwickeln: ein natives FreeGEOS-Spiel nach dem Spielprinzip des klassischen Moorhuhn. Originaltreue ist ein Ziel, soweit sie technisch und rechtlich möglich ist.

## Warum ein separates Repository?
`JMGeithain/mhlib` bleibt das Repository für die vorhandene MHLIB-Engine. Der FreeGEOS-Port soll eine eigenständige Codebasis werden und MHLIB nicht mit GEOS-spezifischem Code vermischen.

## Ausgangslage
Das Upstream-Projekt [Theaninova/mhlib](https://github.com/Theaninova/mhlib) beschreibt eine Engine-Neuimplementierung mit Rust und Godot. In dessen README ist Moorhuhn 1 aktuell als nicht implementiert markiert. MHLIB liefert keine Original-Spielressourcen mit; diese müssen aus einer eigenen Installation stammen.

## Erste Meilensteine
1. FreeGEOS-/GEOS-SDK-Zielumgebung und Beispielprogramme verifizieren.
2. Einen minimalen nativen GEOS-Prototyp mit Fenster, Spielfeld und Mausereignissen erstellen.
3. Zeitlimit, Treffererkennung und Punktestand implementieren.
4. Zulässig nutzbare Originalressourcenformate untersuchen und einen separaten Ressourcen-Importer entwerfen.
5. Im Emulator testen und Build- sowie Testanweisungen dokumentieren.

## Grenzen und Lizenz
Dies ist zunächst ein Projektvorschlag, kein bereits gebauter oder kompilierter Port. Keine Originalgrafiken, Sounds oder Spieldateien ohne geklärte Nutzungsrechte einchecken. Die MIT-Lizenz von MHLIB gilt für dessen eigenen Quellcode, nicht automatisch für das Moorhuhn-Material.

## Referenz
- https://github.com/Theaninova/mhlib
- Repository-Lizenz: https://github.com/Theaninova/mhlib/blob/main/LICENSE
