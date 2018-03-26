![alt text](https://github.com/pbbwfc/Scinc/blob/master/icons/scinc50.png "Scinc Icon")
# Scinc
#### *S*hane's *C*hess *I*nformation database - *N*o *C*omplications

Minimalist version of [Scidvspc](http://scidvspc.sourceforge.net/ "Scidvspc")

## Binary Version

You can get a copy of the binary version by downloading a zip from Releases.

## Features Removed

* Correspondence Chess
* Training features
* Mate in ..N.. Puzzle
* Engine Tournament
* Play against Engine
* Play on Internet (FICS)
* Connecting Hardware
* File Finder
* Tournament Finder
* Crosstable
* Piece Tracker
* Tablebases
* Opening Books
* Sounds
* Engines removed - phalanx, toga, scidlet

## Limitations

* Only build for Windows 64bit using MinGW
* Only supports English as a language
* No choice of board and pieces
* No configuration of toolbars
* No configuration of colors
* No configuration of fonts
* No configuration of number formats

## Development Instructions

* Download a copy of the source code (to say C:\dev\scinc)
* Download a copy of the binaries from Releases
* Create a rel sub-folder of the development folder (e.g. C:\dev\scinc\rel) and put the binary version in the folder.
* Obtain a copy of version 8.5 of TCL from [tombert's tcltk](https://bitbucket.org/tombert/tcltk/downloads "tcl downloads")
* Get [Mingw-w64](https://mingw-w64.org/doku.php "Mingw-w64")
* Edit the folders appropriately in build.cmd, which can be found in the main development folder.
* Run build.cmd to copy across some support files. It then loads the Mingw-w64 prompt. To build the C++ code and the TCL, type "make".

This should rebuild everything. You can then simply edit the code and then re-run build and make.