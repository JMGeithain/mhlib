# MOORGEOS source skeleton

This directory contains the first native FreeGEOS application skeleton.

## Current status

- Project metadata, GOC source, class header and standard `local.mk` are present.
- The drawing method is a placeholder scene, not gameplay.
- The source has **not** been compiled or run yet. GOC/compiler and graphics API compatibility must be checked against the exact FreeGEOS SDK used.
- No copyrighted original Moorhuhn images or sounds are included.

## Next validation

1. Place/copy this directory into the expected application tree of a configured FreeGEOS/PC-GEOS source checkout.
2. Confirm that the build system recognizes the target and compiles the `.gp` and `.goc` files.
3. Resolve any version-specific API or syntax issues based on actual compiler output.
4. Launch in the project's supported emulator and confirm the window and placeholder scene render.
5. Only then add mouse input and hit detection.

Reference project: https://github.com/mgroeber9110/freegeos-raycast
SDK documentation: https://bluewaysw.github.io/pcgeos/


## Source review update

A source-level consistency review found that `MSG_MOORGEOS_REDRAW` was initially declared under the visual object's class even though the trigger targets the process. The declaration now belongs to `MoorGEOSProcessClass` in `moorgeos.goh`; the duplicate local declaration was removed from `moorgeos.goc`.

This is a source review correction only. It does not establish that the project compiles. The next validation must use the actual configured FreeGEOS/PC-GEOS SDK and record the first compiler diagnostics rather than guessing at compatibility.

## Maus-Eingabe: Referenz gefunden

Bei der Recherche im offiziellen FreeGEOS-Repository wurde `Appl/SDK_C/TicTac/tictac.goc` gefunden. Das Beispiel behandelt `MSG_META_START_SELECT`, fordert bei Bedarf den Gadget-Exklusivzugriff an, verwendet `MSG_VIS_GRAB_MOUSE` und markiert ein verarbeitetes Ereignis mit `MRF_PROCESSED`. `Appl/SDK_C/Vis/VisSamp/vissamp.goc` dokumentiert ebenfalls die sichtbare Objektstruktur und die Weiterleitung von Mausereignissen.

Diese Beispiele sind als technische Referenz für die nächste Änderung gespeichert; sie sind keine Bestätigung, dass die derzeitige MOORGEOS-Klasse bereits Eingabeereignisse empfängt. Der aktuelle Entwurf zeichnet noch direkt in einer sichtbaren Klasse. Vor dem Implementieren der Trefferprüfung muss die Spielszene in eine geeignete `GenViewClass`-/`VisContentClass`-Struktur überführt oder eine andere vom SDK belegte Eingaberoute gewählt werden.

Quellen:
- https://github.com/bluewaysw/pcgeos/blob/master/Appl/SDK_C/TicTac/tictac.goc
- https://github.com/bluewaysw/pcgeos/blob/master/Appl/SDK_C/Vis/VisSamp/vissamp.goc
