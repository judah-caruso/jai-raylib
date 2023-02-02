# Raylib

Raylib 4.2.0 bindings for Jai.

## Usage

See: `examples/`

## Notes

- These are generated using Jai's Bindings_Generator library (`jai generate.jai`)
- `extras.jai` contains auto-generated macros for Begin/End procs.


To generate bindings for a different version of Raylib:

- Place headers in `lib/` and compiled libraries in `win/`, `mac/`, or `linux/`
- Change `LIBRARY_NAME` in `generate.jai` to match the compiled library's name (no extension)
- Run `jai generate.jai`
