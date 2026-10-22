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
