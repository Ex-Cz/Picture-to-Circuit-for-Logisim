# Picture-to-Circuit scripts

This repository contains only the cross-platform launchers for the Picture from Picture circuit-layout tool. It does **not** include Logisim source or rebuild Logisim.

The launchers call `com.cburch.logisim.gui.paint.PaintTool` from a Logisim JAR that already contains Picture from Picture. Provide that JAR with `LOGISIM_JAR`, or put `picture-to-circuit.jar`/`logisim.jar` beside the launcher or one directory above it. Java 8 or newer is required for JAR mode. On macOS, the Unix launcher can also use a `Logisim.app` via `LOGISIM_APP`.

## Usage

macOS/Linux:

```sh
chmod +x scripts/paint-from-picture
LOGISIM_JAR=/path/to/logisim.jar scripts/paint-from-picture \\
  --picture input.png --circ input.circ --out output.circ
```

Windows Command Prompt:

```bat
set LOGISIM_JAR=C:\path\to\logisim.jar
scripts\paint-from-picture.cmd --picture input.png --circ input.circ --out output.circ
```

Use `--list FILE.circ` to list circuits, `--help` for all options, or run without arguments to open the graphical tool. The output circuit and preview image are written by the Java tool.

The script archive contains the launchers only. The optional portable runtime archive adds a small platform-independent `picture-to-circuit.jar` and its GPLv2 `COPYING.TXT`; it does not contain Logisim source or a native Logisim application.
