# Demian DeVante Scripts

Useful scripts for Reaper DAW, install through reapack with this repository:
https://github.com/DemianDeVante/Reaper-Useful-Scripts/raw/master/index.xml

If you find this useful consider supporting me on [PayPal](https://paypal.me/DemianDeVante) :)


Some higlights are:

## Global input quantize
Toggle input quantize for all tracks based on last active midi editor grid settings, use arrange view grid settings if MIDI Editor is not initiated. Support for swing. Leaves no undo points. You can modify this script to use only the arrange grid settings. 

## Autotrim adjacent items
Usually, when trimming two adjacent items with the mouse cursor you can trim both edges at the same time, but I sually miss and trim only one edge. This script attempts to fix that by toggling an autotrim mode, where adjacent item edges always snap each other.

<img src="https://private-user-images.githubusercontent.com/113860974/307017736-1f47b331-2cf6-4220-95ed-724c943f9740.gif?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MDg2MTAyMTAsIm5iZiI6MTcwODYwOTkxMCwicGF0aCI6Ii8xMTM4NjA5NzQvMzA3MDE3NzM2LTFmNDdiMzMxLTJjZjYtNDIyMC05NWVkLTcyNGM5NDNmOTc0MC5naWY_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQwMjIyJTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MDIyMlQxMzUxNTBaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT0xYWU4MzJlZjFkMmNmYjFmYmFlNGM3ODYxZjhjYWM4MmEzMjcwYmFiZDFjNGNjMjEzZTIwN2NmNTY4YzVhMTRhJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZhY3Rvcl9pZD0wJmtleV9pZD0wJnJlcG9faWQ9MCJ9.GmrtxauWGQ_fSOdCPoTz2PK18vXhW3GX_3IMTPan_Sk" width="700" />

## Autolengthen items
I tried making a live looping system before, but saw Playtime 2 soon and decided to wait. This script is a result of that and achieves a similar behaviour to the nabla looper closed-source script. As the play cursor moves the rightmost item edges for specified tracks grow for jamming indefinitely.

<img src="https://private-user-images.githubusercontent.com/113860974/307017618-ff9195d9-41ad-4aea-a5f1-a6b91420ca24.gif?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MDg2MTAyMTAsIm5iZiI6MTcwODYwOTkxMCwicGF0aCI6Ii8xMTM4NjA5NzQvMzA3MDE3NjE4LWZmOTE5NWQ5LTQxYWQtNGFlYS1hNWYxLWE2YjkxNDIwY2EyNC5naWY_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQwMjIyJTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MDIyMlQxMzUxNTBaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1kNjRlNDJhZWU4YTJjODYyZGZjOWE5NjVhNDAyMjQxNTZmYjU1NjVjMjEyNDViODA0MjM1YTU3MTIxNGIwODdlJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZhY3Rvcl9pZD0wJmtleV9pZD0wJnJlcG9faWQ9MCJ9.beZzrGHsubNj5IRAUusUsMyoKHqZUrlFRntJh4UQw1E" width="700" />

## Media explorer search scripts
Scripts for searching defined words in Media Explorer, randomizing the resulting list. Useful for previewing random kicks, snares, hihats, or other samples quickly. You can modify these scripts to make your own search presets



Among other utility scripts for more integration with midi controllers, like moving the edit cursor, item edges, contents, freely or by grid division if snap is enabled, or cycling track recording, input and monitoring modes.
