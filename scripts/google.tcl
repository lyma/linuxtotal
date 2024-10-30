############################################################################################## 
##  ## Advanced Google.tcl for eggdrop by CP1832 & Arnold_X-P network: DALnet irc.dal.net channel #tcls 
############################################################################################## 
##  ## To use this script you must set channel flag +google (ie .chanset #chan +google) ##  ## 
############################################################################################## 
## This tcl requires the following in eggdrop: http.tcl json.tcl ## 
## This tcl requires the following in windrop: http.tcl json.tcl tls.tcl ## 

package require http 
package require json 

if {[catch {package require tls}]} { 
set httpsSupport false 
} else { 
set httpsSupport true 
} 
set url "www.googleapis.com/customsearch/v1?" 
if {$httpsSupport} { 
#::http::register https 443 [list ::tls::socket -request 1 -require 0 -ssl3 1 -tls1 1] 
::http::register https 443 [list ::tls::socket -request 1 -require 0 -tls1 1] 

set url https://$url 
} else { set url http://$url } 

############################################################################################## 
##  ##                             Start Setup.                                         ##  ## 
############################################################################################## 
## Change the country code between the "" below to change the language of your results.     ## 
set googlectry "pt" 
## Change the number between the "" below to change the number of results returned.         ## 
set googlemax "3" 
set googlelogo "Google:"

## google api ## 
 set API_KEY "AIzaSyB1kizkhTv3t1ntsZAlRQqdZCp-qX85e0o" 
 set SEARCH_ID "partner-pub-7761078419057030:8184736158" 
############################################################################################## 
##  ##                           End Setup.                                              ## ## 
############################################################################################## 
set gaucho "CP1832 & Arnold_X-P" 
set googlever "v3.0.0" 
setudef flag google 

proc googleweb {nick host hand chan type search} { 
      global googlectry googlemax API_KEY SEARCH_ID url googlelogo 
      if {![channel get $chan google]} {return} 
      if {$search == ""} {puthelp "PRIVMSG $chan :Error: <search> is empty"; return 1 } 
      if {$type == ""} { 
   set googleurl $url[::http::formatQuery alt json key $API_KEY cx $SEARCH_ID hl $googlectry q $search] 
   } else { set googleurl $url[::http::formatQuery alt json key $API_KEY cx $SEARCH_ID hl $googlectry q $search searchType $type] } 
      if {[catch {http::geturl $googleurl -timeout 5000} sockerr]} { 
         puthelp "privmsg $chan :$googlelogo Timeout connecting to Google: $sockerr" 
         return 1 
      } elseif {[http::ncode $sockerr] != 200 || ![string equal [http::status $sockerr] "ok"]} { 
         puthelp "privmsg $chan :$googlelogo Error querying Google: [http::ncode $sockerr] -> [http::status $sockerr]" 
         http::cleanup $sockerr 
         return 1 
      } else { 
         set data [http::data $sockerr] 
         http::cleanup $sockerr 
         set json [ ::json::json2dict $data ] 
         for { set i 0 } { $i < $googlemax } { incr i } { 
            set title "" 
            set link "" 
            catch { set title [ dict get [ lindex [ dict get $json items ] $i ] title ] } 
            catch { set link  [ dict get [ lindex [ dict get $json items ] $i ] link ] } 
            set index [ expr $i + 1 ] 
            if {[string length $title] && [string length $link]} { 
               putserv "PRIVMSG $chan :$googlelogo $title $link" 
            } else { 
               puthelp "PRIVMSG $chan :$googlelogo found no results" 
            } 
         } 
      } 
return 1 
} 

proc google {nick host hand chan text} { googleweb $nick $host $hand $chan "" $text} 
proc gimage {nick host hand chan text} { googleweb $nick $host $hand $chan image $text} 

foreach bind [binds google] {lassign $bind type flags mask num proc; unbind $type $flags $mask $proc} 
foreach bind [binds gimage] {lassign $bind type flags mask num proc; unbind $type $flags $mask $proc} 

bind pub - .google google 
bind pub - !google google 
bind pub - .gimage gimage 
bind pub - !gimage gimage 

putlog "Google search loaded by $gaucho $googlever"