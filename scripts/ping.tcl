########################################################
# Tcl Feita por MrBoss (MrBoss@BRASnet.org)            #
# A tcl de !ping HOST/IP foi desenvolvida para         #
# pingar o IP/Host pela maquina onde é rodado eggdrop  #  
# Além de mostrar a resposta do ping no canal qual o   #
# comando foi digitado.                                #
########################################################
########################################################
# COMANDO VIA CANAL:                                   #
#                                                      #
# !Ping 127.0.0.1  ou !Ping www.linksoft.com.br        #
#                                                      #
########################################################


###########################################################################################
# Não mude nada em baixo , pois a TCL poderá não funcionar corretamente !!!!!!!!!!!!!!!!!!#
###########################################################################################


bind pub - !ping pub_ping
bind pub - .ping pub_ping

proc pub_ping {nick uhost hand channel rest} {
if {[catch {exec ping [lindex $rest 0] -c 3} ping]} { set ping 0 } 
if {[lindex $ping 0] == "0"} { putserv "PRIVMSG $channel :Este Ip ([lindex $rest 0]) está off"; return 0 }
if {[lindex $ping 0] != "0"} {
putserv "PRIVMSG $channel :Resultado do ping [lindex $rest 0]:"
putserv "PRIVMSG $channel :[lindex $ping 0] [lindex $ping 1] [lindex $ping 2] [lindex $ping 3] [lindex $ping 4] [lindex $ping 5]"
putserv "PRIVMSG $channel :[lindex $ping 6] [lindex $ping 7] [lindex $ping 8] [lindex $ping 9] [lindex $ping 10] [lindex $ping 11] [lindex $ping 12] [lindex $ping 13]"
putserv "PRIVMSG $channel :[lindex $ping 14] [lindex $ping 15] [lindex $ping 16] [lindex $ping 17] [lindex $ping 18] [lindex $ping 19] [lindex $ping 20] [lindex $ping 21]"
putserv "PRIVMSG $channel :[lindex $ping 22] [lindex $ping 23] [lindex $ping 24] [lindex $ping 25] [lindex $ping 26] [lindex $ping 27] [lindex $ping 28] [lindex $ping 29]"
putserv "PRIVMSG $channel :[lindex $ping 30] [lindex $ping 31] [lindex $ping 32] [lindex $ping 33] [lindex $ping 34]"
putserv "PRIVMSG $channel :[lindex $ping 38] [lindex $ping 39] [lindex $ping 40] [lindex $ping 41] [lindex $ping 42] [lindex $ping 43]"
putserv "PRIVMSG $channel :[lindex $ping 44] [lindex $ping 45] [lindex $ping 46] [lindex $ping 47] [lindex $ping 48] [lindex $ping 49]"
return 0
 }
}


putlog "Tcl de !Ping IP/Host load"
