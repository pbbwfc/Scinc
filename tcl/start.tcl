#!/bin/sh

# Scid vs. PC
#
# Based on Shane's Chess Information Database
#
# Copyright Steven Atkinson (stevenaaus@yahoo.com) , Pascal Georges, Shane Hudson
# Released under the GPL
# This is freely redistributable software; see the file named "COPYING"
# or "copying.txt" that came with this program.

# The next line restarts using tkscid: \
exec "`dirname "$0"`"/tkscid "$0" "$@"

set scidVersion 0.06
set scidVersionDate {Dec 9, 2020}

package require Tcl 8.6
package require Tk  8.6

# Determine operating system platform: unix or windows

set windowsOS	[expr {$tcl_platform(platform) == "windows"}]
set unixOS	[expr {$tcl_platform(platform) == "unix"}]

# debugging a procedure (can affect performance/toolbar)
if {0} {
  set procname update

  rename $procname oldprocname
  proc $procname {args} {
    if {$::windowsOS} {
      catch {::splash::add "$procname $args"}
    } else {
      puts "$::procname $args ([info  level [expr [info level] -1]])"
    }
    eval oldprocname $args
  }
}

if {![catch {tk windowingsystem} wsystem] && $wsystem == "aqua"} {
  # Note - we don't currently support installing on Mac in the unix fashion (ie /usr)
  set macOS 1
  set scidName {Scid vs. Mac}
  if {[file isdirectory /usr/local/bin]} {
    # Wish does not use the Bash path for some reason
    set env(PATH) $env(PATH):/usr/local/bin
  }
} else {
  set macOS 0
  set scidName {Scinc}
}

# Check that on Unix, the version of tkscid matches the version of this
# script or on Windows, that the scid.exe and scinc.gui versions are identical.

if {[string compare [sc_info version] $scidVersion]} {
  wm withdraw .
  if {$windowsOS} {
    set msg "This is $::scidName version [sc_info version], but the scinc.gui data\n"
    append msg "file has the version number $scidVersion.\n"
  } else {
    set msg "This is $::scidName version $scidVersion,\nbut the "
    append msg "tkscid program \nit uses is version [sc_info version].\n"
    append msg "Check that the path to tkscid is correct."
  }
  tk_messageBox -type ok -icon error -title "Scid: version error" -message $msg
  exit 1
}

#############################################################
#
# NAMESPACES
#
# The main Tcl/Tk namespaces used in the Scid application are
# initialized here, so that default values can be set up and
# altered when the user options file is loaded.
#
foreach ns {
  ::splash
  ::utils
  ::utils::date ::utils::font ::utils::history ::utils::pane ::utils::string
  ::utils::validate ::utils::win
  ::file
  ::file::maint ::maint
  ::edit
  ::game
  ::gbrowser
  ::search
  ::search::filter ::search::board ::search::header
  ::windows
  ::windows::gamelist ::windows::stats ::tree ::tree::mask ::windows::tree
  ::windows::switcher ::windows::eco ::pgn
  ::tools
  ::tools::analysis
  ::tools::graphs
  ::tools::graphs::filter ::tools::graphs::absfilter ::tools::graphs::rating ::tools::graphs::score
  ::optable
  ::board ::move
  ::tactics ::calvar ::uci 
  ::config ::docking
  ::commenteditor
} {
  namespace eval $ns {}
}

set ::MAX_GAMES [sc_info limit games]
set ::pause 0
set ::defaultBackground white
set ::defaultGraphBackgroud white
set ::commenteditor::showBoard 1
set ::windows::gamelist::widths {}
set ::windows::gamelist::findcase 1
set ::windows::gamelist::showButtons 1
set ::windows::switcher::icons 1
set ::windows::switcher::confirmCopy 1
set ::tools::graphs::absfilter::type year
set ::tools::graphs::filter::type year
set ::tools::graphs::showpoints 1
set ::tools::graphs::showbar [expr ! $::macOS] ; # too slow on macs
set annotate(addTag) 1
set annotate(Moves) all
set annotate(WithVars) blunders
set annotate(WithScore) allmoves
set annotate(MissedMates) 1
set annotate(WantedDepth) 13
set annotate(Depth) 1
set useAnalysisBook 0
set annotate(isVar) 0
set annotate(scoreType) {+ 1.5}
set annotate(blunder) 1.0
set annotate(cutoff) 5.0
set maintFlag W
set ::gbrowser::size 35
set photosMinimized 0
set playerInfoHistory {}

proc ::docking::init_layout_list {{recover 0}} {
  # Default window docking layouts
  array set ::docking::layout_list {}
  
  # Basic layout : PGN window with main board
  set ::docking::layout_list(1) {{MainWindowGeometry 834x640+80+50} {{.pw vertical {}} {TPanedwindow {{.pw.pw0 horizontal 564} {TNotebook .nb .fdockmain} {TNotebook .tb1 .fdockpgnWin}}}}}

  if {$recover} {
    return
  }

  set ::docking::layout_list(2)  {{MainWindowGeometry 1311x716+65+36} {{.pw vertical {}} {TPanedwindow {{.pw.pw0 horizontal 570} {TNotebook .nb .fdockmain} {TPanedwindow {{.pw.pw0.pw2 vertical 261} {TPanedwindow {{.pw.pw0.pw2.pw9 horizontal 235} {TNotebook .tb32 .fdockpgnWin} {TPanedwindow {{.pw.pw0.pw2.pw9.pw30 vertical {}} {TNotebook .tb1 {.fdockplayerInfoWin .fdockcommentWin}}}}}} {TPanedwindow {{.pw.pw0.pw2.pw3 horizontal {}} {TNotebook .tb8 {.fdockglistWin .fdockcrosstabWin}}}}}}}}}}

  set ::docking::layout_list(3) {{MainWindowGeometry 968x666+80+50} {{.pw vertical {}} {TPanedwindow {{.pw.pw0 horizontal 566} {TNotebook .nb .fdockmain} {TPanedwindow {{.pw.pw0.pw2 vertical 363} {TNotebook .tb1 {.fdockanalysisWin1 .fdockpgnWin}} {TNotebook .tb3 {.fdocktreeWin1 .fdocktreeBest1}}}}}}}}
  set ::docking::layout_list(4) {{MainWindowGeometry 1449x817+76+30} {{.pw vertical {}} {TPanedwindow {{.pw.pw0 horizontal 747} {TNotebook .nb .fdockmain} {TPanedwindow {{.pw.pw0.pw2 vertical {}} {TPanedwindow {{.pw.pw0.pw2.pw3 horizontal {}} {TPanedwindow {{.pw.pw0.pw2.pw3.pw35 vertical 378} {TPanedwindow {{.pw.pw0.pw2.pw3.pw35.pw38 horizontal 347} {TNotebook .tb36 {.fdockpgnWin .fdockcommentWin}} {TNotebook .tb39 {.fdockanalysisWin0 .fdockplayerInfoWin .fdocktreeWin1}}}} {TNotebook .tb8 {.fdockglistWin .fdocksgraph .fdockcrosstabWin}}}}}}}}}}}}
  set ::docking::layout_list(5) {}
}

::docking::init_layout_list

### Tree/mask options:
set ::tree::showBar [expr {! $::macOS}]
set ::tree::sortBest 1
set ::tree::short 1
set ::tree::mask::recentMask {}
set ::tree::mask::autoLoadMask 0

set cleaner(players) 1
set cleaner(events) 1
set cleaner(sites) 1
set cleaner(rounds) 1
set cleaner(eco) 1
set cleaner(elo) 1
set cleaner(twins) 1
set cleaner(cnames) 0
set cleaner(cgames) 0
set cleaner(tree) 0

#############################################################
# Customisable variables:

# scidExeDir: contains the directory of the Scid executable program.
# Used to determine the location of various relative data directories.
set scidExecutable [info nameofexecutable]

if {$scidExecutable == {}} {
  ### Shit. Wish8.6b2 returns {} 
  if {$macOS} {
    set scidExecutable /Applications/ScidvsMac.app/Contents/MacOS/scid
    puts "scidExecutable is null. Now is \"$scidExecutable\""
  } elseif {$unixOS} {
    catch {
      set scidExecutable [exec readlink /proc/[pid]/exe]
    }
    puts "scidExecutable is null. Now is \"$scidExecutable\"" 
  } else {
    puts "scidExecutable is null" 
  }
}

if {$scidExecutable == {}} {
  ### may work on windows, but will be broken on other OS
  set scidExeDir .
} else {
  if {[file type $scidExecutable] == "link"} {
    set scidExeDir [file dirname [file readlink $scidExecutable]]
    if {[file pathtype $scidExeDir] == "relative"} {
      set scidExeDir [file dirname [file join [file dirname $scidExecutable]\
	[file readlink $scidExecutable]]]
    }
  } else {
    set scidExeDir [file dirname $scidExecutable]
  }
}

# scidUserDir: location of user-specific Scid files.
# This is "~/.scid" on Unix, and the Scid exectuable dir on Windows.

if {$windowsOS} {
  set scidUserDir $scidExeDir

  # Need to cd here to open eco and spellfiles
  #   Probably only has any effect when opening a pgn/si4 file by double clicking on it,
  #   whence the CWD is not "."
  cd $scidExeDir
  # Windows has problems with "cmd.exe /c start" and spaces in file names "Documents and Settings"
  # so choose something dumb
  set scidLogDir {C:\log}
} else {
  set scidUserDir [file nativename "~/.scidvspc"]
  set scidLogDir [file nativename [file join $scidUserDir "log"]]
}

# scidConfigDir, scidDataDir, scidLogDir:
#   Location of Scid configuration, data and log files.
set scidConfigDir [file nativename [file join $scidUserDir "config"]]
set scidDataDir [file nativename [file join $scidUserDir "data"]]
set scidPhotosDir [file nativename [file join $scidUserDir "photos"]]

# boardSizes: sizes after 80 are copied rom smaller ones
set boardSizes [list 25 30 35 40 45 50 55 60 65 70 75 80 90 100 110 120 130 140 150 160]

#load textures for lite and dark squares
set boardfile_dark "emptySquare"
set boardfile_lite "emptySquare"

#[file join $scidExeDir "bitmaps" "empty.gif"] ;# wsquare.gif

# boardSize: Default board size. See the available board sizes above.
set boardSize 60

# language for help pages and messages:
set language E
set oldLang X
# Toolbar configuration:
foreach {tbicon status}  {
  new 0 open 0 save 1 close 0
  gfirst 1 gprev 1 gnext 1 glast 1
  newgame 0 copy 0 paste 0
  rfilter 0 bsearch 0 hsearch 0
  glist 1 pgn 1 comment 0 maint 1 eco 0 tree 1 engine 1
} {
  set toolbar($tbicon) $status
}

# boardCoords: 1 to show board Coordinates, 0 to hide them.
set boardCoords 0

# boardSTM: 1 to show side-to-move icon, 0 to hide it.
set boardSTM 1

# Default values for fonts:
proc createFont {name} {
  set opts $::fontOptions($name)
  font create font_$name \
      -family [lindex $opts 0] -size [lindex $opts 1] \
      -weight [lindex $opts 2] -slant [lindex $opts 3]
}

proc configureFont {name} {
  set opts $::fontOptions($name)
  font configure font_$name \
      -family [lindex $opts 0] -size [lindex $opts 1] \
      -weight [lindex $opts 2] -slant [lindex $opts 3]
}

proc reinitFont {name} {
  set ::fontOptions($name) $::fontOptions(old$name)
  configureFont $name
}

if {$windowsOS} {
  set fontOptions(Regular) { Arial           10 normal roman}
  set fontOptions(Menu)    { {MS Sans Serif}  9 normal roman}
  set fontOptions(Small)   { Arial            9 normal roman}
  set fontOptions(Tiny)    { Arial            7 normal roman}
  set fontOptions(Fixed)   { Courier          9 normal roman}
} elseif {$macOS} {
  set fontOptions(Regular) { {Lucida Grande} 12 normal roman}
  set fontOptions(Menu)    { {Lucida Grande} 14 normal roman}
  set fontOptions(Small)   { {Lucida Grande} 11 normal roman}
  set fontOptions(Tiny)    { {Lucida Grande}  9 normal roman}
  set fontOptions(Fixed)   { Monaco 10 normal roman}
} else {
  set fontOptions(Regular) { helvetica 11 normal roman}
  set fontOptions(Menu)    { helvetica 10 normal roman}
  set fontOptions(Small)   { helvetica 10 normal roman}
  set fontOptions(Tiny)    { helvetica  8 normal roman}

  # try a couple of fonts, and default to "fixed" if no luck
  if {[lsearch [font families] {Liberation Mono}] > 0} {
    set fontOptions(Fixed)   { {Liberation Mono} 11 normal roman}
  } elseif {[lsearch [font families] {Courier 10 Pitch}] > 0} {
    set fontOptions(Fixed)         { {Courier 10 Pitch} 12 normal roman}
  } else {
    set fontOptions(Fixed)   { fixed 11 normal roman}
  }
}

createFont Regular
createFont Menu
createFont Small
createFont Tiny
createFont Fixed

# Analysis command: to start chess analysis engine.
set analysisCommand ""
set analysis(mini) 0

# Maximum number of lines to be saved in a log file
# (setting it to 0 also stops log file being created)
set analysis(logMax) 5000
set analysis(logName) 1
set analysis(maxPly) 0
set analysis(lowPriority) $::windowsOS

# Colors

set lite        #f3f3f3
set dark        #7389b6		;# dark and lite square colors
set highcolor   #b0d0e0		;# color when something is selected
set bestcolor   #bebebe		;# suggested move square
set bgcolor     grey20		;# board (canvas) bg color, appears as the lines between the squares
set progcolor   rosybrown	;# progress bar
set buttoncolor #b0c0d0		;# (below)
set maincolor   black		;# Main line arrow color
set varcolor    grey80		;# Variation arrow colors
set rowcolor    lightsteelblue1 ;# Tree line/row bg color
set switchercolor lightsteelblue3 ;# DB switcher
set crosscolor  grey80		;# Crosstable line colouring
set scorecolor  steelblue	;# Score Graph bars
set scorebarcolor  grey10	;# Score Graph current move

set borderwidth 1

# Set the radiobutton and checkbutton background color if desired.
# I find the maroon color on Unix ugly!
if {$unixOS} {
  option add *Radiobutton*selectColor $buttoncolor
  option add *Checkbutton*selectColor $buttoncolor
  # option add *Menu*selectColor $buttoncolor
}

set ::tactics::analysisTime 3

# Defaults for the PGN window:
# if ::pgn::showColor is 1, the PGN text will be colorized.
set ::pgn::showColor 1
set ::pgn::indentVars 1
set ::pgn::indentComments 1
set ::pgn::symbolicNags 1
set ::pgn::moveNumberSpaces 0
set ::pgn::shortHeader 0
set ::pgn::boldMainLine 0
set ::pgn::columnFormat 0
set ::pgn::stripMarks 0
set ::pgn::showScrollbar 1
set ::pgn::prevOffset 0
set pgnColor(Header) "\#00008b"
set pgnColor(Main) "\#000000"
set pgnColor(Var) "\#0000ee"
set pgnColor(Nag) "\#aa2c2c" ;# ee0000
set pgnColor(Comment) "\#008b00"
set pgnColor(Current) lightSteelBlue
set pgnColor(NextMove) "\#fefe80"
set pgnColor(Background) "\#ffffff"

array set findopponent {}

# Defaults for initial directories:
set initialDir(base) $::env(HOME)
set initialDir(pgn)  $::env(HOME)
set initialDir(html) $::env(HOME)
set initialDir(tex)  $::env(HOME)
set initialDir(stm)  $::env(HOME)
set initialDir(sso)  $::env(HOME)
set initialDir(report) $::env(HOME)
set initialDir(tablebase1) ""
set initialDir(tablebase2) ""
set initialDir(tablebase3) ""
set initialDir(tablebase4) ""

# glistSize: Number of games displayed in the game list window
set glistSize 15

# glexport: Format for saving Game List to text file.
set glexportDefault "g6: w13 W4  b13 B4  r3:m2 y4 s11 o4"
set glexport $glexportDefault

# Default window locations:
foreach i {. .main .pgnWin .helpWin .treeWin .commentWin .glist \
      .playerInfoWin .baseWin .treeBest \
      .ecograph .statsWin .glistWin .maintWin .nedit} {
  set winX($i) -1
  set winY($i) -1
}

for {set b 1} {$b<=[sc_base count total]} {incr b} {
  foreach i {.treeWin .treeBest} {
    set winX($i$b) -1
    set winY($i$b) -1
  }
}

# Default PGN window size:
set winWidth(.pgnWin)  65
set winHeight(.pgnWin) 20

# Default help window size:
set winWidth(.helpWin)  50
set winHeight(.helpWin) 32

# Default stats window size:
set winWidth(.statsWin) 60
set winHeight(.statsWin) 13

# Default tree window size:
set winWidth(.treeWin)  58
set winHeight(.treeWin) 20

# Default comment editor size:
set winWidth(.commentWin)  40
set winHeight(.commentWin)  6

# Default spellcheck results window size:
set winWidth(.spellcheckWin)  55
set winHeight(.spellcheckWin) 25

# Default player info window size:
set winWidth(.playerInfoWin)  45
set winHeight(.playerInfoWin) 20

# Default switcher window size:
set winWidth(.baseWin) 310
set winHeight(.baseWin) 110

# Default stats window lines:
array set ::windows::stats::display {
  r2600 1
  r2500 0
  r2400 1
  r2300 0
  r2200 1
  r2000 1
  r1800 0
  y1900 0
  y1950 0
  y1960 0
  y1970 0
  y1980 0
  y1990 0
  y2000 1
  y2005 1
  y2010 1
}

# Enable stats for subsequent years
for { set year [clock format [clock seconds] -format {%Y}] } \
    { $year > 2010 && ![info exists ::windows::stats::display([subst {y$year}])] } \
    { incr year -1 } {
      set ::windows::stats::display([subst {y$year}]) 1
    }

# Default PGN display options:
set pgnStyle(Tags) 1
set pgnStyle(Comments) 1
set pgnStyle(Vars) 1


# Default Tree sort method:
set tree(order) frequency

# Auto-save tree cache when closing tree window:
set tree(autoSave) 0

# Auto-save options when exiting:
set optionsAutoSave 1

#  Numeric locale: first char is decimal, second is thousands.
#  Example: ".," for "1,234.5" format; ",." for "1.234,5" format.
set locale(numeric) ".,"

# Hightlight the last move played
set highlightLastMove 1
set highlightLastMoveWidth 2
set highlightLastMoveColor "grey"
set highlightLastMovePattern {} ; # this option is not saved

# Ask before replacing existing moves: on by default
set askToReplaceMoves 1

# Show variations popup window, arrows
set showVarPopup 0
set showVarArrows 1

# Keyboard Move entry options:
set moveEntry(On) 1
set moveEntry(AutoExpand) 0
set moveEntry(Coord) 1

# Autoplay and animation delays in milliseconds:
set autoplayDelay 5000
set animateDelay 200


# Geometry of windows:
array set geometry {}

# Default theme
if {$::windowsOS} {
  set lookTheme clam
} else {
  set lookTheme default
}

# set board piece style
foreach i {tilegtk tileq keramik keramik_alt plastik} {
  catch {package require ttk::theme::$i}
}
#   Which windows should be opened on startup
set startup(pgn) 0
set startup(switcher) 0
set startup(tip) 0
set startup(tree) 0
set startup(gamelist) 0
set startup(stats) 0

# myPlayerNames:
#   List of player name patterns for which the chessboard should be
#   flipped each time a game is loaded to show the board from that
#   players perspective.

set myPlayerNames {}

# These new checkbuttons (showMenu, showButtons etc) don't really have anything
# to do with gameInfo, but are here anyway S.A

set gameInfo(show) 1
set gameInfo(photos) 0
set gameInfo(hideNextMove) 0
set gameInfo(showMaterial) 1
set gameInfo(showFEN) 0
set gameInfo(showButtons) 1
set gameInfo(showStatus) 1
set gameInfo(showMenu) 1
set gameInfo(showTool) 1
set gameInfo(showMarks) 1
set gameInfo(wrap) 0
set gameInfo(fullComment) 0

### Twin game checker options
# "players" represents *exact* match or 4 chars only

array set twinSettings {
  players Yes
  colors  Yes
  event   No
  site    Yes
  round   Yes
  year    Yes
  month   Yes
  day     No
  result  No
  eco     No
  moves   Yes
  skipshort  Yes
  setfilter  Yes
  undelete   Yes
  comments   Yes
  variations Yes
  usefilter  No
  delete     Shorter
}
array set twinSettingsDefaults [array get twinSettings]

# Opening report options:
array set optable {
  Stats 1
  Oldest 5
  Newest 5
  Popular 1
  MostFrequent 6
  MostFrequentWhite 1
  MostFrequentBlack 1
  AvgPerf 1
  HighRating 8
  Results 1
  Shortest 5
  ShortestWhite 1
  ShortestBlack 1
  MoveOrders 8
  MovesFrom 1
  Themes 1
  Endgames 1
  MaxGames 500
  ExtraMoves 1
}
array set optableDefaults [array get optable]

# Player report options
array set preport {
  Stats 1
  Oldest 5
  Newest 5
  MostFrequentOpponents 6
  AvgPerf 1
  HighRating 8
  Results 1
  MostFrequentEcoCodes 6
  Themes 1
  Endgames 1
  MaxGames 500
  ExtraMoves 1
}
array set preportDefaults [array get preport]

# Export file options:
set exportFlags(comments) 1
set exportFlags(space) 1
set exportFlags(indentc) 0
set exportFlags(vars) 1
set exportFlags(indentv) 1
set exportFlags(column) 0
set exportFlags(append) 0
set exportFlags(symbols) 0
set exportFlags(htmldiag) 0
set exportFlags(stripMarks) 0
set exportFlags(convertNullMoves) 1
set exportFlags(utf8) 0
set default_exportStartFile(PGN) {}
set default_exportEndFile(PGN) {}

set default_latexRendering(engine) {pdflatex -interaction=nonstopmode}
if {$::windowsOS} {
  set default_latexRendering(viewer) start
} elseif {$::macOS} {
  # Use open -a if you want to force to the built in preview
  set default_latexRendering(viewer) open
} else {
  set default_latexRendering(viewer) xdg-open ; # evince, okular

  # Unused
  if {0} {
    if {[catch {exec xdg-mime query default application/pdf} result] == 0} {
      # cool unix has a registered app for pdfs so lets use it
      set latexViewer "xdg-open"
    } else {
      # try and detect the destop to make at least best guess
      if {[info exists ::env(XDG_CURRENT_DESKTOP)]} {
	set unixDesktop = [string tolower $::env(XDG_CURRENT_DESKTOP)]
      } else {
	switch -regexp -matchvar denv -- $::env(XDG_DATA_DIRS) {
	  .*(gnome|xfce|kde).* { set unixDesktop $denv }
	  default { set unixDesktop "unknown" }
	}
	switch $linuxDesktop {
	  gnome   {set latexViewer evince}
	  kde     {set latexViewer okular}
	  xfce    {set latexViewer evince}
	  default {set latexViewer xpdf}
	}
      }
    }
  }
}

set default_exportStartFile(Latex) {\documentclass[10pt,DIV=20]{scrreprt}
% This is a LaTeX file generated by Scid.
% You must have the skak, KOMAScript and pstricks packages installed to typeset this file.

\usepackage{scrpage2}
\usepackage{charter}
\usepackage[svgnames]{xcolor}
\usepackage{xskak}
\usepackage{lmodern}
\usepackage[T1]{fontenc}
\usepackage{latexsym}
\usepackage{pstricks-add}
\usepackage{tabularx}

% \definecolor{VariationColor}{gray}{0.40}
\definecolor{VariationColor}{RGB}{0,0,128}
% \definecolor{ScoreColor}{gray}{0.40}
\definecolor{ScoreColor}{RGB}{255,215,0}
\definecolor{GridColor}{RGB}{72,61,139}
\definecolor{EvenGameColor}{RGB}{240,240,240}
\definecolor{BlackPiecesGraphColor}{RGB}{101,37,37}
\definecolor{WhitePiecesGraphColor}{RGB}{189,183,107}

\setlength{\extrarowheight}{3pt}  
  
\newcommand{\win}{1-0}
\newcommand{\loss}{0-1}  
\newcommand{\draw}{=-=}  
\newcommand{\p}{\figsymbol{p}}
\newcommand{\N}{\figsymbol{N}}
\newcommand{\B}{\figsymbol{B}}
\newcommand{\R}{\figsymbol{R}}
\newcommand{\Q}{\figsymbol{Q}}  
\newcommand{\K}{\figsymbol{K}}    
  
\renewcommand*\thesection{\arabic{section}}
\addtokomafont{section}{\color{blue}}
\addtokomafont{subsection}{\color{red}}

\begin{document}
}
set default_exportEndFile(Latex) {\end{document}
}

set default_exportStartFile(HTML) {<html>
  <head><title>Scid export</title></head>
  <body bgcolor="#ffffff">
}
set default_exportEndFile(HTML) {</body>
  </html>
}

foreach type {PGN HTML Latex} {
  set exportStartFile($type) $default_exportStartFile($type)
  set exportEndFile($type) $default_exportEndFile($type)
}

foreach type {engine viewer} {
  set latexRendering($type) $default_latexRendering($type)
}

# autoRaise: defines whether the "raise" command should be used to raise
# certain windows (like progress bars) when they become obscured.
# Some Unix window managers (e.g. some versions of Enlightenment and sawfish,
# so I have heard) have a bug where the Tcl/Tk "raise" command times out
# and takes a few seconds. Setting autoRaise to 0 will help avoid this.

# The above mentioned "1 second" bug is relevant to kde1 i think.
# Kde 3.5 (and WinXP) have focus stealing code that stops "raise"
# from working by default. In kde this can be changed by
# configuring "desktop > window behavior > advanced > focus stealing prevention"
# to "none"

set autoRaise 1

proc raiseWin {w} {
  global autoRaise
    if {$w == "." } {
     set w .main
    }
    if {$::docking::USE_DOCKING} {
      if {[catch {::docking::raiseTab $w}]} {
        # dammit, undocked windows aren't raising. fixme
	catch {wm deiconify $w}
	raise $w 
	focus $w
      } 
    } else {
      if {$autoRaise} {
	catch {wm deiconify $w}
	raise $w
	focus $w
      }
    }
}

# autoIconify:
#   Specified whether Scid should iconify all other Scid windows when
#   the main window is iconified. Most people like this behaviour but
#   some window managers send an "UnMap" event when the user switches
#   to another virtual window without iconifying the Scid window so
#   users of such managers will probably want to turn this off.

set autoIconify 1

# windowsDock:
# if true, most of toplevel windows are dockable and embedded in a main window
# windows can be moves among tabs (drag and drop) or undocked (right-clicking on tab)

set windowsDock 1
# set windowsDock [expr {!$::macOS}]

# autoLoadLayout :
# Automatic loading of layout # 1 at startup (docked windows mode only)
set autoLoadLayout 1

# autoResizeBoard:
# resize the board to fit the container
set autoResizeBoard 1

################################################################################
# if undocked window : sets the title of the toplevel window
# if docked : sets the name of the tab
# w : name of the toplevel window
proc setTitle { w title } {
  if { $::docking::USE_DOCKING && ! [ ::docking::isUndocked $w ]} {
    set f .fdock[ string range $w 1 end ]
    if { [catch {set nb [ ::docking::find_tbn $f ]} ]} {
      set nb ""
    }
    
    if { $nb == "" } {
      wm title $w $title
    } else  {
      # if target is main board, update the global window instead
      if { $w == ".main" && $title != [ ::tr "Board" ] } {
        wm title . $title
      } else  {
        # in docked mode trim down title to spare space
        if { [ string range $title 0 5 ] == "Scid: " &&  [ string length $title ] > 6 } {
          set title [string range $title 6 end]
        }
        $nb tab $f -text $title
      }
    }
  } else  {
    set wdock ".fdock[string range $w 1 end]"
    if { [winfo exists $wdock ] } { set w $wdock }
    wm title $w $title
  }
  
}
################################################################################
# Creates a toplevel window depending of the docking option
################################################################################
proc createToplevel { w } {
  set name [string range $w 1 end]
  set f .fdock$name

  # Raise window if already exist
  if { [winfo exists $w] } {
    if {! $::docking::USE_DOCKING } {
      tk::PlaceWindow $w
    } else {
      if { [::docking::isUndocked $w] } {
        tk::PlaceWindow $f
      } else {
        [::docking::find_tbn $f] select $f
      }
    }
    return "already_exists"
  }

  catch {
    unset ::docking::notebook_name($f)
  }

  if { $::docking::USE_DOCKING } {
    frame $f  -container 1
    toplevel .$name -use [ winfo id $f ]
    ::docking::add_tab $f
    
    # auto focus mode : when the mouse enters a toplevel, it gets a forced focus to handle mouse wheel
    # only the highest stacked window can get the focus forced or on windows any time the mouse enters the main window, it will be raised
    bind .$name <Enter> {
      set tl [winfo toplevel %W]
      set focus [focus]
      if {[catch {set focus [winfo toplevel $focus]}]} {
         # if [focus] is {}, try to grab it again
         if {$::windowsOS} {
	   break
         } else {
	   focus -force .fdockmain
         }
      }
      if {$focus != $tl && ([lindex [wm stackorder .] end] == "." || $::macOS)} {
    	  focus -force $tl
      }
    }
    
  } else  {
    toplevel $w
  }
  
}

################################################################################
# In the case of a window closed without the context menu in docked mode, arrange for the tabs to be cleaned up
# Alternative way : directly call ::docking::cleanup $w when closing window
################################################################################
proc createToplevelFinalize {w} {
  if { $::docking::USE_DOCKING } {
    bind $w <Destroy> +[ namespace code "::docking::cleanup $w %W"]
  }
}

################################################################################
# Sets the menu for a new window : in docked mode the menu is displayed by clicking on the tab of the notebook
################################################################################
proc setMenu {w m} {
  if { ! $::docking::USE_DOCKING } {
    $w configure -menu $m
  }
}
################################################################################
# In docked mode, resize board automatically
# Very messy and there's probably a better way, but cant be bothered right now.
################################################################################
proc resizeMainBoard {} {
  global gameInfo board

  if { ! $::docking::USE_DOCKING } { return }
  
  bind .main <Configure> {}
  
  set w [winfo width .main]
  set h [winfo height .main]
  set bd .main.board
  
  ### calculate available height

  set height_used 0
  if {$gameInfo(showTool)} {
    incr height_used [ lindex [grid bbox .main 0 0] 3]
  }
  if {$gameInfo(showButtons)} {
    incr height_used [ lindex [grid bbox .main 0 1] 3]
  }

  # coordinates
  if { $::board::_coords($bd) == 2 || $::board::_coords($bd) == 0} {
    incr height_used [ lindex [ grid bbox $bd 1 9 ] 3 ]
  }
  if { $::board::_coords($bd) == 0 } {
    incr height_used [ lindex [ grid bbox $bd 1 0 ] 3 ]
  }

  # game info &&& fixme
  set min_game_info_height [expr {6 + $gameInfo(showFEN) + $::macOS}]
  set game_info_line_height 5
  set min_game_info_lines 1
  if {$gameInfo(show)} {
    set min_game_info_lines 5
    set game_info_lines [.main.gameInfo count -displaylines 1.0 end]
    if { $game_info_lines > 0 } {
      # probably not very correct, do you know any better way to get this information?
      set game_info_line_height [expr 1.0 * [.main.gameInfo count -ypixels 1.0 end] / $game_info_lines]
    } else {
      # utter approximation
      set game_info_line_height [expr [font configure font_Regular -size] * 1.5]
    }
    set min_game_info_height [expr int($min_game_info_lines * $game_info_line_height + 5)]
  } else {
    set min_game_info_height [expr int([font configure font_Regular -size] * 1.5 * 2.5)]
  }
  incr height_used $min_game_info_height
  
  # status bar
  incr height_used [ lindex [grid bbox .main 0 4] 3]
  
  set availh [expr $h - $height_used]
  
  ### calculate available width

  set width_used 12
  if { $::board::_coords($bd) == 2 || $::board::_coords($bd) == 0} {
    incr width_used [ lindex [ grid bbox $bd 2 1 ] 2 ]
  }
  if { $::board::_coords($bd) == 0 } {
    incr width_used [ lindex [ grid bbox $bd 11 1 ] 2 ]
  }
  if {$::board::_stm($bd)} {
    incr width_used [ lindex [ grid bbox $bd 1 1] 2 ]
    incr width_used 10
  }
  if {$::board::_showmat($bd)} {
    # we can't rely on board::_matwidth($bd) or the bbox of 12,1 because matwidth is being set afterwards
    incr width_used 30
  }
  # Not quite perfect for some reason (-16)
  set availw [expr $w - $width_used -16] 
  
  if {$availh < $availw} {
    set min $availh
  } else  {
    set min $availw
  }

  if { $::autoResizeBoard } {
    # find the closest available size
    for {set i 0} {$i < [llength $::boardSizes]} {incr i} {
      set newSize [lindex $::boardSizes $i]
      if { $newSize > [ expr $min / 8 ] } {
        if {$i > 0} {
          set newSize [lindex $::boardSizes [expr $i -1] ]
        }
        break
      }
    }
    # resize the board
    ::board::resize .main.board $newSize
    set ::boardSize $newSize
  }

  # adjust game info height
  set new_game_info_lines [expr int(($min_game_info_height+($availh-$::boardSize*8))/$game_info_line_height)]
  if { $new_game_info_lines > $min_game_info_lines } {
    set new_game_info_lines [expr $new_game_info_lines - 1]
  }
  .main.gameInfo configure -height $new_game_info_lines
  
  update idletasks
  bind .main <Configure> {::docking::handleConfigureEvent %W}
}

proc toggleToolbar {} {
  if {$::gameInfo(showTool)} {
    grid .main.tb -row 0 -column 0 -columnspan 3 -sticky we
  } else {
    grid forget .main.tb
  }
}

proc showMenubar {} {
  if {!$::gameInfo(showMenu)} {
    $::dot_w configure -menu {}
  } else {
    $::dot_w configure -menu .menu
  }
}

proc toggleButtonBar {} {
  if {!$::gameInfo(showButtons)} {
    grid remove .main.button
  } else {
    grid configure .main.button -row 1 -column 0 -pady 3 -padx 5
  }
}

proc toggleStatus {} {
  if {!$::gameInfo(showStatus)} {
    grid remove .main.statusbar
  } else {
    grid configure .main.statusbar -row 4 -column 0 -columnspan 3 -sticky we
  }
}

proc toggleGameInfo {} {
  set ::gameInfo(show) [expr ! $::gameInfo(show)]
  showGameInfo
  resizeMainBoard
}

proc showGameInfo {} {
  if {$::gameInfo(show)} {
    grid forget .main.gameInfoMini
    grid .main.gameInfoFrame -row 3 -column 0 -sticky nsew -padx 2
  } else  {
    grid forget .main.gameInfoFrame
    grid .main.gameInfoMini -row 3 -column 0 -padx 2
  }
  update idletasks
}

# Engines list file: -- OLD NAMES, NO LONGER USED
#set engines(file) [file join $scidUserDir "engines.lis"]
#set engines(backup) [file join $scidUserDir "engines.bak"]

# Engines data:
set engines(list) {}
set engines(sort) Time
set engines(F2)  0
set engines(F3)  1
set engines(F4)  {}

proc resetInformants {} {
  global informant
  array set informant {}
  set informant("!?")  0.5
  set informant("?")   1.5
  set informant("??")  3.0
  set informant("?!")  0.5
  set informant("+=")  0.5
  set informant("+/-") 1.5
  set informant("+-")  3.0
  set informant("++-") 5.5
}

resetInformants

image create photo icon -format gif -data {
R0lGODlhawBpAHAAACH5BAEAAPwALAAAAABrAGkAhwAAAAAAMwAAZgAAmQAAzAAA/wArAAArMwAr
ZgArmQArzAAr/wBVAABVMwBVZgBVmQBVzABV/wCAAACAMwCAZgCAmQCAzACA/wCqAACqMwCqZgCq
mQCqzACq/wDVAADVMwDVZgDVmQDVzADV/wD/AAD/MwD/ZgD/mQD/zAD//zMAADMAMzMAZjMAmTMA
zDMA/zMrADMrMzMrZjMrmTMrzDMr/zNVADNVMzNVZjNVmTNVzDNV/zOAADOAMzOAZjOAmTOAzDOA
/zOqADOqMzOqZjOqmTOqzDOq/zPVADPVMzPVZjPVmTPVzDPV/zP/ADP/MzP/ZjP/mTP/zDP//2YA
AGYAM2YAZmYAmWYAzGYA/2YrAGYrM2YrZmYrmWYrzGYr/2ZVAGZVM2ZVZmZVmWZVzGZV/2aAAGaA
M2aAZmaAmWaAzGaA/2aqAGaqM2aqZmaqmWaqzGaq/2bVAGbVM2bVZmbVmWbVzGbV/2b/AGb/M2b/
Zmb/mWb/zGb//5kAAJkAM5kAZpkAmZkAzJkA/5krAJkrM5krZpkrmZkrzJkr/5lVAJlVM5lVZplV
mZlVzJlV/5mAAJmAM5mAZpmAmZmAzJmA/5mqAJmqM5mqZpmqmZmqzJmq/5nVAJnVM5nVZpnVmZnV
zJnV/5n/AJn/M5n/Zpn/mZn/zJn//8wAAMwAM8wAZswAmcwAzMwA/8wrAMwrM8wrZswrmcwrzMwr
/8xVAMxVM8xVZsxVmcxVzMxV/8yAAMyAM8yAZsyAmcyAzMyA/8yqAMyqM8yqZsyqmcyqzMyq/8zV
AMzVM8zVZszVmczVzMzV/8z/AMz/M8z/Zsz/mcz/zMz///8AAP8AM/8AZv8Amf8AzP8A//8rAP8r
M/8rZv8rmf8rzP8r//9VAP9VM/9VZv9Vmf9VzP9V//+AAP+AM/+AZv+Amf+AzP+A//+qAP+qM/+q
Zv+qmf+qzP+q///VAP/VM//VZv/Vmf/VzP/V////AP//M///Zv//mf//zP///wAAAAAAAAAAAAAA
AAj/APcJHEiwoMGDCBMqXMiwocOB9R5KTKhv4sKIFjMKhFaQI0GPA0Fu/KhxYEWCykoKPLmyIMuE
GCEWjLmPZk2CNjkSkyQJE09hyYQhEzo0KLJkQ48Kyzc0kzBMwpw+fToMqlOomKoC3RrU6DBh0Ugq
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
ItvsN/uAm5CjgAAAOw==}

wm iconphoto . -default icon

# Opening files by drag & drop on Scid icon on Mac
if { $macOS } {
  # Drag & Drop
  set dndisbusy 0
  set isopenBaseready 0
  set dndargs 0

  proc dragndrop {args} {
    global dndisbusy
    global isopenBaseready
    global dndargs

    # Un-nest arguments:
    set args [join $args]

    # Wait for openBase to be ready, if needed.
    if {$isopenBaseready == 0} {
      if {$dndargs != 0} {
        tk_messageBox -type ok -icon info -title "Scid" -message \
            "Please, wait until Scid finish starting up."
        return
      } else {
        # Save file names for later use:
        set dndargs $args
      }
      return
    }

    # Are we busy opening files? if so, display message and do nothing
    if {$dndisbusy != 0} {
      tk_messageBox -type ok -icon info -title "Scid" -message \
          "Please, wait until the previou(s) database(s) are opened and try again."
      return
    }

    # Un-nest argumens again if Scid opened on drag & drop
    if {$isopenBaseready == 2} {
      # Un-nest arguments:
      set args [join $args]
      set isopenBaseready 1
    }

    set dndisbusy 1
    set errmsg ""
    foreach file $args {
      # Check for available slots:
      if {[sc_base count free] == 0} {
        tk_messageBox -type ok -icon info -title "Scid" \
            -message "Too many databases are open; close at least one \n\
            before opening more databases"
        #::splash::add "No slot available."
        return
      }
      set ext [file extension $file]
      # SearchOptions file:
      if {$ext == ".sso"} {
        set ::fName $file
        if {[catch {uplevel "#0" {source $::fName}} errmsg]} {
          tk_messageBox -title "Scid: Error reading file" -type ok -icon warning \
              -message "Unable to open or read SearchOptions file: $file"
        } else {
          switch -- $::searchType {
            "Header"   { ::search::header }
            default    { continue }
          }
        }
        continue
      }
      if {$ext == ".sg4" || $ext == ".sn4"} {
        set file "[file rootname $file].si4"
      }
      if {$ext == ".sg3" || $ext == ".sn3"} {
        set file "[file rootname $file].si3"
      }

      # Check if base is already opened
      set slot [sc_base slot $file]
      if {$slot != 0} {
        sc_base switch $slot
        refreshWindows
        updateBoard -pgn
      } else  {
        # All seems good, let's open those files:
        wm deiconify $::dot_w
        ::file::Open $file
        focus .main
      }
    }
    set dndisbusy 0
    set dndargs 0
  }
  proc tkOpenDocument {args} {
    after idle [list dragndrop $args]
  }
  rename tkOpenDocument ::tk::mac::OpenDocument

  # Hack to allow focus and text copy from disabled text widgets on OSX
  rename text ::tk::mac::text
  proc text {w args} {
    eval ::tk::mac::text $w $args
    bind $w <1> "focus $w"
    $w configure -highlightthickness 0
  }
}

# Add empty updateStatusBar proc to avoid errors caused by early
# closing of the splash window:

proc updateStatusBar {} {}

set ::splash::keepopen 1
set ::splash::cache {}

# the function gets redfined once the fonts have been read from options.dat

proc ::splash::add {text {tag {indent}}} {
  lappend ::splash::cache $text
}

# Remember old font settings before loading options file:
set fontOptions(oldRegular) $fontOptions(Regular)
set fontOptions(oldMenu) $fontOptions(Menu)
set fontOptions(oldSmall) $fontOptions(Small)
set fontOptions(oldTiny) $fontOptions(Tiny)
set fontOptions(oldFixed) $fontOptions(Fixed)

# New configuration file names:
set scidConfigFiles(options)     options.dat
set scidConfigFiles(engines)     engines.dat
set scidConfigFiles(engines.bak) engines.dat
set scidConfigFiles(recentfiles) recent.dat
set scidConfigFiles(history)     history.dat
set scidConfigFiles(reports)     reports.dat
set scidConfigFiles(optrainer)   optrainer.dat

set ecoFile {}

set addRatings(overwrite) 0
set addRatings(filter)    1

# scidConfigFile:
#   Returns the full path and name of a Scid configuration file,
#   given its configuration type.
#
proc scidConfigFile {type} {
  global scidConfigDir scidConfigFiles
  if {! [info exists scidConfigFiles($type)]} {
    return -code error "No such config file type: $type"
  }
  return [file nativename [file join $scidConfigDir $scidConfigFiles($type)]]
}

# Create user ".scid" directory in Unix if necessary:
# Since the options file used to be ".scid", rename it:
if {! [file isdirectory $scidUserDir]} {
  if {[catch {file mkdir $scidUserDir} err]} {
    ::splash::add "Error creating $scidUserDir directory: $err" error
  } else {
    catch {file rename "$scidUserDir.old" $optionsFile}
  }
}

# Create the config, data and log directories if they do not exist:
proc makeScidDir {dir} {
  if {![file isdirectory $dir] || ![file writable $dir]} {
    if {[catch {file mkdir $dir} err]} {
      ::splash::add "Error creating directory $dir: $err" error
    } else {
      ::splash::add "Created directory: $dir"
    }
  }
}

makeScidDir $scidConfigDir
makeScidDir $scidDataDir
makeScidDir $scidLogDir

# moveOldConfigFiles removed S.A

set optionsFile [scidConfigFile options]

::splash::add "Command line is \"$::argv0 $::argv\""
::splash::add "User directory is \"$scidUserDir\""

if {[info tclversion] >= "8.6"} { 
  ::splash::add "png image support is available."
  set png_image_support 1
  set boardStyle Merida1
} elseif { [catch { package require img::png } ] } {
  ::splash::add "TkImg not found. Most piece sets are disabled."
  set png_image_support 0
  set boardStyle Alpha
} else {
  ::splash::add "TkImg found. Enabling png image support."
  set png_image_support 1
  set boardStyle Merida1
}

if {[catch {source $optionsFile} ]} {
  ::splash::add "Error loading options file \"$optionsFile\"" error
} else {
  ::splash::add "Loaded options from \"$optionsFile\"."
}

if { [string first "-dock" [lindex $argv 0]] > -1} {
  set windowsDock 1
}

if { [string first "-nodock" [lindex $argv 0]] > -1} {
  # reset in case of error recovery
  set windowsDock 0
  ::docking::init_layout_list  1
}

if { [string first "-dock" [lindex $argv 0]] > -1} {
  set windowsDock 1
}

set ::docking::USE_DOCKING $windowsDock

if {$::docking::USE_DOCKING} {
  set dot_w .
} else  {
  set dot_w .main
}

# Reconfigure fonts if necessary

foreach i {Regular Menu Small Tiny Fixed} {
  if {$fontOptions($i) == $fontOptions(old$i)} {
    # Old font format in options file, or no file. Extract new options:
    set fontOptions($i) {}
    lappend fontOptions($i) [font actual font_$i -family]
    lappend fontOptions($i) [font actual font_$i -size]
    lappend fontOptions($i) [font actual font_$i -weight]
    lappend fontOptions($i) [font actual font_$i -slant]
  } else {
    # New font format in options file:
    configureFont $i
  }
}

# make font_Regular the default font for widgets

set fd_size [font actual font_Regular -size]
option add *Font font_Regular
option add *Menu*Font font_Menu
# option add *Menubutton*Font font_Menu
if {$unixOS} {
  option add Scrollbar*borderWidth 1
}

### Fonts now fully configure :> S.A

### Takes an entrybox, a (global?) var, and a text widget
#   Binds Entry <Return> to search the text widget for entry box contents

proc configFindEntryBox {entry var text} {
    upvar $var topvar

    ### This code originally in htext.tcl::updateHelpWindow
    $text tag configure Highlight -background orange

    set topvar(findprev) {}
    set topvar(findindex) 1.0
    bind $entry <Return> "nextFindEntryBox $entry $var $text"
    bind [winfo toplevel $entry] <Control-f> "focus $entry"
}

proc nextFindEntryBox {entry var text} {
    upvar 1 $var topvar

    if {$topvar(findprev) != $topvar(find)} {
      set topvar(findprev) $topvar(find)
    }
    $text tag remove Highlight 1.0 end

    if {[catch {
          set result [$text search -regexp -nocase -- $topvar(find) $topvar(findindex)]
        }]} {
      flashEntryBox $entry
      return
    }
    if {$result == {}} {
      set topvar(findindex) 1.0
      bell
    } else {
      if {[ regexp {(.*)\.(.*)} $result t1 line char]} {
        $text see $result
        # find the length of matching text
        regexp -nocase -- $topvar(find) [$text get $line.0 $line.end] matchVar
        set length [string length $matchVar]
        if {$length < 1} {
          set length 1
        }
        $text tag add Highlight $result $line.[expr $char + $length]
        set topvar(findindex) $line.[expr $char + 1]
      } ;# should always succeed ?
    }
}

### [bell] doesnt work on all platforms (esp. Linux), so make our own

proc flashEntryBox {w} {
      set bg [$w cget -background]
      set fg [$w cget -foreground]
      $w configure -background $fg -foreground $bg
      after 200 "$w configure -background $bg -foreground $fg"
}

### Add basic Bash-style history to entry boxes
#   (History up/down with arrows, Control-c to cancel, and alt-backspace to delete a word)

proc  configHistory {namespace entrybox} {

  set ::${namespace}::entrybox $entrybox

  bind $entrybox <Up> "::${namespace}::cmdHistory up"
  bind $entrybox <Down> "::${namespace}::cmdHistory down"
  if {$::macOS} {
    bind $entrybox <Option-BackSpace> "::${namespace}::cmdBackWord ; break"
  } else {
    bind $entrybox <Alt-BackSpace> "::${namespace}::cmdBackWord ; break"
  }

  namespace eval $namespace {
    variable history
    variable history_pos
    variable history_current
    variable entrybox

    set history {}
    set history_pos 0
    set history_current 0

    namespace export addHistory cmdHistory cmdClear cmdBackWord

    proc addHistory {text} {
      variable history
      variable history_pos
      variable history_current
      variable entrybox
      
      if {[lindex $history end] != $text} {
	lappend history $text
      }
      set history_pos [llength $history]
    }

    proc cmdHistory {action} {
      variable history
      variable history_pos
      variable history_current
      variable entrybox
      
      set t $entrybox

      if {$action == "up" && $history_pos > 0} {
	if {$history_pos == [llength $history]} {
	  set history_current [$t get]
	}
	$t delete 0 end
	incr history_pos -1
	$t insert end [lindex $history $history_pos]
      }
      if {$action == "down"} {
	if {$history_pos < [llength $history]} {
	  $t delete 0 end
	  incr history_pos
	  if {$history_pos == [llength $history]} {
	    set  entry $history_current 
	  } else {
	    set entry [lindex $history $history_pos]
	  }
	  $t insert end $entry
	}
      }
    }

    proc cmdBackWord {} {
      variable entrybox

      # bash like delete last word on command line
      set entry [$entrybox get]
      # break line into two parts (before/after cursor)
      set i [$entrybox index insert]
      set t1 [string range $entry 0 $i-1]
      set t2 [string range $entry $i end]
      if {[string is space [string index $t1 end]]} {
	while {[string is space [string index $t1 end]]} {
	  set t1 [string range $t1 0 end-1]
          # Oops. "" is space !
	  if {$t1 == ""} { return }
	}
      } else {
	set j [string last { } $t1]
	set t1 [string range $t1 0 $j-1]
      }
      $entrybox delete 0 end
      $entrybox insert end $t1$t2

      $entrybox icursor [string length $t1]
    }

    proc cmdClear {} {
      variable history
      variable history_pos
      variable entrybox

      $entrybox delete 0 end
      set history_pos [llength $history]
    }

  }
}

### Start up splash window

proc ::splash::make {} {
  ### windows hack 
  # Dont withdraw toplevel if windows and docked mode, because of rendering bugs in paned windows/tabs
  if {!($::windowsOS && $::docking::USE_DOCKING)} {
     wm withdraw .
  }

  set w [toplevel .splash]

  ### Calculate size of the OS X dock
  #   - but it is busted. Maximized height doesnt want to work, and 'update's don't seem to help
  if {0 && $::macOS} {
      wm state $w zoomed
      set height_maximized [winfo height $w]
      wm state $w normal

      wm attributes $w -fullscreen 1
      set height_fullscreen [winfo height $w]
      wm attributes $w -fullscreen 0

      set ::macDockHeight [expr $height_fullscreen - $height_maximized]
      ::splash::add "OS X Dock height is $::macDockHeight"
  }

  wm withdraw $w
  wm protocol $w WM_DELETE_WINDOW [list wm withdraw $w]
  wm title $w "Welcome to $::scidName $::scidVersion"

  ### Pack in this order to resize nicely
  # buttons
  frame $w.b
  pack $w.b -side bottom -fill x

  # command entry
  entry $w.command
  pack $w.command -side bottom -fill x -padx 3 -pady 2

  configHistory splash $w.command

  # text
  frame $w.f
  pack $w.f -side top -expand yes -fill both

  text $w.t -height 15 -width 55 -cursor top_left_arrow \
       -font font_Regular -wrap word \
      -yscrollcommand [list $w.ybar set] -setgrid 1
  scrollbar $w.ybar -command [list $w.t yview]
  # Hmm - translations aren't set up yet
  checkbutton $w.auto -text "Keep open after startup" \
      -variable ::splash::keepopen -font font_Small -pady 5 -padx 5
  button $w.dismiss -text Close -width 8 -command [list wm withdraw $w] \
      -font font_Small

  entry $w.find -width 10 -textvariable ::splash::find(find) -highlightthickness 0
  configFindEntryBox $w.find ::splash::find $w.t

  set ::splash::console 0
  bind $w.command <Return> {
    if {!$::splash::console} {
      set ::splash::console 1
      ::splash::add {}
      ::splash::add "$scidName $scidVersion Console"
      ::splash::add {------------------------------------}
      ::splash::add {Here you can enter commands to the Scid interpreter for execution.}
      ::splash::add {Try - "time {foreach i [array names helpText] {helpWindow $i}}" for a simple test and benchmark.}
    }
    set command [string trim [.splash.command get]]
    ::splash::add "# $command"
    ::splash::addHistory $command
    if {$command != {}} {
      if {[catch {set result [eval $command]} error]} {
	::splash::add "> $error"
      } else {
	::splash::add "> $result"
      }
    }
    .splash.t see end
    .splash.command delete 0 end
  }


  pack $w.auto -side left -in .splash.b -pady 2 -ipadx 10 -padx 10
  pack $w.find $w.dismiss -side right -in .splash.b -pady 2 -ipadx 10 -padx 10
  pack $w.ybar -in $w.f -side right -fill y
  pack $w.t -in $w.f -side left -fill both -expand yes

  # Centre the splash window:
  update idletasks
  set x [expr {[winfo screenwidth $w]/2 - [winfo reqwidth $w]/2 }]
  set y [expr {[winfo screenheight $w]/2 - [winfo reqheight $w]/2 }]
  wm geom $w +$x+$y
  wm deiconify $w

  bind $w <F1> {helpWindow Contents}
  bind $w <Escape> {.splash.dismiss invoke}

  $w.t tag configure indent -lmargin2 20
  $w.t tag configure error -foreground red
  $w.t tag configure scid_title -font {Arial 24 normal} -foreground darkslateblue

  $w.t insert end "        $::scidName     " scid_title
  $w.t image create end -image icon -padx 20 -pady 10
}

# new logo from www.vitualpieces.net

::splash::make

proc ::splash::add {text {tag {indent}}} {
  if {[winfo exists .splash]} {
    .splash.t insert end "\n$text" $tag
    if {$tag == {error}} {
      if {$::windowsOS} {
	puts $text
      } else {
	puts stderr $text
      }
    }
  }
}

::splash::add "$::scidName $::scidVersion ($::scidVersionDate)"
::splash::add "http://scidvspc.sourceforge.net"
::splash::add ""
::splash::add "(C) Steven Atkinson (stevenaaus@yahoo.com) 2008-2017"
::splash::add "(C) Pascal Georges 2006-2008"
::splash::add "(C) Shane Hudson 1999-2004"
::splash::add "(C) Gregor Cramer, Fulvio Benini and others."
::splash::add "Licenced under the GNU General Public License."
::splash::add ""

# add cached splash comments
foreach line $::splash::cache {
  ::splash::add $line
}

# A lot of code assumes tcl_platform is either windows or unix, so
# lotsa stuff may break if this is not the case.

if {[catch {.splash.t configure -insertforeground blue}]} {
  set result No
} else {
  set result Yes
}
::splash::add "Using Tcl/Tk version: [info patchlevel] (with Gregor's tk::text - $result)"

::splash::add "$tcl_platform(os) operating system, version $tcl_platform(osVersion)"
if {(! $windowsOS)  &&  (! $unixOS)} {
  ::splash::add "Operating System may not be supported"
}
if {[string match -nocase Linux $tcl_platform(os)]} {
  catch {
    ::splash::add "[eval exec cat [glob /etc/*-release] | uniq]"
  }
}

catch {
  ::splash::add "LANG environment var is $::env(LANG)"
}

::splash::add ""

### Workaround a bug in Wish 8.5.10 ttk::scale.
# To trigger, press Control-l three times and try to move y scrollbar

set buggyttk [expr {[info patchlevel] == {8.5.10}}]
if {$buggyttk} {
      ::splash::add "Warning - Disabling Tk-8.5.10's buggy ttk::scale widget." error
}


# Check board size is valid:
set newSize [lindex $boardSizes 0]
foreach sz $boardSizes {
  if {$boardSize >= $sz} { set newSize $sz }
}
set boardSize $newSize

# Load theme
catch {ttk::style theme use $lookTheme}
::ttk::style configure TNotebook.Tab -font font_Menu

# Check for old (single-directory) tablebase option:
if {[info exists initialDir(tablebase)]} {
  set initialDir(tablebase1) $initialDir(tablebase)
}

set fontsize [font configure font_Regular -size]
set font [font configure font_Regular -family]

font create font_Bold -family $font -size $fontsize -weight bold
font create font_BoldItalic -family $font -size $fontsize -weight bold \
    -slant italic
font create font_Italic -family $font -size $fontsize -slant italic
font create font_H1 -family $font -size [expr {$fontsize + 16} ] -weight bold
font create font_H2 -family $font -size [expr {$fontsize + 6} ] -weight bold
font create font_H3 -family $font -size [expr {$fontsize + 4} ] -weight bold
font create font_H4 -family $font -size [expr {$fontsize + 2} ] -weight bold
font create font_H5 -family $font -size [expr {$fontsize + 0} ] -weight bold

set fontsize [font configure font_Small -size]
set font [font configure font_Small -family]
font create font_SmallBold -family $font -size $fontsize -weight bold
font create font_SmallItalic -family $font -size $fontsize -slant italic

# Hidden-file dialog hack
# https://sourceforge.net/p/pure-data/patches/208/
catch {tk_getOpenFile -with-invalid-argument}
namespace eval ::tk::dialog::file {
  variable showHiddenBtn 1
  variable showHiddenVar 0
}

## ttk init
# Gregor's code to give readonly combos/enrties/spinboxes a non-grey background
set fbg {}
switch "_$::ttk::currentTheme" {
   _alt     { set fbg [list readonly white disabled [ttk::style lookup $::ttk::currentTheme -background]] }
   _clam    { set fbg [list readonly white {readonly focus} [ttk::style lookup $::ttk::currentTheme -selectbackground]] }
   _default { set fbg [list readonly white disabled [ttk::style lookup $::ttk::currentTheme -background]] }
}
if {[llength $fbg]} {
   ttk::style map TCombobox -fieldbackground $fbg
   ttk::style map TEntry -fieldbackground $fbg
   if {[info tclversion] >= "8.6"} { 
      ttk::style map TSpinbox -fieldbackground $fbg
   }
}

# Start in the clipbase, if no database is loaded at startup.
sc_base switch clipbase

###
### End of file: start.tcl
