##############################################################
# Horoscopo.tcl by Lyma v. 1.0                      22/08/2017
# Horoscopo diario obtido do site do Terra
##############################################################

bind pub - !horoscopo signo

proc signo {nick uhost hand chan text} {
set conexion [socket www.terra.com.br 80]
set flag 0
set encabezado "Host: www.terra.com.br\r\nUser-Agent: Mozilla/5.0 (X11; U; FreeBSD i386; es-ES; rv:1.7.12) Gecko/20050919 Firefox/1.0.7"
set text [string toupper $text]
if {$text == ""} {
set flag 2 
putserv "NOTICE $nick :Uso: !horoscopo <signo>, Ej: !horoscopo aries"}
if {$text == "ARIES"} {
set flag 1
puts $conexion "GET /astrologia/include/pop_h_diario.cfm?signo=2\r\n$encabezado"}
if {$text == "TAURO"} {
set flag 1 
puts $conexion "GET /astrologia/include/pop_h_diario.cfm?signo=19\r\n$encabezado"}
if {$text == "GEMINIS"} {
set flag 1
puts $conexion "GET /astrologia/include/pop_h_diario.cfm?signo=7\r\n$encabezado"}
if {$text == "CANCER"} {
set flag 1
puts $conexion "GET /astrologia/include/pop_h_diario.cfm?signo=3\r\n$encabezado"}
if {$text == "LEO"} {
set flag 1
puts $conexion "GET /astrologia/include/pop_h_diario.cfm?signo=10\r\n$encabezado"}
if {$text == "VIRGO"} {
set flag 1
puts $conexion "GET /astrologia/include/pop_h_diario.cfm?signo=22\r\n$encabezado"}
if {$text == "LIBRA"} {
set flag 1
puts $conexion "GET /astrologia/include/pop_h_diario.cfm?signo=11\r\n$encabezado"}
if {$text == "ESCORPION"} {
set flag 1
puts $conexion "GET /astrologia/include/pop_h_diario.cfm?signo=6\r\n$encabezado"}
if {$text == "SAGITARIO"} {
set flag 1
puts $conexion "GET /astrologia/include/pop_h_diario.cfm?signo=16\r\n$encabezado"}
if {$text == "CAPRICORNIO"} {
set flag 1
puts $conexion "GET /astrologia/include/pop_h_diario.cfm?signo=4\r\n$encabezado"}
if {$text == "ACUARIO"} {
set flag 1
puts $conexion "GET /astrologia/include/pop_h_diario.cfm?signo=1\r\n$encabezado"}
if {$text == "PISCIS"} {
set flag 1
puts $conexion "GET /astrologia/include/pop_h_diario.cfm?signo=14\r\n$encabezado"}



if {$flag == 1} { 

flush $conexion

while {![eof $conexion]} {
 set linea [gets $conexion] 
if {[string match "*txt_2_10*" $linea]} {
   set largo [string length $linea]
   set inicio [string range $linea 0 [expr $largo-13]]
   set final [string range $linea 31 [expr $largo-13]]
   set horoscopo [string map [list "</b>" "."] $final]
   set horoscopo [string map [list "<br>" " "] $horoscopo]
   putserv "privmsg $chan :$text: $horoscopo"
   }
 }
} 
if {$flag == 0} { 
putserv "NOTICE $nick :SIGNO INVALIDO!. Validos: aries, touro, gemios, cancer, leao, vigem, libra, escorpiao, sagitario, capricornio, aquarios e peixes."
}
}
putlog "Horoscopo.tcl by lyma v. 1.0 <lyma@lymas.com.br>"
