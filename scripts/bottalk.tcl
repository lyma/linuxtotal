## BotTalker-1.3.tcl By nTaxa.
##
## You can access for some features of that script by saying "!talkz" on
## channel.
## bla bla bla... more comments here.

## Configure your BOT sensor here:
bind pub - "$nick:" pub_dotalkz
bind pub - "$nick" pub_dotalkz
bind pub - "$nick," pub_dotalkz
bind pub - "$nick;" pub_dotalkz

set TalkzSaveTimer	1

set TalkzChanArray {
  {#Sex}
}

set talkz_datafile "scripts/BotTalker_data.tcl"

catch {source $talkz_datafile}

## Here you can modify/add default BOT answers:
if {[info exists TalkzStrArray] != "1"} {
  set TalkzStrArray {
    {Пиво есть ?}
    {Как дИла ?}
    {Скок годиков тебе ?}
    {Познакомимся поближе ?}
    {Слушай маму !}
    {Ай, отвали .}
    {Пшол вон халоп.}
  }
}


proc FixStr {str} {
  regsub -all {\[} $str {(} out1
  regsub -all {\]} $out1 {)} out2
  return $out2
}

proc FixStrReg {str} {
  regsub -all {\?} $str {\\?} out1
  regsub -all {\*} $out1 {\\*} out2
  regsub -all {\(} $out2 {\\(} out3
  regsub -all {\)} $out3 {\\)} out4
  return $out4
}

##                                Important !
## Here you can define nicks that be ignored, if you have other BOTs on channel
## add him here !
set bad_nicks {
  {SERGO}
}

## Here you can define list of "Bad Words" all strings that have that words 
## be ignored.
## some for example:
set ignore_words "fuck shit ass dick asshole penis jopa suka ebanij ebal dura sraku ebanii durochka pizdec pizda huj huy mudak mudilo pohuy zhopa sraka"

## max_list - variable for !talkz list this define number of strings
## that be viewed to someone who asks for list.
set max_list 20

##
## Oki. here configuration part if script done. Please do not edit anything
## below.
##

#set botnick "MS-DOS"

###############################################################################
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
 # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
###############################################################################

proc putchan {channel msg} { putserv "PRIVMSG $channel :$msg" }
proc putnot {nick msg} { putserv "NOTICE $nick :$msg" }

proc pub_dotalkz {nick uhost hand chan rest} {
  global botnick
  global TalkzStrArray
  global ignore_words
  global bad_nicks

  set str [lrange $rest 0 end]

  if {$nick == $botnick} {
    return 0
  }

  if {$str == ""} {
    putchan $chan "$nick: What? Чего надо ?"
    return 0
  }

  foreach i $bad_nicks {
   if {[string match [string tolower $nick] [string tolower $i]]} {
     return 0
   }
  }

  foreach i $ignore_words {
    foreach j [join $rest] {
      if {[string match [string tolower $j] [string tolower $i]]} {
        return 0
      }
    }
  }
  set nrword [rand [llength $str]]
  set nword [lrange $str $nrword $nrword]

  set ntalk [lsearch -regexp $TalkzStrArray ".*[FixStrReg $nword].*"]

  if { ($ntalk > 0) && ([rand 10] > 5) } {
    putchan $chan "$nick: [lindex $TalkzStrArray $ntalk]"
  } else {
    putchan $chan "$nick: [lindex $TalkzStrArray [expr [rand [llength $TalkzStrArray]]]]"
  }
  lappend TalkzStrArray [FixStr $str]
}

proc do_save_talkz {} {
  global max_list
  global talkz_datafile
  global TalkzStrArray
  global TalkzSaveTimer

  set fd [open $talkz_datafile w]
  puts $fd "# Bot Talker Data file."
  puts $fd "set TalkzStrArray {"
  for {set n 0} {$n < [llength $TalkzStrArray]} {incr n} {
    if { [lsearch $TalkzStrArray [lindex $TalkzStrArray $n]] >= $n } {
      puts $fd " {[lindex $TalkzStrArray $n]}"
    }
  }
  puts $fd "}"
  close $fd

  timer $TalkzSaveTimer do_save_talkz
}

proc pub_talkz {nick uhost hand chan rest} {
  global max_list
  global talkz_datafile
  global TalkzStrArray

  set what [lindex $rest 0]

  append uzer $nick "!" $uhost

  set who [finduser $uzer]

  if {$what == ""} {
    putnot $nick ".---====(  BotTalker v1.3 By \002nTaxa\002  )====---."
    putnot $nick "| \002!talkz\002 <Action>  - TalkzScript control       |"
    putnot $nick "|        Where Action:                         |"
    putnot $nick "|            list \[<i> \[<n>\]\] - dump all       |"
    putnot $nick "|                 collected stringz.           |"
    putnot $nick "|                 i - from                     |"
    putnot $nick "|                 n - number of messages for   |"
    putnot $nick "|                     display                  |"
    putnot $nick "|             save  - Save all collected       |"
    putnot $nick "|                     messages.                |"
    putnot $nick "+----------------------------------------------+"
    putnot $nick "    Total stringz collected: [llength $TalkzStrArray]."
    return 0
  }

# "list" command
  if {$what == "list"} {
    set from [lindex $rest 1]
    set nview [lindex $rest 2]

    if {$from > [llength $TalkzStrArray]} {
      putnot $nick "I have only [llength $TalkzStrArray] stringz!"
      return 0
    }

  if {$from == ""} {
    set from 0
  }

  if {$nview == ""} {
    set nview $max_list
  }

  putnot $nick ".---====(  BotTalker v1.3 By \002nTaxa\002  )====---."
  putnot $nick "| BotTalker Report:"
  putnot $nick "|   I have [llength $TalkzStrArray] stringz collected."
  putnot $nick "| Now I show to you $nview records, begins from $from."
  putnot $nick "|   ($from - [expr ($from + $nview)])"
  putnot $nick "`-------------------------\\"

  for {set n 0} {$n < $nview} {incr n} {
    putnot $nick "[expr ($from + $n + 1)]: [lindex $TalkzStrArray [expr ($from + $n)]]"
    if {[expr ($from + $n + 1)] >= [llength $TalkzStrArray]} {
      return 0
    }
  }
  return 0
  }
# end if "list"

  if {$what == "save"} {
    putnot $nick "Saving..."
    putnot $nick "$n messages saved."
    do_save_talkz
#   you might want comment next string.
#   putserv "PRIVMSG #Sex :nTaxa RuleZ!"
    return 0
  }
# end of "save"
}
bind pub o "!talkz"  pub_talkz

proc do_doebis {} {
  global TalkzStrArray
  global TalkzChanArray
  global ntalk

  for {set n 0} {$n < [llength $TalkzChanArray]} {incr n} {
    set chan [lindex $TalkzChanArray $n]
    set ToUser "[lindex [chanlist $chan] [rand [llength [chanlist $chan]]]]"
    if {[matchattr $ToUser +b $chan] == 0} {
       putchan $chan "$ToUser: [lindex $TalkzStrArray [expr [rand [llength $TalkzStrArray]]]]"
    }
  }
#  timer 5 do_doebis
}

proc join_talkz {nick uhost hand chan} {
  global TalkzStrArray
  global TalkzChanArray

#  putchan $chan "$nick: [lindex $TalkzStrArray [expr [rand [llength $TalkzStrArray]]]]"
}

bind join - * join_talkz

if {![info exists do_doebis_active]} {
  timer 5 do_doebis
  set do_doebis_active 1
}
if {![info exists do_save_talkz_active]} {
  timer 1 do_save_talkz
  set do_save_talkz_active 1
}

putlog "Talkz Script loaded. ([llength $TalkzStrArray] messages loaded)"
##
##                         Thats all folks ! ;P
##
