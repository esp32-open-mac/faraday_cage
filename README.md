# Faraday cage 3D printing files

The files in this repo accompany the blog post on https://esp32-open-mac.be/posts/0003-faraday-cage/

They are mostly written in OpenSCAD (`*.scad` files), but the holder for the copper pipe was made in FreeCAD (`holders.FCStd`).

The output files are also included here, `*.stl` and `*.3mf`. The `handle` subfolder was taken from thingivers, see that folder for more details.


- global model of the faraday cage: `faraday.scad`
- standoffs for keeping bottom MDF plate off the faraday fabric: `standoff.scad`
- latch for keeping door tightly shut: `latch.scad`
- tapered caps with hole for fiber optic cable to copper `copper_pipe_cap.scad`
- drill tools to easily mark hole locations for drilling `drill_tools.scad`

All files I made myself, are dual-licensed under the Unlicense and 0BSD; it's public domain, you can do whatever you want with them. See LICENSE for more details.

If you have any questions, don't hesitate to open a GitHub issue.
