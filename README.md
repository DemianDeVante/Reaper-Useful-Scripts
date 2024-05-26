# Useful Scripts for Reaper DAW

Install through ReaPack with this repository:

[https://raw.githubusercontent.com/DemianDeVante/Reaper-Useful-Scripts/master/index.xml](https://raw.githubusercontent.com/DemianDeVante/Reaper-Useful-Scripts/master/index.xml)

Main GitHub: [https://github.com/DemianDeVante/Reaper-Useful-Scripts](https://github.com/DemianDeVante/Reaper-Useful-Scripts)

## Highlights

### Global Input Quantize

Toggle input quantize for all tracks based on the last active MIDI editor grid settings, using arrange view grid settings if the MIDI Editor is not initiated. Supports swing. Leaves no undo points. You can modify this script to use only the arrange grid settings.

### Autotrim Adjacent Items

Usually, when trimming two adjacent items with the mouse cursor, you can trim both edges at the same time, but I usually miss and trim only one edge. This script attempts to fix that by toggling an autotrim mode, where adjacent item edges always snap to each other.

![Autotrim Adjacent Items](https://i.imgur.com/yYbwGXa.gif)

### Autolengthen Items

I tried making a live looping system before, but saw Playtime 2 soon and decided to wait. This script is a result of that and achieves similar behavior to the nabla looper closed-source script. As the play cursor moves, the rightmost item edges for specified tracks grow, jamming indefinitely.

![Autolengthen Items](https://i.imgur.com/AYI5Vy5.gif)

### Media Explorer Search Scripts

Scripts for searching defined words in Media Explorer, randomizing the resulting list. Useful for previewing random kicks, snares, hihats, or other samples quickly. You can modify these scripts to make your own search presets.

## Other Utility Scripts

Includes scripts for more integration with MIDI controllers, like moving the edit cursor, item edges, contents freely or by grid division if snap is enabled, or cycling track recording, input, and monitoring modes.
