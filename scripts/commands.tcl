#################################################################################################
#                                                                                               #
# CodeNinja Help System v1.0                                                                    #
#                                                                                               #
# Please see README before using this script                                                    #
#                                                                                               #
# To report bugs and give feedback, email me at codeninja68@gmail.com                           #
#                                                                                               #
# For updates, check out http://bit.ly/codeninjacodes                                           #
#                                                                                               #
#################################################################################################

namespace eval codeninja {
    namespace eval helpsys {

        # Directory where help files are stored (make sure to end with a /)
        variable dir "/home/lyma/eggdrop/scripts/commands/"

        # Available topics and files associated with them
        # More info in README
        variable topics {
            main    main.help
            google  google.help
            seen    seen.help
        }

        # Public help command
        variable pcmd "-help"

        # Message help command
        variable mcmd "help"

        # Sending method (0 = PRIVMSG, 1 = NOTICE)
        variable smeth 1
    }
}

# END CONFIG

namespace eval codeninja {
    namespace eval helpsys {
        variable version "v1.0"
    }
}

namespace eval codeninja {
    namespace eval helpsys {
        proc helppub {nick uhost hand chan text} {
            helpmain $nick $text
        }

        proc helpmsg {nick uhost hand text} {
            helpmain $nick $text
        }

        proc helpmain {nick text} {
            set arg [lindex $text 0]
            if {[string trim $arg] == ""} { set arg "main"
            }
            # if no argument, use main
            set filesock ""
            foreach {topic file} ${codeninja::helpsys::topics} {
                if {[string match -nocase $topic $arg]} {
                    set filesock [open "${codeninja::helpsys::dir}$file" r]
                }
            }
            # decide which file to use
            if {$filesock == ""} { puthelp "[pmnot] $nick :No help available"
                return
            }
            # if no file is found, tell the user
            set cmdlist [split [read $filesock] "\n"]
            close $filesock
            # read file into $cmdlist
	    puthelp "[pmnot] $nick :Oi $nick, tudo bem?"
            foreach line $cmdlist {
                    if {$line != ""} { puthelp "[pmnot] $nick :$line" }
                    # output to user
            }
        }
        proc pmnot {} {
            if {${codeninja::helpsys::smeth}} { return "NOTICE" } else { return "PRIVMSG" }
        }
        proc diagnostics {} {
            regsub {\s{2,}} ${codeninja::helpsys::topics} { } codeninja::helpsys::topics
            if {![file isdirectory ${codeninja::helpsys::dir}]} { error "${codeninja::helpsys::dir} is not a valid directory" }
            if {![regexp {(.+)\/} ${codeninja::helpsys::dir}]} { error "Variable \"dir\" was not set correctly in help system" }
            foreach {topic file} ${codeninja::helpsys::topics} {
                if {![file exists ${codeninja::helpsys::dir}$file]} { error "${codeninja::helpsys::dir}$file does not exist" }
            }
        }
    }
}

codeninja::helpsys::diagnostics

bind pub - ${codeninja::helpsys::pcmd} codeninja::helpsys::helppub
bind pub - .help codeninja::helpsys::helppub
bind pub - !help codeninja::helpsys::helppub
bind pub - !ajuda codeninja::helpsys::helppub
bind pub - .ajuda codeninja::helpsys::helppub
bind pub - !comandos codeninja::helpsys::helppub
bind msg - ${codeninja::helpsys::mcmd} codeninja::helpsys::helpmsg

putlog "CodeNinja Help System ${codeninja::helpsys::version} loaded"
