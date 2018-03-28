### Menus.tcl: part of Scid.
### Copyright (C) 2001-2003 Shane Hudson.

### Keep menus on right hand side (X11)
# This also disables automatic menu posting
# catch {tk::classic::restore menu}

# Disabled
if {0 && [tk windowingsystem] eq "x11"} {
  option add *Menu.useMotifHelp true widgetDefault
}

array set helpMessage {}

### Main window menus:

option add *Menu*TearOff 0

menu .menu

### We need to find a way to focus .menu for Alt+Key menu shortcuts in docked mode
# bind .menu <Any-Enter> {focus -force .menu ; break}
# bind .menu <ButtonRelease-1> {focus -force .menu}

if {$windowsOS} {
  # todo &&&
  # How do we disable windows broken menu short-cuts &&&
  # bind $dot_w <Alt> {}
}

## Mac Application menu has to be before any call to configure.
if {$macOS} {
  # Application menu:
  .menu add cascade -label Scid -menu .menu.apple
  menu .menu.apple

  set menuindex -1
  set m .menu.apple

  $m add command -label HelpAbout -command {helpWindow Author}
  set helpMessage($m,[incr menuindex]) HelpAbout

  $m add separator
  incr menuindex

  bind all <Help> {helpWindow Contents}

  # Trap quitting from the tkscid OSX menu (needed to save options).
  proc ::tk::mac::Quit {}  {
    ::file::Exit
  }

}

if {$::gameInfo(showMenu)} {
  $dot_w configure -menu .menu
}

.menu add cascade -label File -menu .menu.file
.menu add cascade -label Edit -menu .menu.edit
.menu add cascade -label Game -menu .menu.game
.menu add cascade -label Search -menu .menu.search
.menu add cascade -label Windows -menu .menu.windows
.menu add cascade -label Tools -menu .menu.tools
.menu add cascade -label Options -menu .menu.options
.menu add cascade -label Help -menu .menu.help

foreach menuname { file edit game search windows tools options help } {
  menu .menu.$menuname
}

.menu.windows configure -tearoff 1
.menu.options configure -tearoff 1
.menu.help configure -tearoff 1


### File menu:

set menuindex -1
set m .menu.file
# If altering .menu.file, must change the 'set idx ...' value below

$m add command -label FileNew -command ::file::New
set helpMessage($m,[incr menuindex]) FileNew

$m add command -label FileOpen -acc "control-o" -command ::file::Open
bind .main <Control-o> ::file::Open
set helpMessage($m,[incr menuindex]) FileOpen

$m add command -label FileSavePgn  -command {::pgn::savePgn .}
set helpMessage($m,[incr menuindex]) FileSavePgn

$m add command -label FileClose -acc "control-w" -command ::file::Close
bind .main <Control-w> ::file::Close
set helpMessage($m,[incr menuindex]) FileClose

$m add command -label FileReadOnly -command makeBaseReadOnly
set helpMessage($m,[incr menuindex]) FileReadOnly

menu $m.bookmarks

$m add cascade -label FileSwitch -menu $m.switch
set helpMessage($m,[incr menuindex]) FileSwitch

### .menu.file.switch menu items added in updateMenuStates

menu $m.switch -tearoff 1

# naming is weird because the menus are moved from Tools to File menus

$m add command -label FileOpenBaseAsTree -command ::file::openBaseAsTree
set helpMessage($m,[incr menuindex]) FileOpenBaseAsTree
menu $m.recenttrees
$m add cascade -label FileOpenRecentBaseAsTree -menu $m.recenttrees
set helpMessage($m,[incr menuindex]) FileOpenRecentBaseAsTree

$m add command -label FileExit -accelerator "control-q" -command ::file::Exit
bind .main <Control-q> ::file::Exit
set helpMessage($m,[incr menuindex]) FileExit

set totalBaseSlots [sc_base count total]
set clipbaseSlot [sc_info clipbase]
set currentSlot [sc_base current]



### Edit menu

set menuindex -1
set m .menu.edit

$m add command -label EditSetup -command setupBoard -accelerator "control-B"
set helpMessage($m,[incr menuindex]) EditSetup

$m add command -label EditCopyBoard -accelerator "control-C" -command copyFEN
set helpMessage($m,[incr menuindex]) EditCopyBoard

$m add command -label EditCopyPGN -command ::pgn::copyPgn
set helpMessage($m,[incr menuindex]) EditCopyPGN

$m add command -label EditPasteBoard -accelerator "control-V" -command pasteFEN
set helpMessage($m,[incr menuindex]) EditPasteBoard

$m add command -label EditPastePGN -command importPgnGame -accelerator "control-I"
set helpMessage($m,[incr menuindex]) EditPastePGN

$m add separator
incr menuindex

$m add command -label EditReset -command {
  sc_clipbase clear
  updateBoard -pgn
  ::windows::gamelist::Refresh
  updateTitle
}
set helpMessage($m,[incr menuindex]) EditReset

$m add command -label EditCopy -accelerator "control-c" -command copyGame
bind .main <Control-c> copyGame
set helpMessage($m,[incr menuindex]) EditCopy

$m add command -label EditPaste -accelerator "control-v" -command pasteGame
bind .main <Control-v> pasteGame
set helpMessage($m,[incr menuindex]) EditPaste

$m add separator
incr menuindex

$m add cascade -label EditStrip -menu $m.strip
set helpMessage($m,[incr menuindex]) EditStrip

$m add command -label EditUndo -command {sc_game undo ; updateBoard -pgn}
set helpMessage($m,[incr menuindex]) EditUndo
$m add command -label EditRedo -command {sc_game redo ; updateBoard -pgn}
set helpMessage($m,[incr menuindex]) EditRedo
bind .main <Control-z> {sc_game undo ; updateBoard -pgn}
bind .main <Control-y> {sc_game redo ; updateBoard -pgn}

$m add separator
incr menuindex

$m add command -label EditAdd -accel "control-a" -command {sc_var create; updateBoard -pgn}
set helpMessage($m,[incr menuindex]) EditAdd

$m add command -label EditPasteVar -command importVar
set helpMessage($m,[incr menuindex]) EditPasteVar

menu $m.del
$m add cascade -label EditDelete -menu $m.del
set helpMessage($m,[incr menuindex]) EditDelete

menu $m.first
$m add cascade -label EditFirst -menu $m.first
set helpMessage($m,[incr menuindex]) EditFirst

menu $m.main
$m add cascade -label EditMain -menu $m.main
set helpMessage($m,[incr menuindex]) EditMain

$m add checkbutton -label EditTrial -variable trialMode \
    -accelerator "control-space" -command {setTrialMode menu}
bind .main <Control-space> { setTrialMode toggle }
set helpMessage($m,[incr menuindex]) EditTrial

menu $m.strip
$m.strip add command -label EditStripBegin -command {::game::TruncateBegin}
set helpMessage($m.strip,2) EditStripBegin
$m.strip add command -label EditStripEnd -command {::game::Truncate}
set helpMessage($m.strip,3) EditStripEnd
bind .main <Delete> {::game::Truncate}
$m.strip add command -label EditStripComments -command {::game::Strip comments}
set helpMessage($m.strip,0) EditStripComments
$m.strip add command -label EditStripVars -command {::game::Strip variations}
set helpMessage($m.strip,1) EditStripVars


### Game menu:
set menuindex -1
set m .menu.game
$m add command -label GameNew -accelerator "control-N" -command ::game::Clear
bind .main <Control-N> ::game::Clear
set helpMessage($m,[incr menuindex]) GameNew

$m add command -label GameReplace -command gameReplace -accelerator "control-s"
bind .main <Control-s> { .menu.game invoke [tr GameReplace] }
set helpMessage($m,[incr menuindex]) GameReplace

$m  add command -label GameAdd -command gameAdd  -accelerator "control-S"
bind .main <Control-S> gameAdd
set helpMessage($m,[incr menuindex]) GameAdd

$m add separator
incr menuindex

$m add command -label GameInfo -command {gameSave -1} -underline 9
set helpMessage($m,[incr menuindex]) GameInfo

$m add command -label GameBrowse -command {::gbrowser::new [sc_base current] [sc_game number] [sc_pos location]}
set helpMessage($m,[incr menuindex]) GameBrowse

$m add command -label GameList -accel "control-l" -command ::windows::gamelist::Open 
set helpMessage($m,[incr menuindex]) GameList

$m add separator
incr menuindex

$m  add command -label GameDelete -accel "control-delete" -command ::game::Delete -underline 0
set helpMessage($m,[incr menuindex]) GameDelete
if {$::macOS} {
  bind .main <Control-BackSpace> ::game::Delete
} else {
  bind .main <Control-Delete> ::game::Delete
}

$m add command -label GameReload -command ::game::Reload 
set helpMessage($m,[incr menuindex]) GameReload

$m add separator
incr menuindex

$m add command -label GameFirst -accelerator "control-home" \
    -command {::game::LoadNextPrev first}
set helpMessage($m,[incr menuindex]) GameFirst

$m add command -label GameLast -accelerator "control-end" \
    -command {::game::LoadNextPrev last}
set helpMessage($m,[incr menuindex]) GameLast

$m add command -label GameNext -accelerator "control-down" \
    -command {::game::LoadNextPrev next}
set helpMessage($m,[incr menuindex]) GameNext

$m add command -label GamePrev -accelerator "control-up" \
    -command {::game::LoadNextPrev previous}
set helpMessage($m,[incr menuindex]) GamePrev

$m add command -label GameRandom -command ::game::LoadRandom -accelerator "control-?"
set helpMessage($m,[incr menuindex]) GameRandom

$m add command -label GameNumber -command ::game::LoadNumber -accelerator "control-u"
set helpMessage($m,[incr menuindex]) GameNumber

$m add separator
incr menuindex

$m add command -label GameDeepest -command IdentifyOpening 

proc IdentifyOpening {} {
  sc_move ply [sc_eco game ply]
  if {!$::gameInfo(show)} {
    toggleGameInfo
  }
  updateBoard
}

set helpMessage($m,[incr menuindex]) GameDeepest

$m add command -label GameGotoMove -accelerator "control-g" \
    -command ::game::GotoMoveNumber
set helpMessage($m,[incr menuindex]) GameGotoMove
bind .main <Control-g> ::game::GotoMoveNumber

$m add command -label GameNovelty -command findNovelty
set helpMessage($m,[incr menuindex]) GameNovelty


### Search menu:
set menuindex -1
set m .menu.search
$m  add command -label SearchReset -acc "control-r" \
    -command ::search::filter::reset
bind .main <Control-r> ::search::filter::reset
set helpMessage($m,[incr menuindex]) SearchReset

$m  add command -label SearchNegate -acc "control-n" \
    -command ::search::filter::negate
bind .main <Control-n> ::search::filter::negate
set helpMessage($m,[incr menuindex]) SearchNegate

$m  add command -label SearchEnd -command ::search::filter::end
set helpMessage($m,[incr menuindex]) SearchEnd

$m  add separator
incr menuindex

$m  add command -label SearchHeader \
    -command ::search::header -accelerator "control-G"
set helpMessage($m,[incr menuindex]) SearchHeader

$m  add command -label SearchCurrent -command ::search::board
set helpMessage($m,[incr menuindex]) SearchCurrent

$m  add command -label SearchMaterial \
    -command ::search::material -accelerator "control-M"
bind .main <Control-M> ::search::material
set helpMessage($m,[incr menuindex]) SearchMaterial

$m add command -label SearchMoves -command ::search::moves
set helpMessage($m,[incr menuindex]) SearchMoves

$m  add separator
incr menuindex

$m add command -label WindowsPList -command ::plist::Open -accelerator "control-P"
set helpMessage($m,[incr menuindex]) WindowsPList

$m  add separator
incr menuindex

$m add command -label SearchUsing -command ::search::usefile
set helpMessage($m,[incr menuindex]) SearchUsing

### Windows menu:
set menuindex 0
set m .menu.windows

$m  add command -label WindowsGameinfo -accelerator "control-i" -command toggleGameInfo 
bind .main <Control-i> toggleGameInfo
set helpMessage($m,[incr menuindex]) WindowsGameinfo

$m  add command -label WindowsComment -command ::commenteditor::Open -accelerator "control-e"
set helpMessage($m,[incr menuindex]) WindowsComment

$m  add command -label WindowsGList -command ::windows::gamelist::Open -accelerator "control-l"
set helpMessage($m,[incr menuindex]) WindowsGList

$m  add command -label WindowsPGN -command ::pgn::Open  -accelerator "control-p"
set helpMessage($m,[incr menuindex]) WindowsPGN

$m add command -label WindowsPList -command ::plist::Open -accelerator "control-P"
set helpMessage($m,[incr menuindex]) WindowsPList

$m add command -label WindowsMaint -accelerator "control-m" -command ::maint::Open
set helpMessage($m,[incr menuindex]) WindowsMaint

$m add separator
incr menuindex

$m add command -label WindowsECO -command ::windows::eco::Open
set helpMessage($m,[incr menuindex]) WindowsECO

$m add command -label WindowsStats -command ::windows::stats::Open
bind .main <Control-i> ::windows::stats::Open
set helpMessage($m,[incr menuindex]) WindowsStats

$m add command -label WindowsTree -command ::tree::Open -accelerator "control-t"
set helpMessage($m,[incr menuindex]) WindowsTree

### Tools menu:

set menuindex -1
set m .menu.tools
$m  add command -label ToolsAnalysis \
    -command ::enginelist::choose -accelerator "control-A"
bind .main <Control-A> ::enginelist::choose
set helpMessage($m,[incr menuindex]) ToolsAnalysis

#Add Menu for Start Engine 1 and Engine 2
$m  add command -label ToolsStartEngine1 \
    -command "startAnalysisWin F2" -accelerator "F2"
bind .main <F2> "startAnalysisWin F2"
set helpMessage($m,[incr menuindex]) ToolsStartEngine1

$m  add command -label ToolsStartEngine2 \
    -command "startAnalysisWin F3" -accelerator "F3"
bind .main <F3> "startAnalysisWin F3"
set helpMessage($m,[incr menuindex]) ToolsStartEngine2

$m add separator
incr menuindex

# **********

menu $m.utils
$m add cascade -label ToolsMaint -menu .menu.tools.utils
set helpMessage($m,[incr menuindex]) ToolsMaint

$m.utils add command -label ToolsMaintWin -accelerator "control-m" -command ::maint::Open
set helpMessage($m.utils,0) ToolsMaintWin

$m.utils add command -label ToolsMaintNameEditor -command nameEditor 
set helpMessage($m.utils,0) ToolsMaintNameEditor

$m.utils add command -label ToolsMaintCompact -command makeCompactWin
set helpMessage($m.utils,1) ToolsMaintCompact

$m.utils add command -label ToolsMaintSort -command makeSortWin
set helpMessage($m.utils,3) ToolsMaintSort

$m.utils add separator

$m.utils add command -label ToolsMaintNamePlayer -command {openSpellCheckWin Player}
set helpMessage($m.utils,1) ToolsMaintNamePlayer

$m.utils add command -label ToolsMaintNameEvent -command {openSpellCheckWin Event}
set helpMessage($m.utils,2) ToolsMaintNameEvent

$m.utils add command -label ToolsMaintNameSite -command {openSpellCheckWin Site}
set helpMessage($m.utils.3) ToolsMaintNameSite

$m.utils add command -label ToolsMaintNameRound -command {openSpellCheckWin Round}
set helpMessage($m.utils,4) ToolsMaintNameRound

$m.utils add separator

$m.utils add command -label ToolsMaintDelete -state disabled -command markTwins
set helpMessage($m.utils,5) ToolsMaintDelete

$m.utils add command -label ToolsMaintTwin -command updateTwinChecker
set helpMessage($m.utils,6) ToolsMaintTwin

$m.utils add separator

$m.utils add command -label ToolsMaintFixBase -command ::maint::fixCorruptedBase
set helpMessage($m.utils,10) ToolsMaintFixBase

# **********

$m add command -label ToolsPlayerReport -command ::preport::preportDlg
set helpMessage($m,[incr menuindex]) ToolsPlayerReport

$m add command -label ToolsOpReport -command ::optable::makeReportWin
set helpMessage($m,[incr menuindex]) ToolsOpReport

$m add separator
incr menuindex

$m add command -label ToolsFilterGraph -command tools::graphs::filter::Open
set helpMessage($m,[incr menuindex]) ToolsFilterGraph

$m add command -label ToolsAbsFilterGraph -accelerator "control-J" -command ::tools::graphs::absfilter::Open
bind .main <Control-J> ::tools::graphs::absfilter::Open
set helpMessage($m,[incr menuindex]) ToolsAbsFilterGraph

$m add command -label ToolsRating -command {::tools::graphs::rating::Refresh both}
set helpMessage($m,[incr menuindex]) ToolsRating

$m add command -label ToolsScore \
    -accelerator "control-Z" -command ::tools::graphs::score::Raise
bind .main <Control-Z> ::tools::graphs::score::Raise
set helpMessage($m,[incr menuindex]) ToolsScore

$m add separator
incr menuindex

menu $m.exportcurrent

$m add cascade -label ToolsExpCurrent -menu $m.exportcurrent
set helpMessage($m,[incr menuindex]) ToolsExpCurrent

$m.exportcurrent add command -label ToolsExpCurrentPGN -command {exportGames current PGN}
set helpMessage($m.exportcurrent,0) ToolsExpCurrentPGN

$m.exportcurrent add command -label ToolsExpCurrentHTML -command {exportGames current HTML}
set helpMessage($m.exportcurrent,1) ToolsExpCurrentHTML

$m.exportcurrent add command -label ToolsExpCurrentHTMLJS -command {::html::exportCurrentGame}
set helpMessage($m.exportcurrent,2) ToolsExpCurrentHTMLJS

$m.exportcurrent add command -label ToolsExpCurrentLaTeX -command {exportGames current Latex}
set helpMessage($m.exportcurrent,3) ToolsExpCurrentLaTeX

$m.exportcurrent add command -label ToolsExpCurrentLaTeX -command {
  ### $::scidLogDir must be usedhere, as previewLatex also looks there.
  ### and xelatex must be configure instead of pdflatex

  set latexFilename Game-Preview
  if {[exportGames current Latex [file join $::scidLogDir $latexFilename.tex]] != "0"} {
    update ; # todo - redraw . after progress window withdraws
    previewLatex $latexFilename {} .
  }
}

menu $m.exportfilter

$m add cascade -label ToolsExpFilter -menu $m.exportfilter
set helpMessage($m,[incr menuindex]) ToolsExpFilter

$m.exportfilter add command -label ToolsExpFilterPGN -command {exportGames filter PGN}
set helpMessage($m.exportfilter,0) ToolsExpFilterPGN

$m.exportfilter add command -label ToolsExpFilterHTML -command {exportGames filter HTML}
set helpMessage($m.exportfilter,1) ToolsExpFilterHTML

$m.exportfilter add command -label ToolsExpFilterHTMLJS -command {::html::exportCurrentFilter}
set helpMessage($m.exportfilter,2) ToolsExpFilterHTMLJS

$m.exportfilter add command -label ToolsExpFilterLaTeX -command {exportGames filter Latex}
set helpMessage($m.exportfilter,3) ToolsExpFilterLaTeX

$m.exportfilter add command -label ToolsExpFilterLatex -command {
  if {[sc_filter count] > 5} {
    tk_messageBox -type ok -icon info -title "Scid: Latex Preview" \
	-message {Latex Preview has a maximum of 5 games.}
  } else {
    set latexFilename Games-Preview
    if {[exportGames filter Latex [file join $::scidLogDir $latexFilename.tex]] != "0"} { 
      update
      previewLatex $latexFilename {} .
    }
  }
}

$m.exportfilter add command -label ToolsExpFilterGames -command openExportGList
set helpMessage($m.exportfilter,3) ToolsExpFilterGames

$m add separator
incr menuindex

$m add command -label ToolsImportOne -accelerator "control-I" -command importPgnGame
bind .main <Control-I> importPgnGame
set helpMessage($m,[incr menuindex]) ToolsImportOne

$m add command -label ToolsImportFile -command importPgnFile
set helpMessage($m,[incr menuindex]) ToolsImportFile

$m add separator
incr menuindex

$m add command -label ToolsScreenshot -command {boardToFile {} {}} -accelerator control-F12
bind .main <Control-Shift-F12> {boardToFile {} {}}
set helpMessage($m,[incr menuindex]) {Board Screenshot}


### Options menu:

set m .menu.options
set optMenus {windows entry ginfo startup export}
set optLabels {Windows Moves GInfo Startup Export}
set menuindex 0


foreach menu $optMenus label $optLabels {
  $m add cascade -label Options$label -menu $m.$menu
  set helpMessage($m,[incr menuindex]) Options$label
}

$m add command -label OptionsECO -command ::windows::eco::LoadFile
set helpMessage($m,[incr menuindex]) OptionsECO

$m add command -label OptionsSpell -command readSpellCheckFile
set helpMessage($m,[incr menuindex]) OptionsSpell

$m add command -label OptionsTacticsBasesDir -command setTacticsBasesDir
set helpMessage($m,[incr menuindex]) OptionsTacticsBasesDir

$m add command -label OptionsInformant -command configInformant
set helpMessage($m,[incr menuindex]) OptionsInformant

proc setTacticsBasesDir {} {
  global scidBasesDir
  set dir [tk_chooseDirectory -initialdir $scidBasesDir -mustexist 1 -title "Bases [tr Directory]"]
  if {$dir != ""} {
    set scidBasesDir $dir
  }
}

$m add separator
incr menuindex

if {$::docking::USE_DOCKING} {
  $m add command -label OptionsWindowsSaveLayout -command {
    if {[::docking::layout_save 1]} {
      set autoLoadLayout 1
      .menu.options invoke [tr OptionsSave]
    }
  }
}

$m add command -label OptionsSave -command {
  set optionF ""
  if {[catch {open [scidConfigFile options] w} optionF]} {
    tk_messageBox -title "Scid: Unable to write file" -type ok -icon warning \
        -message "Unable to write options file: [scidConfigFile options]\n$optionF"
  } else {
    puts $optionF "# Scid vs. PC (version $scidVersion) Options file"
    puts $optionF "# This file contains commands in the Tcl language format."
    puts $optionF "# If you edit this file, you must preserve valid its Tcl"
    puts $optionF "# format or it will not set your Scid options properly."
    puts $optionF ""

  foreach i {boardSize boardStyle language ::pgn::showColor 
    ::pgn::indentVars ::pgn::indentComments ::defaultBackground ::::defaultGraphBackgroud
    ::pgn::shortHeader ::pgn::boldMainLine ::pgn::stripMarks 
    ::pgn::symbolicNags ::pgn::moveNumberSpaces ::pgn::columnFormat ::pgn::showScrollbar
    myPlayerNames optionsAutoSave ::tree::mask::recentMask ::tree::mask::autoLoadMask ::tree::showBar ::tree::short ::tree::sortBest
    ecoFile suggestMoves showVarPopup showVarArrows 
    annotate(blunder) annotate(addTag) annotate(Moves) annotate(WithVars) annotate(WithScore) useAnalysisBook annotate(isVar) annotate(scoreType) annotate(cutoff) annotate(MissedMates)
    annotate(WantedDepth) annotate(Depth) autoplayDelay animateDelay boardCoords boardSTM 
    moveEntry(AutoExpand) moveEntry(Coord)
    translatePieces highlightLastMove highlightLastMoveWidth highlightLastMoveColor 
    askToReplaceMoves ::windows::switcher::icons ::windows::switcher::confirmCopy locale(numeric) 
    spellCheckFile ::splash::keepopen autoRaise autoIconify windowsDock autoLoadLayout
    exportFlags(comments) exportFlags(space) exportFlags(vars) exportFlags(indentc)
    exportFlags(indentv) exportFlags(column) exportFlags(htmldiag) exportFlags(utf8)
    ::windows::gamelist::findcase ::windows::gamelist::showButtons
    gameInfo(show) gameInfo(photos) gameInfo(wrap) gameInfo(showStatus) 
    gameInfo(fullComment) gameInfo(showMarks) gameInfo(showMenu) gameInfo(showTool) 
    gameInfo(showMaterial) gameInfo(showFEN) gameInfo(showButtons)
    analysis(mini) engines(F2) engines(F3) engines(F4) analysis(logMax) analysis(logName) analysis(maxPly) analysis(lowPriority)
    scidBasesDir 
    ::gbrowser::size 
    ::commenteditor::showBoard ::commenteditor::State(markColor) ::commenteditor::State(markType) boardfile_lite boardfile_dark 
    FilterMaxMoves FilterMinMoves FilterStepMoves FilterMaxElo FilterMinElo FilterStepElo 
    FilterMaxYear FilterMinYear FilterStepYear FilterGuessELO autoResizeBoard
    ::tools::graphs::filter::type  ::tools::graphs::absfilter::type ::tools::graphs::showpoints ::tools::graphs::showbar
    maintFlag photosMinimized bookmarks(gamehistory) playerInfoHistory
    glistSize glexport glistColOrder glistColWidth glistColAnchor addRatings(overwrite) addRatings(filter)
    blistColOrder blistColWidth blistColAnchor} {

      puts $optionF "set $i [list [set $i]]"

    }
    puts $optionF ""
    foreach i [lsort [array names winWidth]] {
      puts $optionF "set winWidth($i)  [expr $winWidth($i)]"
      puts $optionF "set winHeight($i) [expr $winHeight($i)]"
    }
    puts $optionF ""
    foreach i [lsort [array names winX]] {
      puts $optionF "set winX($i)  [expr $winX($i)]"
      puts $optionF "set winY($i)  [expr $winY($i)]"
    }
    puts $optionF ""
    puts $optionF "set analysisCommand [list $analysisCommand]"
    puts $optionF ""
    foreach i {lite dark highcolor bestcolor bgcolor maincolor varcolor rowcolor progcolor crosscolor scorecolor scorebarcolor switchercolor borderwidth \
          pgnColor(Header) pgnColor(Main) pgnColor(Var) \
          pgnColor(Nag) pgnColor(Comment) pgnColor(Background) \
          pgnColor(Current) pgnColor(NextMove) } {
      puts $optionF "set $i [list [set $i]]"
    }
    puts $optionF ""
    foreach i [lsort [array names optable]] {
      puts $optionF "set optable($i) [list $optable($i)]"
    }
    foreach i [lsort [array names startup]] {
      puts $optionF "set startup($i) [list $startup($i)]"
    }
    foreach i [lsort [array names toolbar]] {
      puts $optionF "set toolbar($i) [list $toolbar($i)]"
    }
    foreach i [lsort [array names twinSettings]] {
      puts $optionF "set twinSettings($i) [list $twinSettings($i)]"
    }
    foreach i [lsort [array names cleaner]] {
      puts $optionF "set cleaner($i) [list $cleaner($i)]"
    }
    foreach type {base html tex epd stm sso pgn report tablebase1 tablebase2 tablebase3 tablebase4} {
      puts $optionF "set initialDir($type) [list $initialDir($type)]"
    }
    puts $optionF ""
    foreach type {PGN HTML Latex} {
      puts $optionF "set exportStartFile($type) [list $exportStartFile($type)]"
      puts $optionF "set exportEndFile($type) [list $exportEndFile($type)]"
    }
    puts $optionF ""
    foreach type {engine viewer} {
      puts $optionF "set latexRendering($type) [list $latexRendering($type)]"
    }
    puts $optionF ""
    foreach i [lsort [array names informant]] {
      puts $optionF "set informant($i) [list $informant($i)]"
    }
    puts $optionF ""

    # save Window Docking layouts
    foreach slot {1 2 3 4 5} {
      puts $optionF "set ::docking::layout_list($slot) [list $::docking::layout_list($slot)]"
    }

    close $optionF
    set ::statusBar "Options were saved to: [scidConfigFile options]"
  }
}
set helpMessage($m,[incr menuindex]) OptionsSave

$m add checkbutton -label OptionsAutoSave -variable optionsAutoSave
set helpMessage($m,[incr menuindex]) OptionsAutoSave

menu $m.ginfo -tearoff 1
$m.ginfo add checkbutton -label GInfoHideNext \
    -variable gameInfo(hideNextMove) -offvalue 0 -onvalue 1 -command updateBoard
$m.ginfo add checkbutton -label GInfoShow \
    -variable boardSTM -offvalue 0 -onvalue 1 -command {::board::togglestm .main.board}
$m.ginfo add checkbutton -label GInfoFEN -variable gameInfo(showFEN) -offvalue 0 -onvalue 1 -command {
  checkGameInfoHeight
  if {!$::gameInfo(show)} {
    toggleGameInfo
  }
}
$m.ginfo add checkbutton -label GInfoMarks \
    -variable gameInfo(showMarks) -offvalue 0 -onvalue 1 -command updateBoard
$m.ginfo add checkbutton -label GInfoWrap \
    -variable gameInfo(wrap) -offvalue 0 -onvalue 1 -command updateBoard
$m.ginfo add checkbutton -label GInfoFullComment -variable gameInfo(fullComment) -offvalue 0 -onvalue 1 -command {
  if {!$::gameInfo(show)} {
    toggleGameInfo
  }
  updateBoard
}
$m.ginfo add checkbutton -label GInfoPhotos -variable gameInfo(photos) -offvalue 0 -onvalue 1 -command {
  updatePlayerPhotos -force
  if {!$::gameInfo(show)} {
    toggleGameInfo
  }
}
$m.ginfo add command -label GInfoMaterial -command toggleMat
$m.ginfo add command -label GInfoCoords -command toggleCoords

$m.ginfo add separator

menu $m.entry -tearoff 1
$m.entry add checkbutton -label OptionsMovesAsk \
    -variable askToReplaceMoves -offvalue 0 -onvalue 1
set helpMessage($m.entry,0) OptionsMovesAsk 

$m.entry add checkbutton -label OptionsMovesShowVarArrows \
    -variable showVarArrows -offvalue 0 -onvalue 1
set helpMessage($m.entry,10) OptionsMovesShowVarArrows

$m.entry add checkbutton -label OptionsShowVarPopup \
    -variable showVarPopup -offvalue 0 -onvalue 1
set helpMessage($m.entry,6) OptionsShowVarPopup

menu $m.entry.highlightlastmove -tearoff 1
$m.entry add cascade -label OptionsMovesHighlightLastMove -menu  $m.entry.highlightlastmove
$m.entry.highlightlastmove add checkbutton -label OptionsMovesHighlightLastMoveDisplay -variable ::highlightLastMove -command updateBoard
menu $m.entry.highlightlastmove.width
$m.entry.highlightlastmove add cascade -label OptionsMovesHighlightLastMoveWidth -menu $m.entry.highlightlastmove.width
foreach i {1 2 3 4 5} {
  $m.entry.highlightlastmove.width add radiobutton -label $i -value $i -variable ::highlightLastMoveWidth -command updateBoard
}
$m.entry.highlightlastmove add command -label OptionsMovesHighlightLastMoveColor -command {
  set col [ tk_chooseColor -initialcolor $::highlightLastMoveColor -title "Scid"]
  if { $col != "" } {
    set ::highlightLastMoveColor $col
    updateBoard
  }
}
set helpMessage($m.entry,9) OptionsMovesHighlightLast

$m.entry add cascade -label OptionsMovesAnimate -menu $m.entry.animate
menu $m.entry.animate -tearoff 1
foreach i {0 100 150 200 250 300 400 500 600 800 1000} {
  $m.entry.animate add radiobutton -label "$i ms" \
      -variable animateDelay -value $i
}
set helpMessage($m.entry,1) OptionsMovesAnimate

$m.entry add separator

$m.entry add command -label OptionsMovesDelay -command setAutoplayDelay
set helpMessage($m.entry,2) OptionsMovesDelay

$m.entry add checkbutton -label OptionsMovesCoord \
    -variable moveEntry(Coord) -offvalue 0 -onvalue 1
set helpMessage($m.entry,3) OptionsMovesCoord

$m.entry add checkbutton -label OptionsMovesKey \
    -variable moveEntry(AutoExpand) -offvalue 0 -onvalue 1
set helpMessage($m.entry,4) OptionsMovesKey

$m.entry add checkbutton -label OptionsMovesSuggest \
    -variable suggestMoves -offvalue 0 -onvalue 1
set helpMessage($m.entry,5) OptionsMovesSuggest

$m.entry add checkbutton -label OptionsMovesSpace \
    -variable ::pgn::moveNumberSpaces -offvalue 0 -onvalue 1
set helpMessage($m.entry,7) OptionsMovesSpace

$m.entry add checkbutton -label OptionsMovesTranslatePieces \
    -variable ::translatePieces -offvalue 0 -onvalue 1 -command setLanguage
set helpMessage($m.entry,8) OptionsMovesTranslatePieces

set m .menu.options.export
menu $m -tearoff -1
foreach format {PGN HTML Latex} {
  $m add command -label $format -underline 0 \
      -command "setExportText $format"
}

###############################
set m .menu.options.windows
menu $m -tearoff -1

$m add checkbutton -label OptionsWindowsDock -variable windowsDock -command {
  if {$::docking::USE_DOCKING != $windowsDock} {
    set answer [tk_messageBox -type yesno -icon info -title Scid -message "Changing Docking requires a restart.\nExit now ?"]
    if {$answer == "yes"} {
      ::file::Exit
    }
  }
}
set helpMessage($m,2) OptionsWindowsDock

if {$::docking::USE_DOCKING} {
  $m add checkbutton -label OptionsWindowsAutoLoadLayout -variable autoLoadLayout 
  set helpMessage($m,4) OptionsWindowsAutoLoadLayout

  $m add checkbutton -label OptionsWindowsAutoResize -variable ::autoResizeBoard -command {
     if {$::autoResizeBoard} {resizeMainBoard}
  }
  set helpMessage($m,4) OptionsWindowsAutoLoadLayout

  menu $m.savelayout
  menu $m.restorelayout
  foreach i {"1 (default)" "2 (custom)" "3 (analysis)" "4 (sa)" 5} slot {1 2 3 4 5} {
    $m.savelayout add command -label $i -command "::docking::layout_save $slot"
    $m.restorelayout add command -label $i -command "::docking::layout_restore $slot"
  }
  $m add cascade -label OptionsWindowsSaveLayout -menu $m.savelayout
  set helpMessage($m,5) OptionsWindowsSaveLayout
  $m add cascade -label OptionsWindowsRestoreLayout -menu $m.restorelayout
  set helpMessage($m,6) OptionsWindowsRestoreLayout
}

$m add separator

$m add checkbutton -label OptionsWindowsIconify -variable autoIconify
set helpMessage($m,0) OptionsWindowsIconify
$m add checkbutton -label OptionsWindowsRaise -variable autoRaise
set helpMessage($m,1) OptionsWindowsRaise
$m add command -label OptionsWindowsFullScreen -command toggleFullScreen -accelerator F11
set helpMessage($m,1) OptionsWindowsFullScreen

###############################
set langEncoding(E) utf-8

set m .menu.options.startup
menu $m -tearoff -1
$m add checkbutton -label HelpTip -variable startup(tip)
$m add checkbutton -label HelpStartup -variable ::splash::keepopen
$m add checkbutton -label WindowsGList -variable startup(gamelist)
$m add checkbutton -label WindowsPGN -variable startup(pgn)
$m add checkbutton -label WindowsStats -variable startup(stats)
$m add checkbutton -label WindowsTree -variable startup(tree)

### Help menu:
set menuindex 0
set m .menu.help
$m add command -label HelpContents -command {helpWindow Contents} -accelerator "F1"
set helpMessage($m,[incr menuindex]) HelpContents

$m add command -label HelpIndex -command {helpWindow Index}
set helpMessage($m,[incr menuindex]) HelpIndex

$m add separator
incr menuindex
$m add command -label HelpTip -command ::tip::show
set helpMessage($m,[incr menuindex]) HelpTip
$m add command -label HelpStartup -command raiseSplashWindow

proc raiseSplashWindow {} {
  # .splash window is never destroyed !!
  wm deiconify .splash
  raiseWin .splash
}
set helpMessage($m,[incr menuindex]) HelpStartup

$m add separator
incr menuindex

$m add command -label Changelog -command {helpWindow Changelog}
incr menuindex
$m  add command -label HelpAbout -command {helpWindow Author}
set helpMessage($m,[incr menuindex]) HelpAbout

bind .main <F1> toggleHelp
bind .main <Control-Key-quoteleft> {::file::SwitchToBase 9}
bind .main <Control-Tab> ::file::SwitchToNextBase
bind .main <Control-f> {if {!$tree(refresh)} {toggleRotateBoard}}

catch {
  if {$windowsOS} {
    bind .main <Shift-Tab> {::file::SwitchToNextBase -1} 
  } else {
    bind .main <ISO_Left_Tab> {::file::SwitchToNextBase -1} 
  }
}

##################################################

# updateMenuStates:
#   Update all the menus, rechecking which state each item should be in.

proc updateMenuStates {} {
  global totalBaseSlots windowsOS dot_w

  set ::currentSlot [sc_base current]
  set lang $::language
  set m .menu

  # Switch to database number $i
  set current [sc_base current]
  $m.file.switch delete 0 9
  
  for {set i 1} { $i <= $totalBaseSlots } { incr i } {
    set fname [file tail [sc_base filename $i]]

    # Only show menu items for open database slots
    if {$fname != {[empty]} } {
      $m.file.switch add command -command "set currentSlot $i" \
	  -label "$fname" -underline 5 -accelerator "control-$i" \
          -command "::file::SwitchToBase $i"
      bind .main <Control-Key-$i> "::file::SwitchToBase $i"

      if {$i == $current} {
	$m.file.switch entryconfig $i -state disabled
      }
    }
  }

  foreach i {Compact Delete} {
    $m.tools.utils entryconfig [tr ToolsMaint$i] -state disabled
  }
  foreach i {Editor Player Event Site Round} {
    $m.tools.utils entryconfig [tr ToolsMaintName$i] -state disabled
  }

  $m.file entryconfig [tr FileReadOnly] -state disabled

  # Recent Tree list (open base as Tree)
  ::recentFiles::treeshow .menu.file.recenttrees

  # Remove and reinsert the Recent files list and Exit command
  $m.file add separator
  set idx 12
  $m.file delete $idx end
  if {[::recentFiles::show $m.file] > 0} {
    $m.file add separator
  }

  # File menu entry states
  if {[sc_base inUse]} {
    set isReadOnly [sc_base isReadOnly]
    $m.file entryconfig [tr FileClose] -state normal
    if {! $isReadOnly} {
      $m.tools.utils entryconfig [tr ToolsMaintDelete] -state normal
      foreach i {Editor Player Event Site Round} {
        $m.tools.utils entryconfig [tr ToolsMaintName$i] -state normal
      }
      $m.file entryconfig [tr FileReadOnly] -state normal
      $m.game entryconfig [tr GameInfo] -state normal
    } else {
      $m.game entryconfig [tr GameInfo] -state disabled
    }

    # Load first/last/random buttons
    set filtercount [sc_filter count]
    if {$filtercount == 0} {
      set state disabled
    } else {
      set state normal
    }
    $m.game entryconfig [tr GameFirst] -state $state
    $m.game entryconfig [tr GameLast] -state $state
    $m.game entryconfig [tr GameRandom] -state $state
    $m.game entryconfig [tr GameNumber] -state $state
    $m.game entryconfig [tr GamePrev] -state $state
    $m.game entryconfig [tr GameNext] -state $state
    # .main.tb.gprev configure -state $state
    # .main.tb.gnext configure -state $state

    # Reload and Delete
    if {[sc_game number]} {
      set state normal
    } else {
      set state disabled
    }
    $m.game entryconfig [tr GameReload] -state $state
    if {$isReadOnly} {
      set state disabled
    }
    $m.game entryconfig [tr GameDelete] -state $state

    # Save add button
    if {$isReadOnly  ||  $::trialMode} {
      set state disabled
    } else {
      set state normal
    }
    $m.game entryconfig [tr GameAdd] -state $state

    # Save replace button
    if {[sc_game number] == 0  ||  $isReadOnly  ||  $::trialMode} {
      set state disabled
    } else {
      set state normal
    }
    $m.game entryconfig [tr GameReplace] -state $state

  } else {
    # Base is not in use
    $m.file entryconfig [tr FileClose] -state disabled

    # This gets called *occasionally* after closing tree and others (?)
    # but dont disable 'Info Browse List' as they never get re-enabled !
    foreach i {Replace Add First Prev Reload Next Last Random Number Info Browse List Delete} {
      $m.game entryconfig [tr Game$i] -state disabled
    }
    # .main.tb.gprev configure -state disabled
    # .main.tb.gnext configure -state disabled
  }

  if {[sc_base numGames] == 0} {
    $m.tools entryconfig [tr ToolsExpFilter] -state disabled
  } else {
    $m.tools entryconfig [tr ToolsExpFilter] -state normal
  }

  if {[baseIsCompactable]} {
    set state normal
  } else {
    set state disabled
  }
  $m.tools.utils entryconfig [tr ToolsMaintCompact] -state $state

  ::search::Config
  ::maint::Refresh
}


### Language menu support functions.

#   Reconfigures the main window menus. Called when the language is changed.

proc configMenuText {menu entry tag lang} {
  global menuLabel menuUnder
  if {[info exists menuLabel($lang,$tag)] && [info exists menuUnder($lang,$tag)]} {
    $menu entryconfig $entry -label $menuLabel($lang,$tag) \
        -underline $menuUnder($lang,$tag)
  } else {
    $menu entryconfig $entry -label $menuLabel(E,$tag) \
        -underline $menuUnder(E,$tag)
  }
}

proc setLanguageMenus {{lang ""}} {
  global menuLabel menuUnder oldLang

  if {$lang == ""} {set lang $::language}

  foreach tag {File Edit Game Search Windows Tools Options Help} {
    configMenuText .menu [tr $tag $oldLang] $tag $lang
  }

  foreach tag {New Open SavePgn OpenBaseAsTree OpenRecentBaseAsTree Close ReadOnly Switch Exit} {
    configMenuText .menu.file [tr File$tag $oldLang] File$tag $lang
  }

  foreach tag {PastePGN Setup CopyBoard CopyPGN PasteBoard Reset Copy Paste Add Delete First Main Trial Strip PasteVar Undo Redo} {
    configMenuText .menu.edit [tr Edit$tag $oldLang] Edit$tag $lang
  }
  foreach tag {Comments Vars Begin End} {
    configMenuText .menu.edit.strip [tr EditStrip$tag $oldLang] \
        EditStrip$tag $lang
  }
  foreach tag {Reset Negate End Material Moves Current Header Using} {
    configMenuText .menu.search [tr Search$tag $oldLang] Search$tag $lang
  }
  
  # These two items still appear in windows menu
  configMenuText .menu.search [tr WindowsPList $oldLang] WindowsPList $lang

  foreach tag {Replace Add New First Prev Reload Next Last Random Number Info Browse List Delete
    Deepest GotoMove Novelty} {
    configMenuText .menu.game [tr Game$tag $oldLang] Game$tag $lang
  }

  foreach tag {Gameinfo Comment GList PGN PList Maint ECO Stats Tree} {
    configMenuText .menu.windows [tr Windows$tag $oldLang] Windows$tag $lang
  }

  foreach tag {Analysis Maint FilterGraph AbsFilterGraph OpReport
    Rating Score ExpCurrent ExpFilter ImportOne ImportFile StartEngine1 StartEngine2
    PlayerReport Screenshot} {
    configMenuText .menu.tools [tr Tools$tag $oldLang] Tools$tag $lang
  }

  foreach tag {Win Compact Delete Twin Sort FixBase} {
    # Maintenance used to be in .menu.file but is now in .menu.tools
    configMenuText .menu.tools.utils [tr ToolsMaint$tag $oldLang] \
        ToolsMaint$tag $lang
  }
  foreach tag {Editor Player Event Site Round} {
    configMenuText .menu.tools.utils [tr ToolsMaintName$tag $oldLang] \
        ToolsMaintName$tag $lang
  }

  foreach tag {ToolsExpCurrentPGN ToolsExpCurrentHTML ToolsExpCurrentHTMLJS ToolsExpCurrentLaTeX} {
    configMenuText .menu.tools.exportcurrent [tr $tag $oldLang] $tag $lang
  }
  .menu.tools.exportcurrent entryconfig 4 -label "[tr ToolsExpCurrentLaTeX] ([tr OprepViewLaTeX])"

  foreach tag {ToolsExpFilterPGN ToolsExpFilterHTML ToolsExpFilterHTMLJS ToolsExpFilterLaTeX ToolsExpFilterGames} {
    configMenuText .menu.tools.exportfilter [tr $tag $oldLang] $tag $lang
  }
  .menu.tools.exportfilter entryconfig 4 -label "[tr ToolsExpFilterLaTeX] ([tr OprepViewLaTeX])"

  foreach tag {GInfo Moves Startup
    Windows Export ECO Spell TacticsBasesDir Informant Save AutoSave} {
    configMenuText .menu.options [tr Options$tag $oldLang] Options$tag $lang
  }

  foreach tag {HideNext Show Coords Material FEN Marks Wrap FullComment Photos } {
    configMenuText .menu.options.ginfo [tr GInfo$tag $oldLang] \
        GInfo$tag $lang
  }
  configMenuText .menu.options.entry [tr OptionsShowVarPopup $oldLang] OptionsShowVarPopup $lang
  # S.A. here's how to fix these f-ing menus. &&&
  foreach tag {Ask Animate Delay Suggest Key Coord Space TranslatePieces HighlightLastMove ShowVarArrows} {
    configMenuText .menu.options.entry [tr OptionsMoves$tag $oldLang] \
        OptionsMoves$tag $lang
  }

  foreach tag { Color Width Display } {
    configMenuText .menu.options.entry.highlightlastmove [tr OptionsMovesHighlightLastMove$tag $oldLang] OptionsMovesHighlightLastMove$tag $lang
  }
  foreach tag {HelpTip HelpStartup WindowsPGN WindowsTree \
        WindowsGList WindowsStats} {
    configMenuText .menu.options.startup [tr $tag $oldLang] $tag $lang
  }

  foreach tag {Iconify Raise Dock FullScreen} {
    configMenuText .menu.options.windows [tr OptionsWindows$tag $oldLang] \
        OptionsWindows$tag $lang
  }
  if {$::docking::USE_DOCKING} {
    foreach tag {AutoLoadLayout AutoResize SaveLayout RestoreLayout} {
      configMenuText .menu.options.windows [tr OptionsWindows$tag $oldLang] \
          OptionsWindows$tag $lang
    }
    # and the single save layout menu at the bottom
    configMenuText .menu.options [tr OptionsWindowsSaveLayout $oldLang] \
	OptionsWindowsSaveLayout $lang

  }

  foreach tag {Contents Index Tip Startup About} {
    configMenuText .menu.help [tr Help$tag $oldLang] Help$tag $lang
  }
  if {$::macOS} {
    configMenuText .menu.apple [tr HelpAbout $oldLang] HelpAbout $lang
  }

  # Should sort out what the Delete , Mark menus did.

  foreach tag {HideNext Show Coords Material FEN MenuBar ToolBar ButtonBar StatusBar} {
    configMenuText .main.gameInfo.menu [tr GInfo$tag $oldLang] GInfo$tag $lang
  }
  configMenuText .main.gameInfo.menu [tr OptionsMovesHighlightLastMove $oldLang] OptionsMovesHighlightLastMove $lang
  configMenuText .main.gameInfo.menu [tr WindowsGameinfo $oldLang] WindowsGameinfo $lang

  ::pgn::ConfigMenus
  ::windows::stats::ConfigMenus
  ::tree::ConfigMenus
  ::optable::ConfigMenus
  ::preport::ConfigMenus
  playerInfoConfigMenus

  updateGameinfo
  updateStatusBar
  # todo &&&  Update docking tab labels (setTitle)

  # Check for duplicate menu underline characters in this language
  if {0} {
    foreach m {file edit game search windows tools options help} {
      set list [checkMenuUnderline .menu.$m]
      if {[llength $list] > 0} {
        ::splash::add "Menu $m has duplicate underline letters: $list" error
      }
    }
  }

}

# checkMenuUnderline:
#  Given a menu widget, returns a list of all the underline
#  characters that appear more than once.
#
proc checkMenuUnderline {menu} {
  array set found {}
  set duplicates {}
  set last [$menu index last]
  for {set i [$menu cget -tearoff]} {$i <= $last} {incr i} {
    if {[string equal [$menu type $i] "separator"]} {
      continue
    }
    set char [string index [$menu entrycget $i -label] \
        [$menu entrycget $i -underline]]
    set char [string tolower $char]
    if {$char == ""} {
      continue
    }
    if {[info exists found($char)]} {
      lappend duplicates $char
    }
    set found($char) 1
  }
  return $duplicates
}

### Hmmm - Not possible to cancel this widget. TODO

proc configInformant {} {
  global informant

  set w .configInformant
  if {[winfo exists $w]} {
    destroy $w
  }

  toplevel $w
  wm state $w withdrawn
  wm title $w $::tr(ConfigureInformant)

  frame $w.main
  frame $w.buttons
  set row 0

  foreach i [lsort [array names informant]] {
    label $w.main.explanation$row -text [ ::tr "Informant[ string trim $i "\""]" ]
    label $w.main.label$row -text [string trim $i {"}]
    spinbox $w.main.value$row -textvariable informant($i) -width 4 -from 0.0 -to 9.9 -increment 0.1 \
        -validate all -vcmd {string is double %P} -justify center
    grid $w.main.explanation$row -row $row -column 0 -sticky w 
    grid $w.main.label$row -row $row -column 1 -sticky w -padx 5 -pady 3
    grid $w.main.value$row -row $row -column 2 -sticky w -padx 5 -pady 3
    incr row
  }

  dialogbutton $w.buttons.defaults -textvar ::tr(Defaults) -command resetInformants
  dialogbutton $w.buttons.help -textvar ::tr(Help) -command {helpWindow Analysis Annotating}
  dialogbutton $w.buttons.ok -text OK -command "destroy $w"
  pack $w.main $w.buttons -pady 5

  pack $w.buttons.defaults $w.buttons.help -side left -padx 5
  pack $w.buttons.ok  -side right -padx 5

  update
  placeWinOverParent $w .
  wm state $w normal
}

### End of file: menus.tcl

