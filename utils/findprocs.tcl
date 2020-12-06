set f [open "../rel/bin/scinc.gui"]
set data [read $f]
close $f

set procs {}

foreach {dummy procName} [regexp -all -inline -line {^[\s:]*proc (\S+)} $data] {
#    puts "Found procedure $procName"
    lappend procs $procName
    #set cnt [llength [regexp -all -inline (?=$procName) $data]]
    set i1 [string first $procName $data]
    #puts $i1
    set i2 [string first $procName $data [ incr i1 ]]
    #puts $i2
    if {$i2 < 0} { 
        puts "$procName is no good"
    } else {
        set i3 [string first $procName $data [ incr i2 ]]
        #if {$i3 < 0} { puts "$procName may be no good" } 
    }
}
