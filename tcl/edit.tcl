### start of edit.tcl

set defaultFen {rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1}

proc fenErrorDialog {{msg {}}} {

  if {[winfo exists .setup]} {
    tk_messageBox -icon info -type ok -title "Scid: Invalid FEN" -message $msg -parent .setup
  } else {
    tk_messageBox -icon info -type ok -title "Scid: Invalid FEN" -message $msg 
  }

}

#   Copies the FEN of the current position to the text clipboard.

proc copyFEN {} {
  setClipboard [sc_pos fen]
}

#   Bypasses the board setup window and tries to paste the current
#   text selection as the setup position, producing a message box
#   if the selection does not appear to be a valid FEN string.

proc pasteFEN {} {

  set confirm [::game::ConfirmDiscard]
  if {$confirm == 2} { return }
  if {$confirm == 0} {
    sc_game save [sc_game number]
  }
  setTrialMode 0
  sc_game new

  set fenStr ""
  if {[catch {set fenStr [selection get -selection PRIMARY]} ]} {
    catch {set fenStr [selection get -selection CLIPBOARD]}
  }
  catch {set fenStr [validateFEN [string trim $fenStr]]}

  set fenExplanation {FEN is the standard representation of a chess position, for example:
"rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1"}

  if {$fenStr == ""} {
    set msg "The clipboard is empty.\n\n$fenExplanation"
    fenErrorDialog $msg
    return
  }

  ### If FEN is prepended "FEN:", then strip this prefix
  if {[string match -nocase fen:* $fenStr]} {
    set fenStr [string trim [string range $fenStr 4 end]]
  }

  ### If the first arg ends with "/", then remove it, Some people seem to use this
  # (eg 8/3r1pk1/2p1b3/2p3p1/2P1P3/1P3P2/4KB2/2R5/ B)
  # and lowercase the second letter.
  catch {
      set s1 [lindex $fenStr 0]
      if {[string index $s1 end] == "/"} { 
        set s1 [string range $s1 0 end-1]
      }
      set s2 [lindex $fenStr 1]
      if {$s2 == "W" || $s2 == "B"} {
	set s2 [string tolower $s2]
      }
      set fenStr "$s1 $s2 [lrange $fenStr 2 end]"
  }

  if {[catch {sc_game startBoard $fenStr}]} {
    # Trim length, and remove newlines for error dialog
    if {[string length $fenStr] > 80} {
      set fenStr [string range $fenStr 0 80]
      append fenStr "..."
    }
    set fenStr [string map {\n { }} $fenStr]

    set msg "\"$fenStr\"\nis not a valid FEN.\n\n $fenExplanation"

    fenErrorDialog $msg
  }
  updateBoard -pgn
}

proc copyGame {} {
  catch {sc_clipbase copy}
  set ::glistFlipped([sc_info clipbase]) [::board::isFlipped .main.board] 
  # is updateBoard needed ?
  updateBoard
  ::windows::switcher::Refresh
}


proc pasteGame {} {
  sc_clipbase paste
  if {$::glistFlipped([sc_info clipbase]) != [::board::isFlipped .main.board]} { 
    ::board::flip .main.board
  } 
  updateBoard -pgn

  ## Seems best
  # refreshWindows
  ::tools::graphs::score::Refresh
}

set setupBd {}
set setupFen {}

# The way setupFen is passed here needs fixing

proc validateFEN {fen} {
  global setupFen

  #### Do a sanity check on castling
  #    .. helpful because illegal FENs crash engines
  #    and we could also have one for enpassant

  set c [lindex $fen 2]

  set setupFen $fen

  # todo: missing space (K1w) breaks it
  # r1rbn1k1/2qb1p1p/3p4/5P2/p1p5/P1B4P/1PBQ1PP1/R3R1K1w KQkq - 0 1

  if {![validatePiece r 1 1]} {set c [string map {q {}} $c]}
  if {![validatePiece k 5 1]} {set c [string map {k {} q {}} $c]}
  if {![validatePiece r 8 1]} {set c [string map {k {}} $c]}

  if {![validatePiece R 1 8]} {set c [string map {Q {}} $c]}
  if {![validatePiece K 5 8]} {set c [string map {K {} Q {}} $c]}
  if {![validatePiece R 8 8]} {set c [string map {K {}} $c]}

  if {$c == {}} {set c {-}}
  return "[lreplace $fen 2 2 $c]"
}


proc validatePiece {piece x y} {
  global setupFen

  # Look at setupFen and return true if "$piece" resides at square x,y. S.A

  set pos [expr $x - 1 + ($y - 1) * 8]
  set square 0
  set i      0
  while {1} {
    # process each char in the Fen until we get past where the piece should be

    set ch [string index $setupFen $i]
    incr i

    if {$ch == {/}}		{continue}
    if {$square == $pos}	{return [expr {$ch == $piece}]}
    if {$square  > $pos}	{return 0}
    if {[string is digit -strict $ch]} {
      incr square $ch
    } else {
      incr square
    }
  }
}

### end of edit.tcl
