# chezscheme-glb

Library for reading .glb files exported from Blender

---

- Requires access to [json.ss](https://github.com/bjornkihlberg/chezscheme-json/blob/main/json.ss).
- Read the [glTF 2.0 Specification](https://www.khronos.org/registry/glTF/specs/2.0/glTF-2.0.html) to understand the glTF format.

## Quickstart

Load a .glb file exported from blender:

```scheme
(import (glb))

(call-with-port
  (open-file-input-port "./mesh.glb")
  get-glb)
```

The data structure is quite self explanatory. I recommend you print it out to the REPL and explore it.

- JSON objects are represented as association lists
- JSON arrays are represented as lists.
- `null`s are represented as `'()`
