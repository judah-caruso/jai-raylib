# Raylib

[Raylib](https://www.raylib.com) 4.2.0 bindings for Jai.

## Usage

See: `examples/`

## Notes

- These are generated using Jai's `Bindings_Generator` library (`jai generate.jai`)
- `macros.jai` contains auto-generated macros for Begin/End procs
- `custom.jai` contains custom types that can convert to/from Jai/Raylib types
- `interop.jai` contains overloads to make calling into Raylib easier

To generate bindings for a different version:

- Place headers in `lib/` and compiled libraries in `win/`, `mac/`, or `linux/`
- Change `LIBRARY_NAME` in `generate.jai` to match the compiled library's name (no extension)
- Run `jai generate.jai`
