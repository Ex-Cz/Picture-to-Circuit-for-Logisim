# Picture-to-Circuit 多端脚本

本仓库只提供 Picture-to-Circuit 的跨平台启动脚本，不包含完整的 Logisim 源码、Logisim.app 或 DMG。

脚本本身是启动器，实际转换逻辑位于 Java 类 `com.cburch.logisim.gui.paint.PaintTool` 中。最简单的方式是从 [Release](https://github.com/Ex-Cz/Picture-to-Circuit-for-Logisim/releases) 下载 `picture-to-circuit-v0.1.0-runtime.zip`，其中包含：

- `picture-to-circuit.jar`：平台无关的 Java runtime；
- `scripts/paint-from-picture`：macOS/Linux 启动脚本；
- `scripts/paint-from-picture.cmd`：Windows 启动脚本。

需要 Java 8 或更高版本。原版上游 Logisim 通常不包含 `PaintTool`；如果不使用 release 中的 JAR，而是指定自己的 `logisim.jar`，该 JAR 必须包含 `com.cburch.logisim.gui.paint.PaintTool`。

## macOS / Linux

解压 runtime 包后，在包目录中执行：

```sh
chmod +x scripts/paint-from-picture
./scripts/paint-from-picture \
  --picture input.png \
  --circ input.circ \
  --out output.circ
```

脚本会自动查找上一级目录中的 `picture-to-circuit.jar`。也可以显式指定 JAR：

```sh
LOGISIM_JAR=/path/to/picture-to-circuit.jar \
scripts/paint-from-picture --picture input.png --circ input.circ
```

## Windows

在命令提示符中进入解压目录并运行：

```bat
scripts\paint-from-picture.cmd --picture input.png --circ input.circ --out output.circ
```

如果 JAR 不在脚本上一级目录：

```bat
set LOGISIM_JAR=C:\path\to\picture-to-circuit.jar
scripts\paint-from-picture.cmd --picture input.png --circ input.circ --out output.circ
```

## 常用参数

```text
--list FILE.circ       列出电路文件中的电路名称
--help                 显示完整帮助
--circuit NAME         选择要处理的电路
--out OUTPUT.circ      指定输出电路文件
--no-demo              不生成预览 PNG
```

不带参数运行会打开图形界面。命令行转换完成后会写出新的 `.circ` 文件；默认情况下还会在旁边生成预览 PNG。

仓库中的启动脚本和说明使用根目录 MIT 许可证。runtime JAR 包含 Logisim 衍生代码，随包附带其 GPLv2 `COPYING.TXT`。
