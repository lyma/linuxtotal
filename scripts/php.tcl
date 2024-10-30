# Max results.
set php_config(max) 5

# Deny channels
set php_config(deny_chans) {
}

# Version
set php_config(ver) 0.1

# Include packages.
package require http
package require ncgi
package require tls

# Public command.
#bind pub - !php pub_php_docs
bind pub - !php pub_php_function
bind pub - !function pub_php_function
bind pub - !func pub_php_function

# Search into the php docs.
proc pub_php_docs { nick uhost hand chan arg } {
	global php_config

	if { [lsearch [string tolower $php_config(deny_chans)] [string tolower $chan]] != "-1" } {
    	return 0
  	}

  	if { $arg == "" } {
    	putserv "NOTICE $nick :Uso: !php <pesquisa>"
	    return 0
  	}

	search_docs $chan $nick $arg
}

# Search into online docs.
proc search_docs { chan nick search } {
	global php_config

	regsub -all " " $search "+" search

#	set url http://www.php.net/results.php?q=$search&p=manual&l=en
	set url https://secure.php.net/results.php?q=$search&p=manual&l=en

	set tidy [process_request $url]

	set results ""
	set links_counter 1

	foreach row $tidy {
		if { [regexp -nocase -- {No pages matched your query} $row] } {
			putserv "PRIVMSG $chan :No results"
			return 0
		}

		if { [regexp -nocase -- {<p class="result"} $row] } {
			regexp -nocase -- {.*<a href="(.*)".*>(.*)</a>.*} $row all link text

			if { [string match -nocase "http://www.php.net*" $link] } {
				set link [ncgi::decode $link]
			} else {
				set link "http://www.php.net[ncgi::decode $link]"
			}

			set text [striptags [ncgi::decode $text]]
			set title [format "%u. %s" $links_counter $text]

			if { $links_counter == 1  } {
				set public_result "$title <$link>";
			}

			set results "$results $title <$link>;"

			if { $links_counter == $php_config(max) } {
				break;
			}
			
			incr links_counter
		}
	}

	putserv "PRIVMSG $chan :$nick: $public_result"

	if { $links_counter > 1 } {
		putserv "NOTICE $nick :$results"
	}
}

# Look for a php function.
proc pub_php_function { nick uhost hand chan arg } {
	global php_config

	if { [lsearch [string tolower $php_config(deny_chans)] [string tolower $chan]] != "-1" } {
    	return 0
  	}

  	if { $arg == "" } {
    	putserv "NOTICE $nick :Uso: !func <nome da funcao>"
	    return 0
  	}

	process_function_page $chan $nick $arg
}

# Process function page.
proc process_function_page { chan nick search } {
	regsub -all " " $search "+" search

    set search [string map {_ -} $search]
	set url "https://secure.php.net/manual/pt_BR/function.${search}.php"

	set tidy [process_request $url]

	# Flag to know if we have something here.
	set name ""

	foreach row $tidy {
		# Get function name.
		if { [regexp -nocase -- {<h1 class=\"refname\">.*} $row] } {
			regexp -nocase -- {<h1 class=\"refname\">(.*)</h1>} $row all name
		}

		# Get version info.
		if { [regexp -nocase -- {<p class=\"verinfo\">.*} $row] } {
			regexp -nocase -- {<p class=\"verinfo\">(.*)</p>} $row all version
		}

		# Get description.
		if { [regexp -nocase -- {<span class=\"dc-title\">.*} $row] } {
			regexp -nocase -- {<span class=\"dc-title\">(.*)</span>} $row all desc 
			set desc [striptags $desc]
		}

		# Get params.
		if { [regexp -nocase -- {<div class=\"methodsynopsis dc-description\">.*} $row] } {
			regexp -nocase -- {<div class=\"methodsynopsis dc-description\">(.*)} $row all params
			set params [striptags $params]
		}
	}

	if { $name != "" } {
		putserv "PRIVMSG $chan :\002$name\002 $version - $desc"
		putserv "PRIVMSG $chan :$params"
	} else {
		putserv "PRIVMSG $chan :Não encontrei esta funcao no manual online"
	}
}

proc striptags str {
    regsub -all {<.*?>} $str {} str
    return $str
}

# Process request
proc process_request { url } {
    http::config -useragent "Mozilla/4.75 (X11; U; Linux 2.2.17; i586; Nav)"
    http::register https 443 tls::socket
    set token [http::geturl $url -timeout 30000]
    set status [http::status $token]
    set data [http::data $token]
    http::cleanup $token
    http::unregister https
    #putlog "Status ${status}"
    #putlog "answer ${data}"

    # Create a temp file with the page html string.
    set tmp_file "/tmp/tmp_file_[expr int(rand()*32768)].[pid].xml"
    set fp [open $tmp_file "w"]
    puts -nonewline $fp $data
    close $fp

    # Parse the temp file with tity.
    set tidy_command "tidy -qm -w 0 -utf8 -asxml $tmp_file 2> /dev/null"
    catch { eval exec $tidy_command }

    set fp [open $tmp_file "r"]
    set tidy [read $fp]
    set tidy [split $tidy "\n"]
    catch { close $fp }

#    file delete -force -- $tmp_file

    return $tidy
}


# Loaded.
putlog "php.tcl \[ OK \]"
putlog "Lyma PHP Scraper $php_config(ver) - Loaded"
