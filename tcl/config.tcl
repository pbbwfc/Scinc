###
### config.tcl: Some embedded configuration for Scid

namespace eval ::config {}

if {$windowsOS} {
  set scidShareDir $scidExeDir
} elseif {$macOS} {
  set scidShareDir [file normalize [file join $scidExeDir "../Resources"]]
} else {
  if {![info exists scidShareDir]} {
    set scidShareDir [file normalize [file join $scidExeDir "../share/scid"]]
  }
}

if {![info exists scidBasesDir] || ![file isdirectory $scidBasesDir]} {
  set scidBasesDir [file nativename [file join $scidShareDir "bases"]]
}

# ecoFile: the ECO file for opening classification. Scid will try to load
# this first, and if that fails, it will try to load  "scid.eco" in the
# current directory.
if {$ecoFile == ""} {
  if {$windowsOS} {
    set ecoFile [file join $scidDataDir "scid.eco"]
  } else {
    set ecoFile [file join [file join $scidShareDir "data"] "scid.eco"]
  }
}

# Spell-checking file: default is "spelling.ssp".
if {![info exists spellCheckFile]} {
  if {$windowsOS} {
    set spellCheckFile [file join $scidDataDir "spelling.ssp"]
  } else {
    set spellCheckFile [file join $scidShareDir "spelling.ssp"]
  }
}

### Display directories

::splash::add "scidShareDir is $scidShareDir"

if {[file isdirectory $::scidBasesDir]} {
  ::splash::add "scidBasesDir is $scidBasesDir"
} else {
  ::splash::add "scidBasesDir $scidBasesDir not found!" error
}

### end of config.tcl

