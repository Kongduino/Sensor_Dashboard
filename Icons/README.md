# App icon

`source/icon.svg` is the master (a chart over a small mesh of nodes, on the app's green); `source/icon_small.svg` is a
simplified version for 16–48 px, where the full design's details turn to noise; `source/icon_android.svg` is the full
design with a smaller margin, for Android launchers. The same files are in Sensor_Dashboard_Android/Icons.

The PNGs are rendered from them at each size (icon_16/32/48 from icon_small.svg, icon_64 … icon_1024 from icon.svg)
with a small AppKit-based SVG converter; any SVG renderer that keeps gradients and transparency will do.

In Xojo: Build Settings → Shared → App Icon, then drag each PNG onto the slot of its pixel size (a @2x slot takes the
file twice its point size, e.g. 16 pt @2x = icon_32.png).
