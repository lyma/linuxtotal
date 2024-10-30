## bot_identifyer04.tcl
## 
##  This is a bot identifyer script, for nickserv and chanserv security
##  notices. Besides this, it allows users (with flag +o) to identify the 
##  bot on the NickServ, using the command .nickserv at the party line.
##
##  For using it correctly, follow the instructions below and the other ones on
##  the script. 
##
##  First of all, you have to create a new user on your bot to identify the 
##  Identification Service Provider. It can have any handle, but it has to have
##  flags +fB. After this, you have to add the host mask for it, in the format
##  *!user@host.domain or *!*@host.domain (it depends on your network). In our 
##  case, the user got like the following example:
##
##     [01:11] <Buster_> .whois brasirc
##     [01:11] <bot> [01:11] #Buster_# whois brasirc
##     [01:11] <bot> HANDLE    PASS NOTES FLAGS           LAST
##     [01:11] <bot> brasirc   yes      0 fB              never (nowhere   )
##     [01:11] <bot>   HOSTS: *!services@brasirc.net
##
##  We are not responsible for anything that can happens to your bot. So,
##  good luck !!! :)
##
##  NOTE: this script works on BrasIRC Network, and it maybe will not work
##  correctly on another one.
##
##  Please, report bugs and suggestions to one of the following addresses:
##
##      GiZZmo <vivas@usa.net>
##      Buster_ <ejr@infonet.com.br>
##
##  Se voce nao entende ingles e quer um script traduzido ou uma ajuda com
##  os scripts que voce possui, mande um e-mail para nos.
##
##
############################ CONFIGURE THIS ################################
## Follow the instructions to configure this script correctly.

## This sets your channel name. Replace #lamest for your channel name.
set channame "#lamest"

## This sets your channel password. Replace xxxxxx for your channel password.
set chanpass "xxxxxx"

## This sets your nick password. Replace xxxxxxx for your nick password.
set nickpass "xxxxxxx"

## This sets your bot nick. Replace lamesbot for your bt nick.
set eggnick "lamestbot"

## You must comment the line below. :)
die (Are you sure you've configured the script correctly mother fucker?) ( bot_identifyer.tcl )


################# YOU DON'T NEED TO EDIT THE SCRIPT BELOW #################

bind notc B "*denied." chanserv_sux
bind notc B "*This nickname is registered and protected.*" nickserv_sux

proc chanserv_sux { nick uhost hand text } {
 global channame chanpass
  putserv "PRIVMSG chanserv :identify $channame $chanpass"
  putlog "Sending Identify to ChanServ"
}
   
proc nickserv_sux { nick uhost hand text } { 
 global botnick eggnick nickpass
  if { $botnick == "$eggnick" } {
   putserv "PRIVMSG nickserv :identify $nickpass"
   putlog "Sending Identify to NickServ"
  } else {
   putlog "$eggnick is using a nick owned by someone else"
  }
}

bind dcc o nickserv nickserv

proc nickserv { hand idx mascara } {
 global nickpass
 putserv "PRIVMSG nickserv :identify $nickpass"   
}

putlog "Loading Bot_Identifyer Script, v0.4 -- By GiZZmo <vivas@usa.net> and Buster_ <ejr@infonet.com.br>"

## SDG (Sergipe Development Group)
