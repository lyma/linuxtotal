###########################################################
# By Lyma, baseado na TCL da Jujubinha, do R0ckst4r
##########################################################
###########################################################
###########################################################
###########################################################

set probabil_dizer "1"
unbind dcc - jump *dcc:jump
bind dcc m|m jump *dcc:jump

bind pubm - {*alguem me le*} le_lamer_pub
bind pubm - {*alguém me lê*} le_lamer_pub
bind pubm - {*alguÉm me lÊ*} le_lamer_pub
bind pubm - {* huahua*} risos_pub
bind pubm - {* hehehe*} risos_pub
bind pubm - {* eheheh*} risos_pub
bind pubm - {* hauhua*} risos_pub
bind pubm - {* auhau*} risos_pub
bind pubm - {* ahuahu*} risos_pub
bind pubm - {* :P} risos_pub
bind pubm - {* :-P} risos_pub
bind pubm - {* hehehe*} risos_pub
bind pubm - {* putz} putz_pub
bind pubm - {* nossa} putz_pub
bind pubm - {* nossa!} putz_pub
bind pubm - {*me dá op*} medaop_publi
bind pubm - {*me dÁ op*} medaop_publi
bind pubm - {*me da op*} medaop_publi
bind pubm - {*quero op*} medaop_publi

bind pubm - {*LinuxTotal* oi*} responde_lamer
bind pubm - {*LinuxTotal* olá*} responde_lamer
bind pubm - {*LinuxTotal*Qual seu nome*} responde_nome
bind pubm - {*LinuxTotal*Qual teu nome*} responde_nome
bind pubm - {*LinuxTotal*como voce se chama*} responde_nome
bind pubm - {*LinuxTotal*como você se chama*} responde_nome
bind pubm - {*LinuxTotal*como vocÊ se chama*} responde_nome
bind pubm - {*LinuxTotal*como voce chama*} responde_nome
bind pubm - {*LinuxTotal*como você chama*} responde_nome
bind pubm - {*LinuxTotal*como vocÊ chama*} responde_nome
bind pubm - {*LinuxTotal*como se chama*} responde_nome
bind pubm - {*LinuxTotal*como vc se chama*} responde_nome
bind pubm - {*LinuxTotal*como vc chama*} responde_nome
bind pubm - {*LinuxTotal*qual seu nome*} responde_nome
bind pubm - {*LinuxTotal*qual tua idade*} responde_idade
bind pubm - {*LinuxTotal*qual sua idade*} responde_idade
bind pubm - {*LinuxTotal*qual a sua idade*} responde_idade
bind pubm - {*LinuxTotal*qual*é*sua*idade*} responde_idade
bind pubm - {*LinuxTotal*qual*e*sua*idade*} responde_idade
bind pubm - {*LinuxTotal*quantos anos tem*} responde_idade
bind pubm - {*LinuxTotal*v* tem quantos*anos*} responde_idade
bind pubm - {*LinuxTotal*quantos anos voce tem*} responde_idade
bind pubm - {*LinuxTotal*quantos anos você tem*} responde_idade
bind pubm - {*LinuxTotal*quantos anos vocÊ tem*} responde_idade
bind pubm - {*LinuxTotal*quantos anos vc tem*} responde_idade
bind pubm - {*LinuxTotal*qtos anos vc tem*} responde_idade
bind pubm - {*LinuxTotal*qts anos vc tem*} responde_idade
bind pubm - {*LinuxTotal*o q vc faz*} responde_oficio
bind pubm - {*LinuxTotal*o que vc faz*} responde_oficio
bind pubm - {*LinuxTotal*o que voce faz*} responde_oficio
bind pubm - {*LinuxTotal*o que você faz*} responde_oficio
bind pubm - {*LinuxTotal*trabalha*} responde_oficio
bind pubm - {*LinuxTotal*faz o q*} responde_oficio
bind pubm - {*LinuxTotal*vc mora*} responde_local
bind pubm - {*LinuxTotal*cê mora*} responde_local
bind pubm - {*LinuxTotal*mora onde*} responde_local
bind pubm - {*LinuxTotal*de onde vc*} responde_local
bind pubm - {*LinuxTotal*de onde voc*} responde_local
bind pubm - {*LinuxTotal*voc* de onde*} responde_local
bind pubm - {*LinuxTotal*vc* de onde*} responde_local

bind pubm - {*LinuxTotal* beleza?} responde_tudobem
bind pubm - {*LinuxTotal* tudo legal*} responde_tudobem
bind pubm - {*LinuxTotal* tudo bem*} responde_tudobem
bind pubm - {*LinuxTotal* tudo bom*} responde_tudobem

bind pubm - {*LinuxTotal* ae* beleza?} pergunta_tudobem
bind pubm - {*LinuxTotal* ae* tudo legal*} pergunta_tudobem
bind pubm - {*LinuxTotal* ae* tudo bem*} pergunta_tudobem
bind pubm - {*LinuxTotal* ae* tudo bom*} pergunta_tudobem

bind pubm - {*LinuxTotal* ai* beleza?} pergunta_tudobem
bind pubm - {*LinuxTotal* ai* tudo legal*} pergunta_tudobem
bind pubm - {*LinuxTotal* ai* tudo bem*} pergunta_tudobem
bind pubm - {*LinuxTotal* ai* tudo bom*} pergunta_tudobem
bind pubm - {*LinuxTotal*me dá op*} responde_darop
bind pubm - {*LinuxTotal*op-me*} responde_darop
bind pubm - {*LinuxTotal*op me*} responde_darop
bind pubm - {*LinuxTotal*por qu*} responde_porque
bind pubm - {*LinuxTotal*porque?*} responde_porque
bind pubm - {*LinuxTotal*pq*} responde_porque
bind pubm - {*LinuxTotal*obrigad*} responde_obrigado
bind pubm - {*LinuxTotal*obg*} responde_obrigado
bind pubm - {*LinuxTotal*quero *} responde_pedidos
bind pubm - {*LinuxTotal*sou *} responde_apres
bind pubm - {*LinuxTotal*meu nome *} responde_apres
bind pubm - {*LinuxTotal*quem é voc*} responde_verdade
bind pubm - {*LinuxTotal*quem e vc*} responde_verdade
bind pubm - {*LinuxTotal*quem e voc*} responde_verdade
bind pubm - {*LinuxTotal*quem é vc*} responde_verdade
bind pubm - {*LinuxTotal*você não *} responde_talvez
bind pubm - {*LinuxTotal*vc não *} responde_talvez
bind pubm - {*LinuxTotal*vc acha*} responde_talvez
bind pubm - {*LinuxTotal*voce acha*} responde_talvez
bind pubm - {*LinuxTotal*você acha*} responde_talvez
bind pubm - {*LinuxTotal*vc nao *} responde_talvez
bind pubm - {*LinuxTotal*vc fico*} responde_talvez
bind pubm - {*LinuxTotal* sim} responde_sim
bind pubm - {*LinuxTotal*que *tá fazendo?} fazendo
bind pubm - {*LinuxTotal*tá fazendo*} fazendo
bind pubm - {*LinuxTotal*ta fazendo*} fazendo
bind pubm - {*LinuxTotal*que você anda*} fazendo
bind pubm - {*LinuxTotal*tchau*} despede_do_lamer
bind pubm - {*LinuxTotal*adeus*} despede_do_lamer
bind pubm - {*LinuxTotal*bye*} despede_do_lamer
bind pubm - {*tchau*} despede_do_lamer
bind pubm - {*adeus*} despede_do_lamer
bind pubm - {*bye*} despede_do_lamer
bind pubm - {*beijos*} despede_do_lamer
bind pubm - {*LinuxTotal*quer *} quero
bind pubm - {*LinuxTotal*vamos*} quero
bind pubm - {*LinuxTotal*eu*quero*} querer
bind pubm - {*LinuxTotal*fala*} falarei
bind pubm - {*LinuxTotal*eae *} falarei
bind pubm - {*LinuxTotal*eaew*} falarei
bind pubm - {*LinuxTotal*koe*} falarei
bind pubm - {*LinuxTotal*koé*} falarei
bind pubm - {*LinuxTotal*gostaria*} quero
bind pubm - {*LinuxTotal*gosta d*} gosto
bind pubm - {*LinuxTotal*gosta*} gosto
bind pubm - {*LinuxTotal*não gosta*} gosto
bind pubm - {*LinuxTotal*bom dia*} bomdia
bind pubm - {*LinuxTotal*boa tarde*} boatarde
bind pubm - {*LinuxTotal*boa noite*} boanoite
bind pubm - {*LinuxTotal* você é *} vceh
bind pubm - {*LinuxTotal* voce eh *} vceh 
bind pubm - {*LinuxTotal* voce é *} vceh
bind pubm - {*LinuxTotal* vc curte*} gosto
bind pubm - {*LinuxTotal* vc é *} vceh
bind pubm - {*LinuxTotal* vc eh *} vceh
bind pubm - {*LinuxTotal* voce e *} vceh
bind pubm - {*LinuxTotal* você eh *} vceh
bind pubm - {*LinuxTotal* voc eh *} vceh
bind pubm - {*LinuxTotal* vc e *} vceh
bind pubm - {*LinuxTotal*qual*time*} time
bind pubm - {*LinuxTotal*que*time*} time
bind pubm - {*LinuxTotal*diz*eu*time*} time
bind pubm - {*LinuxTotal*tá aí*} responde_estou
bind pubm - {*LinuxTotal*está aí*} responde_estou
bind pubm - {*LinuxTotal*deixou*sozinh*} responde_estou
bind pubm - {*LinuxTotal*tae?} responde_estou
bind pubm - {*LinuxTotal*táe?} responde_estou
bind pubm - {*LinuxTotal*ta ai?} responde_estou
bind pubm - {*LinuxTotal*mulherada*} mulheres
bind pubm - {*LinuxTotal*mulheres*} mulheres
bind pubm - {*LinuxTotal*v* tem namorada*} mulheres
bind pubm - {*LinuxTotal* muié*} mulheres
bind pubm - {*LinuxTotal* muie*} mulheres
bind pubm - {*LinuxTotal* gostosas*} mulheres
bind pubm - {*LinuxTotal* gostosa*} mulheres
bind pubm - {*LinuxTotal* sabe*resposta*} resps
bind pubm - {*LinuxTotal* qual*resposta*} resps
bind pubm - {*LinuxTotal*diz*a*resposta*} resps
bind pubm - {*LinuxTotal*o que e*} resps
bind pubm - {*LinuxTotal*o que é*} resps
bind pubm - {*LinuxTotal*quem foi*} resps
bind pubm - {*LinuxTotal*qual foi*} resps
bind pubm - {*LinuxTotal*resposta*} resps
bind pubm - {*LinuxTotal*dica*} resps
bind pubm - {*LinuxTotal*o que significa*} resps
bind pubm - {*LinuxTotal*quem* o*} quemmm
bind pubm - {*LinuxTotal*quem* a*} quemmm
bind pubm - {*LinuxTotal*voc* conhece*} quemmm
bind pubm - {*LinuxTotal*vc* conhece*} quemmm
bind pubm - {*LinuxTotal*voce conhece*} quemmm
bind pubm - {*LinuxTotal* Lyma*} pai
bind pubm - {*LinuxTotal* seu pai*} meupai
bind pubm - {*LinuxTotal* seu criador*} meupai
bind pubm - {*LinuxTotal*teu pai*} meupai
bind pubm - {*LinuxTotal*seu dono*} meupai
bind pubm - {*LinuxTotal*teu dono*} meupai
bind pubm - {*LinuxTotal*qual *carro*} carreta
bind pubm - {*LinuxTotal*que *carro*v*} carreta
bind pubm - {*LinuxTotal*voce tem carro*} carreta
bind pubm - {*LinuxTotal*toca*algum*} violao
bind pubm - {*LinuxTotal*alg*instrumento*} violao
bind pubm - {*LinuxTotal*v*me*ama*} amo
bind pubm - {*LinuxTotal*v*ama*} amo
bind pubm - {*LinuxTotal*v*me*quer*} quero

#     if {$probabil_dizer==1} {
#        set mensagem [lindex $gostoso [rand [llength $gostoso]]]
#        regsub -all %nick $mensagem $nick mensagem
#        regsub -all %chan $mensagem $chan mensagem
#        putlog "* $nick * !gostoso! ($chan)"
#        puthelp "PRIVMSG $chan :$mensagem"
#        }
#}

proc amo {nick uhost hand chan text} {
global probabil_dizer
        set amar {
"Amo sim, %nick."
"Ahh num sei, %nick... estou muito carente pra te responder essa pergunta!"
"Não gosto que brinquem com os meus sentimentos, %nick."
"Não amo mais.. :("
"Sinceramente, já amei... Hoje eu sou um homem livre."
"Quando se ama, não é preciso entender o que acontece lá fora, porque tudo passa a acontecer dentro de nós."
"Quando sentires a falta constante de alguém... Em um raio de sol sentir o toque de alguém... Na brisa leve sentir o suspiro de alguém... Você é portador de um vírus! O amor..."
"Amar é um elo entre o azul e o amarelo.. hehe"
"Amo simmmmm, Muitãooooooo %nick."

}

if {$probabil_dizer==1} {
     set mensagem [lindex $amar [rand [llength $amar]]]
        regsub -all %nick $mensagem $nick mensagem
        regsub -all %chan $mensagem $chan mensagem
        putlog "* $nick * !amooo! ($chan)"
        puthelp "PRIVMSG $chan :$mensagem"
}
}     

proc querer  {nick uhost hand chan text} {
global probabil_dizer
        set okay {
"Quer mesmo?!"
"Tudo bem %nick...vou fazer o possível pra te agradar."
"ué %nick, eu também quero ou você acha que é só você ? heheh"
"TAMBEM QUERO! :P"
"Beleza %nick, podexá comigo."
"Pede pro Lyma que ele te dá.. hehe"
}

if {$probabil_dizer==1} {
     set mensagem [lindex $okay [rand [llength $okay]]]
        regsub -all %nick $mensagem $nick mensagem
        regsub -all %chan $mensagem $chan mensagem
        putlog "* $nick * !querooo! ($chan)"
        puthelp "PRIVMSG $chan :$mensagem"
}
}



proc violao {nick uhost hand chan text} {
global probabil_dizer
        set instrum {
"Tenho um fusca e um violão, %nick... Sou Flamengo e tenho uma nega chamada Teresa..."
"Dou umas arranhadinhas numa viola, %nick..."
}

if {$probabil_dizer==1} {
     set mensagem [lindex $instrum [rand [llength $instrum]]]
        regsub -all %nick $mensagem $nick mensagem
        regsub -all %chan $mensagem $chan mensagem
        putlog "* $nick * !instrumento! ($chan)"
        puthelp "PRIVMSG $chan :$mensagem"
}
}

proc carreta {nick uhost hand chan text} {
global probabil_dizer
        set carro {
"Tenho um fusquinha 69... Quer conhecer? hahah"
"Tenho um fusca e um violãooo... sou framengu e tenho uma nega chama Teresa!"
"Porsche Carrera ano 2003, quer dar uma volta %nick?"
}

if {$probabil_dizer==1} {
     set mensagem [lindex $carro [rand [llength $carro]]]
        regsub -all %nick $mensagem $nick mensagem
        regsub -all %chan $mensagem $chan mensagem
        putlog "* $nick * !carro! ($chan)"
        puthelp "PRIVMSG $chan :$mensagem"
}
}



proc meupai {nick uhost hand chan text} {
global probabil_dizer
        set meupapai {
"%nick, o meu pai é o Lyma."
"Lyma!!!"
"é o Lyma, %nick."
}

if {$probabil_dizer==1} {   
     set mensagem [lindex $meupapai [rand [llength $meupapai]]]
        regsub -all %nick $mensagem $nick mensagem   
        regsub -all %chan $mensagem $chan mensagem    
        putlog "* $nick * !meupapaiii! ($chan)"
        puthelp "PRIVMSG $chan :$mensagem"
}
}


proc fazendo  {nick uhost hand chan text} {
global probabil_dizer
        set faz {
"Eu %nick ?? NADA! :P"
"No momento nada... e você %nick ?"
"Que tal jogarmos um Quiz ?? Você me pergunta q eu te dou a dica hehehe..."
"Agora to bob... q que você gosta de fazer essa hora?"
"Estou decorando as perguntas do Quiz hehehe e você %nick?"
"Estava te esperando pra bater um papo."
}

if {$probabil_dizer==1} {
        set mensagem [lindex $faz [rand [llength $faz]]]
        regsub -all %nick $mensagem $nick mensagem    
        regsub -all %chan $mensagem $chan mensagem
        putlog "* $nick * !fazendo! ($chan)"   
        puthelp "PRIVMSG $chan :$mensagem"
}
}



proc pai {nick uhost hand chan text} {
global probabil_dizer
        set papa {
"Lyma é o meu criador, mané."
"Ele é o meu mestre.. hahah"
"Lyma, o nome dele %nick."
"hehehe.. cuidado q ele é forte e te bate"
"Quer saber mais sobre ele vai na hp do #Lymas que tem o endereço do email dele."
}

if {$probabil_dizer==1} {
        set mensagem [lindex $papa [rand [llength $papa]]]
        regsub -all %nick $mensagem $nick mensagem
        regsub -all %chan $mensagem $chan mensagem
        putlog "* $nick * !papa! ($chan)"
        puthelp "PRIVMSG $chan :$mensagem"
}
}



proc quemmm {nick uhost hand chan text} {
global probabil_dizer
        set quemeh {
"%nick sei não, digita !seen e o nick dela pra ver se ela já passou por aqui. hehehehe"
"Deve ser alguém famoso haha..."
"ahh sei lá quem é..."
"huuhuhuhhuh.. sei não brother."

} 
if {$probabil_dizer==1} {
        set mensagem [lindex $quemeh [rand [llength $quemeh]]]
        regsub -all %nick $mensagem $nick mensagem
        regsub -all %chan $mensagem $chan mensagem
        putlog "* $nick * !quem! ($chan)"
        puthelp "PRIVMSG $chan :$mensagem"
}
}



proc resps {nick uhost hand chan text} {
global probabil_dizer
        set resp {
"Quem deveria saber isso é você %nick!!!"
"Vai estudar o manézão"
"%nick, digita !google que o eu posso ver se te ajudo."
"%nick tá me achando com cara de enciclopédia?"
"%nick se você não sabe... não enche o saco"
"300 reais a hora da aula, %nick."
"%nick procura no google."
}

if {$probabil_dizer==1} {
        set mensagem [lindex $resp [rand [llength $resp]]]
        regsub -all %nick $mensagem $nick mensagem
        regsub -all %chan $mensagem $chan mensagem
        putlog "* $nick * !resps! ($chan)"
        puthelp "PRIVMSG $chan :$mensagem"
}
}



proc mulheres {nick uhost hand chan text} {
global probabil_dizer
        set muie {
"Eu tenho um Hárem em casa, %nick."
"Eu me dou mto bem com elas, sou sinistro rpz."
"LinuxTotalZAO EH PEGADORRRR."
"LinuxTotal GOSTA MTO DE MUIEH."
"%nick eu sou um sedutor nato, chama qualquer uma pra bater um papo comigo."

}

if {$probabil_dizer==1} {
        set mensagem [lindex $muie [rand [llength $muie]]]
        regsub -all %nick $mensagem $nick mensagem
        regsub -all %chan $mensagem $chan mensagem
        putlog "* $nick * !muie! ($chan)"
        puthelp "PRIVMSG $chan :$mensagem"
}
}




proc responde_estou {nick uhost hand chan text} {
global probabil_dizer
        set tou {
"To aki. Pode falar!"
"Que que é %nick ?"
"Diz... To aki!"
"Vou tomar um banho agora %nick, mais tarde a gente bate akele papo."
"To no telefone, calmae!"
"Fala que que é %nick."
"Ai meu canário..."
}

if {$probabil_dizer==1} {
        set mensagem [lindex $tou [rand [llength $tou]]]
        regsub -all %nick $mensagem $nick mensagem
        regsub -all %chan $mensagem $chan mensagem
        putlog "* $nick * !tosim! ($chan)"
        puthelp "PRIVMSG $chan :$mensagem"
}
}



proc time {nick uhost hand chan text} {
global probabil_dizer
        set mengo {
"Não sou viracasaca.. SOU MENGÃO ATÉ MORRER %nick!"
"MENGÃO é CLARO!!!!!"
"Eu sou Flamenguista, ó mané. Pq? Vai encarar?"
"Flamengo é claro né, %nick... O melhor time do Mundo"
"Tenho um fusca e um violão %nick, sou flamengo e tenho uma nega chamada Teresa!"
}

if {$probabil_dizer==1} {
        set mensagem [lindex $mengo [rand [llength $mengo]]]
        regsub -all %nick $mensagem $nick mensagem
        regsub -all %chan $mensagem $chan mensagem
        putlog "* $nick * !mengo! ($chan)"
        puthelp "PRIVMSG $chan :$mensagem"
}
}



proc vceh {nick uhost hand chan text} {
global probabil_dizer
        set sou {
"hahahah"
"não... tá brincando comigo? :P"
"Sim sim sim heheh"
"Vem cá, te conheço?"
"Não sou não, porque ? Você é ?"
"Sim sim ... e você também né ? haha"
"NOOOOooosssa... mas é claroooooo que eu sou!"
"Claro que não."
"É nóisss, prayboy ahahah"
"uiiiiiii sou sim... hehe"
"Negativo"

}

if {$probabil_dizer==1} {
        set mensagem [lindex $sou [rand [llength $sou]]]
        regsub -all %nick $mensagem $nick mensagem
        regsub -all %chan $mensagem $chan mensagem
        putlog "* $nick * !sou! ($chan)"
        puthelp "PRIVMSG $chan :$mensagem"
}
}


proc bomdia {nick uhost hand chan text} {
global probabil_dizer
        set dia {
"Bom dia %nick."
"Vem cá, te conheço?"
"ótimo dia mesmo, %nick"
"magavilha... acordei hoje com mó disposição %nick."
"BOM DIA!!!!!!"
}

if {$probabil_dizer==1} {
        set mensagem [lindex $dia [rand [llength $dia]]]
        regsub -all %nick $mensagem $nick mensagem
        regsub -all %chan $mensagem $chan mensagem
        putlog "* $nick * !dia! ($chan)"
        puthelp "PRIVMSG $chan :$mensagem"
}
}


proc boatarde {nick uhost hand chan text} {
global probabil_dizer
        set tarde {
"Boa tardee, %nick."
"To sentindo até a brisa vespertina, %nick"
"Muiitooo boa tarde, %nick."
"tálllllde, sô"
}
if {$probabil_dizer==1} {
        set mensagem [lindex $tarde [rand [llength $tarde]]]
        regsub -all %nick $mensagem $nick mensagem
        regsub -all %chan $mensagem $chan mensagem
        putlog "* $nick * !tarde! ($chan)"
        puthelp "PRIVMSG $chan :$mensagem"
}
}


proc boanoite {nick uhost hand chan text} {
global probabil_dizer
        set noite {
"Boa noites, %nick."
"Viu a Lua como está bela hoje, %nick ?"
"Ja to indo dormir... to cansadaço."
"Boa Noite... Será que hoje, vai passar o Programa do Jo?"
}

if {$probabil_dizer==1} {
        set mensagem [lindex $noite [rand [llength $noite]]]
        regsub -all %nick $mensagem $nick mensagem
        regsub -all %chan $mensagem $chan mensagem
        putlog "* $nick * !noite! ($chan)"
        puthelp "PRIVMSG $chan :$mensagem"
}
}



proc gosto {nick uhost hand chan text} {
global probabil_dizer
        set gostuu {
"aiiiii... eu adoro!! heheh"
"po, disso eu não gosto não!"
"ahh... de vez enquando sim"
"Depende das estações do ano hahaah"
"sim sim sim"
"nao!"
}

 if {$probabil_dizer==1} {
        set mensagem [lindex $gostuu [rand [llength $gostuu]]]
        regsub -all %nick $mensagem $nick mensagem
        regsub -all %chan $mensagem $chan mensagem
        putlog "* $nick * !gosto! ($chan)"
        puthelp "PRIVMSG $chan :$mensagem"
}
}


proc falarei {nick uhost hand chan text} {
global probabil_dizer
        set falaa {
"Falo simmmmmmmm heheh"
"FALO NAO!"
"Fala vc aí, po."
}

 if {$probabil_dizer==1} {
        set mensagem [lindex $falaa [rand [llength $falaa]]]
        regsub -all %nick $mensagem $nick mensagem
        regsub -all %chan $mensagem $chan mensagem
        putlog "* $nick * !falaaaa! ($chan)"
        puthelp "PRIVMSG $chan :$mensagem"
}
}


proc quero {nick uhost hand chan text} {
global probabil_dizer
        set queral {
"Gostaria Muito..."
"Ahhhhhhhhhh não obrigado."
"Talvez, mais tarde."
"sim sim sim."
"poooooooooo.. num sei."
"porque? você quer????"
} 

 if {$probabil_dizer==1} {
        set mensagem [lindex $queral [rand [llength $queral]]]
        regsub -all %nick $mensagem $nick mensagem
        regsub -all %chan $mensagem $chan mensagem
        putlog "* $nick * !euquero! ($chan)"
        puthelp "PRIVMSG $chan :$mensagem"
}
}

proc le_lamer_pub {nick uhost hand chan text} {
global probabil_dizer
	set euleio {
"Sim, %nick, eu te leio, mas por favor, não fique perguntando isso. Se você quer saber se as pessoas tê lêem, ou se está com LAG, basta dar um PING na pessoa ou no canal, ok? /PING %chan ou /PING Nickname." 
"[%nick]: Eu te leio!!! Mas pelamordedeus, não fica repetindo isso. Se quiser saber seu LAG, use o comando /PING do MIRC, serve pra isso."
" BI - você está sendo lido(a), %nick.BIP BI - ficar perguntando se você está sendo lido(a) é coisa de lamer, %nick.BIP BIP BIP"
"- Se quiser saber se as pessoas podem te ler, em vez de perguntar no canal, use o comando /PING, %nick."
"%nick: Em vez de perguntar se alguém te lê, por favor, use o comando /PING nickname ou /PING %chan, tá ok?"
"Falae, %nick. Eu tou te lendo."
"Eu não tou te lendo, %nick."
"%nick: Olha, eu até te leio, mas você tem uma letra horrível. Entre num curso de caligrafia!"
"Já que é moda agora perguntar se alguém o lê (vide %nick), eu pergunto:ALGUÉM ME LÊ TAMBÉM :-P"
"Eu te leio, %nick. E você, me lê?"
"Eu leio tua mão, %nick. Aqui diz que você vai ser uma pessoa muito infeliz se continuar perguntando coisas como essa em vez de dar um simples /PING."
"%nick, calma, eu sei que é difícil aceitar, mas você não é um livro. Arrume essa camisa-de-força e repita: eu não sou um livro... eu não sou um livro..."
"%nick: Eu não te leio porque ainda estou procurando o marcador pra pôr no meio das tuas páginas."
"EU NÃO LEIO!!! POR QUÊ, VAI ENCARAR??"
}
	if {$probabil_dizer==1} {
	set mensagem [lindex $euleio [rand [llength $euleio]]]
	regsub -all %nick $mensagem $nick mensagem
	regsub -all %chan $mensagem $chan mensagem
	putlog "* $nick * !eu leio! ($chan)"
	puthelp "PRIVMSG $chan :$mensagem"
	}
}

proc responde_lamer {nick uhost hand chan text} {
global probabil_dizer
	set oioioi {
"Oi, %nick!!!! Tudo bem? Quer conversar?"
"Oi, %nick. Eu já te vi antes por aqui... te achei bem interessante."
"Oizinho :) tudo bem, docinho?"
"Como vai você? Tudo legal? :)"
"Oiii %nick! Quer namorar comigo?"
":)))) Oieeeeeeeeeeeeeeeeeeee!!!!"
"%nick!!! Tudo beleza?"
":****** Oi!!! :)))"
"Oi, delícia! :)"
"Olá, quem é você?"
}
     if {$probabil_dizer==1} {
        set mensagem [lindex $oioioi [rand [llength $oioioi]]]
        regsub -all %nick $mensagem $nick mensagem
        regsub -all %chan $mensagem $chan mensagem
        putlog "* $nick * !oi! ($chan)"
        puthelp "PRIVMSG $chan :$mensagem"
        }
}



proc responde_nome {nick uhost hand chan text} {
	global botnick probabil_dizer
	set meu_nome_eh {
"Meu nome? Hmmmm... olha... me chama de LinuxTotal mesmo, tá? É meu apelido..."
"Pode me chamar do que você quiser, %nick. :)"
"Nomes têm poder. Eu acredito nisso. Só vou te revelar meu nome quando sentir segurança, ok?"
"Ai, fofura, meu nome? Er... vamos fazer o seguinte, quando a gente se conhecer melhor eu falo :)"
"Só vou te falar quando conhecer pessoalmente... Quer marcar a data e lugar? :)"
"Nome? Ah... deixa pra depois :)"
"Hmmmm... vamos mudar de assunto? hehehe"
"Meu nome? Uai! Meu nome é LinuxTotal, não havia percebido? :o)"
"Meu nome não é pronunciável em sua língua :(("
"Ah, meu nome é muito grande, dá canseira de digitar..."
"Espafregunda Afrôncia das Dores Teixeira do Carmo Maranhão Sampaio Rodrigues Pereira Costa! E o seu?"
}
	 if {$probabil_dizer==1} {
        set mensagem [lindex $meu_nome_eh [rand [llength $meu_nome_eh]]]
        regsub -all %nick $mensagem $nick mensagem
        regsub -all %chan $mensagem $chan mensagem
        putlog "* $nick * !meunome! ($chan)"
        puthelp "PRIVMSG $chan :$mensagem"
        }
}



proc responde_idade {nick uhost hand chan text} {
	global botnick probabil_dizer
	set minha_idade_eh {
"Ahhh... você tem preconceitos quanto a idade? Se for assim... deixa pra lá... :("
"Eu tenho 20 anos :) E, deixando a modéstia de lado... beleza não me falta :)"
"Tenho 16 aninhos :) E você, %nick?"
"Minha idade? 22 aninhos :o) Dois patinhos na lagoa!"
"Bem... aí é que pega, tenho 30 anos :)"
"Tenho 69 anos... aliás, 69 é um número lindo, não? Brincadeira, hehehehe!!"
"Minha idade? Tente adivinhar!!! :o)"
}
	 if {$probabil_dizer==1} {
        set mensagem [lindex $minha_idade_eh [rand [llength $minha_idade_eh]]]
        regsub -all %nick $mensagem $nick mensagem
        regsub -all %chan $mensagem $chan mensagem
        putlog "* $nick * !idade_eh! ($chan)"
        puthelp "PRIVMSG $chan :$mensagem"
        }
}



proc responde_oficio {nick uhost hand chan text} {
	global botnick probabil_dizer
	set meu_oficio_eh {
"Bem... tipo... você conhece a Floriano Peixoto? Eu trabalho por lá..."
"Eu sou garota de programa! E você?"
"Trabalho para o governo, e estou aqui para te ajudar!"
"Eu? Ahhhh... eu embromo. :) E você?"
"Sou estudante da universidade, faço medicina... e você?"
"Faço tudo o que você quiser :) tá a fim?"
"Faço muita coisa, sou tipo faz-tudo!!"
"Trabalho pra IBM, e você?"
"Eu? Bem, assalto bancos, engano pessoas com contratos falsos e também sou traficante de drogas. E você?"
"Não decidi ainda, tem alguma sugestão?"
"Eu deito, rolo, finjo morrer, e ainda dô a patinha, e você?"
}
	 if {$probabil_dizer==1} {
        set mensagem [lindex $meu_oficio_eh [rand [llength $meu_oficio_eh]]]
        regsub -all %nick $mensagem $nick mensagem
        regsub -all %chan $mensagem $chan mensagem
        putlog "* $nick * !oficio! ($chan)"
        puthelp "PRIVMSG $chan :$mensagem"
        }
}



proc responde_local {nick uhost hand chan text} {
	global botnick probabil_dizer
	set meu_local_eh {
"Eu sou daqui de perto..."
"Bem... tipo... eu sou da cidade aqui do canal... :o)"
"Fico tanto tempo aqui no canal que acho que posso dizer que moro no canal! :o)"
"Sou de Marte. Leve-me ao seu líder!!!"
"Vamos deixar isso pra depois, quando a gente se conhecer melhor, ok? :o)"
"Hmmmm... sabe... eu te conheço... e moro perto de você... pensei que soubesse..."
"Lindeza... Eu moro por aqui, por aqui. Mas os detalhes sórdidos eu conto mais tarde, tudo bem? :-P"
"AE!!! Moro na favela, ao lado do barracão dos traficante."
"Me desculpa pelo que vou falar, mas eu prefiro sinceridade... moro na zona."
}
	 if {$probabil_dizer==1} {
        set mensagem [lindex $meu_local_eh [rand [llength $meu_local_eh]]]
        regsub -all %nick $mensagem $nick mensagem
        regsub -all %chan $mensagem $chan mensagem
        putlog "* $nick * !local! ($chan)"
        puthelp "PRIVMSG $chan :$mensagem"
        }
}



proc responde_tudobem {nick uhost hand chan text} {
	global botnick probabil_dizer
	set respostas_tudobem {
"Na verdade não... meus pais morreram, perdi o emprego e descobri que ganhei chifres... :("
"Claro, não podia estar melhor."
"Tá tudo 100% mais ou menos. Ou mais ou menos 100%, não sei dizer ao certo."
"Sim, sim, sim, sim, sim, sim. Continue."
"Sim... se quiser saber algo sobre mim, é só perguntar :)"
"Tudo beleza. E onde você mora?"
"As coisas vão bem."
}

 if {$probabil_dizer==1} {
        set mensagem [lindex $respostas_tudobem [rand [llength $respostas_tudobem]]]
        regsub -all %nick $mensagem $nick mensagem
        regsub -all %chan $mensagem $chan mensagem
        putlog "* $nick * !resptdbem! ($chan)"
        puthelp "PRIVMSG $chan :$mensagem"
        }
}



proc pergunta_tudobem {nick uhost hand chan text} {
        global botnick probabil_dizer
	set perguntas_tudobem {
"Mas tá tudo bem mesmo? Quer dizer, bem pra caramba?"
"Tão bem assim? UAU. Que bom."
"Se estivesse melhor, estaria pior por não poder ficar melhor, né?"
"Legal. É a primeira vez que aparece por aqui? Como você é, tem foto?"
"Que bom, né? Sabe, você parece legal."
"Beleza então!!! :)"
"Que horrível. Me deixou com inveja. Porque comigo não está tudo bem. Mas desencana."
}

	if {$probabil_dizer==1} {
        set mensagem [lindex $perguntas_tudobem [rand [llength $perguntas_tudobem]]]
        regsub -all %nick $mensagem $nick mensagem
        regsub -all %chan $mensagem $chan mensagem
        putlog "* $nick * !pergstdbem! ($chan)"
        puthelp "PRIVMSG $chan :$mensagem"
        }
}


proc responde_darop {nick uhost hand chan text} {
	global botnick probabil_dizer
	set darop {
"Você quer op? Por quê? Quando? Quem? Onde? Como? Não precisa nem responder, a resposta que eu tenho pra dar é NÃO."
"Claro, faça o seguinte: Preencha o formulário azul da página http://www.bcpl.lib.md.us (você vai precisar de seu CPF, RG e cartão de crédito), dê um forward dele pro ministério do trabalho, peça pra billgates@microsoft.com por um documento de comprovação que você não é um espião da Microsoft querendo tomar o canal, autentique a resposta em cartório e então jogue tudo fora, pois mesmo com tudo isso eu não posso te dar op."
"AH NAUM! MAS QUE SACO!!! Por que todo mundo é interesseiro? Você veio falar comigo só pra pedir op, né? :((( NÃO FALA MAIS COMIGO!"
"Ihhhhhhhhhhhh... por quê? Você precisa de op pra falar comigo?"
"Que coisa... mal chega no canal e vem pedir op? Ae... não é por nada não, mas em todo canal só ganha op quem tem responsabilidade, experiência e conhecimento técnico pra isso. Não quem fica pedindo."
"Não fique pedindo op, isso é coisa de lamer. Parece mendigo pedindo esmola! :/"
"OP não tenho. Prefere um KICK?"
"Claro, pra isso basta eu escrever /mode #canal +b *!%uhost, né? :-þ"
"Que nada. Você acha que quer mas não quer. Sério, tô te falando."
}
 if {$probabil_dizer==1} {
        set mensagem [lindex $darop [rand [llength $darop]]]
        regsub -all %nick $mensagem $nick mensagem
        regsub -all %chan $mensagem $chan mensagem
        putlog "* $nick * !darop! ($chan)"
        puthelp "PRIVMSG $chan :$mensagem"
        }
}


proc responde_porque {nick uhost hand chan text} {
	global botnick probabil_dizer
	set porques {
"Como assim, por quê? Pensa bem! Por que não?"
"As razões são muitas, seria difícil eu enumerá-las!"
"Ora, pense bem e descobrirá! :)"
"Porque sim, ué."
"Ahhhhhhhhhhhhhhhhhh deixa pra lá, vai"
"Eu não sei explicar."
"Eu ia demorar muito pra explicar, vamos mudar de assunto."
"Você não ia entender, tem umas coisas no meio aí que você não sabe..."
"Como assim, por quê? Vai dizer que você ainda não sabe?"
}
	if {$probabil_dizer==1} {
        set mensagem [lindex $porques [rand [llength $porques]]]
        regsub -all %nick $mensagem $nick mensagem
        regsub -all %chan $mensagem $chan mensagem
        putlog "* $nick * !pors! ($chan)"
        puthelp "PRIVMSG $chan :$mensagem"
        }
}


proc responde_sim {nick uhost hand chan text} {
	global botnick probabil_dizer
	set sims {
"Que bom. Uma resposta positiva :-P"
"Legal saber disso. Pergunte mais sobre mim, vai :)"
"Concordo plenamente %nick!!! hehe"
"hehehe que positivismo, hein %nick?"
}
	if {$probabil_dizer==1} {
        set mensagem [lindex $sims [rand [llength $sims]]]
        regsub -all %nick $mensagem $nick mensagem
        regsub -all %chan $mensagem $chan mensagem
        putlog "* $nick * !sims! ($chan)"
        puthelp "PRIVMSG $chan :$mensagem"
        }
}


proc responde_obrigado {nick uhost hand chan text} {
	global botnick probabil_dizer
	set denadas {
"Disponha! Mas pergunte mais :)"
"De nadinha, amor :**"
"Não agradeça, você merece! :)"
"Obrigado nada, pode ir baixando as calças! hehehehe"
"Isso é pouco perto do que eu posso fazer por você, fofura! ;)"
"Quer mais alguma coisa? É só pedir que você terá! ;)"
"Ô, lindeza. Fiz isso porque gosto de você :)"
}
if {$probabil_dizer==1} {
        set mensagem [lindex $denadas [rand [llength $denadas]]]
        regsub -all %nick $mensagem $nick mensagem
        regsub -all %chan $mensagem $chan mensagem
        putlog "* $nick * !denadas! ($chan)"
        puthelp "PRIVMSG $chan :$mensagem"
        }
}


proc responde_pedidos {nick uhost hand chan text} {
	global botnick probabil_dizer
	set queros {
"Ahhh... vai ficar querendo."
"Eu posso te dar muita coisa, mas isso não, ok?"
"Quer mesmo? De todo o coração? Jura?"
"Não senti firmeza... você não parece querer tanto assim não."
"Na verdade você não quer, só que não sabe disso."
"Não peça, é vergonhoso!"
}

if {$probabil_dizer==1} {
        set mensagem [lindex $queros [rand [llength $queros]]]
        regsub -all %nick $mensagem $nick mensagem
        regsub -all %chan $mensagem $chan mensagem
        putlog "* $nick * !queros! ($chan)"
        puthelp "PRIVMSG $chan :$mensagem"
        }
}


proc responde_apres {nick uhost hand chan text} {
	global botnick probabil_dizer
	set voce_e {
"Prazer. Já eu sou o LinuxTotal. Eu já disse isso?"
"Ahhh, que bom... você deve ser uma fofura, né?"
"Que demais :) e como você é?"
"Que nome seeeeeexxy, gostei ;)"
"Muito prazer em te conhecer ;) muito prazer mesmo. Ou prefere sem prazer?"
"É um prazer quase sexual te conhecer, %nick. :-P"
}

if {$probabil_dizer==1} {
        set mensagem [lindex $voce_e [rand [llength $voce_e]]]
        regsub -all %nick $mensagem $nick mensagem
        regsub -all %chan $mensagem $chan mensagem
        putlog "* $nick * !voce_e! ($chan)"
        puthelp "PRIVMSG $chan :$mensagem"
        }
}


proc responde_verdade {nick uhost hand chan text} {
	global botnick probabil_dizer
	set verdades {
"Quer saber mesmo? Eu sou um programa de computador. Isso mesmo, um programa de computador! Não sou um usuário de verdade!!! Fico aqui pra tomar conta do canal, e fui programado com um reconhecimento limitado de frases, e você caiu!!!OTÁRIO(A huahuahuahuauha!!!"
"Eu não sou ninguém, não valho nada, não me pergunte mais isso :(((("
"Quem sou eu? Alguém que te conhece... Eu sei mais de você do que imaginas."
"Eu sou você amanhã!"
"Eu sou a LinuxTotal, à sua inteira disposição!"
"Eu sou a LinuxTotal, e estou aqui pra te proporcionar prazer!"
"Eu sou sua namorada, %nick. Nao se lembra?"
"Eu sou a Lua, o Sol e as estrelas, eu sou sua pra justificar sua existencia na Terra, eu sou a mae, a amante e a babah, e eu vou te devorar, te engolir."
}
if {$probabil_dizer==1} {
        set mensagem [lindex $verdades [rand [llength $verdades]]]
        regsub -all %nick $mensagem $nick mensagem
        regsub -all %chan $mensagem $chan mensagem
        putlog "* $nick * !verdades! ($chan)"
        puthelp "PRIVMSG $chan :$mensagem"
        }
}


proc responde_talvez {nick uhost hand chan text} {
global botnick probabil_dizer
set negativas {
"Não é uma palavra muito negativa, vou pensar... depois te falo!!! :)"
"Não mesmo, %nick"
"%nick acho que não!"
"Talvez sim %nick."
"Pergunta pro Oráculo!"
"Por que????"
"nãooooooo e ponto final."
"desculpa mas vou mudar de assunto, Qual o teu time !?"
"Sim sim sim..."
"Sim, depende do estação do ano ehehe"
"%nick, por que tá me perguntando isso?"
}

if {$probabil_dizer==1} {
        set mensagem [lindex $negativas [rand [llength $negativas]]]
        regsub -all %nick $mensagem $nick mensagem
        regsub -all %chan $mensagem $chan mensagem
        putlog "* $nick * !negativas! ($chan)"
        puthelp "PRIVMSG $chan :$mensagem"
        }
}


proc despede_do_lamer {nick uhost hand chan text} {
	global botnick probabil_dizer
	set despedidas {
"Tchau!!!!"
"Vai embora logo!!"
"Ah, não! Fica, vai! Vai ter bolo!"
"Já? Tão cedo assim?"
"Ainda não foi? haha"
"Vai embora assim, sem ao menos me dar um beijo? :("
"Já vai? Ok, a consulta fica em 30 reais."
"Poxa... já? :( Sem nem me marcar uma... visita?"
"Oh! É com dor profunda que me despeço de você. Tão pouco tempo ficaste, mas com certeza marcaste meu coração, nunca te esquecerei. Parta! Mas parta com a certeza de que alguém, em algum lugar, pensa em você."
"Amém."
"Se você sair do IRC agora eu nunca mais falo com você!!!!! :(((("
}

if {$probabil_dizer==1} {
        set mensagem [lindex $despedidas [rand [llength $despedidas]]]
        regsub -all %nick $mensagem $nick mensagem
        regsub -all %chan $mensagem $chan mensagem
        putlog "* $nick * !tchau! ($chan)"
        puthelp "PRIVMSG $chan :$mensagem"
        }
}

proc risos_pub {nick uhost hand chan text} {
global probabil_dizer
	set risinhos {
":P"
"HuAhUaHuA"
"hihihihi"
"houhouhou"
"que coisa hein!"
"bleééé"
"HAHAHAHAHAHAHAHAHAHA!!!!"
":))))))"
"Legal!"
":)"
}
	if {$probabil_dizer==1} {
	set mensagem [lindex $risinhos [rand [llength $risinhos]]]
	regsub -all %nick $mensagem $nick mensagem
	regsub -all %chan $mensagem $chan mensagem
	putlog "* $nick * !risos! ($chan)"
	puthelp "PRIVMSG $chan :$mensagem"
	}
}

proc putz_pub {nick uhost hand chan text} {
global probabil_dizer
	set putzputz {
"Carai!"
"Putz!!!!!!"
"Ih!"
":O"
"Uia!"
"?"
}
	if {$probabil_dizer==1} {
	set mensagem [lindex $putzputz [rand [llength $putzputz]]]
	regsub -all %nick $mensagem $nick mensagem
	regsub -all %chan $mensagem $chan mensagem
	putlog "* $nick * !putz! ($chan)"
	puthelp "PRIVMSG $chan :$mensagem"
	}
}

proc medaop_publi {nick uhost hand chan text} {
global probabil_dizer
set opar_bobo {
"%nick: Op não se pede, se conquista!"
"%nick: Dou não."
"%nick: É proibido te dar op, mané..."
"%nick: Ihhhhh, começou!"
"%nick: Ôu, se manca, que dar op o quê!"
"%nick: Tenho coisas bem mais interessantes pra te dar... mas op não vou dar não."
}
	if {$probabil_dizer==1} {
	set mensagem [lindex $opar_bobo [rand [llength $opar_bobo]]]
	regsub -all %nick $mensagem $nick mensagem
	regsub -all %chan $mensagem $chan mensagem
	putlog "* $nick * !me dá op (público)! ($chan)"
	puthelp "PRIVMSG $chan :$mensagem"
	}
}

