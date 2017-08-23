############################
# TCL - Horoscopo do Terra
# By Lyma - 22/08/2017
############################
package require http
package require tls
bind pub - !signo pub:horoscopo
bind pub - !horoscopo pub:horoscopo


#set signos_validos {
#}
#if { [lsearch [string tolower $signos_validos] [string tolower $arg]] != "-1" } {
#	return 0
#}


proc pub:horoscopo {nick host hand chan arg} {
    set arg [lindex $arg 0]
    if {$arg==""} {
	putserv "PRIVMSG $chan :$nick tente usar desta forma: !signo <signo>"
	return 0
    }
    set search [string map {_ -} $arg]
    set pagina "https://www.terra.com.br/vida-e-estilo/horoscopo/signos/$search/"
    set http [http::config -useragent mozilla]
    set http [http::geturl $pagina -timeout [expr 1000 * 10]]
    set html [http::data $http]
    http::cleanup $http ;
    regexp -nocase -- {<div id="article_embed_text1" class="horoscope_text">(.*?)</p>} $html horoscopo
    regsub -all "<.*?>" $horoscopo "" horoscopo
    set horoscopo [join $horoscopo " "]
    putserv "PRIVMSG $nick :[string toupper $arg]: $horoscopo - Fonte: $pagina"
}
putlog "horoscopo.tcl \[ OK \]"
putlog "Lyma Horoscopo 1.0 - Loaded"