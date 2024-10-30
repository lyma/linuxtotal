# <speechles> Scripts are like children. They grow up to take on lives of their own, along with all their parents time.

# <speechles> Bots are so obedient, like a wife you never need to slap.
 
#---------------------------------------------------------------#
# UNOFFICIAL incith:google                              v2.2a   #
#                                              July 2nd, 2014   #
# performs various methods of Google searches                   #
# tested on:                                                    #
#   eggdrop v1.6.17 GNU/LINUX with Tcl 8.4                      #
#   windrop v1.6.17 CYGWIN_NT with Tcl 8.4 (http.tcl v2.5)      #
#    - http.tcl included - Linux/BSD users should NOT need this #
#                                                               #
# UNOFFICIAL NEWS:............................................. #
#                                                               #
#  As of 1.9, I (speechless) have rewritten and added several   #
#    pieces of this script, fixing various regexp's, adding     #
#    more search sites to it, added a gamefaqs upcoming list    #
#    for gamers and much much more.                             #
#  See the Egghelp forum for info or help you may need:         #
#      http://forum.egghelp.org/viewtopic.php?t=13586           #
#                                                               #
# OFFICIAL NEWS:............................................... #
#                                                               #
#  As of v1.6, I (madwoota) have taken over the development of  #
#    incith:google. If you have any feature req's, bugs, ideas, #
#    etc, please dont hesitate to send them to me.              #
#  My contact details have replaced incith's, but if you wish   #
#    to approach him directly about anything, I can point you   #
#    in the right direction.                                    #
#  See the Egghelp forum for inciths handover and all the latest#
#    info on this script:                                       #
#    http://forum.egghelp.org/viewtopic.php?t=10175             #
#                                                               #
# BASIC USAGE GUIDE:........................................... #
#                                                               #
#   .chanset #channel +google                                   #
#   !google [.google.country.code] [define:|spell:]             #
#      <search terms> <1+1> <1 cm in ft> <patent ##>            #
#      <weather city|zip> <??? airport>                         #
#   !images [.google.country.code] <search terms>               #
#   !groups [.google.country.code] <search terms>               #
#   !news [.google.country.code] <search terms>                 #
#   !local [.google.country.code] <what> near <where>           #
#   !book [.google.country.code] <search terms>                 #
#   !video [.google.country.code] <search terms>                #
#   !fight <word(s) one> vs <word(s) two>                       #
#   !youtube [.google.country.code] <search terms>              #
#   !trans region@region <text>                                 #
#   !gamespot <search terms>                                    #
#   !gamefaqs <system> in <region>                              #
#   !blog [.google.country.code] <search terms>                 #
#   !ebay [.ebay.country.code] <search terms>                   #
#   !ebayfight <word(s) one> vs <word(s) two>                   #
#   !wikipedia [.2-digit-country-code] <search terms>[#subtag]  #
#   !wikimedia [.www.wikisite.org[/wiki]] <search terms>[#subtag]
#   !locate <ip or hostmask>                                    #
#   !review <gamename> [@ <system>]                             #
#   !torrent <search terms>                                     #
#   !best <system>                                              #
#   !worst <system>                                             #
#   !dailymotion <search terms>                                 #
#   !ign <search terms>                                         #
#   !myspace <search terms>                                     #
#   !trends [.google.country.code] <YYYY-MM-DD>                 #
#                                                               #
# CHANGE LOG:.................................................. #
#                                                               #
#   1.0: first public release                                   #
#   1.1: improved bolding of search terms, compatible with      #
#          chopped descriptions                                 #
#        supports 'define: <word>' lookups                      #
#        supports calculator. !google (4+3) * 2 - 1             #
#          - converts, too. !google 1 lb in ounces              #
#        image lookups coded, !images <search>                  #
#        'spell: word1 word2' function added                    #
#          - don't rely on this, it's not a dictionary, just    #
#            corrects common typos.                             #
#        flood protection added                                 #
#   1.2: will wrap long lines (yay, a worthy solution!)         #
#        allowed setting of the seperator instead of a ' | ' by #
#          default. If you set this to "\n" then you will get   #
#          each result on a seperate line instead of one line   #
#        will display 'did you mean' if no results              #
#        [PDF] links will be parsed/included now                #
#        fixed a bug when no data was returned from google such #
#          is the case when you search for """"""""""""""""""   #
#   1.3: can return results in multiple languages now           #
#        fixed quotes being displayed around links              #
#        private messages support added (for /msg !google)      #
#        video.google.com seems impossible, Google Video Viewer #
#          is required to view videos, etc                      #
#   1.4: bit of a different output, easier to click links now   #
#        local lookups coded, use !local <what> near <where>    #
#        seems google does currency the same way my exchange    #
#          script does (!g 1 usd in cad)                        #
#        "patent ##" will return the patent link if it exists   #
#        bugfix in private messages                             #
#        sorry to all whom grabbed a borked copy on egghelp :-( #
#   1.5: fix for !local returning html on 'Unverified listing's #
#        "madwoota" has supplied some nice code updates for us! #
#          - "answer" matches, eg: !g population of japan       #
#            - !g <upc code>                                    #
#          - google groups (!gg), google news (!gn)             #
#          - movie: review lookups                              #
#          - area code lookups (!g 780)                         #
#          - print.google lookups (!gp !print)                  #
#        reworked binds to fix horrible bug allowing !g !gi !gp #
#        case insensitive binds (!gi, !GI, !gI, !Gi, etc)       #
#    .1: fix for double triggers/bad binds                      #
#    .2: fix involving "can't read link" error                  #
#-madwoota:                                                     #
#   1.6: fixed google search returning no results               #
#        fixed descriptions getting cut short on 'answers'      #
#        fixed bug where some urls were returned invalid        #
#        fixed google local searches returning no results       #
#        fixed google print searches returning invalid links    #
#        changed 'did you means' to get returned first as well  #
#        added google weather: !g weather <city|zip>            #
#          - note: US weather only (blame google!)              #
#        added travel info, eg: !g sfo airport | !g united 134  #
#        added config option to send output via /notice         #
#        added initial attempt at parsing google video (!gv)    #
#   1.7: added option to force all replies as private (req)     #
#        fixed google groups returning no results               #
#        fixed define: errors on no results                     #
#        fixed google print errors on no results/typos          #
#        fixed movie review errors on no results/typos          #
#        fixed some characters not usable as command_chars on   #
#          one of regular eggdrop or windrop+cygwin             #
#        fixed occasional weird response for travel info        #
#        updated requirements to http package 2.4               #
#        loads of other internal changes                        #
#    .1: fixed search parameters not being parsed correctly     #
#          - resulted in some bogus "no results" replies.       #
#    .2: fixed main google search returning rubbish results     #
#          - google changed their source again                  #
#        changed all methods of parsing the search results to   #
#          *hopefully* cope better with any source changes      #
#        changed output queue to stop the bot from flooding     #
#    .3: fixed some urls being returned with spaces in them     #
#          - makes them unusable in most irc clients            #
#        fixed google groups occasionally returning junk due to #
#          changes in 1.7.2 (will revisit this later)           #
#   1.8: added option to turn on "safe" searches                #
#        added channel user level filtering option (+v/+o only) #
#        added google fight! !gf or !fight <blah> vs <blah>     #
#         - inspired by www.googlefight.com                     #
#        added ability to do any custom mode to descs & links   #
#         - i'll just apologise now for this one :)             #
#        removed variable underline_links (superseded by above) #
#        removed use of 'tcl_endOfWord' to stop windrop breaking#
#        fixed excess %20's appearing in some results           #
#        fixed "translate this" only returns ? (i think)        #
#        stopped local from returning ad spam on first result   #
#-speechless                                                    #
#   1.9: updated various regexp's and regsub's in almost all    #
#          procs to fix non functioning html parsing.           #
#        added !localuk option to display United Kingdom.       #
#        added !youtube for searching videos on youtube.        #
#        added !atomfilms for searching videos on atomfilms.    #
#        added !trans for searching videos on trans.            #
#        added !gamespot for searching games, etc.              #
#        added !gamefaqs, it is able to parse multiple systems  #
#          and regions, still a work in progress, all bugs have #
#          been squashed.                                       #
#        added !test proc to help debug and dump html for       #
#          future parsing projects.                             #
#    .1: added !blog for searching blogsearch.google            #
#        added !ebay for searching ebay auctions.               #
#        added !ebayfight for amusement, same as googlefight.   #
#        fixed various miscellaneous minor annoyances in parts. #
#        finally fixed !book (aka print) to work with           #
#          books.google                                         #
#        added !ign for searching movies, games, etc..          #
#    .2: added support for total_search to show total results   #
#          or not. :)                                           #
#        added support for link_only (requested).               #
#        added back complete support for desc/link modes        #
#          they will now affect results properly.               #
#          (note: doesn't affect gamefaqs or locate)            #
#        added !locate for dns location information.            #
#    .3: added !wiki for searching wikipedia for things, very   #
#          much a work-in-progress, don't expect it to be       #
#          perfect.. it just reads very top heading <h*> so     #
#          sometimes it returns next to nothing.. like I said   #
#          it's WIP so don't bitch, thx.                        #    
#        added !review for searching gamefaqs and pulling a     #
#          games review, ranking, score, etc.. works similarly  #
#          to the way !wiki does, has same problem, so this     #
#          is also WIP.. thx                                    #
#    .4: fixed a few regexp parsers to correct broken (no       #
#          results returned) messages in some procs.            #
#        changed google populations to return only 1st desc     #
#          this fixes a small bug where excess html was shown.  #
#          ie. !g population japan || !g population of japan    #
#        fixed google define: links with quick regsub hacks.    #
#        problem with recent ign changing to javascripted html  #
#            so removed their advertising.. too bad for them.   #
#        fixed review and wikipedia to almost perfect.          #
#           note: review does not use forms submittal, instead  #
#           I chose to a single query and field matching on the #
#           first page returned. I may later use forms submital #
#           at some later time.                                 #
#        added two gamerankings triggers (!top/!popular)        #
#        added a mininova torrent search parser.                #
#        fixed parser for !blog by removing quotes. "g" -> g    #
#        beefed up the wikipedia parser so can intelligently    #
#            move to html#subtags to display info.              #
#        removed atomfilms trigger because no one was using.    #
#        added dailymotion trigger for searching tv episodes    #
#            since youtube/google seem to remove those too      #
#            often.                                             #
#        wikipedia now has ability to properly handle internal  #
#            redirects intelligently as well.                   #
#        youtube needed its regexp/regsub parsers tweaked a bit #
#            to handle new html design.                         #
#        google changed format and updated search regexp/sub    #
#            accordingly.                                       #
#        fixed !local lookups, removed !localuk as it was       #
#            redundant since !local covers UK region now.       #
#        corrected !book to actually produce an output again    #
#            i left broken intentionally earlier because of     #
#            lack of interest, but a guy named Zircon sparked   #
#            my interest again. enjoy.                          #
#        gamespot injects paid crap into their html design now  #
#            so found a way to scrape around it.. muahah        #
#        requested by a few people that somehow wikipedia is    #
#            multi-lingual so a fast hack is provided at the    #
#            moment which lacks input checking.. will fix later #
#        requested by a british friend was the ability as well  #
#            for ebay to work from different countries server.  #
#            this also lacks input checking.. will fix later.   #
#        added error catching for erroneous url's in both       #
#            wikipedia and ebay, this way bad user countries    #
#            will be reported with socket errors. thx rosc2112  #
#    .5: major modification of script to allow for dynamic      #
#            language selection of _all_ google sites.          #
#            (search,image,news,local,video,book,blog)          #
#            google group is still broken, will fix later :P    #
#        added !trans for google translate. enjoy.              #
#        added stock quotes (supplied by madwoota)              #
#        fixed translation to convertto foreign charsets.       #
#            fixes display of russian and arabic languages.     #
#        corrected google area code map results.                #
#        added google zip code map results.                     #
#        corrected google movie review lookups, now works!      #
#        search totals was incorrect on some country google     #
#            lookups. it was using elapsed search time as the   #
#            total results, so now a fallback (else) corrects   #
#            it by replace total results with 'google' in       #
#            those instances.                                   #
#        youtube undergoing major html changing to keep bots    #
#            from indexing, so changed some parsers to work.    #
#        added back !ign trigger for scraping ign's search      #
#            page for results.                                  #
#        google answers needed fixing to show correct results.  #
#        added !myspace trigger for searching their video       #
#            content.                                           #
#        corrected zipcode/areacode/airport.                    #
#        corrected all google query possibilities by spending a #
#            few hours fine tuning everything. Most languages   #
#            should work exactly as planned. Some languages     #
#            "may" display incorrectly, but this is by design   #
#            rather than an error, as the script presently uses #
#            unicode for everything except google translations. #
#        major work done to !local fixing it for every possible #
#            query result in almost every language, try it out  #
#            feeding it nonsense and try to find a flaw.        #
#        small bug concerning !google patent ##### .. wasn't    #
#            being caught as results, now all is well again.    #
#        corrected ebay parser with small change to eliminate   #
#            excess html in 'buy-it-now' parsing.               #
#        UPC codes work again.. yay.. how many use this? 1 guy? #
#        Ebay, Wikipedia and Google needed minor fixes to       #
#            correct remaining bits that were left untranslated #
#            now all output will be in language chosen.         #
#        Gamespot changed html design of their page layots for  #
#            reviews, so quick fix to !review proc to handle    #
#            their new design :)                                #
#        Corrected 'results' message displayed with totals to   #
#            also be displayed in language searched in, makes   #
#            the output look much more professional. r0x hard.  #
#            All Google triggers are now 100% dialect perfect.  #
#        Fixed small problem with wikipedia's 'no result'       #
#            message being longer than neccessary.              #
#        Added multi-language ability to youtube because it     #
#            now supports it, new default variable for setting  #
#            language default for it as well. enjoy.            #
#        Changed myspace parser query making it less prone to   #
#            breaking.                                          #
#        Added new trigger !trends to get top search results    #
#            for any date (this is limited by google cache,     #
#            not by the script) and also can be given country   #
#            switches. This is new, at present I cannot go      #
#            back beyond May 2007-05-15 ..                      #
#        Added dual results to !ebay trigger for price/bids     #
#            to account for the fact buy-it-now allows bids as  #
#            well...                                            #
#        Fixed the tiny bug in google answers lookup which      #
#            allowed for cruft to be given as 2nd result.       #
#        Fixed the tiny bug in wikipedia articles that left     #
#            parts of tables in the results.                    #
#        Added forced subtagging ability to wikipedia results   #
#            using their standard sub-tag #this so you can now  #
#            force certain sections to being your results and   #
#            it must only begin with the term doesn't need to   #
#            be entire term to force a sub-tag redirect.        #
#    .6: Added !mediawiki trigger following same abilities as   #
#            the wikipedia trigger.  This is beta at the moment #
#            and the reason this script has a revision change.  #
#        Corrected small issue regarding parsing original search#
#            results which makes this now compatabile with      #
#            every mediawiki page.                              #
#        Fixed problem parsers; Groups, News, Book              #
#        Problems with some procs sorted, Gamefaqs modified to  #
#            work with new php site design.                     #
#        Fixed issues with stubborn always changing google      #
#            based searches.  Now hopefully all triggers work   #
#            again.                                             #
#        Added prepend ability (Requested) so now each of your  #
#            lines, can be prepended with whatever you desire.  #
#        Added 'time in' feature to google search, allows you   #
#            to find out the time in any region, works like     #
#            population and date.                               #
#        Added wiki_line option to expand results.              #
#    .7: Added input/output encoding conversion to better       #
#            realize the multi-language side of this script.    #
#        Corrected mistake in input/output encoding handlers.   #
#        Added a triple lookup for youtube to include all       #
#            possible results and not miss any.                 #
#        Corrected issue with wikipedia/wikimedia incorrectly   #
#            removing some elements as page markups.            #
#        Added ability for bold to be seen in wikipedia/wikimedia
#            results again, removed stripcodes.                 #
#   .7a: Expanded Wikimedia and Wikipedia for allowing multi-   #
#            language as well as regional dialects. This also   #
#            allows for expanded custom encoding coverage.      #
#   .7b: Corrected google to return useful results once again.  #
#            broken was define, no_search, did_u_mean, and      #
#            weather.                                           #
#        Ebay now expanded upon to allow 'store' results to     #
#            appear as well as functional 'did you mean'        #
#            messaging.                                         #
#   .7c: Added remaining onebox results to google results.      #
#    .8: New features corrected longstanding shortcomings:      #
#         * Wikipedia/Wikimedia now fully decode and encode     #
#            on the fly and translate subtags seamlessly.       #
#         * Main encoding routine now includes a smart URL      #
#            encoder for those using language other than        #
#            english.                                           #
#        Corrected problem with script handling tcl special     #
#            characters as part of user input.                  #
#   .8a: All did you mean messages now report from page exactly #
#            as they appear. All sites that allow this now      #
#            handle this ability if no results are found.       #
#   .8b: Corrected deficiencies in !translate, it should now    #
#            function better regarding encodings and html       #
#            markups.  thx perplexa.                            #
#        Corrected minor problem regarding wikipedia's recent   #
#            template change. Now uses similar style as         #
#            wikimedia to prevent issues.                       #
#   .8c: Corrected google video as well as added the whois      #
#            onebox to regular google searches.                 #
#        Corrected way define: links are handled so encodings   #
#            are dealt with properly.                           #
#   .8d: Corrects issue with myspace and regional IP bases.     #
#   .8e: Corrects google video to produce results.              #
#   .8f: Added vocabulary aversion.                             #
#        Corrected flaw with wikimedia's encoding process,      #
#             improved overall functionality.                   #
#   .8g: Added domain detection for wikimedia domain's which    #
#             aren't using the standard subdomain /wiki.        #
#   .8h: Corrected !torrent                                     #
#   .8i: Corrected google zipcodes and google video.            #
#   .8j: Corrected youtube and google groups.                   #
#   .8k: Corrects some urlencoding problems regarding eggdrops  #
#             complete inability to distinguish between utf-8   #
#             and iso8859-1. Now requires http 2.5 which allows #
#             setting the -urlencoding flag.                    #
#        Corrects entire script which now uses the -urlencoding #
#             flag in some way to hopefully force eggdrop to    #
#             understand the differences and force proper       #
#             detections.                                       #
#         * requirements upped, now requries http 2.5 *         #
#   .8l: Corrects google search (calculations, did_you_mean,etc)#
#        Corrects google book                                   #
#        -- experimental version --                             #
#        Adds "automagic" detection to google translations      #
#        Possiblity for more automagic detection in the future  #
#          support procedures in place to allow this already.   #
#   .8m: Adds more "automagic" detection and a more robust      #
#          debugging display.                                   #
#        Corrected minor display problems.                      #
#   .8n: Corrects Googles embolding placement within results,   #
#           can now interpret <em> tags as bold.                #
#   .8o: Added correct support for a true utf-8 workaround.     #
#   .8p: Added proper redirect support.                         #
#        Corrected Youtube behavior.                            #
#   .8q: Corrected Dailymotion, added multilanguage support to  #
#           it and extended it's capabilities.                  #
#   .8r: Corrected minor youtube url inconsitancy.              #
#   .8s: Corrected result totals to appear again for all google #
#           sites, also corrected other google anamolies.       #
#        Corrected local as well to work with custom locations. #
#        Added mediawiki customized triggers to allow access    #
#           to mediawiki sites without so much input required.  #
#   .8t: Google template changed, <div class=g -> <li class=g   #
#   .8u: Added full support for session cookies as well as      #
#           unlimited redirect support. This allows adding      #
#           the secondary ebay template for their store server  #
#           and allows ebay to function 100% again.             #
#   .8v: Added back support for !game and !review and elaborated#
#           upon the amount of information displayed.           #
#   .8w: Added new abilities to both !locate and !trans now     #
#           allows much less input from the user and default    #
#           behavior.                                           #
#        Also correct other slight anomalies.                   #
#   .8x: Corrected ebay finally, yay! also added sorry detection#
#           to google so users experiencing this can tell. Also #
#           fixed the html cruft in gamespot review replies.    #
#   .8y: Corrected youtube, now more compliant with all templates
#           returned                                            #
#   .8z: Corrected video and group functionality.               #
#        Added scholar for parsing scholar.google.*             #
#    .9: Corrected video and youtube to work with website       #
#           re-designs.                                         #   
#        Other minor tweaks here and there.                     #
#   .9a: Corrected local, google define and google did-you-mean #
#   .9b: Corrected more problems with parsing, might still be   #
#           a few. This is just a test version to see if this   #
#           does solve them.                                    #
#   .9c: Addded a crude work around to allow youtube to remain  #
#           in the language chosen, even tho redirecting is     #
#           occuring.                                           #
#   .9e: Corrected ability to split lines and now keeps bolding #
#           and underlining intact perfectly.                   #
#        Corrected !news to return results again.               #
#        Modified all procs in some way to allow the split line #
#           correction noted above, no longer should \017 ever  #
#           be used.                                            #
#        Corrected !scholar to return accurate results.         #
#        Added short_answers config variable for google results.#
#   .9e: Corrected !google weather replies.                     #
#        Removed !top and !pop, gamerankings removed support.   #
#        Added !best and !worst, gamerankings added support.    #
#        Added support for color splitting and color themes.    #
#   .9f: Corrected split routine for those using \n as seperator#
#   .9g: Added custom triggers with phrasing.                   #
#   .9h: Corrected bug in custom triggers, now works properly.  #
#        Corrected color theme enforcement (not everything was  #
#          following it correctly, now it does)                 #
#   .9i: Corrected slight bugs in some procs.                   #
#        Corrected !news and !video.                            #
#        Combined custom wiki into custom trigger phrases.      #
#   .9j: Corrected google weather.                              #
#        Corrected remaining bugs with themes.                  #
#   .9k: Corrected !local                                       #
#   .9l: Corrected !local again.. stop it google :P             #
#        Corrected !torrent no-search results message appears   #
#          along with it's did-you-mean results.                #
#        Corrected issue regarding setting results to zero      #
#          and some commands still triggering.                  #
#        Corrected small bug with google weather replies when   #
#          custom themes are in use.                            #
#   .9m: Corrected alot of broken things, fixed a few things.   #
#          Basically forgot what these were as this was done    #
#          over the course of several weeks and I didn't        #
#          document any of it.. DOH!                            #
#   .9n: Corrected google weather and cruft html elements within#
#          some google no-results-found messages.               #
#   .9o: Corrected bug within google video display and fixed    #
#          ebay parsing.                                        #
#   .9p: Added input/output encoding abilities for google       #
#          translations. This appears to corrects accented      # 
#          character problem and misdetected encodings.         #
#   .9q: Added HD filter switch for youtube videos.             #
#        Added proxy support for main fetch_html routine.       #
#        Added Gzip support for wikipedia/media.                #
#        Corrected Google define mechanism.                     #
#   .9r: Added full support for gzipped downloading of webpages #
#           this should be sorta faster as well as less to      #
#           download doing all this, enjoy.                     #
#   .9s: Added ability to enable/disable gzipped support as this#
#           breaks functionality (eggdrop's utf-8 bug) for some #
#           languages.                                          #
#        Corrected youtube and ebay.                            #
#   .9t: Corrected google's zipcode and time queries.           #
#        Corrected utf-8 output, all queries should now appear  #
#            correct and in proper utf-8.. yay!                 #
#   .9u: Corrected google results, fight, video, youtube, news  #
#            and some other things I forgot about.              #
#        Corrected short_answers, created new option skip_self  #
#            to deal with google self-injecting results.        #
#        Corrected google did_you_mean and no_results messages  #
#            once again. Stop changing so often google, jeez..  #
#   .9v: Corrected wikipedia/wikimedia #achor lookup method, it # 
#            it's now more accurate and much faster.            #
#        Corrected minor inconsistancies with some procedures.  #
#        Corrected google weather for multilanguage replies.    #
#   .9w: Corrected google weather yet again! stop changing things
#            so often google, jeez..                            #
#        Corrected translate to use new templates. yes, google  #
#            was busy updating all their templates :(           #
#        Added new feature to custom trigger phrasing:          #
#            * ability to query by index as well as entire      #
#              sentence..                                       #
#   .9x: Corrected google "spell" to always return results or   #
#            did-you-mean.                                      #
#        Added "special searches" to google searching.          #
#        Corrected population/public_data searches to use new   #
#            template created for these. Is not given as a google
#            "answer" anymore.                                  #
#   .9y: Corrected: !news !game !review -- gamespot added       #
#            backslash escape protection to it's ajax replies to#
#            prevent injection from happening with chars..      #
#  .9r1: Corrected too many things to list, google went on a    #
#            spree and changed templates on lots of different   #
#            things causing lots of functionality to break.     #
#            suffice to say it's fixed. Most of it. Good show   #
#            google, but it's now your move again. This game of #
#            chess is certainly fun..                           #
#  .9r2: Corrected Google's oneboxes, specifically time and     #
#            maps.                                              #
#  .9r3: Corrected !ebay, !dailymotion, !ign, !myspace .        #
#            Deprecated functions: !scholar / !google movie:*   #
#            !scholar will be removed, and changed to something #
#            else google-y.                                     #
#            !google movie:* will be re-incorporated later.     #
#  2.00a: alot corrected, broken regexps, and more..            #
#  .... : stuff                                                 #
#  2.1x : more stuff, this version number shall be re-used      #
#         for infinity onward. Keep track of the date of the    #
#         revision below, or the date at top of script to know  #
#         any of that irrelevant stuff.                         #
#  2.2a : Fixed !fight and totals within google results. More   #
#         awesome is coming. Soon. Stay tuned.                  #
#                                                               #
# TODO:........................................................ #
#                                                               #
#   Fix broken parsers, this is a never-ending battle!          #
#   -- This is always #1 priority over anything else --         #
#                                                               #
#   Correct error detection mechanisms to use exact same as     #
#      "webby".                                                 #
#                                                               #
#   Solve inconsitancies in some countries total results and    #
#      inaccurate parsing due to differing html templates.      #
#      This includes missing result totals, condense entire     #
#      result grabbing to it's own procedure eventually akin    #
#      to fetch_html but for parsing total results, easier to   #
#      maintain that way then spread out individually amongst   #
#      each procedure.                                          #
#                                                               #
#   Once everything above is done we can start on these:        #
#     Clean-up code where obvious hacks were left in, code them #
#       correctly, remove debugging code from procs which is    #
#       presently commented out.                                #
#     Clean-up overly messy code that can be solved by coding   #
#       cleaner modules and not reusing so much code.           #
#                                                               #
#     For this UNOFFICIAL version please direct any and all     #
#        Suggestions/Thanks/Bugs to the forum link below:       #
#    -->  http://forum.egghelp.org/viewtopic.php?t=13586  <--   #           
#                                                               #
# LICENSE:..................................................... #
#                                                               #
#   This code comes with ABSOLUTELY NO WARRANTY.                #
#                                                               #
#   This program is free software; you can redistribute it      #
#   and/or modify it under the terms of the GNU General Public  #
#   License as published by the Free Software Foundation;       #
#   either version 2 of the License, or (at your option) any    #
#   later version.                                              #
#                                                               #
#   This program is distributed in the hope that it will be     #
#   useful, but WITHOUT ANY WARRANTY; without even the implied  #
#   warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR     #
#   PURPOSE.  See the GNU General Public License for more       #
#   details. (http://www.gnu.org/copyleft/library.txt)          #
#                                                               #
# CREDITS:..................................................... #
#                                                               #
# ..Officially:                                                 #
# Copyright (C) 2005, Jordan (Incith)                           #
# Currently maintained by madwoota                              #
# google@woota.net                                              #
#                                                               #
# ..Unofficially:                                               #
# Copyleft (C) 2006-2012, Speechless                            #
# http://ereader.kiczek.com/scripts                             #
# v2.1x - July 10th, 2o12 - speechles <#roms-isos@efnet>        #
#---------------------------------------------------------------#

# EVERYTHING IN THIS SECTION IS USER CUSTOMIZABLE.
# BEST SETTINGS ARE DEFAULT, YOU MAY HAVE OTHER IDEAS OF WHAT IS BEST.
#
# NOTE: some config options won't list how to enable/disable, but
# 0 will typically disable an option (turn it off), otherwise a
# value 1 or above will enable it (turn it on).
# ------
# start of configuration - make your changes in this section
# ------
namespace eval incith {
  namespace eval google {
    # set this to the command character you want to use for the binds
    # ------
    variable command_char "!"

    # set these to your preferred binds ("one two three etc etc" - space delimited!)
    # ------
    variable google_binds "g google goog"
    variable image_binds "i gi image images"
    variable local_binds "l gl local"
    variable group_binds "gg group groups"
    variable news_binds "n gn news"
    variable print_binds "gb book books"
    variable video_binds "v gv video"
    variable scholar_binds "s sc scholar"
    variable fight_binds "f fight googlefight"
    variable youtube_binds "y yt youtube"
    variable locate_binds "geo loc locate"
    variable gamespot_binds "gs game gamespot"
    variable trans_binds "tr trans translate"
    variable daily_binds "dm daily dailymotion"
    variable gamefaq_binds "gf gamefaq gamefaqs"
    variable blog_binds "b blog blogsearch"
    variable ebay_binds "e ebay"
    variable efight_binds "ef ebayfight"
    variable popular_binds "best great bestest"
    variable rev_binds "r review"
    variable wiki_binds "jj w wiki wikipedia"
    variable wikimedia_binds "wm wikim wikimedia"
    variable recent_binds "worst crap"
    variable mininova_binds "t torrent mininova"
    variable ign_binds "ign igame"
    variable myspacevids_binds "m myspace myvids"
    variable trends_binds "gtr trends"
    variable helpbot_binds "help bot"

    # to restrict input queries to Ops (+o), Halfops (+h) or Voiced (+v) users on
    # any +google channel, use this setting.
    # set the variable to one of the following to achieve the desired filtering:
    #   at least Op -> 3      (obvious)
    #   at least Halfop -> 2  (will also allow ops)
    #   at least Voice -> 1   (will also allow halfops and ops)
    #   everyone -> 0         (no filtering)
    #
    # note: this does NOT apply to private messages, use the below setting for them.
    # ------
    variable chan_user_level 0

    # if you want to allow users to search via private /msg, enable this
    # ------
    variable private_messages 1

    # as per emailed & forum requests, use the next two variables together
    # to determine the output type like so:
    #  notice_reply 1 & force_private 1 = private notice reply only (this is as requested)
    #  notice_reply 0 & force_private 1 = private msg reply only
    #  notice_reply 1 & force_private 0 = regular channel OR private NOTICE
    #  notice_reply 0 & force_private 0 = regular channel OR private MSG (default)
    # set to 1 to enable a /notice reply instead, 0 for normal text
    # ------
    variable notice_reply 0

    # set to 1 to force all replies to be private
    # ------
    variable force_private 0

    # set this to the language you want results in! use 2 letter form.
    # "all" is the default/standard google.com search.
    # see http://www.google.com/advanced_search for a list.  You have to use
    # the 'Language' dropdown box, perform a search, and find a line in the URL
    # that looks like "&lr=lang_en" (for English). "en" is your language code.
    # popular Ones: it (italian), da (danish), de (german), es (spanish), fr (french)
    # please note, this does not 'translate', it searches Google in a
    # language of choice, which means you can still get English results.
    # ------
    # NOTE: Changing this from "all" will effectively disable some of the
    # multi-language features of this script, doing so is not advised.
    # ------
    variable language "all"

    # set this to "on" to let google filter "adult content" from any of your search results
    # "off" means results will not be filtered at all
    # note: this is only applicable to !google, !images and !groups
    # ------
    variable safe_search "off"

    # number of search results/image links to return, 'define:' is always 1 as some defs are huge
    # ------
    variable search_results 5
    variable image_results 4
    variable local_results 4
    variable group_results 3
    variable news_results 3
    variable print_results 3
    variable video_results 4
    variable scholar_results 4
    variable youtube_results 3
    variable locate_results 1
    variable gamespot_results 3
    variable trans_results 1
    variable daily_results 4  
    variable gamefaq_results 20
    variable blog_results 3
    variable ebay_results 3
    variable popular_results 10
    variable rev_results 1
    variable wiki_results 1
    variable wikimedia_results 1
    variable recent_results 10
    variable mininova_results 3
    variable ign_results 3
    variable myspacevids_results 3
    variable trends_results 25
    variable helpbot_results 1

    # This part was requested to be added so now here it is, it has
    # various prepends you may wish to have preceed each function.
    # To use this, just change what you see below from nothing to
    # something...ie, if you want [ GOOGLE ] to prepend google
    # search results change the search_prepend to "\[GOOGLE\]". You
    # can do the same with all of the following prepends, they will
    # start the output for each line. If you don't wish to use this,
    # leave them as "". Keep in mind tcl special characters MUST be
    # escaped or will cause tcl errors, and/or crash your bot. This
    # is your own problem, just be aware. Read about them if possible.
    #
    # Note 1: Prepends will increase your line length, and won't be
    # accommodated for in the max line length setting, so you may
    # find you need to lower your max line length setting if your
    # prepends are lengthy or contain lots of escape sequences. If
    # you don't you  may find the bots replys may get cut short or
    # cut completely by the ircd your using.
    #
    # Note 2: To use color, bold, etc.. simply use the proper escape
    # sequence to generate it here, make sure to properly CLOSE your
    # sequence (\003 for color, \002 for bold, etc) or you will see
    # the effect of the prepend bleed thru into your output as well.
    # ------
    variable search_prepend ""
    variable image_prepend ""
    variable local_prepend ""
    variable group_prepend ""
    variable news_prepend ""
    variable print_prepend ""
    variable video_prepend ""
    variable scholar_prepend ""
    variable youtube_prepend ""
    variable locate_prepend ""
    variable gamespot_prepend ""
    variable fight_prepend ""
    variable ebayfight_prepend ""
    variable trans_prepend ""
    variable dailymotion_prepend ""
    variable gamefaqs_prepend ""
    variable blog_prepend ""
    variable ebay_prepend ""
    variable popular_prepend ""
    variable rev_prepend ""
    variable wiki_prepend ""
    variable wikimedia_prepend ""
    variable recent_prepend ""
    variable mininova_prepend ""
    variable ign_prepend ""
    variable myspacevids_prepend ""
    variable trends_prepend ""

    # set this to 0 to turn google fight off (it is a tad slow after all ...)
    # this also disables or enables ebay fights (it's even slower ...)
    # ------
    variable google_fight 1

    # ** this is not an optional setting, if a string is too long to send, it won't be sent! **
    # it should be set to the max amount of characters that will be received in a public
    # message by your IRC server.  If you find you aren't receiving results, try lowering this.
    # ------
    variable split_length 410

    # trimmed length of returned descriptions, only for standard searches.
    # ------
    variable description_length 80

    # amount of lines you want your wiki* results to span, the more lines the more
    # of the wiki article or section you will see, some get cut short if so raise this.
    # this affects both wikipedia and wikimedia results.
    # ------
    variable wiki_lines 2

    # short answers? when google search encounters an answer this
    # option will make only it show, no other results. this also skips
    # showing image/news/etc results from other google sites as results.
    # ------
    variable short_answers 1

    # skip links to self? google sometimes uses links to it's own
    # services within normal google searches. This will skip _any_ google
    # links from appearing within google search results. For some
    # queries this will omit obvious replies which is normal.
    # ------
    variable skip_self 0

    # replace search terms appearing in the description as bolded words?
    # -> does not bold entire description, just the matching search words
    # -> this is ignored if desc_modes contains the Bold mode below.
    # ------
    variable bold_descriptions 1

    # set this to 0 to turn off total results appearing with searches.
    # ------
    variable total_results 1

    # set this to 1 to remove descriptions and set only links to show
    # ------
    variable link_only 0

    # set this to the default country you would like *.wikipedia to use when
    # no country is specified. default is "en". country is 2-letter wiki code.
    # http://*.wikipedia.org/ - en, de, it, es, fr, these are examples.
    # ------
    variable wiki_country "en"

    # set this to the default website you would like wikimedia to use when
    # no website is specified.
    # ------
    variable wikimedia_site "wiki.gbatemp.net/wiki"

    # Wikimedia URL detection
    # remove double entries from urls? would remove a '/wikisite' from this
    # type of url @ http://yoursite.com/wikisite/wikisite/search_term
    # if you have issues regarding url capture with wikimedia, enable this.
    # /wiki/wiki/ problems are naturally averted, a setting of 0 already
    # stops these type.
    # --------
    variable wiki_domain_detect 1

    # Customized Trigger Phrasing?
    # allow customized triggers to be attached to custom phrasing
    # Anything other than 0 will enable and will use the list below.
    variable my_custom 1

    # Custom Trigger Phrasing
    # This is used to customize triggers and for
    # constructing phrases to pass, format is:
    # "custom-trigger:trigger-to-associate-with:phrase-to-pass"
    # within the phrase-to-pass, %search% = the users input.. but,
    # if this is passed onto another custom trigger it will become
    # the enitre phrase which was passed from the trigger before it.
    # hopefully people understand how to use these, and remember
    # to read the lines below this at least twice before
    # constructiong your phrasing...
    # DO NOT USE YOUR COMMAND CHAR IN THESE IT IS ASSUMED.
    # special tcl characters MUST be escaped for you to acheive greatness.
    variable my_customs {
      "ch:g:%search% +site:computerhope.com"
      "eh egghelp:g:%search% +site:egghelp.org"
      "mi:g:%search% +site:mircscripts.org"
      "rw:wm:.wiki.roms-isos.com %search%"
      "gw:wm:.wiki.gbatemp.net/wiki %search%"
      "ed:wm:.encyclopediadramatica.se %search%"
      "un:wm:.uncyclopedia.wikia.com %search%"
      "un2:wm:.mirror.uncyc.org/wiki %search%"
      "wq:wm:.en.wikiquote.org/wiki %search%"
      "lw:wm:.lyricwiki.org %search%"
      "wk:wm:.en.wiktionary.org/wiki %search%"
      "bible:wm:.biblewiki.be/wiki %search%"
      "znc:wm:.wiki.znc.in %search%"
      "gbr:g:.com.br %search%"
      "got:g:%search% +ext:torrent"
      "rs:g:%search% +inurl:rapidshare"
      "rsmp3 r3 rs3:rs:%search% inurl:mp3"
      "mb memory:wm:.memory-beta.wikia.com %search%"
      "kiczek:gf:%search% in usa"
      "mysite:g:+site:%%1%% +ext:%%2%% %%3-end%%"
      "cg:g:+inurl:%%1%%.craigslist +%%2-end%%"
      "kt:g:%search% +site:kotaku.com"
      "gay:f:%search% +ass +gay vs %search% +vagina -gay"
      "ts:g:%search% site:twitter.com"
	"ft futurama:wm:.futurama.wikia.com %search%"
      "fg familyguy:wm:.familyguy.wikia.com %search%"
      "ad americandad:wm:.americandad.wikia.com %search%"
      "sp southpark:wm:.southpark.wikia.com %search%"
      "sw starwars:wm:.starwars.wikia.com %search%"
      "st startrek:wm:.malf.wikia.com %search%"
      "na naruto:wm:.naruto.wikia.com %search%"
      "in inuyasha:wm:.inuyasha.wikia.com %search%"
      "gr gremlins:wm:.gremlins.wikia.com %search%"
      "wow worldofwarcraft:wm:.wowwiki.com %search%"
      "smf smurfs:wm:.smurfs.wikia.com %search%"
      "sm sailormoon:wm:.sailormoon.wikia.com %search%"
      "pk pokemon:wm:.pokemon.wikia.com %search%"
      "md mcdonalds:wm:.mcdonalds.wikia.com %search"
      "ss strawberryshortcake:wm:.strawberryshortcake.wikia.com %search%"
      "mlp mylittlepony:wm:.mlp.wikia.com %search%"
      "lps littlestpetshop:wm:.lps.wikia.com %search%"
      "ant ants:wm:.ants.wikia.com %search%"
      "gm gaming:wm:.gaming.wikia.com %search%"
      "nt nothing:wm:.nothing.wikia.com %search%"
      "ff finalfantasy:wm:.finalfantasy.wikia.com %search%"
      "ok openkinect:wm:.openkinect.org/wiki %search%"
      "bl borderlands:wm:.borderlands.wikia.com %search%"
      "es elderscrolls:wm:.elderscrolls.wikia.com %search%"
      "lb liberal:wm:.liberapedia.wikia.com %search%"
      "egg eggdrop:wm:.eggwiki.org %search%"
      "am amz amazon:g:%%2-end%% site:amazon%%1%%"
      "by barney:wm:.barney.wikia.com %search%"
      "cn conservative:wm:.www.conservapedia.com %search%"
      "nazi:tr:@de %search%"
      "jew:tr:@pl %search%"
      "spic:tr:@es %search%"
      "nigger:tr:@af %search%"
      "yank:tr:@en %search%"
      "rio:tr:@pt %search%"
      "pepe:tr:@fr %search%"
      "mario:tr:@it %search%"
      "terror:tr:@ar %search%"
      "chingchong:tr:@zh %search%"
      "kamakazi:tr:@ja %search%"
      "fb:g:%search% +site:facebook.com"
      "4s:g:%search% +site:4shared.com"
      "apk:g:%search% +ext:apk"
	"bibleverse bv:wm:.biblewiki.be/wiki %%1%% Chapter %%2%%, Verse %%3%%"
      "cy:wm:.wiki.cyanogenmod.com %search%"
      "nzb:g:%search% +ext:nzb"
      "fit ftube:g:%search% +site:filestube.com"
    }

    # this controls custom trigger phrasing query control.
    # with this you can split the users search into individual
    # words, and use these with your custom trigger above.
    # suppose the user types your custom trigger
    # <user> !rsmp3 tupac mama
    # you can reference this in your custom trigger as:
    # %search% to get the entire text: tupac mama
    # but, suppose you want individual words, tupac and mama
    # well now you can reference these too as %%1%% and %%2%%.
    # you can also use ranges %%1-4%% %%1-end%%. Unlike eggdrop
    # 1 is the starting index of the users input, not 0.
    # this works in combination with %search%, but for indexes
    # you _MUST_ reference within %%'s (double percents)..
    # hopefully you understand how this functions.. ;)
    # any setting 1 or higher enables, 0 or lower disables
    # ------
    # NOTE: Leaving this enabled is advised if you use any double
    # percent variables (%%1%% %%etc%%) in your my_customs list above.
    # ------
    variable custom_words 1

    # set this to the proxy you wish the main html fetching procedure to
    # use. set both proxy_host and proxy_port. if you don't wish to use
    # a proxy. set proxy_host ""
    # ------
    variable proxy_host ""
    variable proxy_port ""

    # set this to the default country you would like ebay.* to use when no
    # country is specified. default is "com". country is ebay extension
    # http://ebay.*/ - co.uk, de, es, com, com.au, these are examples.
    # ------
    variable ebay_country "com" 

    # set this to the default country you would like *.google.* sites to use when
    # no country is specified. default is "com". country is google extension.
    # http://google.*/ - co.uk, de, es, com, com.au, these are examples.
    # ------
    variable google_country "com/intl/en"

    # set this to the default country you would like dailymotion to use when
    # no country is specified. default is "en" for international.
    # http://dailymotion.com/*/ - en, us, es, fr, nl, pt, da, el, it, pl, ro, sv, tr, ja, ko, zh, these are examples.
    # ------
    variable daily_country "en" 

    # set this to the default country you would like *.youtube to use when
    # no country is specified. default is "com". country is youtube code.
    # http://*.youtube.com/ - com, us, ie, fr, it, nl, br, gb, jp, de, es, pl, these are examples.
    # ------
    variable youtube_country "com" 

    # enable this to allow youtube links to lead to higher definition videos
    # rather than their stream optimized lower quality setting.
    # to disable use 0, anything else enables.
    # ------
    variable youtube_highquality 1

    # set this to the switch you want to use for youtube to filter content
    # and display only high-definition videos.
    # ------
    variable youtube_highdef "@hd"

    # set your default translation language here, this is what will be assumed
    # if the user omits the 'translate to' portion of their input.
    # en, es, it, nl, de, etc.. these are merely some examples, there are more available.
    # ------
    variable trans "en"

    # Google translation input/output encodings
    # set these below to either:
    # 0 for automatic encoding
    # 1 for utf-8
    # You may use switches to inverse this behavior on-the-fly. Set them
    # below as well.
    # ------
    variable trans_input 1
    variable trans_output 0
    variable trans_input_t "--swapi"
    variable trans_output_t "--swapo"

    # Channel filter
    # this is for users who already have a google script running, but would
    # like to use the other functions of this script. You can filter out google
    # requests in any of the channels listed below.
    # default is "". To add them use: "#chan1 #CHAN2 #cHaN3 #EtC", case is irrelevant.
    # ------
    variable filtered ""
    
    # COLOR THEME - THESE CAN BE SHARED WITH OTHERS ON EGGHELP! :P
    # use these settings below to set your preferred color theme.
    # the following modes apply and you can use any combination of them: (NO SPACES!)
    #
    #  Bold = \002
    #  Underline = \037
    #  Reverse = \026
    #  Colours:                 #RGB/Html code:
    #   White = \00300          #FFFFFF
    #   Black = \00301          #000000
    #   Blue = \00302           #00007F
    #   Green = \00303          #008F00
    #   Light Red = \00304      #FF0000
    #   Brown = \00305          #7F0000
    #   Purple = \00306         #9F009F
    #   Orange = \00307         #FF7F00
    #   Yellow = \00308         #F0FF00
    #   Light Green = \00309    #00F700
    #   Cyan = \00310           #008F8F
    #   Light Cyan = \00311     #00F7FF
    #   Light Blue = \00312     #0000FF
    #   Pink = \00313           #FF00FF
    #   Grey = \00314           #7F7F7F
    #   Light Grey = \00315     #CFCFCF
    #
    # this example will do Bold, Underline and Light Blue: "\002\037\00312"
    # note: this will affect *ALL* descs, links, totals and errors. also
    # don't forget to use the \ too ! note: abusing this will heavily increase
    # the number of characters per line, so your output lines will increase accordingly.
    #
    # COLOR CODES MUST CONSIST OF 2 DIGITS, IF YOU WISH TO USE 0-9 PREFIX
    # IT WITH 0 ACCORDINGLY. IE, \00304 for red...
    # IF YOU WISH TO USE BACKGROUNDS, THIS IS ALLOWED; IE, \00304,02...
    # TO DEMODE A COLOR YOU MUST USE \00399 RATHER THAN SIMPLY \003
    #
    # use *_modes to enable each color, bold, underline.
    # use *_demodes to undo this back to plain text.
    # if you do not use the proper modes/demodes here your color theme will look
    # horrible... 
    # ------
    # description mode/demode
    variable desc_modes ""
    variable desc_demodes ""
    # link mode/demode
    variable link_modes ""
    variable link_demodes ""
    # totals mode/demode
    variable total_modes ""
    variable total_demodes ""
    # error mode/demode
    variable error_modes ""
    variable error_demodes ""

    # break, seperator and split_char need more than modes
    # you also enter the appropriate character you wish used.
    variable break " @ "
    variable seperator " \002|\002 "
    # if using "\n" within the seperator above, you may want to change
    # the below setting to possibly to ", " or "; "
    variable split_char " | "

    # number of minute(s) to ignore flooders, 0 to disable flood protection
    # ------
    variable ignore 1

    # how many requests in how many seconds is considered flooding?
    # by default, this allows 3 queries in 10 seconds, the 4th being ignored
    # and ignoring the flooder for 'variable ignore' minutes
    # ------
    variable flood 4:10

    # would you like to use vocabulary aversion?
    # this will replace swear words with more appropriate words
    # and the query returned will be aversion free.
    # 0 disables, anything else enables
    #----------
    variable aversion_vocabulary 0
    
    # set your aversion vocabulary below if desired:
    # remember to enable, keep the setting above at 1.
    #----------
    variable aversion {
      cunt:cock
      cock:cunt
      anal:internet
      "hell:a hot place"
      sex:troll
      "fred:wasn't he a flintstone?"
      *fuck*:nice
      bitches:women
      bitch:woman
      "analsex:true love"
      "supergear:licorice and pancakes"
	"tecra:I LIKE LARGE POSTERIORS AND I CANNOT PREVARICATE!"
	{word:"fuck you"}
    }

#---> NOTE:
#---> IF YOUR PRIMARY LANGUAGE ISN'T ENGLISH YOU MUST CHANGE THIS SECTION BELOW POSSIBLY
    # this is the help list generated by the bot to help users become familiar with the script.
    # you can change these here to affect the language used when help is asked for.
    # there MUST be 28 entries in this list, the first must be the word for ALL.
    # this list MUST be kept entirely lowercase.
    # ------
    variable helplist "all google images groups news local book video fight youtube translate gamespot gamefaqs blog ebay ebayfight wikipedia wikimedia locate review torrent top popular dailymotion ign myspace trends scholar"

    # english words within the help phrases, spacing must be kept as it is below.
    # ------
    variable helpmsg1 "Help is only available for the following:"
    variable helpmsg2 "is disabled."
    variable helpmsg3 "with "
    variable helpmsg4 " results."

    # the help messages given. 
    # ------
    variable help1 "\[.google.country.code\] \[define:|spell:\] <search terms> <1+1> <1 cm in ft> <patent ##> <weather city|zip> <??? airport>" ;#google
    variable help2 "\[.google.country.code\] <search terms>" ;#images
    variable help3 "\[.google.country.code\] <search terms>" ;#groups
    variable help4 "\[.google.country.code\] <search terms>" ;#news
    variable help5 "\[.google.country.code\] <what> near <where>" ;#local
    variable help6 "\[.google.country.code\] <search terms>" ;#book
    variable help7 "\[.google.country.code\] <search terms>" ;#video
    variable help8 "<word(s) one> vs <word(s) two>" ;#fight
    variable help9 "\[.youtube.country.code\] <search terms>" ;#youtube
    variable help10 "region@region <text>" ;#translate
    variable help11 "<search terms>" ;#gamespot
    variable help12 "<system> in <region>" ;#gamefaqs
    variable help13 "\[.google.country.code\] <search terms>" ;#blog
    variable help14 "\[.ebay.country.code\] <search terms>" ;#ebay
    variable help15 "<word(s) one> vs <word(s) two>" ;#ebayfight
    variable help16 "\[.wiki-country-code\] <search terms>\[#subtag\]" ;#wikipedia
    variable help17 "\[.www.wikisite.org\[/wiki\]\] <search terms>\[#subtag\]" ;#wikimedia
    variable help18 "<ip or hostmask>" ;#locate
    variable help19 "<gamename> \[@ <system>\]" ;#review
    variable help20 "<search terms>" ;#torrent
    variable help21 "<system>" ;#top
    variable help22 "<system>" ;#popular
    variable help23 "<search terms>" ;#dailymotion
    variable help24 "<search terms>" ;#ign
    variable help25 "<search terms>" ;#myspace
    variable help26 "\[.google.country.code\] <YYYY-MM-DD>" ;#trends
    variable help27 "\[.google.country.code\] <search terms>" ;#scholar
#---> END OF NOTE:

    # enable encoding conversion, set this to 1 to enable.
    # with this enabled it will follow the format of encoding conversions listed
    # below. these will affect both input and output and will follow country switch.
    # ------
    variable encoding_conversion_input 0
    variable encoding_conversion_output 1

    # enable dirty decoding? This attempts to use the regular "dirty" method
    # of rendering html elements which works well with iso8859-1 and other
    # latin variants. This does not work well at all with russian, japanese,
    # and any other non-latin variants. So keep this at 0 if you want a truly
    # multi-language bot, but keep in mind you may see unrendered &x12345; html
    # elements. This is because I don't know of a method to transcode these
    # to proper utf-8 characters yet.. :P
    # ------
    # NOTE: If you bot is properly utf-8 patched, setting this to 1 is recommened.
    # ------
    variable dirty_decode 1

    # enable gzip compression for bandwidth savings? Keep in mind
    # this semi-breaks some of the present utf-8 work-arounds and
    # eggdrop may mangle encodings when gzip compression that it 
    # doesn't when uncompressed html it used (default). A setting
    # of 0 defaults to uncompressed html, a 1 or higher gzip.
    # ------
    # NOTE: If you do not have Trf or zlib packages setting this
    # to 0 is recommened. Leaving it at 1 is fine as well, as the
    # script will attempt to find these commands or packages every
    # rehash or restart. But to keep gzip from ever being used it
    # is best to set the below variable to 0.
    # NOTE2: If you have Trf or zlib packages present, then this
    # should always be set to 1. You save enormous bandwidth and
    # time using this. If your bot is patched and you have Trf/zlib
    # then you should definitely leave this at 1 and you will never
    # suffer issues.
    # ------
    variable use_gzip 1

    # THIS IS TO BE USED TO DEVELOP A BETTER LIST FOR USE BELOW.
    # To work-around certain encodings, it is now necessary to allow
    # the public a way to trouble shoot some parts of the script on
    # their own. To use these features involves the two settings below.
    # -- DEBUG INFORMATION GOES BELOW --
    # set debug and administrator here
    # this is used for debugging purposes
    # ------
    variable debug 1
    variable debugnick speechles

    # AUTOMAGIC
    # with this set to 1, the bottom encode_strings setting will become
    # irrelevant. This will make the script follow the charset encoding
    # the site is telling the bot it is. 
    # This DOES NOT affect wiki(media/pedia), it will not encode automatic.
    # Wiki(media/pedia) still requires using the encode_strings section below.
    # ------
    # NOTE: If your bot is utf-8 pathced, leave this option at 1, the only
    # time to change this to 0 is if your having rendering problems.
    # ------
    variable automagic 1

    # UTF-8 Work-Around (for eggdrop, this helps automagic)
    # If you use automagic above, you may find that any utf-8 charsets are
    # being mangled. To keep the ability to use automagic, yet when utf-8
    # is the charset defined by automagic, this will make the script instead
    # follow the settings for that country in the encode_strings section below.
    # ------
    # NOTE: If you bot is utf-8 patched, set this to 0. Everyone else, use 1.
    # ------
    variable utf8workaround 0

    # encoding conversion lookups
    # here is where you can correct language encoding problems by pointing their
    # abbreviation towards an encoding. if you want more, feel free to add more.
    # this is a somewhat poor example below, there are possibly hundreds of additions
    # that need to be added to this section, this is just something to see if this
    # indeed is a work around, enjoy and merry christmas ;P
    # ------
    # NOTE: If your bot is utf-8 patched, the below list is irrevelevant.
    # NOTE2: If your bot isn't utf-8 patched and Trf/zlib are found and used, the below
    # list is used to correct latin encodings, this is how the list starts by default.
    # NOTE3: If your bot isn't utf-8 patched, and Trf/zlib are NOT found, the below
    # list is to correct utf-8 encodings, as well as various latin encodings. You
    # may need to add things to this list possibly to correct rendering problems.
    # ------
    variable encode_strings {

    }
  }
}

# ------
# end of configuration, script begins - changes beyond this section aren't advised.
# ------
# *** DO NOT CHANGE THINGS BEYOND THIS POINT UNLESS YOU KNOW WHAT YOUR DOING ***
# If you know what your doing, well by all means, change anything and everything,
# but do so with the understanding that all modifications are bound by the
# GNU General Public license agreement found above regarding credit for authors
# and general copyrights.
# ------

# requires http package
package require http 2.5.3

# for pixelz and hrz, they are the r0x0r of your s0x0r
if {[file exists [file join [file dirname [info script]] incith-google-settings.tcl]]} { source [file join [file dirname [info script]] incith-google-settings.tcl] }

# if gzip requested, Trf or zlib required.
if {$::incith::google::use_gzip > 0} {
  if {([lsearch [info commands] zlib] == -1) && ([catch {package require zlib} error] !=0)} {
    if {([catch {package require Trf} error] == 0) || ([lsearch [info commands] zip] != -1)} {
      putlog "Incith:Google compression test successful, found Trf package! Gzip enabled."
      set incith_trf 1
      set incith_hdr "Accept-Encoding gzip,deflate"
    } else {
      putlog "Incith:Google unable to find zlib or trf package! Gzip disabled."
      putlog "Incith:Google requires gzip decompression with wikipedia and Wikimedia. As a result, every article will not work for you."
      set incith_nozlib 1
      set incith_hdr ""
    }
  } else {
    putlog "Incith:Google compression test successful, found zlib package! Gzip enabled."
    set incith_hdr "Accept-Encoding gzip,deflate"
  }
} else {
  set incith_nozlib 1
  set incith_hdr ""
}

# tls-https
if {[catch {package require tls} error]} {
	putlog "Incith:Google: https NOT supported: tls package NOT found."
} else {
	::http::register https 443 [list ::tls::socket -require 0 -request 1]
	putlog "Incith:Google: https supported: tls package found."
}

# set flag per channel use
setudef flag google

# initialize
namespace eval incith {
  namespace eval google {
    variable version "incith:google-2.2a"
    variable encode_strings [split $encode_strings]
  }
}

# bind the public binds
bind pubm -|- "*" incith::google::public_message

# bind the private message binds, if wanted
if {$incith::google::private_messages >= 1} {
  bind msgm -|- "*" incith::google::private_message
}

namespace eval incith {
  namespace eval google {
    # GOOGLE
    # performs a search on google.
    #
    proc google {input} {
      # local variable initialization
      set results 0 ; set calc 0 ; set break 0 ; set spell 0 ; set output ""; set match ""
      set populate 0 ; set titem "" ; set no_search "" ; set did_you_mean "" ; set titen ""

      # can't be moved to fetch_html since $spell isn't global
      if {[string match -nocase "*spell:*" $input] == 1} {
        set spell 1
      }

      # fetch the html
      set html [fetch_html $input 1]

      # this isn't global, so we need to keep ctry (country) here
      regexp -nocase -- {^\.(.+?)\s(.+?)$} $input - titen input
      if {$titen == ""} {
        set titen "${incith::google::google_country}" 
      } else {
        set titen [lindex [split $titen /] 0]
      }

      # standard fetch_html error catcher
	if {[string match -nocase "*socketerrorabort*" $html]} {
            regsub {(.+?)\|} $html {} html
            return "${::incith::google::error_modes}Socket Error accessing '${html}' .. Does it exist?${::incith::google::error_demodes}" 
	}
	if {[string match -nocase "*timeouterrorabort*" $html]} {
		return "${::incith::google::error_modes}Connection has timed out...${::incith::google::error_demodes}" 
	}

      regsub -- {<div id=ss-box>.*?</div><div>} $html {} html
      # strip out 'did you mean?' first
      # what do we call 'no search results in any language?'
      if {![regexp -nocase -- {<div id="ires"></div></div></div>(.*?)</p>} $html - no_search]} {
        if {![regexp -nocase -- {</div><div id=res class=med>(.+?)<p style} $html - no_search]} {
          if {![regexp -nocase -- {</script><div id=res>(.+?)<br><br>} $html - no_search]} {
            if {![regexp -nocase -- {<div id=res class=med>.*?<p>(.+?)<p style} $html - no_search]} {
              if {![regexp -nocase -- { </div><div class=med.*?>(.*?)\.<br><br>} $html - no_search]} {
                if {![regexp -nocase -- {<p class=sp_cnt>(.*?)<a id} $html - no_search]} {
		      if {![regexp -nocase -- {<div class=med><p style=.*?>(.*?)<a id} $html - no_search]} {
                    regexp -nocase -- {</div><div id=res class=med>(.+?)<p style} $html - no_search
                  }
                }
              }
            }
          }
        }
      }
      if {$no_search != ""} {
        #regsub -- {^.*?</h2>} $no_search "" no_search
        #regsub -- {</a>.*?<div class=med style=.*?>} $no_search "</a>" no_search
        #regexp -- {^(.+?)</td></tr>} $no_search - no_search
        regsub -- {</a>} $no_search "? " no_search
        regsub -all -- {<(.*?)>} $no_search { } no_search
        while {[string match "*  *" $no_search]} {
          regsub -all -- {  } $no_search " " no_search
        }
        if {$incith::google::bold_descriptions == 0} {
          regsub -all -- "\002" $no_search {} no_search
        }
        set no_search [string trim $no_search]
      }

      # give results an output header with result tally.
      if {[regexp -- {id="resultStats">(.*?)</div>} $html - match]} {
          if {[string length [set match [split [string trim $match]]]]} {
            set titem [lindex $match end]
            set match [lindex $match end-1]
          } else {
            set match "Google"
            set titem ""
          }
      } else {
          set match "Google"
          set titem ""
      }
      regsub -all -- {<(.*?)>} [descdecode $match] {} match
      regsub -all -- {<(.*?)>} $titem {} titem
      # format output according to variables.
      if {$incith::google::total_results != 0 && $spell == 0} {
        set output "${::incith::google::total_modes}\002[string trim ${match}]\002 [descdecode [string trim $titem]]${::incith::google::total_demodes}${incith::google::seperator}"
        if {$incith::google::bold_descriptions == 0} {
          regsub -all -- "\002" $output {} output
        }
      } 
      # parse the html
      set loopy 0
      #regsub -nocase {^.+<div id="topstuff">} $html {} html
      while {$results < $incith::google::search_results} {
        # the regexp grabs the data and stores them into their variables, while
        # the regsub removes the data, for the next loop to grab something new.

        # check if there was an alternate spelling first
        if {([string match "*<p class=ssp>*" $html] || [string match "*<p class=sp_cnt>*" $html] || [string match "*</div><div id=res class=med><p>*" $html] || [string match "*</div><div id=res class=med>*<li><p>*" $html])&& [string match "define:*" $input] == 0 && [string match "*&nocalc=1\">*" $html] == 0} {
          if {[regexp -nocase {<p class=ssp>(.*?)<a href=.*?>(.*?)</a>} $html - titem did_you_mean]} {
            regsub -all -nocase -- {<p class=ssp>} $html {} html
          } elseif {[regexp -nocase -- {</div><div id=res class=med><h2 class=hd>.*?<p>(.+?)<a href=.*?>(.+?)</a>} $html - titem did_you_mean]} {
            regsub -all -nocase -- {</div><div id=res class=med><h2 class=hd>.*?<p>.+?<a href=.*?>.+?</a>} $html {} html
          } elseif {[regexp -nocase -- {</div><div id=res class=med><!--a--><h2 class.+?>.*?<p>(.*?)<a href=.*?>(.+?)</a>} $html - titem did_you_mean]} {
            regsub -all -nocase -- {</div><div id=res class=med><!--a--><h2 class.+?>.*?</a>} $html {} html
          } elseif {[regexp -nocase -- {<td id=rhspad></table><div id=res class=med><p>(.+?)<a href=.*?>(.+?)</a>} $html - titem did_you_mean]} {
            regsub -all -nocase -- {<td id=rhspad></table><div id=res class=med><p>.+?<a href=.*?>.+?</a>} $html {} html
          } elseif {[regexp -nocase {<p class=sp_cnt>(.*?)<a href=.*?>(.*?)</a>} $html - titem did_you_mean]} {
            regsub -all -nocase -- {<p class=sp_cnt>} $html {} html
          } elseif {[regexp -nocase -- {</div><div id=res class=med><p>(.+?)<a href=.*?>(.+?)</a>} $html - titem did_you_mean]} {
            regsub -all -nocase -- {</div><div id=res class=med><p>(.+?)</a>} $html {} html
            regexp -- {^(.*?)</h2>} $titem - titem
          }
          # sometimes calculator results are mixed into our alternate spelling.
          # we want to show these like we do our 'did you mean'
          if {[string match "*<img src=/images/calc_img*" $titem] == 1} {
            regexp -nocase -- {calc_img.+?nowrap.*?>(.+?)</td></tr>} $titem - titem
            set desc $titem
            if {$::incith::google::short_answers > 0 } {
              regsub -all -- {<(.+?)>} $desc "" desc
              return "${::incith::google::desc_modes}$desc"
            }
          } else {
            set desc "$::incith::google::total_modes$titem$incith::google::total_demodes$incith::google::desc_modes$did_you_mean$incith::google::desc_demodes"
          }
	    if {$incith::google::bold_descriptions == 0 && [string match "\002" $incith::google::desc_modes] == 1} {
            regsub -all -- "\002" $desc {} desc
          }
          regexp -- {^(.+?)</td></tr>} $desc - desc
          regsub -all -- {<(.+?)>} $desc "" desc
          # did you mean and calculate have no link
          set link ""

### ONEBOX RESULTS ###

        # answers
        # } elseif {[string match "*<div id=res class=med role=main><div class=e><h3 class=r><a href=*" $html]} {
        #  if {![regexp -- {<div id=res class=med role=main><div class=e><h3 class=r><a href="http\://www.google.com/url\?q=(.+?)\&ei=.*?">(.*?)</h3><div} $html - link desc]} {
        #    if {![regexp -- {<h3 class=r.*?<a href="(.*?)\&hl=.*?<div style=.*?>(.*?)</div>.*?<cite>(.*?)</cite>} $html - link desc url]} {
        #      if {[regexp -- {<div class=e><h3 class=r><a href="(.*?)".*?>(.*?)</a>} $html - link desc]} { set url "www.google.${titen}" }
        #    }
        #    set link "http://$url$link"
        #  }
        #  regsub -- {<div id=res class=med><div class=e><h3 class=r><a href=.+?</h3><div} $html "" html
        #  if {[info exists desc]} {
        #    regsub -- {<(.+?)>} $desc "" desc
        #    if {$::incith::google::short_answers > 0 } { 
        #      if {[info exists link]} {
        #        return "${::incith::google::desc_modes}[descdecode $desc]$incith::google::desc_demodes$::incith::google::break${::incith::google::link_modes}$link${::incith::google::link_demodes}"
        #      } else {
        #        return "${::incith::google::desc_modes}[descdecode $desc]$incith::google::desc_demodes"
        #      }
        #    }
        #  }
        # more answers
        } elseif {[string match "*\{google.rrep('answersrep'*" $html]} {
          regexp -- {<div id=res class=med role=main>.*?<h3 class=r>(.*?)</h3>} $html - desc
          regsub -all -- {google.rrep\('answersrep'} $html {} html
          if {$::incith::google::short_answers > 0 } { return "${::incith::google::desc_modes}[descdecode [string map {\002 ""} $desc]]$incith::google::desc_demodes" }
        # time:
        } elseif {[string match "*<table cellpadding=0 class=obcontainer>*" $html] == 1} {
          if {[regexp -nocase -- {<table cellpadding=0 class=obcontainer><tr><td valign=top width=100%><div><table cellspacing=0><tr><td style="font-size:medium">(.*?)</table>} $html - desc]} {
            regsub -- {<br>} $desc ". " desc
            regsub -all {<table cellpadding=0 class=obcontainer>} $desc "" desc
            if {$::incith::google::short_answers > 0 } { return "$::incith::google::desc_modes[descdecode $desc]" }
            set link ""
          }
        # area codes
        } elseif {[string match "*/images/map_icon2.gif*" $html] == 1} {
          regexp -- {<div class=e>.+?<a href="(.+?)".+?">(.+?)</a>} $html - link desc
          regsub -- {/images/map_icon2.gif} $html {} html
          if {[info exists link] == 1 && $link != ""} {
        	set link [urldecode $link]
        	if {[string match "/url?q=http*" $link] == 1} {
	        regexp -- {/url\?q=(.+?q=.+?)&} $link - link
            }
          }
          if {$::incith::google::short_answers > 0 } { return "$::incith::google::desc_modes[descdecode $desc]$::incith::google::desc_demodes$::incith::google::break${::incith::google::link_modes}$link${::incith::google::link_demodes}" }
        # zip codes
        } elseif {[string match "*&oi=geocode_result*" $html] == 1} {
          if {![regexp -nocase -- {oi=geocode_result.*?">(.*?)</a>.*?<tr valign=.*?><td valign=.*?><a href="(.+?)"} $html - desc link]} {
            regexp -- {<h3 class=r><a href="(.+?)".*?>(.+?)</a>} $html - link desc
          }
          regsub -all {\&oi=geocode_result} $html {} html
          if {[info exists link] == 1 && $link != ""} {
            set link "[urldecode $link]"
            if {[string match "/url?q=http*" $link] == 1} {
	        regexp -- {/url\?q=(.+?q=.+?)&} $link - link
            }
          }
          if {[string equal [string index $link 0] "/"]} { set link "http://maps.google.$titen$link" }
          if {$::incith::google::short_answers > 0 } { return "$::incith::google::desc_modes[descdecode $desc]$::incith::google::desc_demodes$::incith::google::break${::incith::google::link_modes}$link${::incith::google::link_demodes}" }
        # music
        } elseif {[string match "*&oi=music&ct=result*" $html] == 1} {
          regexp -- {</td><td valign=top><h2 class=r><a href=(.+?musica\?aid=.+?)\&.+?>(.+?)\002(.+?)\002} $html - link desc
          regsub -- {\&oi=music\&ct=result} $html {} html
          if {[info exists link] == 1 && $link != ""} {
            set link "[urldecode $link]"
            if {[string match "/url?q=http*" $link] == 1} {
	        regexp -- {/url\?q=(.+?q=.+?)&} $link - link
            }
          }
          if {$::incith::google::short_answers > 0} { return "$::incith::google::desc_modes[descdecode $desc]$::incith::google::desc_demodes$::incith::google::break${::incith::google::link_modes}$link${::incith::google::link_demodes}" }
        # travel info
        } elseif {[string match "*/images/airplane.gif*" $html] ==1} {
          regexp -- {<div class=e>.*?/images/airplane.gif.*?<td.+?valign=top.*?>(.*?)<a.+?href="(.+?)"(?:.*?)>(.+?)</a>} $html - d1 link d2
          regsub -- {<div class=e>.*?/images/airplane.gif.*?</a>} $html "" html
          set desc "$d1 $d2"
        # UPC codes
        } elseif {[string match "*/images/barcode.gif*" $html] ==1} {
          regexp -- {<td valign=top><h3 class=r><a href="(.+?)".*?>(.+?)</a>} $html - link desc
          regsub -- {<div class=e>.*?/images/barcode.gif.*?</a>} $html "" html
        # weather!
        } elseif {[string match "*onebox/weather*" $html]} {
          #regexp -- {<h3 class=r.*?>(.+?)</h3>.*?<div style="font.*?>(.*?)</div><div.*?>(.*?)<.*?>(.*?)<.*?>(.*?)<} $html - w1 w2 w3 w4 w5
	    if {![regexp -nocase -- {<h3 class=r.*?>(.*?)</h3>.*?<img.*?<td.*?>(.*?)<.*?<td.*?>(.*?)<.*?>(.*?)<.*?>(.*?)<.*?>(.*?)<.*?<img.*?/onebox/weather.*? title="(.*?)".*?<img.*?/onebox/weather.*? title="(.*?)".*?<img.*?/onebox/weather.*? title="(.*?)".*?<img.*?/onebox/weather.*? title="(.*?)".*?<td.*?>(.*?)<.*?<td style.*?>(.*?)<.*?<td style.*?>(.*?)<.*?>(.*?)<td.*?>(.*?)<td.*?>(.*?)<td.*?>(.*?)<.*?>(.*?)<td.*?>(.*?)<td.*?>(.*?)<td.*?>(.*?)<} $html - w1 w2 f1 f4 f7 f10 f2 f5 f8 f11 w3 w4 w5 z1 z2 z3 z4 z5 z6 z7 z8]} {
                regexp -nocase -- {<h3 class=r.*?>(.*?)</h3>.*?<img.*?<td.*?>(.*?)<.*?<td.*?>(.*?)<.*?>(.*?)<.*?>(.*?)<.*?>(.*?)<.*?<img.*?/onebox/weather.*? title="(.*?)".*?<img.*?/onebox/weather.*? title="(.*?)".*?<img.*?/onebox/weather.*? title="(.*?)".*?<td.*?>(.*?)<.*?<td style.*?>(.*?)<.*?<td style.*?>(.*?)<.*?>(.*?)<td.*?>(.*?)<td.*?>(.*?)<td.*?>(.*?)<.*?>(.*?)<td.*?>(.*?)<td.*?>(.*?)<td.*?>(.*?)<} $html - w1 w2 f1 f4 f7 f10 f2 f5 f8 f11 w4 w5 z1 z2 z3 z4 z5 z6 z7 z8
          }
          #regexp -- {<div align=center style="padding:5px.*?">(.+?)<br>.+?src="/images/weather/.*?gif" alt="(.*?)".*?<nobr>(.+?)</nobr>.+?<div align=center style="padding:.*?\:left">(.+?)<br>.+?src="/images/weather/.*?gif" alt="(.*?)".*?<nobr>(.+?)</nobr>.+?<div align=center style="padding:.*?\:left">(.+?)<br>.+?src="/images/weather/.*?gif" alt="(.*?)".*?<nobr>(.+?)</nobr>} $html - f1 f2 f3 f4 f5 f6 f7 f8 f9
          regsub -- {<h3 class=r.*?>(.*?)</table} $html {} html
          # not all weather stations report 5 results at all times
          # this make up for when we only get 4, and does it gracefully
	    if {![info exists w3]} { set w3 "" }
          if {[regexp {[0-9a-zA-Z]} $w3]} { set w3 ", $w3" }
          if {[regexp {[0-9a-zA-Z]} $w4]} { set w4 ", $w4" }
          if {![regexp {[0-9a-zA-Z]} $w5]} {
            set w5 ""
          } else {
            set w5 "; $w5"
          }
          set desc "$w1\: $w2$w3$w4$w5; $f1: $f2 \($z1/$z2\); $f4: $f5 \($z3/$z4\); $f7: $f8 \($z5/$z6\)"
          regsub -all -- {&deg;} $desc {°} desc
          set link ""
          regsub -all -- {weather} $input {} input
          if {$::incith::google::short_answers > 0 } { return "$::incith::google::desc_modes[descdecode $desc]" }
        # public_data:
        } elseif {[string match "*/publicdata</div></div>*" $html]} {
          regexp -nocase -- {valign=top><h3 class=r><a href=.*?>(.*?)</a>.*?<tr><td style.*?><a href="(.*?)".*?<td valign=top.*?>(.*?)<br>} $html - tit link des
          regsub -all {<.*?>} $des "" des
          regsub -- {/publicdata</div></div>} $html "" html
          set desc "$tit: $des"
          if {[info exists link] == 1 && $link != ""} {
            if {[string match "*\&sa\=X*" $link]} {
              regexp -- {(^.+?)&sa\=} [urldecode $link] - link
            }
            if {[string match "\/url\?q=*" $link]} {
              regexp -- {\/url\?q=(.*?)$} $link - link
            }
            regexp -- {(.+?)\&ei=} $link - link
          }
          if {$::incith::google::short_answers > 0 } {
            return "${::incith::google::desc_modes}[descdecode ${desc}]${::incith::google::desc_demodes}"
          }
        # define:
        } elseif {[string match "*<ul type=*" $html]} {
          #[string match "*define:*" $input] == 1
          set output "" 
          regexp -- {<ul type=.+?<li>(.+?)(?=\s*<li>|<br>).*<a href.*(http.+?)">} $html - desc link
          regsub -- {<u1 type=.+?><li>(.+?)(?=\s*<li>|<br>)} $html {} html
          regsub -all -- {\+} $input {%2B} define_input
          regsub -all -- { } $define_input {+} define_input
          if {[info exists link] == 1 && $link != ""} {
            regexp -- {(.+?)\&sig=} $link - link
            regexp -- {(.+?)\&usg=} $link - link
            regexp -- {(.+?)\&ei=} $link - link
            regexp -- {(.+?)\&sa=} $link - link
            set link "[urldecode $link]"
            regsub -all " " $link "%20" link
            append link " ( http://www.google.${titen}/search?q=${define_input} )"
          } else {
            if {![regexp -- {</div><div class=med style=".*?"><p>(.+?)\.<br><br>} $html - no_def]} {
              if {![regexp -- {<div class=med style=".*?"><br>(.+?)<br><br>} $html - no_def]} {
                if {![regexp -- {<!--z--><p>(.*?)<br>} $html - no_def]} {
                  set no_def "Houston, we have a problem. Aborting lift-off!"
                }
              }
            }
            regsub -- {</a>} $no_def "." no_def
            regsub -all -- {<(.+?)>} $no_def "" no_def
            return "${::incith::google::desc_modes}${no_def}${::incith::google::desc_demodes}"
          }
        } elseif {[string match "*oi=define*" $html]} {
          if {[string match "*oi=spell*" $html]} {
            regexp -- {</div><div class=med style=.*?><p>(.*?)<p>(.*?)<p>} $html - desc link
            regsub -- {</a>} $desc "?" desc
            regsub -all -- {<.*?>} $desc "" desc
            regsub -all -- {<.*?>} $link "" link
            return "${::incith::google::desc_modes}${desc} ${link}${::incith::google::desc_demodes}"
          }
          regexp -- {<div class=med style=.*?><p>(.*?)<br>.*?<a href=.*?>(.*?)</a>} $html - desc link
          regsub -- {<div class=med style=.*?><p>.*?<br>.*?<a href=.*?>.*?</a>} $html "" html 
          regsub -all -- {<(.+?)>} [string map {"<li>" " "} $desc] "" desc
          if {![string match "http*" $link]} { set link "http://$link" }
          regsub -all -- {\+} $input {%2B} define_input
          regsub -all -- { } $define_input {+} define_input
          set link "${link} ( http://www.google.${titen}/search?q=${define_input} )"
          return "${::incith::google::desc_modes}${desc}${incith::google::break}${link}${::incith::google::desc_demodes}"
        # finance / stock quotes
        } elseif {[string match "*<a href=\"/url\?q=http://finance.google.com/finance%3Fclient%3D*" $html] == 1} {
          # this has to be one of the worst regexps ever written !
          regexp -- {<a href="/url\?q=http://finance.google.com/finance%3Fclient%3D.*?">(.*?)</a>(.*?)<.*?<td colspan=3 nowrap>(.+?)</td>.*?Mkt Cap:.*?<td.*?>(.+?)</td>} $html - tick name price mktcap
          regsub -- {<div class=e><div><a href="/url\?q=http://finance.google.com/finance%3Fclient%3D.*?">(.*?)</a>(.*?)<.*?<td colspan=3 nowrap>(.+?)</td>.*?Mkt Cap:.*?<td.*?>(.+?)</td>} $html {} html
          if {[info exists tick] == 1 && [info exists name] == 1 && [info exists price] == 1} {
            set desc "$tick: $name = $$price"
          	set link "http://finance.google.com/finance?q=$tick"
		regsub -all -- "\002" $link {} link
          	if {[info exists mktcap] == 1} { append desc " Mkt Cap: $mktcap" }
          	unset tick ; unset name ; unset price ; unset mktcap
          }
          if {$::incith::google::short_answers > 0 } { return "$::incith::google::desc_modes[descdecode $desc]" }
        # patents
        } elseif {[string match "*/images/magnifier.gif*" $html] ==1} {
          regexp -- {<td valign=top><a href="(http://patft.uspto.gov/.+?)".+?">(.+?)</a>} $html - link desc
          regsub -- {/images/magnifier.gif} $html {} html
        # calculator
        } elseif {[string match "*<img src=/images/calc_img*" $html] || [string match "*<img src=\"/images/icons/onebox/calculator*" $html]} {
          set calc 1
          # remove bold codes from the html, not necessary here.
          regexp -nocase -- {/calc.*?<h2 class=.*?>(.+?)</h2>} $html - desc
          regsub -all -- {<(.+?)>} $desc "" desc
          if {$::incith::google::short_answers > 0 } { return "$::incith::google::desc_modes[descdecode $desc]" }
          set link ""
        # conversion
        } elseif {[string match "*oi=currency_onebox*" $html] == 1} {
          set calc 1
          regexp -nocase -- {<h3 class=r>(.*?)<} $html - desc
          regsub -nocase -- {oi=currency_onebox} $html {} html
          if {$::incith::google::short_answers > 0 } { return "$::incith::google::desc_modes[descdecode $desc]" }
          set link ""
        # whois
        } elseif {[string match "*\002Whois\002 record for*" $html] == 1} {
          if {[regexp -- {<h3 class=r.*?<a href="(.*?)".*?>(.*?)</a>.*?<tr><td>(.*?)<tr>} $html - link desc descwho]} {
            regsub -- {<h3 class=r.*?<a href=".+?".*?>.+?</a>.*?<tr>.*?<tr>} $html "" html 
            append desc " \(${descwho}\)"
          }
          if {[info exists link] == 1 && $link != ""} {
            if {[string match "*\&sa\=X*" $link]} {
              regexp -- {(^.+?)&} $link - link
            }
            if {[string match "\/url\?q=*" $link]} {
              regexp -- {\/url\?q=(.*?)$} $link - link
            }
          }
          if {$::incith::google::short_answers > 0 } { return "$::incith::google::desc_modes[descdecode $desc]$::incith::google::desc_demodes$::incith::google::break${::incith::google::link_modes}$link${::incith::google::link_demodes}" }
### END ONEBOX ###

        # spell: # special query - not onebox
        } elseif {$spell == 1} {
          if {[regexp {<div id=res class=med><p>(.*?)</a>} $html - titem]} {
            regsub -all {<.*?>} $titem "" titem
            set desc "$incith::google::total_modes${titem}$incith::google::total_demodes$incith::google::desc_modes${did_you_mean}$incith::google::desc_demodes"
          } else {
            if {$match != "Google"} {
              return "${::incith::google::total_modes}\002${match}\002 ${titem}"
            } else {
              return "$incith::google::total_modes$did_you_mean$incith::google::total_demodes$incith::google::desc_modes$no_search"
            }
          }
          if {[string len $desc] < 2} {
            set desc "$incith::google::desc_modes$no_search$incith::google::desc_demodes"
          }
          set link ""
        # regular search
        } else {
          #if {![regexp -- {class=g(?!b).*?<a href="(.*?)".*?>((?!<).*?)</a>} $html - link desc]} {
          #  if {[regexp -nocase {class=(?:r|"r")><a\s*href="(.*?)">(.*?)</a>} $html - link desc ]} {
          #    regsub -nocase {class=(?:r|"r")><a\s*href=".+?">.*?</a>} $html "" html
          #  }
          #} else {
          #  regsub -- {class=g(?!b).*?<a href=".*?".*?>.+?</a>} $html "" html
          #}
	    if {![regexp -- {class="g">.*?<a href="(.*?)".*?>(.*?)</a>} $html - link desc]} {
            if {[regexp -- {class=g>.*?<a href="(.*?)".*?>(.*?)</a>} $html - link desc]} {
              regsub -- {class=g>.*?<a href=".*?".*?>.*?</a>} $html "" html
              regexp -- {^(.*?)</a></h3>} $desc - desc
            }
          } else {
            regsub -- {class="g">.*?<a href=".*?".*?>.*?</a>} $html "" html
            regexp -- {^(.*?)</a></h3>} $desc - desc
          }
 
          if {[info exists link] == 1} {
            if {[string match "*&rct=j*" $link]} {
              regexp -- {(^.+?)&rct=j} $link - link
            }
		if {[string match "*\&sa=U*" $link]} {
              regexp -- {(^.+?)&sa=U} $link - link
            }
          }
          if {[info exists link] == 1} { 
            if {[string match "*http*" $link] == 0} {
              set link ""
            } elseif {[string match *.pdf $link] == 1} {
              set desc "\[PDF\] $desc"
            }
          }
          if {($::incith::google::skip_self > 0) && ([info exists link])} {
            if {[string match "*.google.*" $link]} { 
              unset link ; unset desc ; set spell 0 ; set calc 0 ; set break 0
              continue
            }
          }
          # trim the description
          if {[info exists desc] == 1 && $incith::google::description_length > 0} {
            set desc [string range $desc 0 [expr $incith::google::description_length - 1]]
          }
        }
        if {[info exists desc]} { set desc [descdecode $desc] }
        # make sure we have something to send
        if {[info exists desc] == 0} {
          if {$match == "Google"} {
            if {[string match "*<img src=/images/calc_img*" $titem] == 1} {
              regexp -nocase -- {calc_img.+?nowrap>(.+?)</} $titem - desc
              regexp -- {^(.+?)</td></tr>} $desc - desc
              set reply "${desc}"
            } else {
              if {![string length [set reply [string trim "${no_search}"]]]} { set reply "derp." }
            }
            return "$incith::google::desc_modes$reply"
          }
          return $output
        }

        if {[info exists link] == 1} {
          if {[string match "*http*" $link] == 0} {
            set link ""
          }
        }
        set desc [string trim $desc]
        regsub -all "%20" $desc " " desc
        regsub -all "<br>" $desc " " desc

        # add the search result
        if {$calc == 0 && $spell == 0 && $populate == 0} {
          if {[info exists link] && $link != ""} {
            if {![string match "*define:*" $input]} {
              set link [urldecode $link]
              regsub -all " " $link "%20" link
            }
            # added because of recent google changes, needed to clean-up *.google.* links
            if {[string match "*url\?*" $link]} {
              regexp -- {url\?q=(.+?)$} $link - link
              regexp -- {(.+?)\&sig=} $link - link
              regexp -- {(.+?)\&usg=} $link - link
              regexp -- {\?url=(.+?)$} $link - link
            }
            # top result may be news, at the moment it is too close to regular
            # search results to cull this out.. so in the meantime, this hack
            # will at least remove the 10,000 google tags at the end of the url
            # to keep it from spanning 2 lines of results.
            if {[string match "http://news.google*" $link]} {
               regexp -- {^(.+?)&hl=} $link - link
            }
            regsub -all "(?:\x93|\x94|&quot;|\")" $link {} link
            if {[info exists desc]} { set desc "$incith::google::desc_modes[string trim $desc]$incith::google::desc_demodes" }
            if {[info exists link]} { set link "$incith::google::link_modes[string trim $link]$incith::google::link_demodes" }
            if {$incith::google::link_only == 1} { 
              append output "${link}${incith::google::seperator}"
            } else {
              append output "$desc$::incith::google::break${link}${incith::google::seperator}"
            }
          } else {
            append output "$desc${incith::google::seperator}"
          }
        } else {
          set output "$desc"
        }

        # I've hard-coded it to only fetch one result for define lookups, and
        #   spell shouldn't ever have to loop.
        if {[string match "define:*" $input] == 1 || $spell == 1 || $calc == 1 || $break == 1 } {
          break
        }

        # increase the results, clear the variables for the next loop
        unset link ; unset desc ; set spell 0 ; set calc 0 ; set break 0
        incr results
      }

      # make sure we have something to send
      if {$output == "" && ![string match "*:*" $input] && ![string match "*<img src=/images/calc_img*" $html] } {
        set reply "${no_search}"
        return "$::incith::google::desc_modes$reply"
      }
      return $output
    }

    # IMAGES
    # fetches a list of links to images from images.google.
    #
    proc images {input} {
	; set results 0 ; set output ""; set match "" ; set titem "" ; set no_search "" ; set did_you_mean ""

	# fetch the html
	set html [fetch_html $input 2]

	# user input causing errors?
	if {[string match -nocase "*socketerrorabort*" $html]} {
		regsub {(.+?)\|} $html {} html
		return "${::incith::google::error_modes}Socket Error accessing '${html}' .. Does it exist?${::incith::google::error_demodes}"
	}
	if {[string match -nocase "*timeouterrorabort*" $html]} {
		return "${::incith::google::error_modes}Connection has timed out...${::incith::google::error_demodes}"
	}

	# strip out 'did you mean?' first
	# what do we call 'no search results in any language?'
	if {![regexp -- {--></script><div>(.+?)<br><br>} $html - no_search]} {
		if {![regexp -- {</a></div><div><p>(.+?)<br><br>} $html - no_search]} {
			if {![regexp -- {<table border=0 cellpadding=0 cellspacing=0><tr><td class=j><br>(.+?)<br><br>} $html - no_search]} {
				if {![regexp -- {<div id="res"><div id="ires">(.*?)<br><br>} $html - no_search]} {
					if {![regexp -- {<div class="sd" id="resultStats"></div><div id="res">.*?<p>(.*?)</p>} $html - no_search]} {
						if {[regexp -- {<div class="sd" id="resultStats"></div><div id="spe".*?<div.*?>(.*?)</p>} $html - no_search]} {
							regsub -all -- {</a>} $no_search ". " no_search
							regsub -all -- {<.*?>} $no_search "" no_search
						}
					}
				}
			}
		}
	}
	if {$no_search != ""} {
		regsub -- {</a>} $no_search "? " no_search
		regsub -all -- {<(.+?)>} $no_search { } no_search
		while {[string match "*  *" $no_search]} {
			regsub -all -- {  } $no_search " " no_search
		}
		set no_search [string trim $no_search]
	}

	# give results an output header with result tally.
	 if {[regexp -- {<td colspan.*?>.*?<div class=.*?id="resultStats">(.*?)</div>} $html - match]} {
		set titem [lindex [split $match] 2]
		set match [lindex [split $match] 1]
		regsub -all -- {<(.+?)>} $match {} match
		# format output according to variables.
		if {$incith::google::total_results != 0 && $match > 0} {
			set output "${::incith::google::total_modes}\002[descdecode [string trim ${match}]]\002 [descdecode [string trim $titem]]${::incith::google::total_demodes}${incith::google::seperator}"
			if {$incith::google::bold_descriptions == 0} {
				regsub -all -- "\002" $output {} output
			}
		}
	} elseif {[regexp -- {<div id="resultStats">(.*?)</div>} $html - match]} {
		set titem [lindex [split $match] 2]
		set match [lindex [split $match] 1]
		regsub -all -- {<(.+?)>} $match {} match
		# format output according to variables.
		if {$incith::google::total_results != 0 && $match > 0} {
			set output "${::incith::google::total_modes}\002[descdecode [string trim ${match}]]\002 [descdecode [string trim $titem]]${::incith::google::total_demodes}${incith::google::seperator}"
			if {$incith::google::bold_descriptions == 0} {
				regsub -all -- "\002" $output {} output
			}
		}
      }

      regexp -- {<div id="ires">(.+)$} $html - html
	# parse the html
	while {$results < $incith::google::image_results} {
		if {[regexp -- {href="/url\?q=(.*?)\&.*?<img height=.*?src="(.*?)".*?<cite title="(.*?)".*?<br>(.*?)<br>(.*?)</td>} $html - page link site desc attrib]} {
			regsub -- {href="/url\?q=.*?<img height=.*?src=".*?".*?<cite title=".*?".*?<br>.*?<br>.*?</td>} $html {} html
			regsub -all -- {(?:<b>|</b>)} [descdecode [string trim $desc]] "\002" desc
			set desc2 " ([urldecode $page] - [string trim [string map [list "*" "x" " " ""] [join [lrange [split $attrib "-"] 0 1] "-"]]])"
		}
		# if there's no link, return or stop looping, depending
		if {[info exists link] == 0} {
			if {$results == 0} {
				set reply $no_search
				return "$::incith::google::desc_modes$reply$::incith::google::desc_demodes"
			} else {
				break
			}
		}
		# prevent duplicate results is mostly useless here, but will at least
		#   ensure that we don't get the exact same picture.
		if {[string match "*$link*" $output] == 1} {
			break
		}
		if {$incith::google::desc_modes != ""} { set desc "$incith::google::desc_modes${desc}$incith::google::desc_demodes" }
		if {$incith::google::desc_modes != ""} { set desc2 "$incith::google::desc_modes${desc2}$incith::google::desc_demodes" }
		if {$incith::google::link_modes != ""} { set link "$incith::google::link_modes${link}$incith::google::link_demodes" }

		# add the search result
		append output "$desc$desc2$::incith::google::break${link}${incith::google::seperator}"

		# increase the results, clear the variables for the next loop just in case
		unset link
		incr results
	}

	# make sure we have something to send
	if {$match == ""} {
		set reply "${no_search}"
		return "$::incith::google::desc_modes$reply$::incith::google::desc_demodes"
	}
	return $output
    }

    # LOCAL
    # fetches a list of address & phone numbers from local.google.
    # -speechless updated
    proc local {input} {
      ; set results 0 ; set output ""; set match "" ; set titem "" ; set no_search "" ; set did_you_mean "" ; set titen ""

      # fetch the html
      set html [fetch_html $input 3]
      regsub -all {&#8206;} $html "" html

      # this isn't global, so we need to keep ctry (country) here
      regexp -nocase -- {^\.(.+?)\s(.+?)$} $input - titen input
      if {$titen == ""} {
        set titen "${incith::google::google_country}" 
      }

      # user input causing errors?
	if {[string match -nocase "*socketerrorabort*" $html]} {
            regsub {(.+?)\|} $html {} html
            return "${::incith::google::error_modes}Socket Error accessing '${html}' .. Does it exist?${::incith::google::error_demodes}" 
	}
	if {[string match -nocase "*timeouterrorabort*" $html]} {
		return "${::incith::google::error_modes}Connection has timed out...${::incith::google::error_demodes}" 
	}

      # strip out 'did you mean?' first
      # what do we call 'no search results in any language?'
      if {![regexp -- {<div class=spacer></div></div></div><br><p>(.+?)</p>} $html - no_search]} {
        if {[regexp -- {<table cellpadding=0 cellspacing=0><tr valign=top><td>(.+?)<br><br>} $html - no_search]} {
          set no_search [string map {"<br>" "; "} $no_search]
          regsub -all -- {<.*?>} $no_search "" no_search
          set no_search [string trim $no_search "; "]
        } elseif {[regexp -- {<div class="suggest noprint">(.*?)</a>} $html - no_search]} {
          regsub -all -- {<.*?>} $no_search "" no_search
        } elseif {[regexp -- {<div id=refsec class="suggest noprint">(.*?)<div class=ref>(.*?)<div id=bottomads} $html - did extra]} {
          foreach {- m} [regexp -all -inline {<a href=.*?>(.*?)</a>} $extra] { lappend matches $m }
          set no_search "$did [join $matches "; "]"
        } 
      }
      if {[regexp -- {<div class="noprint res">.*?<p>(.*?)</p>} $html - more]} {
        append no_search "$more"
      }

      # give results an output header with result tally.
      if {![regexp -- {<form name="qmod".*?<br/>(.+?)\s\002(.+?)</form>} $html - titem match]} {
        if {![regexp -- {<form name="qmod".*?>(.+?)\s\002(.+?)</form>} $html - titem match]} {
          if {![regexp -- {<div id=contentpanel>.*?<form name=qmod>(.+?)\s\002(.+?)</form>} $html - match titem]} {
            if {[regexp -- {<div class="noprint">(.*?)</div>} $html - match]} {
              regsub -all -- {<.*?>} $match "" match
              set match [split [string trim $match]] ; set titem [lindex $match end] ; set match [lindex $match end-1]
              if {![string length [string trim $match]]} { set match "Google" ; set titem "" }
            } else {
              set match "Google"
              set titem ""
            }
          }
        }
      }
      regsub -all -- {<(.+?)>} $match {} match
      # format output according to variables.
      if {$incith::google::total_results != 0} {
        set output "${::incith::google::total_modes}[string trim ${match}] [descdecode [string trim $titem]]${::incith::google::total_demodes}${incith::google::seperator}"
        if {$incith::google::bold_descriptions == 0} {
          regsub -all -- "\002" $output {} output
        }
      }
      # parse the html
      while {$results < $incith::google::local_results} {
        if {[regexp -nocase {class="name lname.*?<a.*?>(.*?)</a>.*?href=".*?cid=(.*?)\&q.*?</a></nobr>.*?</div> <div>(.*?)<div>} $html - loc url add1 desc]} {
          regsub -nocase {class="name lname.*?<a.*?>.*?</a>.*?href=".*?cid=.*?\&q.*?</a></nobr>.*?</div> <div>.*?<div>} $html "" html
        } elseif {[regexp -nocase {<div class=lname>.*?href=(.*?) .*?">(.*?)</a></div></div><div class=atxt dir=ltr>(.*?)</div>(.*?)<} $html - url loc add1 desc]} {
          regsub {<div class=lname>.*?href=(.*?) .*?">(.*?)</a></div></div><div class=atxt dir=ltr>(.*?)</div>} $html "" html
        }
        #regsub -nocase {<div class="name.*?href=.*?>.*?</a>.*?<div><div>.*?</div>.*?<div align=left>.*?</div>.*?<a class=f href=(.*?)>} $html "" html
        if {[info exists url]} {
          if {![string match -nocase "*maps.google*" $url]} {
            regexp -- {^/local.*?q=(.*?)(?:$| )} $url - url
            regsub -- {^/maps} $url "http://maps.google.$titen/maps" url
            regexp -- {^(.*?)&dq=} $url - url
          }
          regexp -- {^(.*?) } $url - url
        }
        # if there's no link, return or stop looping, depending
        if {![info exists loc]} {
          if {$results == 0} {
            set reply $no_search
            return "$incith::google::desc_modes$reply$::incith::google::desc_demodes"
          } else {
            return $output
            break
          }
        }
        regsub -all -- "<.*?nobr>" $add1 {} add1
        regsub -all -- "&lrm;" $add1 {} add1
        if {$incith::google::desc_modes != ""} { set loc "$incith::google::desc_modes${loc}$incith::google::desc_demodes" }
        if {$incith::google::link_modes != ""} { set link "$incith::google::link_modes${add1}$incith::google::link_demodes" } { set link $add1 }
        
        # add the search result
        if {$incith::google::link_only == 1} { 
          append output "${link} ${incith::google::seperator}"
        } else {
          append output "[descdecode ${loc}]$::incith::google::break${link}${incith::google::seperator}"
        }

        # increase the results, clear the variables for the next loop just in case
        unset loc ; unset link ; unset desc
        incr results
      }
      return $output
    }

    # GROUPS
    # fetches a list of threads from groups.google.
    # -speechless updated
 
    proc groups {input} {
      ; set results 0 ; set output "" ; set match "" ; set no_search "" ; set titem "" ; set titen ""

      # this isn't global, so we need to keep ctry (country) here
      regexp -nocase -- {^\.(.+?)\s(.+?)$} $input - titen dummy
      if {$titen == ""} {
        set titen "${incith::google::google_country}" 
      }

      # fetch the html
      set html [fetch_html $input 4]

      # user input causing errors?
	if {[string match -nocase "*socketerrorabort*" $html]} {
            regsub {(.+?)\|} $html {} html
            return "${::incith::google::error_modes}Socket Error accessing '${html}' .. Does it exist?${::incith::google::error_demodes}" 
	}
	if {[string match -nocase "*timeouterrorabort*" $html]} {
		return "${::incith::google::error_modes}Connection has timed out...${::incith::google::error_demodes}" 
	}

      # strip out 'did you mean?' first
      # what do we call 'no search results in any language?'
      regexp -- {<div id=res><p>(.+?)</div><div>} $html - no_search
      if {$no_search != ""} {
        regsub -- {</a>} $no_search "? " no_search
        regsub -all -- {<(.+?)>} $no_search { } no_search
        while {[string match "*  *" $no_search]} {
          regsub -all -- {  } $no_search " " no_search
        }
        set no_search [string trim $no_search]
      }

      # give results an output header with result tally.
      regexp -- {</td><td align="right".*?>(.+?)\s\002(.+?)(\[|<)} $html - titem match
      if {![regexp -- {1\002\s-\s.+?\002.+?\002(.+?)\002} $match - match]} {
         set match "Google"
         set titem ""
      }
      regsub -all -- {<(.+?)>} $match {} match
      # format output according to variables.
      if {$incith::google::total_results != 0 && $match > 0} {
        set output "${::incith::google::total_modes}\002[string trim ${match}]\002 [descdecode [string trim $titem]]${::incith::google::total_demodes}${incith::google::seperator}"
        if {$incith::google::bold_descriptions == 0} {
          regsub -all -- "\002" $output {} output
        }
      } 

      # parse the html
      while {$results < $incith::google::group_results} {
        # this grabs a google group if one exists
        # this grabs a usenet group if one exists
        if {[regexp -- {<div class="gdrr"><a\s+href="(.+?)".*?>(.+?)</a>.+?</td></tr></table>} $html {} thread desc]} {
          regsub -- {<div class="gdrr">(.+?)</td></tr></table>} $html "" html
          if {[regexp -- {url\?(?:url|q)=(.+?)\&} $thread - thread]} {
            regexp -- {^(.+?)&(?:sa|ie|ei)=} $thread - thread
            set thread [urldecode $thread]
            if {[regexp -- {url\?(?:url|q)=(.+?)\&} $thread - thread]} {
              regexp -- {^(.+?)&(?:sa|ie|ei)=} $thread - thread
              set thread [urldecode $thread]
            }
          }
        } elseif {[regexp -- {<div class="g".*?href="(.+?)".*?>(.+?)</a>} $html - thread desc]} {
          regsub -- {div class="g".*?href=".+?".*?>(.+?)</td></tr>} $html "" html
          if {[regexp -- {url\?(?:url|q)=(.+?)\&} $thread - thread]} {
            regexp -- {^(.+?)&(?:sa|ie|ei)=} $thread - thread
            set thread [urldecode $thread]
            if {[regexp -- {url\?(?:url|q)=(.+?)\&} $thread - thread]} {
              regexp -- {^(.+?)&(?:sa|ie|ei)=} $thread - thread
              set thread [urldecode $thread]
            }
          }
        }

        # if there's no desc, return or stop looping, depending
        if {[info exists desc] == 0} {
          if {$results == 0} {
            set reply $no_search
            return "$::incith::google::desc_modes$reply$::incith::google::desc_demodes"
          } else {
            break
          }
        }

        if {[info exists desc] == 1 && $incith::google::description_length > 0} {
          set desc [string range $desc 0 [expr $incith::google::description_length - 1]]
          set desc [string trim $desc]
        }

        # make the link valid because we only got a partial href result, not a full url
        set link $thread

        if {[info exists desc]} { set desc "$incith::google::desc_modes[string trim $desc]$incith::google::desc_demodes" }
        if {[info exists link]} { set link "$incith::google::link_modes[string trim $link]$incith::google::link_demodes" }

        # add the search result
        if {$incith::google::link_only == 1} { 
          append output "${link}${incith::google::seperator}"
        } else {
          append output "[descdecode $desc] $::incith::google::break${link}${incith::google::seperator}"
        }

        # increase the results, clear the variables for the next loop just in case
        unset link; unset desc
        incr results
      }

      # make sure we have something to send
      if {$match == ""} {
        set reply $no_search
        return "$::incith::google::desc_modes$reply$::incith::google::desc_demodes"
      }
      return $output
    }

    # NEWS
    # fetches the news from news.google.
    # -madwoota supplied, speechless updated
    #
    proc news {input} {
      ; set results 0 ; set output ""; set match ""
      ; set no_search "" ; set titem ""
 
      # fetch the html
      set html [fetch_html $input 5]

      # user input causing errors?
	if {[string match -nocase "*socketerrorabort*" $html]} {
            regsub {(.+?)\|} $html {} html
            return "${::incith::google::error_modes}Socket Error accessing '${html}' .. Does it exist?${::incith::google::error_demodes}" 
	}
	if {[string match -nocase "*timeouterrorabort*" $html]} {
		return "${::incith::google::error_modes}Connection has timed out...${::incith::google::error_demodes}" 
	}
      # strip out 'did you mean?' first
      # what do we call 'no search results in any language?'
      if {![regexp -- {<div class="spelling-correction">(.+?)</p><p>} $html - no_search]} {
        regexp -- {<div class="no-results">(.+?)</p>} $html - no_search
      }
      if {$no_search != ""} {
        regsub -- {</a>} $no_search "? " no_search
        regsub -all -- {<(.+?)>} $no_search { } no_search
        while {[string match "*  *" $no_search]} {
          regsub -all -- {  } $no_search " " no_search
        }
        set no_search [string trim $no_search]
      }

      # give results an output header with result tally.
      regexp -- {<div class="results-stats">(.+?)\s\002(.+?)\(\002} $html - titem match
      if {![regexp -- {1\002\s&ndash;\s\002.+?\002.+?\002(.+?)\002} $match - match]} {
         set match "Google"
         set titem ""
      }
      regsub -all -- {<(.+?)>} $match {} match
      # format output according to variables.
      if {$incith::google::total_results != 0 && $match > 0} {
        set output "${::incith::google::total_modes}\002[string trim ${match}]\002 [descdecode [string trim $titem]]${::incith::google::total_demodes}${incith::google::seperator}"
        if {$incith::google::bold_descriptions == 0} {
          regsub -all -- "\002" $output {} output
        }
      }

      # parse the html
      while {$results < $incith::google::news_results} {
        # somewhat extenuated regexp due to allowing that there *might* be
        # an image next to the story
	  # <h2 class="title">.*?<a class.*?>.*?<a.*?href="(.+?)".*?>(.+?)</a>.+?<div class="sub-title">(.+?)</div>
        if {[regexp -- {<h3 class="title">.*?<a target.*?href="(.+?)".*?>(.+?)</a>.+?<div class="sub-title">(.+?)</div>} $html {} link desc time]} {
          regsub -all -- {<.*?>} $time "" time
          regsub -- {<h3 class="title">.*?<a.*?href=".+?".*?>.+?</a>.+?<div class="sub-title">.+?</div>} $html {} html
        } elseif {[regexp -- {<h2 class="esc-lead-article-title">(.*?)<table id=} $html {} entry]} {
          regexp -- {url="(.*?)"} $entry - link
          regexp -- {class="titletext">(.*?)</span} $entry - desc 
          if {![regexp -- {class=.esc-.*?-source.>(.*?)</span>} $entry - src]} { set src "" }
          if {![regexp -- {class=.esc-.*?-timestamp.>(.*?)</span>} $entry - time]} { set time "" }
          regsub -all -- {<.*?>} $time "" time
          regsub -all -- {&lrm;} $time "" time
          regsub -- {<h2 class="esc-lead-article-title">.*?<table} $html {} html
        }

        # if there's no desc, return or stop looping, depending
        if {[info exists desc] == 0} {
          if {$results == 0} {
            set reply $no_search
            return "$::incith::google::desc_modes$reply$::incith::google::desc_demodes"
          } else {
            break
          }
        }
        
        if {[info exists desc] == 1 && $incith::google::description_length > 0} {
          set desc [string range $desc 0 [expr $incith::google::description_length - 1]]
          set desc [descdecode [string trim $desc]]
        }

        # prevent duplicate results is mostly useless here, but will at least
        #   ensure that we don't get the exact same article.
        if {[string match "*$link*" $output] == 1} {
          break
        }
       
        if {[info exists desc]} { set desc "$incith::google::desc_modes$desc$incith::google::desc_demodes" }
        if {[info exists src]} { set src "$incith::google::desc_modes$src$incith::google::desc_demodes" }
        if {[info exists time]} { set time "$incith::google::desc_modes[descdecode [string trim $time]]$incith::google::desc_demodes" }
        if {[info exists link]} { set link "$incith::google::link_modes[string trim $link]$incith::google::link_demodes" }
        # add the search result
        if {$incith::google::link_only == 1} { 
          append output "${link}${incith::google::seperator}"
        } else {
          append output "$desc \($src - $time\)$::incith::google::break${link}${incith::google::seperator}"
        }

        # increase the results, clear the variables for the next loop just in case
        unset link; unset desc
        incr results
      }

      # make sure we have something to send
      if {$match == ""} {
        set reply $no_search
        return "$::incith::google::desc_modes$reply$::incith::google::desc_demodes"
      }
      return $output
    }

    # PRINT
    # fetches book titles from books.google.
    # -madwoota supplied, -broken-
    # -speechless updated, fixed no longer using print.google
    #
    proc print {input} {
      ; set results 0 ; set output "" ; set titem "" ; set no_search "" ; set did_you_mean "" ; set titen ""
      ; set match ""

      # this isn't global, so we need to keep ctry (country) here
      regexp -nocase -- {^\.(.+?)\s(.+?)$} $input - titen dummy
      if {$titen == ""} {
        set titen "${incith::google::google_country}" 
      }
      if {[string match -nocase "*/intl/*" $titen]} {
        set lng [lindex [split $titen /] end]
        set titen [lindex [split $titen /] 0]
        set uselang 1
      }

      # fetch the html
      set html [fetch_html $input 6]

      # user input causing errors?
	if {[string match -nocase "*socketerrorabort*" $html]} {
            regsub {(.+?)\|} $html {} html
            return "${::incith::google::error_modes}Socket Error accessing '${html}' .. Does it exist?${::incith::google::error_demodes}" 
	}
	if {[string match -nocase "*timeouterrorabort*" $html]} {
		return "${::incith::google::error_modes}Connection has timed out...${::incith::google::error_demodes}" 
	}

      # strip out 'did you mean?' first
      # what do we call 'no search results in any language?'
      regexp -- {<td id="main_content">(.*?)</p>} $html - no_search

      # if we have a no search results message, let's format it for displaying possibly.
      if {$no_search != ""} {
        #regsub -all -- {\002\002} $no_search "\002" no_search
        regsub -- {</a></div>} $no_search "? " no_search
        regsub -all -- {<(.+?)>} $no_search { } no_search
        while {[string match "*  *" $no_search]} {
          regsub -all -- {  } $no_search " " no_search
        }
        set no_search [string trim $no_search]
      }

      # give results an output header with result tally.
      regexp -- {<td align=right>(.+?)\s\002(.+?)\(\002} $html - titem match
      if {![regexp -- {1\002\s-\s\002.+?\002.+?\002(.+?)\002} $match - match]} {
         set match "Google"
         set titem ""
      }

      regsub -all -- {<(.+?)>} $match {} match
      # format output according to variables.
      if {$incith::google::total_results != 0 && $match > 0} {
        set output "${::incith::google::total_modes}\002[string trim ${match}]\002 [descdecode [string trim $titem]]${::incith::google::total_demodes}${incith::google::seperator}"
        if {$incith::google::bold_descriptions == 0} {
          regsub -all -- "\002" $output {} output
        }
      } 

      while {$results < $incith::google::print_results} {
        if {[regexp -- {<div class=resbdy><h2 class="resbdy">(.*?)</table>} $html - snippet]} {
          if {![regexp -- {<a.*?href=".+?id=(.+?)&pg=(.*?)&.*?".*?>(.+?)</a></h2>(.+?)<br} $snippet - id page desc author]} {
            regexp -- {<a.*?href=".+?id=(.+?)&.*?".*?>(.+?)</a></h2>(.+?)<br} $snippet - id desc author
          }
          regsub -- {<div class=resbdy><h2 class="resbdy"><a.*?href=(.+?)</table>} $html "" html
        }

        # if there's no desc, return or stop looping, depending
        if {![info exists desc]} {
          if {$results == 0} {
            set reply $no_search
            return "$::incith::google::desc_modes$reply$::incith::google::desc_demodes"
          } else {
            break
          }
        }

        # this cleans up perhaps bad html cuts
        if {[info exists desc]} {
          regsub -all -- {<(.+?)>} $desc "" desc
          set desc [string trim $desc]
        }

        if {[info exists desc]} {
          regsub -all -- {<(.+?)>} $author "" author
          set author [string trim $author]
        }

        # make link by appending book id
        if {[info exists page]} { set page "&pg=$page" } { set page "" }
        if {[info exists uselang]} {
          set link "http://books.google.${titen}?hl=${lng}&id=${id}${page}"
        } else {
          set link "http://books.google.${titen}?id=${id}${page}"
        }
   
        # prevent duplicate results is mostly useless here, but will at least
        # ensure that we don't get the exact same article.
        #if {[string match "*$link*" $output] == 1} {
        # break
        #}
        append desc " (${author})"
        if {[info exists desc]} { set desc "$incith::google::desc_modes[string trim $desc]$incith::google::desc_demodes" }
        if {[info exists link]} { set link "$incith::google::link_modes[string trim $link]$incith::google::link_demodes" }

        # add the search result
        if {$incith::google::link_only == 1} { 
          append output "${link}${incith::google::seperator}"
        } else {
          append output "[descdecode $desc]$::incith::google::break${link}${incith::google::seperator}"
        }

        # increase the results, clear the variables for the next loop just in case
        unset link ; unset desc ; unset page
        incr results
      }

      # make sure we have something to send
      if {![info exists output]} {
        set reply $no_search
        return "$::incith::google::desc_modes$reply$::incith::google::desc_demodes"
      }
      return $output
    }
  
    # GeoBytes
    # Fetches IP Location information
    # -speechless supplied
    #
    proc locate {input} {
      ; set results 0 ; set output ""
      ; set city "" ; set region "" ; set country ""
      ; set certainty "" ; set timezone "" ; set population ""
      ; set currency "" ; set proxy "" ; set curr "" ; 

      # fetch the html
      set ua "Lynx/2.8.5rel.1 libwww-FM/2.14 SSL-MM/1.4.1 OpenSSL/0.9.7e"
      set http [::http::config -useragent $ua]
      set url "http://www.geobytes.com/IpLocator.htm?GetLocation"
      set query [::http::formatQuery ipaddress $input]
      set http [::http::geturl $url -query $query -headers $::incith_hdr -timeout [expr 1000 * 10]]
      upvar #0 $http state
      set incithcharset [string map -nocase {"UTF-" "utf-" "iso-" "iso" "windows-" "cp" "shift_jis" "shiftjis"} $state(charset)]
      set html [charenc [ungzip [::http::data $http] $state(meta)] $state(charset)]
      ::http::cleanup $http

      # is site broken? if it is, say so
      if {![string match "*<html>*" $html]} {
        return "$::incith::google::error_modes\002 GeoBytes Error:\002 Unable to access site. www.geobytes.com seems to be down.$::incith::google::error_demodes"
      }

      #strip html tags
      regsub -all "\t" $html "" html
      regsub -all "\n" $html "" html
      regsub -all "\r" $html "" html
      regsub -all "\v" $html "" html
	regsub -all "\f" $html "" html
	regsub -all "\b" $html "" html
	regsub -all "\a" $html "" html
      regsub -all "&#039;" $html "'" html

      #parse html
      regexp -- {input.+?name="ro-no_bots_pls13".+?value="(.+?)".+?size} $html {} country
      regexp -- {input.+?name="ro-no_bots_pls15".+?value="(.+?)".+?size} $html {} region
      regexp -- {input.+?name="ro-no_bots_pls17".+?value="(.+?)".+?size} $html {} city
      regexp -- {input.+?name="ro-no_bots_pls18".+?value="(.+?)".+?size} $html {} certainty
      regexp -- {input.+?name="ro-no_bots_pls9".+?value="(.+?)".+?size} $html {} timezone
      regexp -- {input.+?name="ro-no_bots_pls3".+?value="(.+?)".+?size} $html {} population
      regexp -- {input.+?name="ro-no_bots_pls1".+?value="(.+?)".+?size} $html {} currency
      #currency sometimes has a trailing space, let's fix that with a dirty hack.
      set currency [string trim $currency]
      regexp -- {input.+?name="ro-no_bots_pls11".+?value="(.+?)".+?size} $html {} proxy
      regexp -- {input.+?name="ro-no_bots_pls".+?value="(.+?)".+?size} $html {} curr

      #in case we get blocked, say we did
      if {[string match "*temporarily blocked*" $html] == 1} {
       set output "$::incith::google::error_modes\002GeoBytes Error:\002 (${input}) Reasonable usage limit has been exceeded. This bot has been temporarily blocked from accessing services. Please try back again later.$::incith::google::error_demodes"
      }

      #if we can't read a country, assume there was nothing to lookup.
      if {$country == "" && $output == ""} {
        set output "$::incith::google::error_modes\002GeoBytes Error:\002 (${input}) Undefined IP. Nothing to LookUp.$::incith::google::error_demodes"
      } elseif {$output == ""} {
        set output "$::incith::google::total_modes\002GeoBytes Location:\002$::incith::google::total_demodes$::incith::google::desc_modes (${input})$::incith::google::desc_demodes$::incith::google::break$incith::google::link_modes${city}, ${region}, ${country} (${certainty}%) \[\002GMT:\002${timezone}\|\002Proxy:\002${proxy}\|${currency}\|${curr}\]$incith::google::link_demodes"
      }
      if {$incith::google::bold_descriptions != 1 && [string match "\002" $incith::google::desc_modes] != 1} {
         regsub -all -- "\002" $output {} output
      }
      return $output
    }

    # VIDEO
    # fetches links to video with search data in it (video.google.com)
    # -madwoota supplied, speechless updated
    #
    proc video {input} {
      ; set results 0 ; set output ""; set match ""; set ded ""
      ; set titen "" ; set titem "" ; set no_search "" ; set did_you_mean ""

      # this isn't global, so we need to keep ctry (country) here
      regexp -nocase -- {^\.(.+?)\s(.+?)$} $input - titen dummy
      if {$titen == ""} {
        set titen "${incith::google::google_country}" 
      }

      # fetch the html
      set html [fetch_html $input 7]

      # user input causing errors?
	if {[string match -nocase "*socketerrorabort*" $html]} {
            regsub {(.+?)\|} $html {} html
            return "${::incith::google::error_modes}Socket Error accessing '${html}' .. Does it exist?${::incith::google::error_demodes}" 
	}
	if {[string match -nocase "*timeouterrorabort*" $html]} {
		return "${::incith::google::error_modes}Connection has timed out...${::incith::google::error_demodes}" 
	}

      # strip out 'did you mean?' first
      # what do we call 'no search results in any language?'
      if {[regexp -- {<div class=med><p style=.*?>(.*?)<p style} $html - no_search]} {
        #regsub -all -- {(<strong>|</strong>)} $no_search "\002" no_search
        #regsub -- {</a>} $no_search "? " no_search
        #regsub -- {</td>} $no_search ". " no_search
        regsub -all -- {<(.+?)>} $no_search "" no_search
        set no_search [string trim $no_search] 
      }

      # give results an output header with result tally.
      if {![regexp -- {<div id=resultStats>(.+?)<nobr>} $html - match]} {
         set match "Google"
         set titem ""
      } else {
        regsub -all -- {<(.+?)>} $match {} match
        regexp -- {([0-9].*?)$} $match - match
        set match "\002[join [lrange [split $match] 0 end-1]]\002 [lindex [split $match] end]"
      }
      # format output according to variables.
      if {$incith::google::total_results != 0} {
        set output "${::incith::google::total_modes}[string trim ${match}]${::incith::google::total_demodes}${incith::google::seperator}"
        if {$incith::google::bold_descriptions == 0} {
          regsub -all -- "\002" $output {} output
        }
      }

      # parse the html
      while {$results < $incith::google::video_results} {
        # somewhat extenuated regexp due to allowing that there might be an image next to the title
        regexp -- {<h3 class="r">.*?href="(.*?)".*?>(.*?)</a>.*?<span class=f>(.*?)</span><br>(.*?)<br>} $html {} link desc ded ded2
        regsub -- {<h3 class="r">.*?href=".*?".*?>.*?</a>.*?<span class=f>.*?</span><br>.*?<br>} $html "" html

        # if there's no desc, return or stop looping, depending
        if {[info exists desc] == 0} {
          if {$results == 0} {
            set reply $no_search
            return "$::incith::google::desc_modes$reply$::incith::google::desc_demodes"
          } else {
            break
          }
        }

        set desc [string trim [string range $desc 0 [expr $incith::google::description_length - 1]]]
        # append narration to description for more detail unless its identical
        # keep description from becoming too lengthy and clean up trailing spaces
        regsub -all {<div class=description.+?</div>} $ded "" ded
        regexp {(.+?)\)--} $ded - ded
        regsub { -} $ded " - " ded
        regsub {<span class=rl-domain>} $ded " - " ded
        regsub -all {<(.*?)>} $ded "" ded
        #if {[string length $ded2]} {
        #  set ded2 "\([descdecode [string range $ded2 0 [expr $incith::google::description_length - 1]]]\)"
        #}
        set ded2 ""
        set desc "[descdecode $desc] $ded2\([descdecode [string trim $ded]]\)"

        # make the link valid because we were only given a partial href result, not a full url
        if {[string match [string range $link 0 0] "/"]} {
          regsub -- {&.+?$} $link "" link
          set link "http://video.google.${titen}${link}"
        }

        # prevent duplicate results is mostly useless here, but will at least
        #   ensure that we don't get the exact same article.
        if {[string match "*$link*" $output] == 1} {
         break
        }
        # quick and dirty double-space remover
        while {[string match "*  *" $desc]} {
          regsub -all -- {  } $desc " " desc
        }
        set desc [string trim $desc]
        if {[info exists desc]} { set desc "$incith::google::desc_modes[string trim $desc]$incith::google::desc_demodes" }
        if {[info exists link]} { set link "$incith::google::link_modes[string trim $link]$incith::google::link_demodes" }

        # add the search result
        if {$incith::google::link_only == 1} { 
          append output "${link}${incith::google::seperator}"
        } else {
          append output "[descdecode $desc]$::incith::google::break${link}${incith::google::seperator}"
        }

        # increase the results, clear the variables for the next loop just in case
        unset link; unset desc
        incr results
      }

      # make sure we have something to send
      if {$match == ""} {
        set reply $no_search
        return "$::incith::google::desc_modes$reply$::incith::google::desc_demodes"
      }
      return $output
    }

    # FIGHT
    # google fight !
    #
    proc fight {input} {
      set output ""; set winner 0; set match1 0; set match2 0

      if {![regexp -nocase -- {^\.(.+?)\s(.+?)$} $input - country input]} {
        set country "${incith::google::google_country}" 
      }
      regexp -nocase -- {^(.+?) vs (.+?)$} $input - word1 word2
      if {![regexp -nocase -- {^\.(.+?)\s(.+?)$} $word2 - country2 word2]} {
        set country2 "${incith::google::google_country}"
      }

      # fetch the first result
      set html [fetch_html ".$country $word1" 8]
      # parse the html
      if {![regexp -nocase {<div id=prs>.*?</div><p>(.+?)(?:\(\002|\[)} $html - matches1]} {
        if {![regexp -- {<div id=resultStats> (.*?) (.*?)\(\002} $html - titem matches1]} {
          if {[regexp -- {id="resultStats">(.*?)</div>} $html - match]} {
            set matches1 [string map {&#160; " "} [string trim $match]]
          }
        }
      }
      if {[info exists matches1]} {
        #regsub -- {(?:\002|\s)1\002 - \0021\002} $matches1 "" matches1
        #regsub -- {(?:\002|\s)1\002-\0021\002} $matches1 "" matches1
	  regexp {([0-9].*[0-9])} $matches1 - matches1
        regsub -nocase -all {<a href.*?>} $matches1 "" matches1
        regsub -nocase -all {</a>} $matches1 "" matches1
        set match1 $matches1
        regsub -all -- {[\., ]} $match1 "" match1
      } else { set matches1 "0" }
      if {![string is digit $match1]} {
        regexp -- {\002(.+?)\002.*?\002(.+?)\002} $matches1 - dummy match1
        if {[string match $match1 $word1]} {
          regexp -- {\002(.+?)\002} $matches1 - match1
        }
      }

      # fetch the second result
      set html [fetch_html ".$country2 $word2" 8]
      # parse the html
      if {![regexp -nocase {<div id=prs>.*?</div><p>(.+?)(?:\(\002|\[)} $html - matches2]} {
        if {![regexp -- {<div id=resultStats> (.*?) (.*?)\(\002} $html - titem matches2]} {
          if {[regexp -- {id="resultStats">(.*?)</div>} $html - match]} {
            set matches2 [string map {&#160; " "} [string trim $match]]
          }
        }
      }
      if {[info exists matches2]} {
        #regsub -- {(?:\002|\s)1\002 - \0021\002} $matches2 "" matches2
        #regsub -- {(?:\002|\s)1\002-\0021\002} $matches2 "" matches2
	  regexp {([0-9].*[0-9])} $matches2 - matches2
        regsub -nocase -all {<a href.*?>} $matches2 "" matches2
        regsub -nocase -all {</a>} $matches2 "" matches2
        set match2 $matches2
      } else { set matches2 "0" }
      if {![string is digit $match2]} {
        regexp -- {\002(.+?)\002.*?\002(.+?)\002} $matches2 - dummy match2
        if {[string match $match2 $word2]} {
          regexp -- {\002(.+?)\002} $matches2 - match2
        }
      }

      if {![string match $country $country2]} { set country "$country and Google.$country2" }
      if {![info exists match1]} {
        set match1 "0"
        set match1expr "0"
      } else {
        regsub -all {(?:\.|,| )} $match1 "" match1expr
      }

      if {![info exists match2]} {
        set match2 "0"
        set match2expr "0"
      } else {
        regsub -all {(?:\.|,| )} $match2 "" match2expr
      }

      if {[expr $match2expr < $match1expr]} {
        set winner 1
      } elseif {[string match $match2expr $match1expr]} {
        set winner 3
      } else {
        set winner 2
      }

      if {$incith::google::bold_descriptions > 0 && $incith::google::desc_modes == ""} {
        set word1 "\002$word1\002"; set word2 "\002$word2\002"
        set match1 "\002 $matches1\002"; set match2 "\002 $matches2\002"
      } elseif {$incith::google::desc_modes != ""} {
        set word1 "\002$word1\002"; set word2 "\002$word2\002"
        set match1 " $matches1"; set match2 " $matches2"
      } else {
        set match1 " $matches1"; set match2 " $matches2"
      }

      if {$winner == 1} {
        set output "${::incith::google::total_modes}By results on Google.$country:$::incith::google::total_demodes$::incith::google::desc_modes $word1 beats $word2 by$match1 to$match2!$::incith::google::desc_demodes"
      } elseif {$winner == 2} {
        set output "${::incith::google::total_modes}By results on Google.$country:$::incith::google::total_demodes$::incith::google::desc_modes $word2 beats $word1 by$match2 to$match1!$::incith::google::desc_demodes"
      } else {
        set output "${::incith::google::total_modes}Google.$country could not determine the winner.$::incith::google::total_demodes$::incith::google::desc_modes $word2 ties $word1 with$match1 results.$::incith::google::desc_demodes"
      }

      # make sure we have something to send
      if {[info exists output] == 0} {
        set reply "${::incith::google::desc_modes}Sorry, no search results were found. Something is wrong...$::incith::google::desc_demodes"
        return $reply
      }
      return $output
    }

    # YOUTUBE
    # fetches links to video with search data in it (youtube.com)
    # -speechless supplied
    #
    proc youtube {input} {
     
      ; set results 0 ; set output "" ; set ded ""; set match "" ; set titem "" ; set titen ""
      if {[regsub -nocase -all -- "$::incith::google::youtube_highdef" $input "" dummy]} { set hd 1 }
      # this isn't global, so we need to keep ctry (country) here
      regexp -nocase -- {^\.(.+?)\s(.+?)$} $input - titem dummy
      if {$titem == ""} {
        set titem "${incith::google::youtube_country}" 
      }

      # fetch the html
      set html [fetch_html $input 9]

      # user input causing errors?
	if {[string match -nocase "*socketerrorabort*" $html]} {
            regsub {(.+?)\|} $html {} html
            return "${::incith::google::error_modes}Socket Error accessing '${html}' .. Does it exist?${::incith::google::error_demodes}" 
	}
	if {[string match -nocase "*timeouterrorabort*" $html]} {
		return "${::incith::google::error_modes}Connection has timed out...${::incith::google::error_demodes}" 
	}

      # give results an output header with result tally.
      if {![regexp -- {<p class="num-results">.*?\002(.*?)\002(.*?)</p>} $html - match titen]} {
        set match "YouTube"
        set titen "results"
      } else {
        regsub -all {\s+} [string trim $titen] " " titen
      } 

      # format output according to variables.
      if {$incith::google::total_results != 0 && $match != ""} {
        set output "${::incith::google::total_modes}\002[string trim ${match}]\002 [descdecode [string trim $titen]]${::incith::google::total_demodes}${incith::google::seperator}"
        if {$incith::google::bold_descriptions == 0} {
          regsub -all -- "\002" $output {} output
        }
      }
      if {[regexp -nocase {<div class="marT10">(.+?)(</div></div>|</div><div>|</a></div>|<\!--)} $html - reply]} {
        regsub -all -nocase {<div class="marT10">.+?(</div></div>|</div><div>|</a></div>|<\!--)} $html "" html
        regsub -all {<td>} $reply ". " reply
        regsub -all -- {<.*?>} $reply "" reply
      } elseif {[regexp -nocase {id="search-no-results-message">(.*?)</div>} $html - reply]} {
        regsub -all -- {<.*?>} $reply "" reply
      } elseif {[regexp -nocase {id="results-main-.*?>.*?<img.*?>(.*?)<br>} $html - reply]} {
        regsub -all -- {<.*?>} $reply "" reply
      } elseif {[regexp -nocase {role="alert">.*?<div class="yt-alert-message">.*?<div class="yt-alert-message">(.*?)</div></div>} $html - reply]} {
        regsub -all -- {<.*?>} $reply "" reply
      } else { set reply "" }

      # parse the html
      while {$results < $incith::google::youtube_results} {
        if {[regexp -nocase {(<li class="yt-lockup.*?(?:<li class="yt-lockup|$))} $html - line]} {
           putlog "line - $line"
           if {[regexp -nocase {href.*?href="(.*?)".*?>(.*?)</a>.*?<li>(.*?)<li>} $line - id title stuff]} {
              regexp -nocase {</li>.*?<div.*?>(.*?)</div>} $line - desc
              regsub -all -- {<.*?>} $desc "" desc 
              regsub -all -- {<li>} $stuff " | " stuff
              regsub -all -- {<.*?>} $stuff "" stuff
              putlog "stuff - $stuff"
           }
	     if {[regexp -nocase {data-context-item-title="(.*?)"} $line - title]} { 
              regexp -nocase {data-context-item-id="(.*?)"} $line - id
              regexp -nocase {data-context-item-views="(.*?)"} $line - views
              regexp -nocase {data-context-item-user="(.*?)"} $line - user
              regexp -nocase {data-context-item-type="(.*?)"} $line - type
              regexp -nocase {data-context-item-time="(.*?)"} $line - time
              if {![regexp -nocase {<div class="yt-lockup2-description.*?>(.*?)</div>} $line - desc]} { set desc "" } { regsub -all -- {<.*?>} $desc "" desc }
              regsub -nocase {<li class="yt-lockup2.*?<li class="yt-lockup2} $html {<li class="yt-lockup2} html
              set id "/watch?v=$id"
           }
          if {[info exists title] == 0} {
            if {$results == 0} {
              append output "[descdecode [string trim $reply]]${incith::google::seperator}"
              return "$incith::google::desc_modes[descdecode $reply]$::incith::google::desc_demodes"
            } else {
              break
            }
          }
        }

        # keep description from becoming too lengthy and clean up trailing spaces
        if {[info exists desc]} {
          set desc [string range $desc 0 [expr $incith::google::description_length - 1]]
          set desc [descdecode [string trim $desc]]
        }

        # make the link valid because we were only given a partial href result, not a full url
        if {$titem == "com" } {
          set link "http://youtube.com${id}&hl=en"
        } else {
          set link "http://${titem}.youtube.com${id}&hl=${titem}"
        }
        # fullscreen window link - http://youtube.com/v/${id}

        if {[info exists desc]} { set desc "$incith::google::desc_modes[string trim $desc]$incith::google::desc_demodes" }
        if {[info exists link]} { 
          if {[info exists hd]} {
            set link [string map {"&hd=1" "&fmt=22"} $link]
          } elseif {$incith::google::youtube_highquality != 0} {
            append link "&fmt=18"
          }
          set link "$incith::google::link_modes[string trim $link]$incith::google::link_demodes"
        }

        # add the search result
        if {$incith::google::link_only == 1} { 
          append output "${link}${incith::google::seperator}"
        } else {
          if {![info exists stuff]} {
            append output "[descdecode "$title (by $user; $type; $views; $time) $desc"]$::incith::google::break${link}${incith::google::seperator}"
          } else {
            append output "[descdecode "$title ($stuff) $desc"]$::incith::google::break${link}${incith::google::seperator}"
          }
        }

        # increase the results, clear the variables for the next loop just in case
        unset link; unset desc
        incr results
      }
      return $output
    }

    # MYSPACEVIDS
    # fetches links to video with search data in it (videosearch.myspace.com)
    # -speechless supplied
    #
    proc myspacevids {input} {

      ; set results 0 ; set output "" ; set ded ""; set match "" ; set rating ""

      # fetch the html
      set html [fetch_html $input 11]

      # give results an output header with result tally.
      regexp -nocase -- {class="resultsInfo">.*?1-.*?\s.*?\s(.*?)\s(.*?)\s} $html - match videos

      # format output according to variables.
      if {$incith::google::total_results != 0 && $match != ""} {
        set output "${::incith::google::total_modes}\002[string trim ${match}]\002 [descdecode [string trim $videos]]${::incith::google::total_demodes}${incith::google::seperator}"
        if {$incith::google::bold_descriptions == 0} {
          regsub -all -- "\002" $output {} output
        }
      }

      # parse the html
      while {$results < $incith::google::myspacevids_results} {
        # somewhat extenuated regexp due to allowing that there might be an image next to the title
        regexp -nocase -- {a class="taggedlink.*?href=.*?videoid=(.*?)\&.*?>(.*?)</a>.*?<a class=.*?>(.*?)</a>.*?<ul class="videoData group">(.*?)</ul>} $html - cid desc ded rating
        regsub -nocase -- {a class="taggedlink.*?href=.*?videoid=.*?\&.*?>.*?</a>.*?<a class=.*?>.*?</a>.*?<ul class="videoData group">.*?</ul>} $html {} html
        # if there's no desc, return or stop looping, depending
        if {![info exists desc]} {
          if {$results == 0} {
            if {[regexp -- {class="displayingSummary">(.+?)</div>} $html - reply]} {
              return "$::incith::google::desc_modes$reply$::incith::google::desc_demodes"
            } elseif {[regexp -- {<p id="displaySummary" class="resultsInfo">(.*?)</p>} $html - reply]} {
              return "$::incith::google::desc_modes$reply$::incith::google::desc_demodes"
            }
          } else {
            break
          }
        }

        # duplicate link filter, clumsy indeed.. will remove soon and fix properly
        if {[string match "*${cid}*" $output] == 1} {
          break
        }
        if {[info exists rating]} {
          regsub -all {</li>} [string map {"	" "" "\002" ""} $rating] ";" rating
          regsub -all {<.*?>} $rating "" rating
          regsub -all {\s+} $rating " " rating
          regsub -all { ;} $rating ";" rating
        }
        if {[info exists ded]} {
          regsub -all {<.*?>} [string trim $ded] "" ded
          if {[string length $ded]} { set ded "(by $ded)" }
        }
        # keep description from becoming too lengthy and clean up trailing spaces
        if {[info exists desc]} {
          set desc [string trim [string range $desc 0 [expr $incith::google::description_length - 1]]]
          set desc "${desc} ${ded}([string trim ${rating} "; "])"
        }

        # make the link valid because we were only given a partial href result, not a full url
        set link "http://vids.myspace.com/index.cfm?fuseaction=vids.individual&videoid=${cid}"

        if {[info exists desc]} { set desc "$incith::google::desc_modes[string trim $desc]$incith::google::desc_demodes" }
        if {[info exists link]} { set link "$incith::google::link_modes[string trim $link]$incith::google::link_demodes" }

        # add the search result
        if {$incith::google::link_only == 1} { 
          append output "${link}${incith::google::seperator}"
        } else {
          append output "[descdecode $desc]$::incith::google::break${link}${incith::google::seperator}"
        }

        # increase the results, clear the variables for the next loop just in case
        unset link; unset desc
        incr results
      }

      # make sure we have something to send
      if {$match == ""} {
        regexp -- {class="displayingSummary">(.+?)</div>} $html - reply
        return "$::incith::google::desc_modes$reply$::incith::google::desc_demodes"
      }
      if {$incith::google::bold_descriptions != 0} {
        regsub -all -- "(<mark>|</mark>)" $output "\002" output
      } else { regsub -all -- "(<mark>|</mark>)" $output "" output }
      return $output
    }

    # trans
    # google translation -(www.google.com\translate_t?)
    # -speechless supplied
    #
    proc trans {input where} {
      global incithcharset
      ; set results 0 ; set output ""; set match "" ; set titem "" ; set translit ""
      if {[regsub -nocase -all -- $incith::google::trans_input_t $input "" input]} { set y 0 }
      if {[regsub -nocase -all -- $incith::google::trans_output_t $input "" input]} { set z 0 }
      # split up stuff
      regexp -nocase -- {^(.+?)@(.+?)\s(.+?)$} $input - link desc titem
      # fetch the html
      set ua "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.3) Gecko/20090824 Firefox/3.5.3"
      if {$::incith::google::trans_input > 0} {
        set http [::http::config -useragent $ua -urlencoding "utf-8"]
      } else {
        set http [::http::config -useragent $ua -urlencoding ""]
      }
      set url "https://translate.google.com/m?"
      if {$::incith::google::trans_input > 0} {
        if {![info exists y]} {
          set ie "&ie=utf-8"
        } else {
          set ie ""
        }
      } else {
        if {![info exists y]} {
          set ie ""
        } else {
          set ie "&ie=utf-8"
        }
      }
      if {$::incith::google::trans_output > 0} {
        if {![info exists z]} {
          set oe "&oe=utf-8"
        } else {
          set oe ""
        }
      } else {
        if {![info exists z]} {
          set oe ""
        } else {
          set oe "&oe=utf-8"
        }
      }
      if {[regsub -all -- {--p} $titem {} titem]} { set ph 1 }
      if {![info exists y]} {
        set query "text=[urlencode $titem 0 "utf-8"]&sl=${link}&tl=${desc}$ie$oe"
      } else {
        set query "text=[urlencode $titem 0]&sl=${link}&tl=${desc}$ie$oe"
      }
	catch {set http [::http::geturl "$url" -query $query -headers $::incith_hdr -timeout [expr 1000 * 10]]} error

      # CHECK CHECK
      upvar #0 $http state
      set incithcharset [string map -nocase {"UTF-" "utf-" "iso-" "iso" "windows-" "cp" "shift_jis" "shiftjis"} $state(charset)]
      if {$incith::google::debug > 0} {
        putserv "privmsg $incith::google::debugnick :\002url:\002 $url$query \002\037charset:\002\037 [string map -nocase {"iso-" "iso" "windows-" "cp" "shift_jis" "shiftjis"} $incithcharset]"
      }
	if {[string match -nocase "*couldn't open socket*" $error]} {
		return "${::incith::google::error_modes}Socket Error accessing '${url}' .. Does it exist?${::incith::google::error_demodes}" 
	}
	if { [::http::status $http] == "timeout" } {
		return "${::incith::google::error_modes}Connection has timed out...${::incith::google::error_demodes}" 
	}
      set html [charenc [ungzip [::http::data $http] $state(meta)] $state(charset)]
      ::http::cleanup $http
      # DEBUG DEBUG                    
      set junk [open "trans.txt" w]
      puts $junk $html
      close $junk

      regsub -all -nocase {<sup>(.+?)</sup>} $html {^\1} html
      regsub -all -nocase {<font.+?>} $html "" html
      regsub -all -nocase {</font>} $html "" html
      regsub -all -nocase {<input.+?>} $html "" html
      regsub -all -nocase {(?:<i>|</i>)} $html "" html
      regsub -all -nocase {<i style.*?>} $html "" html
      regsub -all "\t" $html " " html
      regsub -all "\n" $html " " html
      regsub -all "\r" $html " " html
      regsub -all "\v" $html " " html
	regsub -all "\f" $html "" html
	regsub -all "\b" $html "" html
	regsub -all "\a" $html "" html
      regsub -all "</li>" $html ". " html
      regsub -all ";;>" $html "" html
      # make sure everything is lowercase.
      # make sure everything is lowercase.
      set desc [string tolower $desc]
      set link [string tolower $link]
      if {![regexp -- {<h3 id=headingtext.*?>(.+?)</h3>} $html {} detect]} {
        if {![regexp -- {<div class="goog-inline-block goog-flat-menu-button-caption">(.*?)</div>.*?<div class="goog-inline-block goog-flat-menu-button-caption">(.*?)</div>} $html {} detect1 detect2]} {
          if {![regexp -- {class="s1">(.*?)<.*?class="s1">(.*?)<} $html - detect1 detect2]} {
		set detect ""
          } else { set detect "$detect1 > $detect2" }
        } else { set detect "$detect1 $detect2" }
      } else { regsub -all {<.*?>} $detect "" detect }
      if {[regexp -- {</h3>.*?</object></div>(.+?)</div>} $html - match]} {
        regsub -all {<.*?>} $match "" match
      } elseif {[regexp -- {onmouseover="this\.style\.backgroundColor='#ebeff9'" onmouseout="this\.style\.backgroundColor='#fff'">(.*?)</span></span>} $html - match]} {
        regsub -all {<.*?>} $match "" match
      } elseif {[regexp -- {<textarea id=source.*?>(.*?)</textarea>} $html - match]} {
        regsub -all {<.*?>} $match "" match
      } elseif {[regexp -- {<div dir="ltr" class=.*?>(.*?)</div>} $html - match]} {
	  regsub -all {<.*?>} $match "" match
      } elseif {[regexp -- {<div dir="rtl" class=.*?>(.*?)</div>} $html - match]} {
	  regsub -all {<.*?>} $match "" match
      }
      if {[regexp -- {<div id=src-translit class=translit.*?>(.*?)</div>} $html - translit]} { regsub -all {<.*?>} $translit "" translit }
      if {[string length $match]} {
        put_output $where "${::incith::google::total_modes}Google\:$::incith::google::total_demodes$::incith::google::desc_modes \(${link}\-\>${desc}\)\ [descdecode $detect]"
        if {![info exists ph] || ![string length $translit]} { put_output $where [descdecode [descdecode ${match}]] }
        if {[string length $translit] && [info exists ph]} { put_output $where "Phonetically: [descdecode [descdecode ${translit}]]" }
      } else {
        put_output $where "${::incith::google::error_modes}Translation error\:$::incith::google::error_demodes$::incith::google::desc_modes \(${link}\-\>${desc}\)\ [descdecode "$detect."]$::incith::google::desc_demodes"
      }
    }

    # MININOVA TORRENT HUNT
    # fetches torrent links from mininova. (mininova.com)
    # -speechless supplied
    #
    proc mininova {input} {

      ; set results 0 ; set output ""; set match "" ; set ebcSP "" ; set match2 ""

      #regsub -all {-} $input { } input
      # fetch the html
      set html [fetch_html $input 51]

      # give results an output header with result tally.
      regexp -- {<h1>(?!No).*?\((.+?)\s(.+?)\)} $html - match match2
      # format output according to variables.
      if {$incith::google::total_results != 0} {
        set output "${::incith::google::total_modes}\002[string trim ${match}]\002 [descdecode [string trim $match2]]${::incith::google::total_demodes}${incith::google::seperator}"
        if {$incith::google::bold_descriptions == 0} {
          regsub -all -- "\002" $output {} output
        }
      }
      regsub {<tr.*?>(.+?)</tr>} $html "" html

      # parse the html
      while {$results < $incith::google::mininova_results && $match != ""} {
        # this could break any second, its cumbersome and long..i know, but for now it works.
        regexp -nocase {<tr.*?>(.+?)</tr>} $html - htm
        regsub {<tr.*?>(.+?)</tr>} $html "" html
        regexp -nocase {<td>(.+?)</td><td><a href="/cat.+?>(.+?)</a>.+?<a href="/get/(.*?)".+?">.+?<a href="/tor.+?">(.+?)</a>} $htm - ebcU ebcI ebcBid ebcPR
        regexp -nocase {<td align="right">(.+?)</td><td align="right">(.+?)</td><td align="right">(.+?)</td>} $htm - ebcShpNew ebcTim ebcCheck
        regexp -nocase {title="Tracker URL: (.+?)"} $htm - ebcSP
        if {$ebcSP != ""} {
          set ebcSP "\037${ebcSP}\037 "
        }
        # keep torrent name from becoming too lengthy
        if {[info exists ebcPR]} {
          set ebcPR [string range $ebcPR 0 [expr $incith::google::description_length - 1]]
          set ebcPR [string trim $ebcPR]
        }
 
        # check results are more than 0, return or stop looping, depending
        if {$match < 1 } {
          if {$results == 0} {
            regexp -nocase {<h1>(.+?)</h1>} $html - reply
            if {![regexp -nocase {</h1><p>(.+?)</p>} $html - reply2]} { set reply2 "" } {
              if {![string match *Didn't* $reply2]} { regsub -all -- {<(.+?)>} $reply2 "" reply2 ; set reply2 ". $reply2" } { set reply2 "" }
            }
            regsub -all -- {<(.+?)>} $reply "" reply
            return "$::incith::google::desc_modes$reply$reply2$::incith::google::desc_demodes"
          } else {
            break
          }
        }

        # make the link valid because we were only given a partial href result, not a full url
        set link "http://mininova.org/get/${ebcBid}"

        # prevent duplicate results is mostly useless here, but will at least
        # ensure that we don't get the exact same article.
        if {[string match "*$link*" $output] == 1} {
          break
        }

        # fix up our variables so the output looks purdy.
        set desc "${ebcU}/${ebcI} ${ebcSP}\002${ebcPR}\002 (${ebcShpNew}, ${ebcTim}s, ${ebcCheck}p)"

        if {[info exists desc]} { set desc "$incith::google::desc_modes[string trim $desc]$incith::google::desc_demodes" }
        if {[info exists link]} { set link "$incith::google::link_modes[string trim $link]$incith::google::link_demodes" }

        # add the search result
        if {$incith::google::link_only == 1} { 
          append output "${link}${incith::google::seperator}"
        } else {
          append output "$desc$::incith::google::break${link}${incith::google::seperator}"
        }

        # increase the results, clear the variables for the next loop just in case
        unset link ; set ebcCheck "" ; set ebcU "" ; set ebcSP ""
        incr results
      }

      # make sure we have something to send
      if {$match == ""} {
        regexp -nocase {<h1>(.+?)</h1>} $html - reply
        if {![regexp -nocase {</h1><p>(.+?)</p>} $html - reply2]} { set reply2 "" } {
          if {![string match *Didn't* $reply2]} { regsub -all -- {<(.+?)>} $reply2 "" reply2 ; set reply2 ". $reply2" } { set reply2 "" }
        }
        regsub -all -- {<(.+?)>} $reply "" reply
        return "$::incith::google::desc_modes$reply$reply2$::incith::google::desc_demodes"
      }

      regsub -all -- " " $input "+" input
      append output "www.mininova.org/search/${input}/seeds"
      #append output "www.mininova.org/search/?search=${input}"
      return $output
    }

    # DAILYMOTION
    # fetches links to video with search data in it (dailymotion.com)
    # -speechless supplied
    #
    proc dailymotion {input} {

      ; set results 0 ; set output "" ; set titem ""

      # this isn't global, so we need to keep ctry (country) here
      regexp -nocase -- {^\.(.+?)\s(.+?)$} $input - titem dummy
      if {$titem == ""} {
        set titem "${incith::google::daily_country}" 
      }

      # fetch the html
      set html [fetch_html $input 14]

      # user input causing errors?
	if {[string match -nocase "*socketerrorabort*" $html]} {
            regsub {(.+?)\|} $html {} html
            return "${::incith::google::error_modes}Socket Error accessing '${html}' .. Does it exist?${::incith::google::error_demodes}" 
	}
	if {[string match -nocase "*timeouterrorabort*" $html]} {
		return "${::incith::google::error_modes}Connection has timed out...${::incith::google::error_demodes}" 
	}

      if {[regexp -- {<div class="dmco_text foreground2">(.*?)</div>} $html - nope]} {
        regsub -all -- {</a>} $nope "." nope
        regsub -all -- {<br/>} $nope " " nope
        regsub -all -- {<.*?>} $nope "" nope
        set reply "${::incith::google::desc_modes}$nope$::incith::google::desc_demodes"
        return $reply
      }

      set output "DailyMotion${incith::google::seperator}"
      if {$incith::google::bold_descriptions != 0} {
        set output "$::incith::google::total_modes\002DailyMotion\002$::incith::google::total_demodes${incith::google::seperator}"
      }
      # parse the html
      while {$results < $incith::google::daily_results} {
        # somewhat extenuated regexp due to allowing that there might be an image next to the title
        regexp -nocase -- {<div class="dmco_text duration">(.*?)<.*?<a class=.+?href=.*?/video/(.*?)_.*?">(.*?)<.*?<div class="dmpi_video_description foreground.*?>.*?<div>(.*?)<} $html - snatch cid desc vote
        regsub -nocase -- {<div class="dmco_text duration">.*?<h4 class="dmco_title.*?>.*?<a class=.+?href=.*?/video/.+?_.*?">.*?div class="dmco_date">(.*?)<} $html "" html

        # if there's no desc, return or stop looping, depending
        if {[info exists desc] == 0} {
          if {$results == 0} {
            set reply "Sorry, no search results were found."
            return "${::incith::google::desc_modes}$reply$::incith::google::desc_demodes"
          } else {
            break
          }
        }
        set desc [string trim [string range $desc 0 [expr $incith::google::description_length - 1]]]
        set vote [string trim [string range $vote 0 [expr $incith::google::description_length - 1]]]
        set desc "${desc} (${snatch}) ([string trim $vote])"

        # make the link valid because we were only given a partial href result, not a full url
        set link "http://www.dailymotion.com/${titem}/video/${cid}"

        # prevent duplicate results is mostly useless here, but will at least
        #   ensure that we don't get the exact same article.
        if {[string match "*$link*" $output] == 1} {
         break
        }

        if {[info exists desc]} { set desc "$incith::google::desc_modes[string trim $desc]$incith::google::desc_demodes" }
        if {[info exists link]} { set link "$incith::google::link_modes[string trim $link]$incith::google::link_demodes" }

        # add the search result
        if {$incith::google::link_only == 1} { 
          append output "${link}${incith::google::seperator}"
        } else {
          append output "[descdecode $desc]$::incith::google::break${link}${incith::google::seperator}"
        }

        # increase the results, clear the variables for the next loop just in case
        unset link; unset desc ; unset cid
        incr results
      }

      # make sure we have something to send
      if {[info exists output] == 0} {
        set reply "Sorry, no search results were found."
        return "$::incith::google::desc_modes$reply$::incith::google::desc_demodes"
      }
      return $output
    }

    # GAMEFAQS
    # fetches upcoming game list variable by system and region (gamefaqs.com)
    # this is far better than any gamefaqs procedure you've seen before, this is looooong, but very simple
    # in it's approach. I learned alot coding it.
    # -speechless supplied
    #
    proc gamefaqs {system region} {

      ; set results 0 ; set output "" ; set html "" ; set match 0 ; set game "" ; set date ""

      # strip excessive spaces from region and system desired.
      regsub -all " " $system "" system
      regsub -all " " $region "" region

      # this is where most of the work is done
      # parsing systems and regions to create an output header
      # and cut the html down to the specified region

      if {[string match -nocase "nds" $system] == 1} {
        if {[string match -nocase "usa" $region] == 1} {
          set html [fetch_html "/region-1" 15]
          set output "\002NDS North America (USA)\002"
        }
        if {[string match -nocase "jap" $region] == 1} {
          set html [fetch_html "/region-2" 15]
          set output "\002NDS Asia (JAPAN)\002"         
        }
        if {[string match -nocase "eur" $region] == 1} {
          set html [fetch_html "/region-3" 15] 
          set output "\002NDS Europe (UK)\002"
        }
        if {[string match -nocase "aus" $region] == 1} {
          set html [fetch_html "/region-4" 15]
          set output "\002NDS Australia (AUS)\002"
        }
      }

      if {[string match -nocase "3ds" $system] == 1} {
        if {[string match -nocase "usa" $region] == 1} {
          set html [fetch_html "/region-1" 56]
          set output "\0023DS North America (USA)\002"
        }
        if {[string match -nocase "jap" $region] == 1} {
          set html [fetch_html "/region-2" 56]
          set output "\0023DS Asia (JAPAN)\002"         
        }
        if {[string match -nocase "eur" $region] == 1} {
          set html [fetch_html "/region-3" 56] 
          set output "\0023DS Europe (UK)\002"
        }
        if {[string match -nocase "aus" $region] == 1} {
          set html [fetch_html "/region-4" 56]
          set output "\002NDS Australia (AUS)\002"
        }
      }

      if {[string match -nocase "iphone" $system] == 1} {
        if {[string match -nocase "usa" $region] == 1} {
          set html [fetch_html "/region-1" 16]  
          set output "\002iPhone North America (USA)\002"
        }
        if {[string match -nocase "jap" $region] == 1} {
          set html [fetch_html "/region-2" 16]
          set output "\002iPhone Asia (JAPAN)\002"
        }
        if {[string match -nocase "eur" $region] == 1} {
          set html [fetch_html "/region-3" 16]
          set output "\002iPhone Europe (UK)\002"
        }
        if {[string match -nocase "aus" $region] == 1} {
          set html [fetch_html "/region-4" 16]
          set output "\002iPhone Australia (AUS)\002"
        }
      }

      if {[string match -nocase "psp" $system] == 1} {
        if {[string match -nocase "usa" $region] == 1} {
          set html [fetch_html "/region-1" 17]
          set output "\002PSP North America (USA)\002"
        }
        if {[string match -nocase "jap" $region] == 1} {
          set html [fetch_html "/region-2" 17]
          set output "\002PSP Asia (JAPAN)\002"
        }
        if {[string match -nocase "eur" $region] == 1} {
          set html [fetch_html "/region-3" 17]
          set output "\002PSP Europe (UK)\002"
        }
        if {[string match -nocase "aus" $region] == 1} {
          set html [fetch_html "/region-4" 17]
          set output "\002PSP Australia (AUS)\002"
        }
      }

      if {[string match -nocase "x360" $system] == 1} {
        if {[string match -nocase "usa" $region] == 1} {
          set html [fetch_html "/region-1" 18]
          set output "\002XBOX360 North America (USA)\002"
        }
        if {[string match -nocase "jap" $region] == 1} {
          set html [fetch_html "/region-2" 18]
          set output "\002XBOX360 Asia (JAPAN)\002"
        }
        if {[string match -nocase "eur" $region] == 1} {
          set html [fetch_html "/region-3" 18]    
          set output "\002XBOX360 Europe (UK)\002"
        }
        if {[string match -nocase "aus" $region] == 1} {
          set html [fetch_html "/region-4" 18]
          set output "\002XBOX360 Australia (AUS)\002"
        }
      }

      if {[string match -nocase "xbox" $system] == 1} {
        if {[string match -nocase "usa" $region] == 1} {
          set html [fetch_html "/region-1" 19]
          set output "\002XBOX North America (USA)\002"
        }
        if {[string match -nocase "jap" $region] == 1} {
          set html [fetch_html "/region-2" 19]
          set output "\002XBOX Asia (JAPAN)\002"
        }
        if {[string match -nocase "eur" $region] == 1} {
          set html [fetch_html "/region-3" 19]   
          set output "\002XBOX Europe (UK)\002"
        }
        if {[string match -nocase "aus" $region] == 1} {
          set html [fetch_html "/region-4" 19]
          set output "\002XBOX Australia (AUS)\002"
        }
      }

      if {[string match -nocase "gc" $system] == 1} {
        if {[string match -nocase "usa" $region] == 1} {
          set html [fetch_html "/region-1" 20]
          set output "\002GAMECUBE North America (USA)\002"
        }
        if {[string match -nocase "jap" $region] == 1} {
          set html [fetch_html "/region-2" 20]
          set output "\002GAMECUBE Asia (JAPAN)\002"
        }
        if {[string match -nocase "eur" $region] == 1} {
          set html [fetch_html "/region-3" 20]
          set output "\002GAMECUBE Europe (UK)\002"
        }
        if {[string match -nocase "aus" $region] == 1} {
          set html [fetch_html "/region-4" 20]
          set output "\002GAMECUBE Australia (AUS)\002"
        }
      }

      if {[string match -nocase "ps2" $system] == 1} {
        if {[string match -nocase "usa" $region] == 1} {
          set html [fetch_html "/region-1" 21]
          set output "\002PS2 North America (USA)\002"
        }
        if {[string match -nocase "jap" $region] == 1} {
          set html [fetch_html "/region-2" 21]
          set output "\002PS2 Asia (JAPAN)\002"
        }
        if {[string match -nocase "eur" $region] == 1} {
          set html [fetch_html "/region-3" 21] 
          set output "\002PS2 Europe (UK)\002"
        }
        if {[string match -nocase "aus" $region] == 1} {
          set html [fetch_html "/region-4" 21]
          set output "\002PS2 Australia (AUS)\002"
        }
      }

      if {[string match -nocase "pc" $system] == 1} {
        if {[string match -nocase "usa" $region] == 1} {
          set html [fetch_html "/region-1" 22]
          set output "\002PC North America (USA)\002"
        }
        if {[string match -nocase "jap" $region] == 1} {
          set html [fetch_html "/region-2" 22]
          set output "\002PC Asia (JAPAN)\002"
        }
        if {[string match -nocase "eur" $region] == 1} {
          set html [fetch_html "/region-3" 22]
          set output "\002PC Europe (UK)\002"
        }
        if {[string match -nocase "aus" $region] == 1} {
          set html [fetch_html "/region-4" 22]
          set output "\002PC Australia (AUS)\002"
        }
      }

      if {[string match -nocase "ps3" $system] == 1} {
        if {[string match -nocase "usa" $region] == 1} {
          set html [fetch_html "/region-1" 23]
          set output "\002PS3 North America (USA)\002"
        }
        if {[string match -nocase "jap" $region] == 1} {
          set html [fetch_html "/region-2" 23]
          set output "\002PS3 Asia (JAPAN)\002"
        }
        if {[string match -nocase "eur" $region] == 1} {
          set html [fetch_html "/region-3" 23]
          set output "\002PS3 Europe (UK)\002"
        }
        if {[string match -nocase "aus" $region] == 1} {
          set html [fetch_html "/region-4" 23]
          set output "\002PS3 Australia (AUS)\002"
        }
      }

      if {[string match -nocase "wii" $system] == 1} {
        if {[string match -nocase "usa" $region] == 1} {
          set html [fetch_html "/region-1" 28]
          set output "\002Wii North America (USA)\002"
        }
        if {[string match -nocase "jap" $region] == 1} {
          set html [fetch_html "/region-2" 28]
          set output "\002Wii Asia (JAPAN)\002"
        }
        if {[string match -nocase "eur" $region] == 1} {
          set html [fetch_html "/region-3" 28]
          set output "\002Wii Europe (UK)\002"
        }
        if {[string match -nocase "aus" $region] == 1} {
          set html [fetch_html "/region-4" 28]
          set output "\002Wii Australia (AUS)\002"
        }
      }

      if {[string match -nocase "dc" $system] == 1} {
        if {[string match -nocase "jap" $region] == 1} {
          set html [fetch_html "/region-2" 29]
          set output "\002Dreamcast Asia (JAPAN)\002"
        }
      }

      if {[string match -nocase "mac" $system] == 1} {
        if {[string match -nocase "usa" $region] == 1} {
          set html [fetch_html "/region-1" 59]
          set output "\002MAC America (USA)\002"
        }
        if {[string match -nocase "jap" $region] == 1} {
          set html [fetch_html "/region-2" 59]
          set output "\002MAC Asia (JAPAN)\002"         
        }
        if {[string match -nocase "eur" $region] == 1} {
          set html [fetch_html "/region-3" 59] 
          set output "\002MAC Europe (UK)\002"
        }
        if {[string match -nocase "aus" $region] == 1} {
          set html [fetch_html "/region-4" 59]
          set output "\002MAC Australia (AUS)\002"
        }
      }

      if {[string length $output]} {
        set output "$::incith::google::total_modes$output$::incith::google::total_demodes"
      }
      # remove the bold if it isn't desired.
      if {$incith::google::bold_descriptions == 0} {
        regsub -all -- "\002" $output {} output
      }

      # parse for results and loop until desired amount of results
      # is attempted to be reached if possible.
      while {$results < $incith::google::gamefaq_results && $output != ""} {

        # grab date and game title and clear future html of it for looping
        regexp -nocase {<tr.*?td>(.*?)<.+?td>.*?<td><a.+?href.+?title.+?"(.+?)">.+?<.+?a><.+?td>} $html {} date game
        regsub {<tr.*?td>(.+?)<.+?a><.+?td>} $html "" html

        # add the search result
        # if there is a date, add date in bold and game to $output
        if {[string len $date] > 3} {
          if {$incith::google::bold_descriptions == 0} {
            append output "${incith::google::seperator}$::incith::google::desc_modes${date} ${game}$::incith::google::desc_demodes"
          } else {
            append output "${incith::google::seperator}$::incith::google::desc_modes\002${date}\002 ${game}$::incith::google::desc_demodes"
          }
        # otherwise just add name of game
        } elseif {[string len $game] > 1}  {
          append output "${incith::google::split_char}$::incith::google::desc_modes${game}$::incith::google::desc_demodes"
          #append output ",${game}"
        }

        # increase the results, clear the variables for the next loop just in case
        incr results
        ; set date "" ; set game ""    
      }

      # if we have nothing to send, we have no results :(
      if {$output == ""} {
        set output "${::incith::google::desc_modes}Sorry, found no results! \[system = 3ds/nds/gc/wii/ps2/psp/ps3/xbox/x360/pc/mac/iphone; region = usa/jap/eur/aus\] usage: !gamefaqs system in region$::incith::google::desc_demodes"
      }
      return $output
    }

    # BLOGSEARCH
    # fetches the news from blogsearch.google.
    # -madwoota supplied (uses news.google engine), speechless updated
    #
    proc blog {input} {
      ; set results 0 ; set output "" ; set match "" ; set titem "" ; set no_search "" ; set did_you_mean ""

      # fetch the html
      set html [fetch_html $input 24]

      # user input causing errors?
	if {[string match -nocase "*socketerrorabort*" $html]} {
            regsub {(.+?)\|} $html {} html
            return "${::incith::google::error_modes}Socket Error accessing '${html}' .. Does it exist?${::incith::google::error_demodes}" 
	}
	if {[string match -nocase "*timeouterrorabort*" $html]} {
		return "${::incith::google::error_modes}Connection has timed out...${::incith::google::error_demodes}" 
	}
      # strip out 'did you mean?' first
      # what do we call 'no search results in any language?'
      regexp -- {<p></p></div></div><div id=f>(.+?)<br><br>} $html - no_search
      if {$no_search != ""} {
        regsub -- {</a>} $no_search "? " no_search
        regsub -all -- {<(.+?)>} $no_search { } no_search
        while {[string match "*  *" $no_search]} {
          regsub -all -- {  } $no_search " " no_search
        }
        set no_search [string trim $no_search]
      }

      # give results an output header with result tally.
      regexp -- {</td><td align=right class=rsb>(.+?)\s\002(.+?)\(\002} $html - titem match
      if {![regexp -- {1\002\s-\s\002.+?\002.+?\002(.+?)\002} $match - match]} {
         set match "Google"
         set titem ""
      }
      regsub -all -- {<(.+?)>} $match {} match
      # format output according to variables.
      if {$incith::google::total_results != 0 && $match > 0} {
        set output "${::incith::google::total_modes}\002[string trim ${match}]\002 [descdecode [string trim $titem]]${::incith::google::total_demodes}${incith::google::seperator}"
        if {$incith::google::bold_descriptions == 0} {
          regsub -all -- "\002" $output {} output
        }
      }

      # parse the html
      while {$results < $incith::google::news_results} {
        # somewhat extenuated regexp due to allowing that there *might* be
        # an image next to the story
        regexp -- {</p><a href="(.+?)".+?id=.+?">(.+?)</a>.+?<td class=j>(.+?)<br>} $html {} link desc time
        regsub -- {</p><a href=(.+?)</a>} $html {} html

        # if there's no desc, return or stop looping, depending
        if {[info exists desc] == 0} {
          if {$results == 0} {
            set reply $no_search
            return "$::incith::google::desc_modes$reply$::incith::google::desc_demodes"
          } else {
            break
          }
        }
        # clean up desc
        if {[info exists desc] == 1 && $incith::google::description_length > 0} {
          set desc [string range $desc 0 [expr $incith::google::description_length - 1]]
          set desc "[descdecode [string trim $desc]] ([descdecode [string trim $time]])"
        }
        # prevent duplicate results is mostly useless here, but will at least
        # ensure that we don't get the exact same article.
        if {[string match "*$link*" $output] == 1} {
          break
        }

        if {[info exists desc]} { set desc "$incith::google::desc_modes[string trim $desc]$incith::google::desc_demodes" }
        if {[info exists link]} { set link "$incith::google::link_modes[string trim $link]$incith::google::link_demodes" }

        # add the search result
        if {$incith::google::link_only == 1} { 
          append output "${link}${incith::google::seperator}"
        } else {
          append output "[descdecode $desc]$::incith::google::break${link}${incith::google::seperator}"
        }

        # increase the results, clear the variables for the next loop just in case
        unset link; unset desc
        incr results
      }

      # make sure we have something to send
      if {$match == ""} {
        set reply $no_search
        return "$::incith::google::desc_modes$reply$::incith::google::desc_demodes"
      }
      return $output
    }

    # SCHOLAR SEARCH
    # fetches the news from scholar.google.
    # -madwoota supplied (uses news.google engine), speechless updated
    #
    proc scholar {input} {
      ; set results 0 ; set output "" ; set match "" ; set titem "" ; set no_search "" ; set did_you_mean "" ; set titen ""

      # this isn't global, so we need to keep ctry (country) here
      regexp -nocase -- {^\.(.+?)\s(.+?)$} $input - titen dummy
      if {$titen == ""} {
        set titen "${incith::google::google_country}" 
      }

      # fetch the html
      set html [fetch_html $input 10]

      # user input causing errors?
	if {[string match -nocase "*socketerrorabort*" $html]} {
            regsub {(.+?)\|} $html {} html
            return "${::incith::google::error_modes}Socket Error accessing '${html}' .. Does it exist?${::incith::google::error_demodes}" 
	}
	if {[string match -nocase "*timeouterrorabort*" $html]} {
		return "${::incith::google::error_modes}Connection has timed out...${::incith::google::error_demodes}" 
	}
      # strip out 'did you mean?' first
      # what do we call 'no search results in any language?'
      if {![regexp -- {</script><p>(.+?)\.<br>} $html - no_search]} {
        regexp -- {</script><br><br>(.+?)<br><br>} $html - no_search
      }
      if {$no_search != ""} {
        regsub -- {</a>} $no_search "? " no_search
        regsub -all -- {<(.*?)>} $no_search { } no_search
        while {[string match "*  *" $no_search]} {
          regsub -all -- {  } $no_search " " no_search
        }
        set no_search [string trim $no_search]
      }

      # give results an output header with result tally.
      regexp -- {align=right nowrap>(.+?)\s\002(.+?)\(\002} $html - titem match
      if {![regexp -- {1\002\s-\s\002.+?\002.+?\002(.+?)\002} $match - match]} {
         set match "Google"
         set titem ""
      }
      regsub -all -- {<(.+?)>} $match {} match
      # format output according to variables.
      if {$incith::google::total_results != 0 && $match > 0} {
        set output "${::incith::google::total_modes}\002[string trim ${match}]\002 [descdecode [string trim $titem]]${::incith::google::total_demodes}${incith::google::seperator}"
        if {$incith::google::bold_descriptions == 0} {
          regsub -all -- "\002" $output {} output
        }
      }

      # parse the html
      while {$results < $incith::google::news_results} {
        # somewhat extenuated regexp due to allowing that there *might* be
        # an image next to the story
        if {[regexp -- {<p class=g><h3 class="r">(.+?)   } $html - ps]} {
          regsub -- {<p class=g><h3 class="r">(.+?)   } $html {} html
          if {![regexp -- {<a href="(.+?)" onmousedown} $ps - link]} { set link "none" } { regsub {<a href="(.+?)" onmousedown.*?>} $ps "" ps }
          if {[regexp -- {(.+?)</h3>.*?<br>(.*?)<br>} $ps - desc time]} { regsub {</a>} $desc "" desc }
        }

        # if there's no desc, return or stop looping, depending
        if {[info exists desc] == 0} {
          if {$results == 0} {
            set reply $no_search
            return "$::incith::google::desc_modes$reply$::incith::google::desc_demodes"
          } else {
            break
          }
        }
        # clean up desc
        if {[info exists desc] == 1 && $incith::google::description_length > 0} {
          set desc [string range $desc 0 [expr $incith::google::description_length - 1]]
          set desc "[string trim $desc] ([string trim $time])"
        }
        # prevent duplicate results is mostly useless here, but will at least
        # ensure that we don't get the exact same article.
        if {[string match "*$link*" $output] == 1} {
          break
        }

        if {[info exists desc]} { set desc "$incith::google::desc_modes[string trim $desc]$incith::google::desc_demodes" }
        if {[info exists link]} { set link "$incith::google::link_modes[string trim $link]$incith::google::link_demodes" }

        # add the search result
        if {$incith::google::link_only == 1} { 
          append output "${link}${incith::google::seperator}"
        } else {
          if {![string equal $link "none"]} {
            if {![string match "http*" $link]} { set link "http://scholar.google.${titen}/$link" }
            append output "[descdecode $desc]$::incith::google::break${link}${incith::google::seperator}"
          } else {
            append output "[descdecode $desc]${incith::google::seperator}"
          }
        }

        # increase the results, clear the variables for the next loop just in case
        unset link; unset desc
        incr results
      }

      # make sure we have something to send
      if {$match == ""} {
        set reply $no_search
        return "$::incith::google::desc_modes$reply$::incith::google::desc_demodes"
      }
      return $output
    }


    # WIKI
    # fetches wiki info from *.wikipedia.org
    # -speechless supplied
    #
    proc wiki {input} {
      global incithcharset
      ; set output "" ; set ded "" ; set match "" ; set redir "" ; set country "" ; set dec ""
      ; set query "" ; set titem "" ; set ebcPR "" ; set results "" ; set tresult "" ; set red 0
      ; set subtag "" ; set region "" ; set regional ""

      # make it so people can search their country
      regexp -nocase -- {^\.(.+?)\s(.+?)$} $input - country input
      if {$country == ""} {
        set country "${incith::google::wiki_country}"
      }
      regexp -nocase -- {(.*)\@(.*)} $country - country region

      # this is my input encoding hack, this will convert input before it goes
      # out to be queried.
      if {$incith::google::encoding_conversion_input > 0 && $region != ""} {
        set encoding_found [lindex [split [lindex $incith::google::encode_strings [lsearch -glob $incith::google::encode_strings "${region}:*"]] :] 1]
      } elseif {$incith::google::encoding_conversion_input > 0 && $country != ""} {
        set encoding_found [lindex [split [lindex $incith::google::encode_strings [lsearch -glob $incith::google::encode_strings "${country}:*"]] :] 1]
      } else { set encoding_found "" }
      if {$encoding_found != "" && [lsearch -exact [encoding names] $encoding_found] != -1} {
        set input [encoding convertfrom $encoding_found $input]
      }
      regsub -all -- {_} $input { } input
      regexp -- {^(.+?)\#(.+?)$} $input - input results
      regsub -all -- {_} $results { } results
      set input [urlencode $input 0 "utf-8"]
      set results [string map {.20 _} [urlencode [string trim $results] 1 "utf-8"]]

# 1st load of webpage - this is the only part which has error control
# this is where we load the search page to find an exact match or most relevant.
# we will also be able to detect bad user input in the form of socket errors.

      # beware, changing the useragent will result in differently formatted html from Google.
      set query "https://${country}.wikipedia.org/wiki/index.php?title=Special%3ASearch&search=${input}&fulltext=Search"
      set ua "Lynx/2.8.5rel.1 libwww-FM/2.14 SSL-MM/1.4.1 OpenSSL/0.9.7e"
      set http [::http::config -useragent $ua -urlencoding "utf-8"]
      # stole this bit from rosc2112 on egghelp forums
      # borrowed is a better term, all procs eventually need this error handler.
	catch {set http [::http::geturl "$query" -headers $::incith_hdr -timeout [expr 1000 * 5]]} error

	if {[string match -nocase "*couldn't open socket*" $error]} {
		return "${::incith::google::error_modes}Socket Error accessing '${country}.wikipedia.org' .. Does it exist?${::incith::google::error_demodes}" 
	}
	if { [::http::status $http] == "timeout" } {
		return "${::incith::google::error_modes}Connection has timed out...${::incith::google::error_demodes}" 
	}

      # CHECK CHECK
      upvar #0 $http state
      set incithcharset [string map -nocase {"UTF-" "utf-" "iso-" "iso" "windows-" "cp" "shift_jis" "shiftjis"} $state(charset)]
      set html [charenc [ungzip [::http::data $http] $state(meta)] $state(charset)]
      set redir [::http::ncode $http]
      # REDIRECT
      if {[string match "*${redir}*" "302|301" ]} {
        foreach {name value} $state(meta) {
	    if {[regexp -nocase ^location$ $name]} {
	      catch {set http [::http::geturl "$value" -query "" -headers $::incith_hdr -timeout [expr 1000 * 10]]} error
            if { $::incith::google::debug > 0 } { putserv "privmsg $::incith::google::debugnick :\002redirected:\002 $query -> $value" }
	      if {[string match -nocase "*couldn't open socket*" $error]} {
              return "${::incith::google::error_modes}Socket Error accessing '${country}.wikipedia.org' .. Does it exist?${::incith::google::error_demodes}" 
	      }
	      if { [::http::status $http] == "timeout" } {
		  return "${::incith::google::error_modes}Connection has timed out...${::incith::google::error_demodes}" 
	      }
            upvar #0 $http state
            set incithcharset [string map -nocase {"UTF-" "utf-" "iso-" "iso" "windows-" "cp" "shift_jis" "shiftjis"} $state(charset)]
            set html [charenc [ungzip [::http::data $http] $state(meta)] $state(charset)]
            set query $value
	    }
        } 
      }
      ::http::cleanup $http
     
      # generic pre-parsing
      regsub -all -nocase {<sup>(.+?)</sup>} $html {^\1} html
      regsub -all -nocase {<font.+?>} $html "" html
      regsub -all -nocase {</font>} $html "" html
      regsub -all -nocase {<input.+?>} $html "" html
      regsub -all -nocase {(?:<i>|</i>)} $html "" html
      regsub -all "\t" $html " " html
      regsub -all "\n" $html " " html
      regsub -all "\r" $html " " html
      regsub -all "\v" $html " " html
	regsub -all "\f" $html "" html
	regsub -all "\b" $html "" html
	regsub -all "\a" $html "" html
      regsub -all "</li>" $html ". " html
      regsub -all ";;>" $html "" html
      regsub {<div class="floating_object".*?>.*?</div>} $html "" html

      if {$html == ""} { return "$::incith::google::error_modes\002Wikipedia Error:\002 No html to parse.$::incith::google::error_demodes" }

      # see if our direct result is available and if so, lets take it
      if {![regexp -- {<div id="contentSub"><p>.*?<a href="(.+?)".*?title} $html - match]} {
        if {![regexp -- {<div class=.searchresults.><p>*?<a href="(.+?)".*?title} $html - match]} {
          if {![regexp -- {<div class=.searchresults.><p class="mw-search.*?>.*?<a href="(.+?)".*?title} $html - match]} {
		regexp -- {<p class="mw-search-exists">.*?<a href="(.+?)"} $html - match
	    }
        }
      }
      if {[string match -nocase "*action=edit*" $match]} { set match "" }
      # otherwise we only care about top result
      if {$match == ""} {
        if {![regexp -- {<li><a href="((?!http).+?)"} $html - match]} {
          if {![regexp -- {<li style.*?><a href="(.+?)"} $html - match]} {
            if {![regexp -- {<div class='searchresults'>.*?<a href="(.*?)".*?class="mw-redirect">} $html - match]} {
              if {[regexp -- {<li><div class='mw-search-result-heading'>(.*?)</div>} $html - slice]} {
		    if {![regexp -- {<span class='searchalttitle'>.*?<a href="(.*?)"} $slice - match]} {
		      regexp -- {<a href="(.*?)"} $slice - match
                }
              }
            }
          }
        }
      }
      #if {[string match "http://*" $match]} { set match "" }
      if {[string match -nocase "*/wiki*" $country]} {
        regsub -- {/wiki} $country {} country
      }
      # DEBUG DEBUG                    
      set junk [open "ig-debug.txt" w]
      puts $junk $html
      close $junk

      # at this point we can tell if there was any match, so let's not even bother
      # going further if there wasn't a match, this pulls the 'no search etc' found.
      # this can be in any language.
      if {$match == ""} {
        # these are for 'no search results' or similar message
        # these can be in any language.
        if {[regexp -- {<div class='searchresults'>(.+?)</p>} $html - match]} {
          regsub -all {(?:<b>|</b>|<em>|</em>)} $match "\002" match
          regsub -- {<a href="/wiki/Special\:Allpages.*?</a>} $match "." match
          regsub -all {<div id.*?>} $match "" match
          regsub -- {</a></div>} $match "?" match
          regsub -all {</div>} $match "" match
          regsub -all {\[Index\]} $match "" match
          regsub -all {<span.*?/span>} $match "" match
          regsub -all {<script type.*?</script>} $match "" match
          regsub -all { \(<.*?>\)} $match ". " match
          if {[string match "*<!--*" $match]} {
            regexp -- {<li class="normal">.*?</p><p>(.*?)</p>} $html - match
          }
        } else {
          if {[regexp -- {<div id='search results'><p class="mw-search.*?>(.*?)</p>} $html - match]} {
            regsub -all {(?:<b>|</b>|<em>|</em>)} $match "\002" match
          }
        }

        if {$match == ""} {
          if {[regexp -nocase -- {<div class='searchresults'>(.*?)<div class="printfooter">} $html - match]} {
            regsub -all {<p>} $match " " match
            regsub -all {(?:<b>|</b>|<em>|</em>)} $match "\002" match
            regsub -- {<a href="/wiki/Special\:Allpages.*?</a>} $match "." match
            regsub -all {<div id.*?>} $match "" match
            regsub -- {</a></div>} $match "?" match
            regsub -all {</div>} $match "" match
            regsub -all {\[Index\]} $match "" match
            regsub -all {<span.*?/span>} $match "" match
            regsub -all {<script type.*?</script>} $match "" match
            regsub -all { \(<.*?>\)} $match ". " match
          }
        }
        # this is our last error catch, this can grab the
        # 'wikimedia cannot search at this time' message
        # this can be in any language.
        if {[string len $match] < 3} { regexp -- {<center><b>(.+?)</b>} $html - match }
        if {$match == ""} {
          regsub -all -- { } $results {_} results
          if {$results != ""} { set results "#${results}" } 
          return "$::incith::google::error_modes\002Wikimedia Error:\002 Unable to parse for: \002${input}\002 @ ${query}${results}$::incith::google::error_demodes"
        }
        # might be tags since we allowed any language here we cut them out
        regsub -all -- {<(.+?)>} $match {} match
        if {$region == ""} {
          return "$::incith::google::desc_modes[utf8encodefix $country [descdecode ${match}]]$::incith::google::desc_demodes"
        } else {
          return "$::incith::google::desc_modes[utf8encodefix $region [descdecode ${match}]]$::incith::google::desc_demodes"
        }
      }

      # we assume here we found another page to traverse in our search.
      if {$region != ""} {
        regsub -- {/wiki/} $match "/$region/" match
      }
      if {![string match https://* $match]} { set query "https://${country}.wikipedia.org${match}" } { set query $match }

# 2nd load of webpage - this has no error checking what-so-ever
# here is where we pluck the link to the exact match, or the most relevant 'top' link.
# or in the case of redirects, to other pages, we will handle that here as well.

      # beware, changing the useragent will result in differently formatted html from Google.
      set ua "Lynx/2.8.5rel.1 libwww-FM/2.14 SSL-MM/1.4.1 OpenSSL/0.9.7e"
      set http [::http::config -useragent $ua -urlencoding "utf-8"]
      set http [::http::geturl "$query" -headers $::incith_hdr -timeout [expr 1000 * 5]]
      upvar #0 $http state
      set incithcharset [string map -nocase {"UTF-" "utf-" "iso-" "iso" "windows-" "cp" "shift_jis" "shiftjis"} $state(charset)]
      # this is the output encoding hack.
      if {$incith::google::encoding_conversion_output > 0} {
        if {$region != ""} {
          set encoding_found [lindex [split [lindex $incith::google::encode_strings [lsearch -glob $incith::google::encode_strings "$region:*"]] :] 1]
        } else {
          set encoding_found [lindex [split [lindex $incith::google::encode_strings [lsearch -glob $incith::google::encode_strings "$country:*"]] :] 1]
        }
      }

      set html [charenc [ungzip [::http::data $http] $state(meta)] $state(charset)]
      if {$incith::google::debug > 0} {
        putserv "privmsg $incith::google::debugnick :\002url:\002 $query \002charset:\002 [string map -nocase {"iso-" "iso" "windows-" "cp" "shift_jis" "shiftjis"} $incithcharset] \002\037encode_string:\037\002 $encoding_found"
      }
      ::http::cleanup $http
      #correct the html, remove shitty tags
      # generic pre-parsing
      regsub -all -nocase {<sup>(.+?)</sup>} $html {^\1} html
      regsub -all -nocase {<font.+?>} $html "" html
      regsub -all -nocase {</font>} $html "" html
      regsub -all -nocase {<input.+?>} $html "" html
      regsub -all -nocase {(?:<i>|</i>)} $html "" html
      regsub -all "\t" $html " " html
      regsub -all "\n" $html " " html
      regsub -all "\r" $html " " html
      regsub -all "\v" $html " " html
	regsub -all "\f" $html "" html
	regsub -all "\b" $html "" html
	regsub -all "\a" $html "" html
      regsub -all "</li>" $html ". " html
      regsub -all ";;>" $html "" html

      if {$incith::google::bold_descriptions > 0 && [string match "\002" $incith::google::desc_modes] != 1} {
        regsub -all -nocase {(?:<b>|</b>)} $html "\002" html
      }
      set match ""

      # are we redirected to another page? if so, let's go there
      regexp -- {alt="#REDIRECT ".+?<a href="(.+?)" title="} $html - match
      if {$match != ""} {
        incr red 1
        set query "https://${country}.wikipedia.org${match}"

# 3rd load of webpage - this has no error checking what-so-ever
# here is our final webpage, this is hopefully what the user was looking for.

        # beware, changing the useragent will result in differently formatted html from Google.
        set ua "Lynx/2.8.5rel.1 libwww-FM/2.14 SSL-MM/1.4.1 OpenSSL/0.9.7e"
        set http [::http::config -useragent $ua -urlencoding "utf-8"]
        set http [::http::geturl $query -headers $::incith_hdr -timeout [expr 1000 * 10]]
        upvar #0 $http state
        set incithcharset [string map -nocase {"UTF-" "utf-" "iso-" "iso" "windows-" "cp" "shift_jis" "shiftjis"} $state(charset)]
        # this is the output encoding hack.
        if {$incith::google::encoding_conversion_output > 0} {
          if {$region != ""} {
            set encoding_found [lindex [split [lindex $incith::google::encode_strings [lsearch -glob $incith::google::encode_strings "$region:*"]] :] 1]
          } else {
            set encoding_found [lindex [split [lindex $incith::google::encode_strings [lsearch -glob $incith::google::encode_strings "$country:*"]] :] 1]
          }
        } else { set incithcharset "" }

        set html [charenc [ungzip [::http::data $http] $state(meta)] $state(charset)]
        if {$incith::google::debug > 0} {
          putserv "privmsg $incith::google::debugnick :\002url:\002 $query \002charset:\002 [string map -nocase {"iso-" "iso" "windows-" "cp" "shift_jis" "shiftjis"} $incithcharset] \002\037encode_string:\037\002 $encoding_found"
        }
        ::http::cleanup $http
        #correct the html, remove shitty tags
        # generic pre-parsing
        regsub -all -nocase {<sup>(.+?)</sup>} $html {^\1} html
        regsub -all -nocase {<font.+?>} $html "" html
        regsub -all -nocase {</font>} $html "" html
        regsub -all -nocase {<input.+?>} $html "" html
        regsub -all -nocase {(?:<i>|</i>)} $html "" html
        regsub -all "\t" $html " " html
        regsub -all "\n" $html " " html
        regsub -all "\r" $html " " html
        regsub -all "\v" $html " " html
	  regsub -all "\f" $html "" html
	  regsub -all "\b" $html "" html
	  regsub -all "\a" $html "" html
        regsub -all "</li>" $html ". " html
        regsub -all ";;>" $html "" html

        if {$incith::google::bold_descriptions > 0 && [string match "\002" $incith::google::desc_modes] != 1} {
          regsub -all -nocase {(?:<b>|</b>)} $html "\002" html
        }
      }

      # DEBUG DEBUG                    
      set junk [open "wikize.txt" w]
      puts $junk $html
      close $junk

      set match ""
      # give results an output header with result tally.
      if {[regexp -- {<title>(.+?)</title>} $html - match]} { regexp -- {(.+?)\s(?:-|-)\s} $match - match }
      # see if page has a redirect to fragment
      regexp -- {redirectToFragment\("\#(.*?)"\)} $html - tresult
      if {[string match "*#*" $query]} { regexp -- {^(.*?)#(.*?)$} $query - query tresult }
      if {![string match "*<a name=*" $html]} { set walt 1 }
      # this is my kludge to allow listing table of contents, to make
      # sub-tag lookups easier to see on irc.
      if {[string length $results]} {
        set tresult ""
        set subtag [string tolower $results]
        # if the table of contents exists on the page, lets use real world words
        # instead of ugly subtags...
        if {[string match "*<table id=\"toc*" $html]} {
          set ded "\002ToC\002\: " ; set ebcPR "" ; set results "" ; set anchors "toc"
          # set results [regexp -inline -all -- {<li class="toclevel.*?<span class="toctext">(.*?)</span>} $html]
          set results [regexp -inline -all -- {<li class="toclevel.*?href="#(.*?)"} $html]
          foreach {junk anchor} $results { lappend anchors $anchor }
          if {[string tolower $subtag] == "toc"} {
		set new [list]
            foreach anchor $anchors { 
		  if {[string length $::incith_hdr]} {
                if {![catch {package present http 2.7}]} {
		      lappend new [string map {"_" " "} [encoding convertfrom utf-8 [subtagDecode $anchor]]]
                } else {
		      if {![botispatched]} {
				lappend new [string map {"_" " "} [subtagDecode $anchor]]
			} else {
				lappend new [string map {"_" " "} [encoding convertfrom utf-8 [subtagDecode $anchor]]]
			}
                }
		  } else {
		    lappend new [string map {"_" " "} [charenc [subtagDecode $anchor] utf-8]]
              }
            }
            append ded [join $new "; "]
            set toc 1
          } else {
            set ded ""
          }
        } else {
          # table of contents doesnt exist for the page, so we are manually
          # going to pull them for the user ourselves.
          set ded "\002\(ToC)\002: " ; set ebcPR "" ; set anchors "toc"
          if {![info exists walt]} {
            set results [regexp -inline -all -- {<a name=".*?id="(.+?)"} $html]
          } else {
            set results [regexp -inline -all -- {<span class="mw-headline".*?id="(.*?)"} $html]
          }
          foreach {junk anchor} $results { lappend anchors $anchor }
          if {[string tolower $subtag] == "toc"} {
		set new [list]
            foreach anchor $anchors { 
		  if {[string length $::incith_hdr]} {
                if {![catch {package present http 2.7}]} {
		      lappend new [string map {"_" " "} [encoding convertfrom utf-8 [subtagDecode $anchor]]]
                } else {
		      if {![botispatched]} {
				lappend new [string map {"_" " "} [subtagDecode $anchor]]
			} else {
				lappend new [string map {"_" " "} [encoding convertfrom utf-8 [subtagDecode $anchor]]]
			}
                }
		  } else {
		    lappend new [string map {"_" " "} [charenc [subtagDecode $anchor] utf-8]]
              }
            }
            append ded [join $new "; "]
            set toc 1
          } else {
            set ded ""
          }
        }
      }

      # this is in case an internal redirectToFragment(# ) was found
      if {$tresult != ""} {
        set subtag $tresult
        incr red 1
        if {![info exists walt]} {
          set redir "<a name=\"${subtag}\".*?>(.*?)(?:<a name|<div class=\"printfooter)"
        } else {
          if {[string index $tresult 0] == "#"} { set tresult [string range $tresult 1 end] ; set subtag $tresult }
          set redir "<span class=\"mw-headline\" id=\"${subtag}\".*?>(.*?)(?:<span class=\"mw-headline|<div class=\"printfooter)"
        }
        regexp -nocase "$redir" $html - ded
        regsub -all -- {\[<(.*?)>\]} $ded {} ded
        regsub -all -- {\[[[:digit:]]+\]}  $ded {} ded
        regsub -all -- {<th style=.*?</th>} $ded {} ded
        regsub -all -- {<table.+?</table>} $ded {} ded
        if {$ded == ""} {
            return "$::incith::google::error_modes\002Wikipedia Error:\002 redirectToFragment(#${tresult}) not found in body of html @ ${query} .  This Wiki Entry is flawed and should be reported for redirect errors.$::incith::google::error_demodes"
        }
      }

      # This is for our manual #sub-tag search..
      if {![string equal [string tolower $subtag] "toc"] && [string length $subtag] && ![string length $tresult]} {
        set subtag [string map {" " "_"} $subtag]
        # direct match
        if {[info exists anchors]} {
	    foreach entry $anchors {
            if {[string match -nocase $entry $subtag] || [string match -nocase [subtagDecode $entry] $subtag]} {
              set stf "true"
              incr red 1
              set subtag [string map {" " "_"} $entry]
              break
            }
          }
          if {![info exists stf]} {
            # starts the anchor
            foreach entry $anchors {
              if {[string match -nocase "$subtag*" $entry] || [string match -nocase [subtagDecode "$subtag*"] $entry]} {
                set stf "true"
                incr red 1
                set subtag [string map {" " "_"} $entry]
                break
              }
            }
          }
          if {![info exists stf]} {
            # anywhere in the anchor
            foreach entry $anchors {
              if {[string match -nocase "*$subtag*" $entry] || [string match -nocase [subtagDecode "*$subtag*"] $entry]} {
		    set stf "true"
                incr red 1
                set subtag [string map {" " "_"} $entry]
                break
              }
            }
          }
        }
        if {![info exists stf]} {
          return "$::incith::google::error_modes\002Wikipedia Error:\002 Manual #anchor (${subtag}) not found in body of html @ ${query} .$::incith::google::error_demodes"
        }
        if {![info exists walt]} {
          set redir "<a name=\"${subtag}\".*?>(.*?)(?:<a name|<div class=\"printfooter)"
        } else {
          set redir "<span class=\"mw-headline\" id=\"${subtag}\".*?>(.*?)(?:<span class=\"mw-headline|<div class=\"printfooter)"
        }
        regexp -nocase "${redir}" $html - ded
        regsub -all -- {\[<(.*?)>\]} $ded {} ded
        regsub -all -- {\[[[:digit:]]+\]}  $ded {} ded
        regsub -all -- {<th style=.*?</th>} $ded {} ded
        regsub -all -- {<table.+?</table>} $ded {} ded
        if {$ded == ""} {
            return "$::incith::google::error_modes\002Wikipedia Error:\002 Unknown problem with (${subtag}) found @ ${query} .$::incith::google::error_demodes"
        }
      }

      # we couldn't chop these earlier because we needed them
      # to easily pull our #sub-tag finder above, need to remove
      # them here before we go further, because it might upset our checks.
      regsub -all -nocase {<span.*?>} $html "" html
      regsub -all -nocase {</span>} $html "" html

      # if we have no pre-cut html, let's start the cutting process.
      if {$ded == ""} {
        regsub -all {<div id="siteNotice">.*?</p></div>} $html {} html
        regsub -all {<script type=.*?</script>} $html {} html
        regsub -all {<th style=.*?</th>} $html {} html
        regsub -all {//<.*?//]]>} $html {} html
        ### - trying to clear out those damned wikipedia tables --
        regsub -all -- {<table.+?</table>} $html {} html
        regexp -- {<p>(.+?)<h} $html - ded
        if {[string match "*</table>*" $ded]} {
          regsub -all -- {.+?</table>} $ded {} ded
        } elseif {[string match "*<table*" $ded]} {
          regsub -all -- {<table.*>.+?} $ded {} ded
        }
      }
   
      # if wiki page is non-standard, then this will attempt
      # to get at least something from the webpage to display.
      if {$ded == ""} {
        if {![regexp -- {<p>(.+?)</p>} $html - ded]} {
          regexp -- {<p>(.+?)<div class="printfooter">} $html - ded
        }
      }
      #clean up messy parsing.
      regsub -all -- {<br>|<br/>} $ded {. } desc
      regsub -all -- {\[<(.*?)>\]} $desc {} desc
      regsub -all -- {<(.+?)>} $desc {} desc
      while {[string match "*  *" $desc]} {
        regsub -all -- {  } $desc " " desc
      }
      regsub -all -- {\[[[:digit:]]+\]}  $desc {} desc
      regsub -all -- { , } $desc ", " desc
      regsub -all -- { \.} $desc "\." desc
      set match [string trim $match]
      # if we have a very short description this will grab more.
      if {$match != ""} {
        if {[string len $desc] < 3} {
          regexp -- {<p>.+?<p>(.+?)<h} $html - ded
          regsub -all -- {<(.+?)>} $ded { } desc
        }
      }
      # if we still have a tiny description, grab more yet.
      if {$match != ""} {
        if {[string len $desc] < 3} {
          regexp -- {<p>(.+?)<p} $html - ded
          regsub -all -- {<(.+?)>} $ded { } desc
        }
      }

      # clean up messy parsing.
      # here we try to sanitize the description
      # i'm hoping this works with any language, *crosses fingers*
      set desc [string trim $desc]
      regsub -all -- {<br>} $desc {. } desc
      regsub -all -- {\[<(.*?)>\]} $desc {} desc
      regsub -all -- {<(.+?)>} $desc {} desc
      while {[string match "*  *" $desc]} {
        regsub -all -- {  } $desc " " desc
      }
      regsub -all -- {\[[[:digit:]]+\]}  $desc {} desc
      regsub -all -- { , } $desc ", " desc
      regsub -all -- { \.} $desc "\." desc
      # regsub -all -- {&#(25(\[6-9\])?|2(\[6-9\])?[\d]|(\[3-9\])?[\d]{2}|[\d]{4,5});} $desc "?" desc
      # set our variables so formatting settings work
      if {$subtag != ""} {
        #regsub -- {" id="top".*?$} $subtag "" subtag
        set subtag "#${subtag}"
      }
      set link $query
      set desc [descdecode $desc]
      if {![info exists toc]} { set desc "[string range $desc 0 [expr 360 * $incith::google::wiki_lines]]" }
      if {[info exists desc]} { set desc "$incith::google::desc_modes[string trim $desc]$incith::google::desc_demodes" }
      if {[info exists link]} { set link "$incith::google::link_modes[string trim "$link$subtag"]$incith::google::link_demodes" }
      if {[info exists match]} { set match "$incith::google::total_modes[string trim $match]$incith::google::total_demodes" }
      # after stripping excessive tags if our description is
      # reduced to nothing, let's lie and say it was too much to parse :)
      if {$match != "" && $desc == ""} {
        regexp -- {<h[0-9].*?>.*?h[0-9]>.*?<ul>(.*?)</ul>} $html - desc
        set desc [string trim $desc]
        regsub -all -- {<br>} $desc {. } desc
        regsub -all -- {\[<(.*?)>\]} $desc {} desc
        regsub -all -- {<(.+?)>} $desc {} desc
        while {[string match "*  *" $desc]} {
          regsub -all -- {  } $desc " " desc
        }
        regsub -all -- {\[[[:digit:]]+\]}  $desc {} desc
        regsub -all -- { , } $desc ", " desc
        regsub -all -- { \.} $desc "\." desc
        set desc "${::incith::google::desc_modes}$desc${::incith::google::desc_demodes}"
      }
      # if we have no description, then let's decide what to do.
      if {$desc == ""} {
        regexp -- {<p>(.+?)</p>} $html - match
        if {$match != ""} { return "$::incith::google::error_modes\002Wikipedia Error:\002 Unable to parse for: \002${input}\002 @ ${query}${subtag}$::incith::google::error_demodes" }
        if {$match == ""} { return "$::incith::google::error_modes\002Wikipedia Error:\002 Sorry, no search results found.$::incith::google::error_demodes" }
        break
      }
      # regular output displayed.
      if {$match != ""} {
        if {$red > 0} {
          set output "\002[descdecode ${match}]\002${incith::google::seperator}${desc}$::incith::google::break${link} $::incith::google::total_modes\[${red} Redirect\(s\)\]$incith::google::total_demodes"
        } else {
          set output "\002[descdecode ${match}]\002${incith::google::seperator}${desc}$::incith::google::break${link}"
        }
      } else {
        if {$red > 0} {
          set output "${desc}$::incith::google::break${link} $::incith::google::total_modes\[${red} Redirect\(s\)\]$::incith::google::total_demodes"
        } else {
          set output "${desc}$::incith::google::break${link}"
        }
      }
      return $output
    }


    # WIKIMEDIA
    # fetches wiki info from sites other than wikipedia.org
    # -speechless supplied
    #
    proc wikimedia {input} {
      global incithcharset
      ; set output "" ; set ded "" ; set match "" ; set redir "" ; set country "" ; set dec ""
      ; set query "" ; set titem "" ; set ebcPR "" ; set results "" ; set tresult "" ; set red 0
      ; set subtag "" ; set no_search "" ; set force 0 ; set fr 0 ; set natch "" ; set region ""
      ; set regional ""

      # make it so people can search their wiki in proper encoding....
      regexp -nocase -- {^\.(.+?)\s(.+?)$} $input - country input
      if {$country == ""} {
        set country "${incith::google::wikimedia_site}"
      }
      regexp -nocase -- {(.*)\@(.*)} $country - country region
      # allow full search if desired
      if {[string match "+" [string range $region 0 0]]} {
        set region [string range $region 1 end]
        set regional $region
      }

      # this is my input encoding hack, this will convert input before it goes
      # out to be queried.
      if {$incith::google::encoding_conversion_input > 0 && $region != ""} {
        set encoding_found [lindex [split [lindex $incith::google::encode_strings [lsearch -glob $incith::google::encode_strings "${region}:*"]] :] 1]
      } elseif {$incith::google::encoding_conversion_input > 0 && $country != ""} {
        set encoding_found [lindex [split [lindex $incith::google::encode_strings [lsearch -glob $incith::google::encode_strings "${country}:*"]] :] 1]
      } else { set encoding_found "" }
      if {$encoding_found != "" && [lsearch -exact [encoding names] $encoding_found] != -1} {
        set input [encoding convertfrom $encoding_found $input]
      }

      regsub -all -- {_} $input { } input
      regexp -- {^(.+?)\#(.+?)$} $input - input results
      regsub -all -- { } $results { } results
      set input [urlencode $input 0 "utf-8"]
      set results [string map {.20 _} [urlencode [string trim $results] 1 "utf-8"]]

      # force is for those times you want to MAKE
      # it directly go to a location, you use force
      # by making first letter of your search term a .
      set force [regexp -nocase -- {^\.(.+?)$} $input - input]
      if {$force == 1} {
        #set query "http://${country}/index.php?search=${input}&go=Go"
        set query "http://${country}/index.php/${input}"
        #set match "/index.php?search=${input}&go=Go"
        #set match "/index.php/${input}"
      } else {
        set query "http://${country}/index.php?title=Special%3ASearch&search=${input}&fulltext=Search"
      }
# pre-load page to get damn redirects out of the way
# this is stupid i agree, but let's not think about it.

      # beware, changing the useragent will result in differently formatted html from Google.
      set ua "Lynx/2.8.5rel.1 libwww-FM/2.14 SSL-MM/1.4.1 OpenSSL/0.9.7e"
      set http [::http::config -useragent $ua -urlencoding "utf-8"]
      # stole this bit from rosc2112 on egghelp forums
      # borrowed is a better term, all procs eventually need this error handler.
	catch {set http [::http::geturl $query -headers $::incith_hdr -timeout [expr 1000 * 5]]} error

	if {[string match -nocase "*couldn't open socket*" $error]} {
		return "${::incith::google::error_modes}Socket Error accessing '${query}' .. Does it exist?${::incith::google::error_demodes}" 
	}
	if { [::http::status $http] == "timeout" } {
		return "${::incith::google::error_modes}Connection has timed out...${::incith::google::error_demodes}" 
	}

      # CHECK CHECK
      upvar #0 $http state
      set incithcharset [string map -nocase {"UTF-" "utf-" "iso-" "iso" "windows-" "cp" "shift_jis" "shiftjis"} $state(charset)]
      set html [charenc [ungzip [::http::data $http] $state(meta)] $state(charset)]
      # REDIRECT
      if {[string match "*${redir}*" "302|301" ]} {
        foreach {name value} $state(meta) {
	    if {[regexp -nocase ^location$ $name]} {
	  	putlog "1. value - $value"
	      catch {set http [::http::geturl "$value" -query "" -headers $::incith_hdr -timeout [expr 1000 * 10]]} error
	      if {[string match -nocase "*couldn't open socket*" $error]} {
		  return "${::incith::google::error_modes}Socket Error accessing '${query}' .. Does it exist?${::incith::google::error_demodes}" 
	      }
	      if { [::http::status $http] == "timeout" } {
		  return "${::incith::google::error_modes}Connection has timed out...${::incith::google::error_demodes}" 
	      }
            upvar #0 $http state
            set incithcharset [string map -nocase {"UTF-" "utf-" "iso-" "iso" "windows-" "cp" "shift_jis" "shiftjis"} $state(charset)]
            set html [charenc [ungzip [::http::data $http] $state(meta)] $state(charset)]
            set query $value
            regsub -all "&amp;" $query {\&} query
            incr red
	    }
        } 
      }
      ::http::cleanup $http

      # are we redirected to another page so soon?
      # usually this is the case, if our original search page wants
      # to search using another method, so let's accomodate it...
      regexp -nocase -- {document has moved.+?<a href="(.+?)">} $html - match
      regexp -nocase -- {Did you mean to type.+?<a href="(.+?)">} $html - match

	putlog "2. query - $query"
      # if we are redirected, then we can modify our url
      # to include the redirect as our new destination site.
      if {$match != ""} {
        incr red 1 ; set fr 1
        set query $match
        regsub -all "&amp;" $query {\&} query
        regexp -- {http\:\/\/(.+?)/index.php} $match - country
      } 

# 1st load of webpage - this is the only part which has error control
# this is where we load the search page to find an exact match or most relevant.
# we will also be able to detect bad user input in the form of socket errors.

      # beware, changing the useragent will result in differently formatted html from Google.
      if {$fr == 1} {
        set ua "Lynx/2.8.5rel.1 libwww-FM/2.14 SSL-MM/1.4.1 OpenSSL/0.9.7e"
        set http [::http::config -useragent $ua -urlencoding "utf-8"]
	  set http [::http::geturl $query -headers $::incith_hdr -timeout [expr 1000 * 15]]
        upvar #0 $http state
        set incithcharset [string map -nocase {"UTF-" "utf-" "iso-" "iso" "windows-" "cp" "shift_jis" "shiftjis"} $state(charset)]
        set html [charenc [ungzip [::http::data $http] $state(meta)] $state(charset)]
        ::http::cleanup $http
      }

      # generic pre-parsing
      regsub -all -nocase {<sup>(.+?)</sup>} $html {^\1} html
      regsub -all -nocase {<font.+?>} $html "" html
      regsub -all -nocase {</font>} $html "" html
      regsub -all -nocase {<span.*?>} $html "" html
      regsub -all -nocase {</span>} $html "" html
      regsub -all -nocase {<input.+?>} $html "" html
      regsub -all -nocase {(?:<i>|</i>)} $html "" html
      regsub -all "\t" $html " " html
      regsub -all "\n" $html " " html
      regsub -all "\r" $html " " html
      regsub -all "\v" $html " " html
	regsub -all "\f" $html "" html
	regsub -all "\b" $html "" html
	regsub -all "\a" $html "" html
      regsub -all "</li>" $html ". " html
      regsub -all ";;>" $html "" html
      regsub {<div class="floating_object".*?>.*?</div>} $html "" html

      if {$html == ""} { return "$::incith::google::error_modes\002Wikimedia Error:\002 No html to parse.$::incith::google::error_demodes" }

  # this is my kludge, enjoy it
  if {$force == 0} {
      # see if our direct result is available and if so, lets take it
      if {![regexp -- {<div id="contentSub"><p>.*?<a href="((?!#).+?)".*?title} $html - match]} {
        regexp -nocase -- {<div class='searchresults'>.*?<a href="(.*?)".*?(class=|title=|style=)} $html - match
      }
      if {[string match -nocase "*action=edit*" $match]} { set match "" }
      # otherwise we only care about top result
      # this is the _only_ way to parse mediawiki, sorry.
      if {$match == ""} {
	  regsub -- {^.*</header>} $html {} html
        regexp -- {<li><a href="(.*?)"} $html - match
        if {$match == ""} {
          if {![regexp -- {<li><div class='mw-search.*?'><a href="(.*?)"} $html - match]} {
            regexp -- {<li style.*?><a href="(.+?)"} $html - match
          }
        }
      }
      # this will strip double domain entries from our country if it exists
      # on our anchor.
      if {$incith::google::wiki_domain_detect != 0} {
        if {[string match -nocase [lindex [split $country "/"] end] [lindex [split $match "/"] 1]]} {
          set country [join [lrange [split $country "/"] 0 end-1] "/"]
        }
      } elseif {[string match -nocase "*/wiki*" $country]} {
       regsub -- {/wiki} $country {} country
      }


      # at this point we can tell if there was any match, so let's not even bother
      # going further if there wasn't a match, this pulls the 'no search etc' found.
      # this can be in any language.
      if {$match == ""} {
        # these are for 'no search results' or similar message
        # these can be in any language.
        # if {[regexp -- {</form>.*?<p>(.+?)(<p><b>|</p><hr)} $html - match]} { regsub -all -- {<(.+?)>} $match {} match } 
        if {$match == ""} {
          if {[regexp -- {<div class='searchresults'>(.+?)</p>} $html - match]} {
            regsub -all {(?:<b>|</b>|<em>|</em>)} $match "\002" match
          } else {
            if {[regexp -- {<div id="contentSub">(.+?)<form id=} $html - match]} {
              regsub -all {(?:<b>|</b>|<em>|</em>)} $match "\002" match
              regsub -- {<a href="/wiki/Special\:Allpages.*?</a>} $match "." match
              regsub -- {<div id.*?>} $match "" match
              regsub -- {</a></div>} $match "?" match
              regsub -- {</div>} $match "" match
              regsub -- {\[Index\]} $match "" match
              regsub -- {<span.*?/span>} $match "" match
              regsub -- { \(<.*?>\)} $match ". " match
              if {[string match "*<!--*" $match]} {
                regexp -- {<li class="normal">.*?</p><p>(.*?)</p>} $html - match
              }
            }
          } 
        }
        # this is our last error catch, this can grab the
        # 'wikimedia cannot search at this time' message
        # this can be in any language.
        if {[string len $match] < 3} { regexp -- {<center><b>(.+?)</b>} $html - match }
        if {$match == ""} {
          regsub -all -- { } $results {_} results
          if {$results != ""} { set results "#${results}" } 
          return "$::incith::google::error_modes\002Wikimedia Error:\002 Unable to parse for: \002${input}\002 @ ${query}${results}$::incith::google::error_demodes"
        }
        # might be tags since we allowed any language here we cut them out
        regsub -all -- {<(.+?)>} $match "" match
        if {$region == ""} {
          return "$::incith::google::desc_modes[utf8encodefix $country [descdecode ${match}]]$::incith::google::desc_demodes"
        } else {
          return "$::incith::google::desc_modes[utf8encodefix $region [descdecode ${match}]]$::incith::google::desc_demodes"
        }
      }
     
      # this lets us easily change our internal sub redirected wiki link.
      #if {$regional != ""} {
      # regsub -- {/wiki/} $match "/$region/" match
      #}

      # we assume here we found another page to traverse in our search.
      if {![string match "*http*" $match]} { set query "http://${country}${match}" } { set query $match }

# 2nd load of webpage - this has no error checking what-so-ever
# here is where we pluck the link to the exact match, or the most relevant 'top' link.
# or in the case of redirects, to other pages, we will handle that here as well.

      # beware, changing the useragent will result in differently formatted html from Google.
      set ua "Lynx/2.8.5rel.1 libwww-FM/2.14 SSL-MM/1.4.1 OpenSSL/0.9.7e"
      set http [::http::config -useragent $ua -urlencoding "utf-8"]
      set http [::http::geturl $query -headers $::incith_hdr -timeout [expr 1000 * 15]]
      upvar #0 $http state ; set ncode [http::ncode $http] ; set metas $state(meta) ; set value ""
      set incithcharset [string map -nocase {"UTF-" "utf-" "iso-" "iso" "windows-" "cp" "shift_jis" "shiftjis"} $state(charset)]
      # this is the output encoding hack.
      #if {$incith::google::encoding_conversion_output > 0} {
      #  if {$region != ""} {
      #    set encoding_found [lindex [split [lindex $incith::google::encode_strings [lsearch -glob $incith::google::encode_strings "$region:*"]] :] 1]
      #  } else {
      #    set encoding_found [lindex [split [lindex $incith::google::encode_strings [lsearch -glob $incith::google::encode_strings "$country:*"]] :] 1]
      #  }
      #}

      set html [charenc [ungzip [::http::data $http] $state(meta)] $state(charset)]

      if {$incith::google::debug > 0} {
        putserv "privmsg $incith::google::debugnick :\002url:\002 $query \002charset:\002 [string map -nocase {"iso-" "iso" "windows-" "cp" "shift_jis" "shiftjis"} $incithcharset] \002\037encode_string:\037\002 $encoding_found"
      }
      ::http::cleanup $http
      #correct the html, remove shitty tags
      # generic pre-parsing
      regsub -all -nocase {<sup>(.+?)</sup>} $html {^\1} html
      regsub -all -nocase {<font.+?>} $html "" html
      regsub -all -nocase {</font>} $html "" html
      regsub -all -nocase {<input.+?>} $html "" html
      regsub -all -nocase {(?:<i>|</i>)} $html "" html
      regsub -all "\t" $html " " html
      regsub -all "\n" $html " " html
      regsub -all "\r" $html " " html
      regsub -all "\v" $html " " html
	regsub -all "\f" $html "" html
	regsub -all "\b" $html "" html
	regsub -all "\a" $html "" html
      regsub -all "</li>" $html ". " html
      regsub -all ";;>" $html "" html
      if {$incith::google::bold_descriptions > 0 && [string match "\002" $incith::google::desc_modes] != 1} {
        regsub -all -nocase {(?:<b>|</b>)} $html "\002" html
      }
      set match ""
   
    # this is where my kludge ends ;)
    # this is if there is no text on a special page.
    } else {
     if {[regexp -nocase -- {<div class="noarticletext">(.+?)</div>} $html - no_search]} {
       regsub -all -- {<(.+?)>} $no_search {} no_search
       while {[string match "*  *" $no_search]} {
         regsub -all -- {  } $no_search " " no_search
       }
       return "$::incith::google::desc_modes$no_search$::incith::google::desc_demodes"
     }
    }
    
    if {[string match 30* $ncode]} {
      foreach {name value} $metas {
        if {[regexp -nocase ^location$ $name]} {
          set go $value
        }
      }
    }
    # are we redirected to another page? if so, let's go there
    if {[regexp -- {alt="#REDIRECT ".+?<a href="(.+?)" title="} $html - match] || [info exists go]} {
      if {$match != ""} {
        incr red 1
        set query "http://${country}${match}"
      } else { set query $go }

# 3rd load of webpage - this has no error checking what-so-ever
# here is our final webpage, this is hopefully what the user was looking for.

        # beware, changing the useragent will result in differently formatted html from Google.
        set ua "Lynx/2.8.5rel.1 libwww-FM/2.14 SSL-MM/1.4.1 OpenSSL/0.9.7e"
        set http [::http::config -useragent $ua -urlencoding "utf-8"]
        set http [::http::geturl $query -headers $::incith_hdr -timeout [expr 1000 * 15]]
        upvar #0 $http state
        set incithcharset [string map -nocase {"UTF-" "utf-" "iso-" "iso" "windows-" "cp" "shift_jis" "shiftjis"} $state(charset)]
        # this is the output encoding hack.
        #if {$incith::google::encoding_conversion_output > 0} {
        #  if {$region != ""} {
        #    set encoding_found [lindex [split [lindex $incith::google::encode_strings [lsearch -glob $incith::google::encode_strings "$region:*"]] :] 1]
        #  } else {
        #    set encoding_found [lindex [split [lindex $incith::google::encode_strings [lsearch -glob $incith::google::encode_strings "$country:*"]] :] 1]
        #  }
        #}

        set html [charenc [ungzip [::http::data $http] $state(meta)] $state(charset)]

        if {$incith::google::debug > 0} {
          putserv "privmsg $incith::google::debugnick :\002url:\002 $query \002charset:\002 [string map -nocase {"iso-" "iso" "windows-" "cp" "shift_jis" "shiftjis"} $incithcharset] \002\037encode_string:\037\002 $encoding_found"
        }
        ::http::cleanup $http
        #correct the html, remove shitty tags
        # generic pre-parsing
        regsub -all -nocase {<sup>(.+?)</sup>} $html {^\1} html
        regsub -all -nocase {<font.+?>} $html "" html
        regsub -all -nocase {</font>} $html "" html
        regsub -all -nocase {<input.+?>} $html "" html
        regsub -all -nocase {(?:<i>|</i>)} $html "" html
        regsub -all "\t" $html " " html
        regsub -all "\n" $html " " html
        regsub -all "\r" $html " " html
        regsub -all "\v" $html " " html
	  regsub -all "\f" $html "" html
	  regsub -all "\b" $html "" html
	  regsub -all "\a" $html "" html
        regsub -all "</li>" $html ". " html
        regsub -all ";;>" $html "" html
        if {$incith::google::bold_descriptions > 0 && [string match "\002" $incith::google::desc_modes] != 1} {
          regsub -all -nocase {(?:<b>|</b>)} $html "\002" html
        }
      }

      set match ""
      # give results an output header with result tally.
      regexp -- {<title>(.+?)\s\-\s.+?</title>} $html - match
      # see if page has a redirect to fragment
      if {![string length $results]} { regexp -- {redirectToFragment\("(\#.+?)"\)} $html - tresult }
      if {![string match "*<a name=*" $html]} { set walt 1 }
      # this is my kludge to allow listing table of contents, to make
      # sub-tag lookups easier to see on irc.
      if {[string length $results] || [string length $tresult]} {
        if {[string length $results]} { set tresult "" }
        set subtag [string tolower $results]
        # if the table of contents exists on the page, lets use real world words
        # instead of ugly subtags...
        if {[string match "*<table id=\"toc*" $html]} {
          set ded [encoding convertto "utf-8" "\002ToC\002\: "] ; set ebcPR "" ; set results "" ; set anchors "toc"
          # set results [regexp -inline -all -- {<li class="toclevel.*?<span class="toc.*?">(.*?)</span>} $html]
          set results [regexp -inline -all -- {<li class="toclevel.*?href="#(.*?)"} $html]
          foreach {junk anchor} $results { lappend anchors $anchor }
          if {[string tolower $subtag] == "toc"} {
		set new [list]
            foreach anchor $anchors { 
		  if {[string length $::incith_hdr]} {
                if {![catch {package present http 2.7}]} {
		      lappend new [string map {"_" " "} [encoding convertfrom utf-8 [subtagDecode $anchor]]]
                } else {
		      if {![botispatched]} {
				lappend new [string map {"_" " "} [subtagDecode $anchor]]
			} else {
				lappend new [string map {"_" " "} [encoding convertfrom utf-8 [subtagDecode $anchor]]]
			}
                }
		  } else {
		    lappend new [string map {"_" " "} [charenc [subtagDecode $anchor] utf-8]]
              }
            }
            append ded [join $new "; "]
            set toc 1 ; set loop 1
          } else {
            set ded ""
          }
        } else {
          # table of contents doesnt exist for the page, so we are manually
          # going to pull them for the user ourselves.
          set ded [encoding convertto "utf-8" "\002\(ToC)\002: "] ; set ebcPR "" ; set anchors "toc"
          if {![info exists walt]} {
            set results [regexp -inline -all -- {<a name=".*?id="(.+?)"} $html]
          } else {
            set results [regexp -inline -all -- {<span class="mw-headline".*?id="(.*?)"} $html]
          }
          foreach {junk anchor} $results { lappend anchors $anchor }
          if {[string tolower $subtag] == "toc"} {
		set new [list]
            foreach anchor $anchors { 
		  if {[string length $::incith_hdr]} {
                if {![catch {package present http 2.7}]} {
		      lappend new [string map {"_" " "} [encoding convertfrom utf-8 [subtagDecode $anchor]]]
                } else {
		      if {![botispatched]} {
				lappend new [string map {"_" " "} [subtagDecode $anchor]]
			} else {
				lappend new [string map {"_" " "} [encoding convertfrom utf-8 [subtagDecode $anchor]]]
			}
                }
		  } else {
		    lappend new [string map {"_" " "} [charenc [subtagDecode $anchor] utf-8]]
              }
            }
            append ded [join $new "; "]
            set toc 1 ; set loop 1
          } else {
            set ded ""
          }
        }
      }

      # this is in case an internal redirectToFragment(# ) was found
      if {$tresult != ""} {
        #set subtag $tresult
        incr red 1
        if {![info exists walt]} {
          set redir "name=\"${tresult}\".*?>(.+?)(<a name|</table>|\<\!\-)"
        } else {
          set tresult [string range $tresult 1 end]
          set redir "<span class=\"mw-headline\" id=\"${tresult}.*?>(.+?)(<span|</table>|\<\!\-)"
        }
        regexp -nocase "$redir" $html - ded
        regsub -all -- {\[<(.*?)>\]} $ded {} ded
        regsub -all -- {\[[[:digit:]]+\]}  $ded {} ded
        regsub -all -- {<table.+?</table>} $ded {} ded
        if {$ded == ""} {
            return "$::incith::google::error_modes\002Wikimedia Error:\002 redirectToFragment(#${tresult}) not found in body of html @ ${query} .  This Wiki Entry is flawed and should be reported for redirect errors.$::incith::google::error_demodes"
        }
      }

      # This is for our manual #sub-tag search..
      if {![string equal [string tolower $subtag] "toc"] && [string length $subtag]} {
        set subtag [string map {" " "_"} $subtag]
        # direct match
        if {[info exists anchors]} {
	    foreach entry $anchors {
            if {[string match -nocase $entry $subtag] || [string match -nocase [subtagDecode $entry] $subtag]} {
              set stf "true"
              incr red 1
              set subtag [string map {" " "_"} $entry]
              break
            }
          }
          if {![info exists stf]} {
            # starts the anchor
            foreach entry $anchors {
              if {[string match -nocase "$subtag*" $entry] || [string match -nocase [subtagDecode "$entry*"] $subtag]} {
                set stf "true"
                incr red 1
                set subtag [string map {" " "_"} $entry]
                break
              }
            }
          }
          if {![info exists stf]} {
            # anywhere in the anchor
            foreach entry $anchors {
              if {[string match -nocase "*$subtag*" $entry] || [string match -nocase [subtagDecode "*$subtag*"] $entry]} {
		    set stf "true"
                incr red 1
                set subtag [string map {" " "_"} $entry]
                break
              }
            }
          }
        }
        if {![info exists stf]} {
          return "$::incith::google::error_modes\002Wikimedia Error:\002 Manual #anchor (${subtag}) not found in body of html @ ${query} .$::incith::google::error_demodes"
        }
        if {![info exists walt]} {
          set redir "name=\"${subtag}\".*?>(.*?)(?:<a name|<div class=\"printfooter)"
        } else {
          set redir "<span class=\"mw-headline\" id=\"${subtag}\".*?>(.*?)(?:<span class=\"mw-headline|<div class=\"printfooter)"
        }
        regexp -nocase "${redir}" $html - ded
        regsub -all -- {\[<(.*?)>\]} $ded {} ded
        regsub -all -- {\[[[:digit:]]+\]}  $ded {} ded
        regsub -all -- {<th style=.*?</th>} $ded {} ded
        regsub -all -- {<table.+?</table>} $ded {} ded
        if {$ded == ""} {
            return "$::incith::google::error_modes\002Wikimedia Error:\002 Unknown problem with (${subtag}) found @ ${query} .$::incith::google::error_demodes"
        }
      }

      # we couldn't chop these earlier because we needed them
      # to easily pull our #sub-tag finder above, need to remove
      # them here before we go further, because it might upset our checks.
      regsub -all -nocase {<span.*?>} $html "" html
      regsub -all -nocase {</span>} $html "" html

      # if we have no pre-cut html, let's start the cutting process.
      if {$ded == ""} {   
        regexp -- {<h1.*?>.*?<p>(.+?)<h} $html - ded
        ### - trying to clear out those damned wikipedia tables --
        regsub -all -- {<table.+?</table>} $ded {} ded
        if {[string match "*</table>*" $ded]} {
          regsub -all -- {.+?</table>} $ded {} ded
        } elseif {[string match "*<table*" $ded]} {
          regsub -all -- {<table.*>.+?} $ded {} ded
        }
      }
   
      # if wiki page is non-standard, then this will attempt
      # to get at least something from the webpage to display.
      if {$ded == ""} {
        regexp -- {<p>(.+?)<div class="printfooter">} $html - ded
      }
      #clean up messy parsing.
      regsub -all -- {<br>|<br/>} $ded {. } desc
      #regsub -all -- {">:alpha:\]} $desc {} desc
      regsub -all -- {\[<(.*?)>\]} $desc {} desc
      regsub -all -- {<(.+?)>} $desc {} desc
      while {[string match "*  *" $desc]} {
        regsub -all -- {  } $desc " " desc
      }
      regsub -all -- {\[[[:digit:]]+\]}  $desc {} desc
      regsub -all -- { , } $desc ", " desc
      regsub -all -- { \.} $desc "\." desc
      regsub -all -- {&#(25(\[6-9\])?|2(\[6-9\])?[\d]|(\[3-9\])?[\d]{2}|[\d]{4,5});} $desc "?" desc
      set match [string trim $match]
      # if we have a very short description this will grab more.
      if {[string len $desc] < 3} {
        if {[regexp -- {<p>.+?<p>(.+?)<h} $html - desc]} { set desc [cleans $desc] }
      }
      if {[string len $desc] < 3} {
        if {[regexp -- {<p>(.+?)<p} $html - desc]}  { set desc [cleans $desc] }
      }
      #if {[string length $tresult]} { set subtag $tresult }
      # set our variables so formatting settings work
      if {$subtag != ""} {
        regsub -- {" id="top".*?$} $subtag "" subtag
        set subtag "#${subtag}"
      }
      set link $query
      set desc [descdecode $desc]
      if {![info exists loop]} { set desc "[string range $desc 0 [expr 360 * $incith::google::wiki_lines]]" }
      if {[info exists desc]} { set desc "$incith::google::desc_modes[string trim $desc]$incith::google::desc_demodes" }
      if {[info exists match]} { set match "$incith::google::total_modes[string trim $match]$incith::google::total_demodes" }
      if {[info exists link]} { set link "$incith::google::link_modes[string trim "$link$subtag"]$incith::google::link_demodes" }
      # after stripping excessive tags if our description is
      # reduced to nothing, let's lie and say it was too much to parse :)

      # if we have no description, then let's decide what to do.
      if {$desc == ""} {
        regexp -- {<p>(.+?)</p>} $html - match
        if {$match != ""} { return "$::incith::google::error_modes\002Wikimedia Error:\002 Unable to parse for: \002${input}\002 @ ${query}${subtag}$::incith::google::error_demodes" }
        if {$match == ""} { return "$::incith::google::error_modes\002Wikimedia Error:\002 Sorry, no search results found.$::incith::google::error_demodes" }
        break
      }

      # regular output displayed.
      if {$match != ""} {
        if {$red > 0} {
          set output "\002[descdecode ${match}]\002${incith::google::seperator}${desc}$incith::google::break${link} $incith::google::total_modes\[${red} Redirect\(s\)\]$::incith::google::total_demodes"
        } else {
          set output "\002[descdecode ${match}]\002${incith::google::seperator}[descdecode ${desc}]$::incith::google::break${link}"
        }
      } else {
        if {$red > 0} {
          set output "${desc}$::incith::google::break${link} $::incith::google::total_modes\[${red} Redirect\(s\)\]$::incith::google::total_demodes"
        } else {
          set output "${desc}$::incith::google::break${link}"
        }
      }
      return $output
    }

    # wikipedia/wikimedia support
    # CLEANS
    #
    proc cleans {input} {
      # clean up messy parsing.
      # here we try to sanitize the description
      # i'm hoping this works with any language, *crosses fingers*
      set desc [string trim $input]
      regsub -all -- {<br>} $desc {. } desc
      regsub -all -- {\[<(.*?)>\]} $desc {} desc
      regsub -all -- {<(.+?)>} $desc {} desc
      while {[string match "*  *" $desc]} {
        regsub -all -- {  } $desc " " desc
      }
      regsub -all -- {\[[[:digit:]]+\]}  $desc {} desc
      regsub -all -- { , } $desc ", " desc
      regsub -all -- { \.} $desc "\." desc
      regsub -all -- {&#(25(\[6-9\])?|2(\[6-9\])?[\d]|(\[3-9\])?[\d]{2}|[\d]{4,5});} $desc "?" desc
      return $desc
    }

    # EBAY
    # fetches search results from ebay for auctions closest to completion.
    # -speechless supplied
    #
    proc ebay {input} {
      # lots of variables, keeping them clean is important.
      ; set results 0 ; set output "" ; set titem "" ; set tresult "" ; set ebcSP ""
      ; set ebcU "" ; set ebcI "" ; set ebcBid "" ; set ebcPR "" ; set ebcTim "" ; set ebcShpNew ""
      ; set ebcCheck "" ; set no_search "" ; set auctions "" ; set ebcBid2 "" ; set ebcStr ""

      # this isn't global, so we need to keep ctry (country) here
      regexp -nocase -- {^\.(.+?)\s(.+?)$} $input - titem dummy
      if {$titem == ""} {
        set titem "${incith::google::ebay_country}" 
      }

      # fetch the html
      set html [fetch_html $input 25]
      if {$html == ""} {
        return "$::incith::google::error_modes\002Ebay Error: No html to parse.$::incith::google::error_demodes"
      }

      # user input causing errors?
	if {[string match -nocase "*socketerrorabort*" $html]} {
            regsub {(.+?)\|} $html {} html
            return "${::incith::google::error_modes}Socket Error accessing '${html}' .. Does it exist?${::incith::google::error_demodes}" 
	}
	if {[string match -nocase "*timeouterrorabort*" $html]} {
		return "${::incith::google::error_modes}Connection has timed out...${::incith::google::error_demodes}" 
	}

      # set up an ebay results header for results to be appended to as $output
      if {![regexp -- {class="sectiontitle">([0-9  .,]+)\002.*?<h2 class="standard ens} $html - tresult]} {
        if {![regexp -- {<div class="count">([0-9  .,]+) } $html - tresult]} {
           if {![regexp -- {var.*?getCustomAdConfig.*?,"items=(.+?)"} $html - tresult]} {
             if {![regexp -nocase {<div id="v.*?" class="fpcc"><div><h1 class="smuy">(.*?)\s(.*?)\s(.*?)\s} $html - tresult auctions]} {
               if {![regexp -nocase {<div id="v.*?" class="fpcc"><div>(.*?)\s(.*?)\s(.*?)\s} $html - tresult auctions]} {
                 regexp -nocase {<div id="v.*?" class="fpcc">.*?\s(.+?)\s.*?\:\s*(.+?)\s} $html - auctions tresult
                 set tresult "[join [scan  $tresult "%d%d"] ""]"
               }
             }
           }
        }
      }
      # no_results line in any language.
      if {[regexp -- {<div class="msg msg-alert">(.+?)</div>} $html - no_search]} {
        if {[regexp -- {div class="msg msg-alert.+?</div>.+?"msg msg-alert">(.+?)</div>} $html - more]} {
          append no_search " $more"
        }
        regsub -all {<(.+?)>} $no_search "" no_search
      } else {
        if {![regexp -- {class="sectiontitle">(.+?)</h2><h2 class="standard ens"> } $html - no_search]} {
          if {![regexp -- {<div class="count">(.+?)(?:</script>|</div>)} $html - no_search]} {
            if {![regexp -- {<div class="toplne"><div class="msg">(.+?)</div>} $html - no_search]} {
              regexp -- {<div class="cnt">(.*?)</div>} $html - no_search
            }
          }
        }
      }

      # santize our no_search results found error message
      # may need to use it very shortly if we have no results
      if {$no_search != ""} {
        #if {[regexp -- {<div class="suggestions".+?<ul><li><div>(.+?)</li>} $html - ebcStr]} {
        #  regsub -all -- {<(.+?)>} $ebcStr {} ebcStr
        #  set ebcStr "${ebcStr}. "
        #}
        #regexp {(^.+?)document.write} $no_search - no_search
        #regsub -all -- {<(.+?)>} $no_search {} no_search
        #set no_search "${ebcStr}[string trim $no_search]"
      } else {
        if {$tresult == 0 && $no_search == ""} {
          set no_search "eBay error."
        }
      }

      # bids in any language
      if {![regexp -- {<td class="ebcBid">(.+?)</td>} $html {} ebcSP]} {set ebcsp ""}

      # format output according to variables.
      if {$incith::google::total_results != 0} {
        regexp -- {<option value="1" selected="selected">(.+?)</option>} $html - auctions
        set output "$::incith::google::total_modes\002[string trim ${tresult}]\002 [string trim $auctions]$::incith::google::total_demodes${incith::google::seperator}"
        if {$incith::google::bold_descriptions == 0} {
          regsub -all -- "\002" $output {} output
        }
      }

      # parse the html
      while {$results < $incith::google::ebay_results} {
        # these CANNOT be tied together, some results appear in different
        # order, so always leave these spread out in a mess...
        if {![regexp -nocase {<td class="dtl"><div class="ttl">(.*?)</a></td>} $html - line]} {
          if {![regexp -nocase {<table class="lview nol">.*?class="details.*?">(.+?)</table>} $html - line]} {
            if {![regexp -nocase {<table class="nol">.*?class="details.*?">(.+?)</table>} $html - line]} {
              if {![regexp -nocase {<h3 class="ens fontnormal">(.+?)class="ebRight"} $html - line]} { 
                if {![regexp -nocase {<td class="details">(.*?)</a></td>} $html - line]} {
                  set line ""
                } else { regsub -nocase {<td class="details">.*?</a></td>} $html {} html }
              } else { regsub {<h3 class="ens fontnormal">.+?class="ebRight"} $html {} html }
            } else { regsub {<table class="nol">.+?</table>} $html {} html }
          } else { regsub {<table class="lview nol">.+?</table>} $html {} html }
        } else { regsub -nocase {<td class="dtl"><div class="ttl">.*?</a></td>} $html {} html } 
        # name & url
        if {![regexp -nocase {href=".*?ebay.*?/.*?/(.*?)\?pt.*?>(.*?)</a>} $line - ebcU ebcI]} {
          if {![regexp -nocase {<a href=".+?QQitem(.+?)QQ.+?">.+?<a href=".*?">(.+?)</a>} $line - ebcU ebcI]} {
		regexp -nocase {<a href="http://cgi.ebay.*?/.*?/(.*?)\?cmd=.*?>(.*?)</a>} $line - ebcU ebcI
          }
        } 
        # bid
        if {[regexp -nocase {class="bids.*?">(.+?)</td>} $line - ebcBid]} {
          if {[regexp {<div.*?>(.+?)</div><img src=".*?title="(.+?)"} $ebcBid - ebcBid ebcBid2]} {
            set ebcBid "${ebcBid}/${ebcBid2}"
          }
          if {[string match *<img* $ebcBid]} { regexp {<img src=".*?title="(.+?)"} $ebcBid - ebcBid }
        } else {
          regexp -nocase {class="ebcBid">(.*?)</td} $line - ebcBid
          # trying to parse out the phrase "buy-it-now" in any language
          # this isn't elegant at all, we are chopping 'massive' html tags out
          # it works effectively, but isn't quick at all. We also have to account
          # for multiple bid/buy-it-now possibilities....
          regexp -- {(^[0-9\-]{1,})<} $ebcBid {} ebcBid2
          if {![regexp -- {title="(.+?)"} $ebcBid {} ebcBid]} {
            if {![regexp -- {alt="(.+?)(?:\":\:|-)} $ebcBid {} ebcBid]} {
              regsub -all -- {<(.+?)>} $ebcBid "" ebcBid
              if {$ebcBid == "-"} { set ebcBid "0" }
              if {$ebcBid != ""} {
                regsub -all -- {<(.+?)>} $ebcSP "" ebcSP
                append ebcBid " ${ebcSP}"
              }
              if {$ebcBid == ""} { set ebcBid "??" }
            }
          }
          # if our buy-it-now has a bid too, prepend bid to it.
          if {![string match "*${ebcBid2}*" $ebcBid]} {
             if {$ebcBid2 == "-"} { set ebcBid2 "0" }
             regsub -all -- {<(.+?)>} $ebcSP "" ebcSP
             set ebcBid "${ebcBid2} ${ebcSP}/[string trim $ebcBid]"
          }
        }
        regsub -nocase {</div><div class=.*?>} $ebcBid "/" ebcBid
        regsub -all {<.*?>} $ebcBid "" ebcBid
        # prices
        if {[regexp -nocase {<td class="prc.*?">(.*?)</td} $line - ebcPR]} {
          regsub -- {</div><div>} $ebcPR "/" ebcPR
          regexp -- {^(.+)</div>(.*?)$} $ebcPR - ebcPR ebcShpNew
          regsub -all {<.*?>} $ebcPR "" ebcPR
        }
        
        # shipping
        if {![string length $ebcShpNew]} {
          if {[regexp -nocase {td class=".*?(?:ship|fshp).*?">(.+?)</td>} $line - ebcShpNew]} {
            if {[string match "<" [string index $ebcShpNew 0]]} { set ebcShpNew "Calculate" }
          } else {
            regexp -nocase {class="ebcShpNew">(.+?)<} $line - ebcShpNew
            if {[info exists ebcShpNew]} {
              regexp -- {;;">(.+?)} $ebcShpNew {} ebcCheck
              if {$ebcCheck == ""} {
                regexp -- {$(.+?)<} $ebcShpNew {} ebcShpNew
                if {$ebcShpNew == ""} {
                  set ebcTim "store"
                  regexp -nocase {class="ebcStr">.+?http://stores.ebay.com/.+?">(.+?)</a>} $html - ebcStr
                }
              } else {
		    if {![regexp -- {(.*?)<div class="tfsp">(.*?)</div>} $ebcPR - ebcPR ebcShpNew]} {
                  set ebcShpNew "Calculate"
		    }
              }
            }
            # remove pesky trailing spaces
            regsub -all -- {<(.+?)>} $ebcShpNew {} ebcShpNew
            regsub -all " " $ebcShpNew "" ebcShpNew
          }
        }
        # time left
        if {![regexp -nocase {td class="time.*?rt">(.+?)</td>} $line - ebcTim]} {
          if {![regexp -nocase {class="ebcTim">(.+?)<} $line - ebcTim]} {
            regexp -nocase {class="hidlb">(.+?)<} $line - ebcTim
          }
        }
        if {[info exists ebcTim]} {
          regsub -all -- {<.*?>} [string map {\002 ""} $ebcTim] {} ebcTim
          if {[string match *:* $ebcTim]} { set ebcTim [join [lrange [split $ebcTim :] 1 end]] }
        }
        # keep ebay Item from becoming too lengthy
        if {[info exists ebcI]} {
          #ebay has these odd tags, removing them cleans up results.
          regsub -all -nocase "<wbr>" $ebcI "" ebcI
          set ebcI [string range $ebcI 0 [expr $incith::google::description_length - 1]]
          set ebcI [string trim $ebcI]
        }
 
        # check results are more than 0, return or stop looping, depending
        if {$tresult < 1 } {
          if {$results == 0} {
            set reply $no_search
            return "$::incith::google::desc_modes$reply$::incith::google::desc_demodes"
          } else {
            break
          }
        }

        # make the link valid because we were only given a partial href result, not a full url
        set link "http://cgi.ebay.${titem}/_W0QQItemZ[lindex [split ${ebcU} "/"] end]"

        # fix up our variables so the output looks purdy.
        if {$ebcPR == ""} { set ebcPR "--" }
        if {$ebcTim == ""} {
          set ebcTim "--"
        } elseif {$ebcTim == "store"} {
          set desc "\037${ebcStr}\037 ${ebcI}, ${ebcPR}(${ebcShpNew}), ${ebcBid}"
        } elseif {$ebcI != ""} {
          set desc "${ebcI}, ${ebcPR}(${ebcShpNew}), ${ebcBid}, ${ebcTim}"
        } else {
          set link "" ; set desc ""
        }

        # add the search result
        if {$link != ""} {
          if {[info exists desc] == 1 && $ebcI != ""} {
          if {[info exists desc]} { set desc "$incith::google::desc_modes[string trim $desc]$incith::google::desc_demodes" }
          if {[info exists link]} { set link "$incith::google::link_modes[string trim $link]$incith::google::link_demodes" }
            if {$incith::google::link_only == 1} { 
              append output "${link}${incith::google::seperator}"
            } else {
              append output [descdecode "${desc}$::incith::google::break${link}${incith::google::seperator}"]
            }
          }
        }

        # increase the results, clear the variables for the next loop just in case
        unset link ; set ebcCheck "" ; set ebcU "" ; set ebcBid2 ""
        set ebcI "" ; set ebcPR "" ; set ebcShpNew ""
        incr results
      }

      # make sure we have something to send
      if {$tresult < 1} {
        set reply $no_search
        return "$::incith::google::desc_modes$reply$::incith::google::desc_demodes"
      }
      return $output
    }


    # EBAYFIGHT
    # ebay fight !
    #
    proc ebayfight {input} {
      set output ""; set winner 0 ; set match1 0; set match2 0
      
      regexp -nocase -- {^(.+?) vs (.+?)$} $input - word1 word2

      # fetch the first result
      set html [fetch_html $word1 25]
      if {![regexp -- {class="sectiontitle">([0-9  .,]+)\002.*?<h2 class="standard ens} $html - match1]} {
        if {![regexp -- {<div class="count">([0-9  .,]+) } $html - match1]} {
           if {![regexp -- {var.*?getCustomAdConfig.*?,"items=(.+?)"} $html - match1]} {
             if {![regexp -nocase {<div id="v.*?" class="fpcc"><div><h1 class="smuy">(.*?)\s(.*?)\s} $html - match1]} {
               if {![regexp -nocase {<div id="v.*?" class="fpcc"><div>(.*?)\s(.*?)\s} $html - match1]} {
                 regexp -nocase {<div id="v.*?" class="fpcc">.*?\s.+?\s.*?\:\s*(.+?)\s} $html - auctions match1
                 set match1 "[join [scan  $match1 "%d%d"] ""]"
               }
             }
           }
        }
      }

      # fetch the second result
      set html [fetch_html $word2 25]
      regexp -- {<div id="v.*?" class="fpcc">(.+?)\s} $html - match2
      if {![regexp -- {class="sectiontitle">([0-9  .,]+)\002.*?<h2 class="standard ens} $html - match2]} {
        if {![regexp -- {<div class="count">([0-9  .,]+) } $html - match2]} {
           if {![regexp -- {var.*?getCustomAdConfig.*?,"items=(.+?)"} $html - match2]} {
             if {![regexp -nocase {<div id="v.*?" class="fpcc"><div><h1 class="smuy">(.*?)\s(.*?)\s} $html - match2]} {
               if {![regexp -nocase {<div id="v.*?" class="fpcc"><div>(.*?)\s(.*?)\s} $html - match2]} {
                 regexp -nocase {<div id="v.*?" class="fpcc">.*?\s.+?\s.*?\:\s*(.+?)\s} $html - auctions match2
                 set match2 "[join [scan  $match2 "%d%d"] ""]"
               }
             }
           }
        }
      }

      # clean up our matches, so it looks all tidy and neat.
      regsub -all "\002" $match1 " " match1
      regsub -all "\002" $match2 " " match2

      if {![info exists match1]} {
        set match1 "0"
        set match1expr "0"
      } else {
        regsub -all {,} $match1 {} match1expr
      }

      if {![info exists match2]} {
        set match2 "0"
        set match2expr "0"
      } else {
        regsub -all {,} $match2 {} match2expr
      }

      if {[expr $match2expr < $match1expr]} {
        set winner 1
      } else {
        set winner 2
      }

      if {[expr $match2expr == $match1expr]} {
        set winner 1
        set troll1 {
         Pissing Shitting SpillingPez DrippingCum Trolling
        } 
        set troll2 {
         YourFace YourSister YourMama
        } 
        set match1 "[lindex $troll1 [rand [llength $troll1]]]"
        set match2 "[lindex $troll2 [rand [llength $troll2]]]"
      }

      if {$incith::google::bold_descriptions > 0 && $incith::google::desc_modes == ""} {
        set word1 "\002$word1\002"; set word2 "\002$word2\002"
        set match1 "\002 $match1\002"; set match2 "\002 $match2\002"
      } elseif {$incith::google::desc_modes != ""} {
        set word1 "$incith::google::desc_modes$word1$incith::google::desc_demodes"; set word2 "$incith::google::desc_modes$word2$incith::google::desc_demodes"
        set match1 " $incith::google::desc_modes$match1$incith::google::desc_demodes"; set match2 " $incith::google::desc_modes$match2$incith::google::desc_demodes"
      } else {
        set match1 " $match1"; set match2 " $match2"
      }

      regsub -all " " $match1 "" match1
      regsub -all " " $match2 "" match2

      if {$winner == 1} {
        set output "${::incith::google::total_modes}By results on ebay:$::incith::google::total_demodes$incith::google::desc_modes $word1 beats $word2 by $match1 to $match2!$::incith::google::desc_demodes"
      } elseif {$winner == 2} {
        set output "${::incith::google::total_modes}By results on ebay:$::incith::google::total_demodes$incith::google::desc_modes $word2 beats $word1 by $match2 to $match1!$::incith::google::desc_demodes"
      } else {
        set output "${::incith::google::total_modes}Could not determine the winner."
      }

      # make sure we have something to send
      if {[info exists output] == 0} {
        set reply "Sorry, no search results were found."
        if {[info exists did_you_mean] == 1} {
          append reply " Did you mean: ${did_you_mean}?"
        }
        return "$incith::google::desc_modes$reply$::incith::google::desc_demodes"
      }
      return $output
    }

    # Popular
    # fetches games results from gamerankings.
    # -speechless supplied
    #
    proc popular {input} {

      # lots of variables, keeping them clean is important.
      # borrowed mostly from my ebay proc above.
      ; set results 0 ; set output "" ; set tresult ""
      ; set ebcU "" ; set ebcI "" ; set ebcBid "" ; set ebcPR ""
      ; set ebcCheck "" ; set html ""
      
      # redundant and messy, yes i know.. but it works, k
      # parses the query and reads html according to system desired.

      if {[string match -nocase "gc" $input] == 1} {
        set html [fetch_html "0" 30]
        set output "\002GameRankings BEST GameCube\002"
      }
      if {[string match -nocase "pc" $input] == 1} {
        set html [fetch_html "0" 31]
        set output "\002GameRankings BEST PC\002"
      }
      if {[string match -nocase "ps2" $input] == 1} {
        set html [fetch_html "0" 32]
        set output "\002GameRankings BEST PlayStation2\002"
      }
      if {[string match -nocase "ps3" $input] == 1} {
        set html [fetch_html "0" 33]
        set output "\002GameRankings BEST PlayStation3\002"
      }
      if {[string match -nocase "wii" $input] == 1} {
        set html [fetch_html "0" 34]
        set output "\002GameRankings BEST Wii\002"
      }
      if {[string match -nocase "xbox" $input] == 1} {
        set html [fetch_html "0" 35]
        set output "\002GameRankings BEST Xbox\002"
      }
      if {[string match -nocase "x360" $input] == 1} {
        set html [fetch_html "0" 36]
        set output "\002GameRankings BEST Xbox360\002"
      }
      if {[string match -nocase "ds" $input] == 1} {
        set html [fetch_html "0" 37]
        set output "\002GameRankings BEST NDS\002"
      }
      if {[string match -nocase "gba" $input] == 1} {
        set html [fetch_html "0" 38]
        set output "\002GameRankings BEST GBA\002"
      }
      if {[string match -nocase "psp" $input] == 1} {
        set html [fetch_html "0" 39]
        set output "\002GameRankings BEST PSP\002"
      }
      if {[string match -nocase "mobile" $input] == 1} {
        set html [fetch_html "0" 40]
        set output "\002GameRankings BEST Mobile\002"
      }
      if {[string match -nocase "ngage" $input] == 1} {
        set html [fetch_html "0" 41]
        set output "\002GameRankings BEST N-Gage\002"
      }
      if {[string match -nocase "3do" $input] == 1} {
        set html [fetch_html "0" 42]
        set output "\002GameRankings BEST 3DO\002"
      }
      if {[string match -nocase "dc" $input] == 1} {
        set html [fetch_html "0" 43]
        set output "\002GameRankings BEST Dreamcast\002"
      }
      if {[string match -nocase "gen" $input] == 1} {
        set html [fetch_html "0" 44]
        set output "\002GameRankings BEST Genesis\002"
      }
      if {[string match -nocase "jag" $input] == 1} {
        set html [fetch_html "0" 45]
        set output "\002GameRankings BEST Jaguar\002"
      }
      if {[string match -nocase "n64" $input] == 1} {
        set html [fetch_html "0" 46]
        set output "\002GameRankings BEST N64\002"
      }
      if {[string match -nocase "neo" $input] == 1} {
        set html [fetch_html "0" 47]
        set output "\002GameRankings BEST Neo-Geo\002"
      }
      if {[string match -nocase "ps1" $input] == 1} {
        set html [fetch_html "0" 48]
        set output "\002GameRankings BEST Playstation\002"
      }
      if {[string match -nocase "sat" $input] == 1} {
        set html [fetch_html "0" 49]
        set output "\002GameRankings BEST Saturn\002"
      }
      if {[string match -nocase "snes" $input] == 1} {
        set html [fetch_html "0" 50]
        set output "\002GameRankings BEST Snes\002"
      }
      if {[string match -nocase "segacd" $input] == 1} {
        set html [fetch_html "0" 52]
        set output "\002GameRankings BEST Sega-CD\002"
      }
      if {[string match -nocase "gameboy" $input] == 1} {
        set html [fetch_html "0" 53]
        set output "\002GameRankings BEST GameBoy\002"
      }
      if {[string match -nocase "gbc" $input] == 1} {
        set html [fetch_html "0" 54]
        set output "\002GameRankings BEST GameBoy Color\002"
      }
      if {[string match -nocase "all" $input] == 1} {
        set html [fetch_html "0" 55]
        set output "\002GameRankings BEST -ALL-\002"
      }
      if {[string match -nocase "3ds" $input] == 1} {
        set html [fetch_html "0" 57]
        set output "\002GameRankings BEST 3DS\002"
      }
      if {[string match -nocase "mac" $input] == 1} {
        set html [fetch_html "1" 58]
        set output "\002GameRankings WORST MAC\002"
      }

      if {[string match -nocase "*http://www.gamespot.com/gamerankings/offline.html*" $html]} {
        append output "${incith::google::seperator}${::incith::google::error_modes}We're sorry, we are temporarily offline.  We'll be back as soon as possible."
        return $output
      }
      if {[string match -nocase "*Temporarily Unavailable*" $html]} {
        append output "${incith::google::seperator}${::incith::google::error_modes}GameRankings is Temporarily Unavailable."
        return $output
      }
      if {$output == ""} {
        return "${::incith::google::desc_modes}Sorry, that system is not supported! \[system = gc/pc/mac/ps2/ps3/wii/xbox/x360/3ds/ds/gba/psp/mobile/ngage/3d0/dc/gen/jag/n64/neo/ps1/sat/snes\] usage: $::lastbind system"
      } else { set output "$::incith::google::total_modes$output$::incith::google::total_demodes" }

      regsub -all "(?:\t|\n|\r|\v|\a|\b|\f)" $html "" html
       
      # remove the bold if it isn't desired.
      if {$incith::google::bold_descriptions == 0} {
        regsub -all -- "\002" $output {} output
      }

      # parse for results and loop until desired amount of results
      # is attempted to be reached if possible.
      while {$results < $incith::google::popular_results && $output != ""} {
        # grab date and game title and clear future html of it for looping
        if {[regexp -- {<col class="game" />.*?<tr.+?<td>.*?<td>(.*?)</td>.*?<a href=.+?">(.+?)</a>.*?<br />(.+?)</td><td>(.+?)<} $html - sys game pub date]} {
          regsub -- {><tr.*?<td>.*?</td></tr} $html "" html
          regsub -- {<nobr>} $date "" date
        }

        # if there's no desc, return or stop looping, depending
        if {![info exists game]} {
          if {$results == 0} {
            set reply "Sorry, no search results were found."
            return "$::incith::google::desc_modes$reply$::incith::google::desc_demodes"
          } else {
            break
          }
        }

        # add the search result
        # add game to output if there is one
        if {[info exists game]} {
          if {[string match -nocase "all" $input] == 1} {
            append output "${incith::google::seperator}$::incith::google::desc_modes\002${game}\002 ($sys) by $pub (${date})$::incith::google::desc_demodes"
          } else {
            append output "${incith::google::seperator}$::incith::google::desc_modes\002${game}\002 by $pub (${date})$::incith::google::desc_demodes"
          }
          unset game; unset date
        }
        # increase the results, clear the variables for the next loop just in case
        incr results
      }
      # if we have nothing to send, we have no results :(
      if {$output == ""} {
        set output "${::incith::google::desc_modes}Sorry, found no results! \[system = gc/pc/ps2/ps3/wii/xbox/x360/ds/gba/psp/mobile/ngage/3do/dc/gen/jag/n64/neo/ps1/sat/snes\] usage: !popular system"
      }
      return $output
    }

    # Recent Games
    # fetches games results from Gamerankings.
    # -speechless supplied
    #
    proc recent {input} {

      # lots of variables, keeping them clean is important.
      # borrowed mostly from my ebay proc above.
      ; set results 0 ; set output "" ; set tresult ""
      ; set ebcU "" ; set ebcI "" ; set ebcBid "" ; set ebcPR ""
      ; set ebcCheck "" ; set html ""
      
      # redundant and messy, yes i know.. but it works, k
      # parses the query and reads html according to system desired.

      if {[string match -nocase "gc" $input] == 1} {
        set html [fetch_html "1" 30]
        set output "\002GameRankings WORST GameCube\002"
      }
      if {[string match -nocase "pc" $input] == 1} {
        set html [fetch_html "1" 31]
        set output "\002GameRankings WORST PC\002"
      }
      if {[string match -nocase "ps2" $input] == 1} {
        set html [fetch_html "1" 32]
        set output "\002GameRankings WORST PlayStation2\002"
      }
      if {[string match -nocase "ps3" $input] == 1} {
        set html [fetch_html "1" 33]
        set output "\002GameRankings WORST PlayStation3\002"
      }
      if {[string match -nocase "wii" $input] == 1} {
        set html [fetch_html "1" 34]
        set output "\002GameRankings WORST Wii\002"
      }
      if {[string match -nocase "xbox" $input] == 1} {
        set html [fetch_html "1" 35]
        set output "\002GameRankings WORST Xbox\002"
      }
      if {[string match -nocase "x360" $input] == 1} {
        set html [fetch_html "1" 36]
        set output "\002GameRankings WORST Xbox360\002"
      }
      if {[string match -nocase "ds" $input] == 1} {
        set html [fetch_html "1" 37]
        set output "\002GameRankings WORST NDS\002"
      }
      if {[string match -nocase "gba" $input] == 1} {
        set html [fetch_html "1" 38]
        set output "\002GameRankings WORST GBA\002"
      }
      if {[string match -nocase "psp" $input] == 1} {
        set html [fetch_html "1" 39]
        set output "\002GameRankings WORST PSP\002"
      }
      if {[string match -nocase "mobile" $input] == 1} {
        set html [fetch_html "1" 40]
        set output "\002GameRankings WORST Mobile\002"
      }
      if {[string match -nocase "ngage" $input] == 1} {
        set html [fetch_html "1" 41]
        set output "\002GameRankings WORST N-Gage\002"
      }
      if {[string match -nocase "3do" $input] == 1} {
        set html [fetch_html "1" 42]
        set output "\002GameRankings WORST 3D0\002"
      }
      if {[string match -nocase "dc" $input] == 1} {
        set html [fetch_html "1" 43]
        set output "\002GameRankings WORST Dreamcast\002"
      }
      if {[string match -nocase "gen" $input] == 1} {
        set html [fetch_html "1" 44]
        set output "\002GameRankings WORST Genesis\002"
      }
      if {[string match -nocase "jag" $input] == 1} {
        set html [fetch_html "1" 45]
        set output "\002GameRankings WORST Jaguar\002"
      }
      if {[string match -nocase "n64" $input] == 1} {
        set html [fetch_html "1" 46]
        set output "\002GameRankings WORST N64\002"
      }
      if {[string match -nocase "neo" $input] == 1} {
        set html [fetch_html "1" 47]
        set output "\002GameRankings WORST Neo-Geo\002"
      }
      if {[string match -nocase "ps1" $input] == 1} {
        set html [fetch_html "1" 48]
        set output "\002GameRankings WORST Playstation\002"
      }
      if {[string match -nocase "sat" $input] == 1} {
        set html [fetch_html "1" 49]
        set output "\002GameRankings WORST Saturn\002"
      }
      if {[string match -nocase "snes" $input] == 1} {
        set html [fetch_html "1" 50]
        set output "\002GameRankings WORST Snes\002"
      }
      if {[string match -nocase "segacd" $input] == 1} {
        set html [fetch_html "1" 52]
        set output "\002GameRankings WORST Sega-CD\002"
      }
      if {[string match -nocase "gameboy" $input] == 1} {
        set html [fetch_html "1" 53]
        set output "\002GameRankings WORST GameBoy\002"
      }
      if {[string match -nocase "gbc" $input] == 1} {
        set html [fetch_html "1" 54]
        set output "\002GameRankings WORST GameBoy Color\002"
      }
      if {[string match -nocase "all" $input] == 1} {
        set html [fetch_html "1" 55]
        set output "\002GameRankings WORST -ALL-\002"
      }
      if {[string match -nocase "3ds" $input] == 1} {
        set html [fetch_html "1" 57]
        set output "\002GameRankings WORST 3DS\002"
      }
      if {[string match -nocase "mac" $input] == 1} {
        set html [fetch_html "1" 58]
        set output "\002GameRankings WORST MAC\002"
      }

      if {[string match -nocase "*http://www.gamespot.com/gamerankings/offline.html*" $html]} {
        append output "${incith::google::seperator}${::incith::google::error_modes}We're sorry, we are temporarily offline.  We'll be back as soon as possible."
        return $output
      }
      if {[string match -nocase "*Temporarily Unavailable*" $html]} {
        append output "${incith::google::seperator}${::incith::google::error_modes}GameRankings is Temporarily Unavailable."
        return $output
      }
      if {$output == ""} {
        return "${::incith::google::desc_modes}Sorry, that system is not supported! \[system = gc/pc/mac/ps2/ps3/wii/xbox/x360/3ds/ds/gba/psp/mobile/ngage/3do/dc/gen/jag/n64/neo/ps1/sat/snes\] usage: $::lastbind system"
      } else { set output "$::incith::google::total_modes$output$::incith::google::total_demodes" }

      regsub -all "(?:\t|\n|\r|\v|\a|\b|\f)" $html "" html

      # remove the bold if it isn't desired.
      if {$incith::google::bold_descriptions == 0} {
        regsub -all -- "\002" $output {} output
      }

      # parse for results and loop until desired amount of results
      # is attempted to be reached if possible.
      while {$results < $incith::google::popular_results && $output != ""} {
      
        # grab date and game title and clear future html of it for looping
        if {[regexp -- {<col class="game" />.*?<tr.+?<td>.*?<td>(.*?)</td>.*?<a href=.+?">(.+?)</a>.*?<br />(.+?)</td><td>(.+?)<} $html - sys game pub date]} {
          regsub -- {><tr.*?<td>.*?</td></tr} $html "" html
          regsub -- {<nobr>} $date "" date
        }

        # if there's no desc, return or stop looping, depending
        if {![info exists game]} {
          if {$results == 0} {
            set reply "Sorry, no search results were found."
            return "$::incith::google::desc_modes$reply$::incith::google::desc_modes"
          } else {
            break
          }
        }

        # add the search result
        # add game to output if there is one
        if {[info exists game]} {
          if {[string match -nocase "all" $input] == 1} {
            append output "${incith::google::seperator}$::incith::google::desc_modes\002${game}\002 ($sys) by $pub (${date})$::incith::google::desc_demodes"
          } else {
            append output "${incith::google::seperator}$::incith::google::desc_modes\002${game}\002 by $pub (${date})$::incith::google::desc_demodes"
          }
          unset game; unset date
        }
        # increase the results, clear the variables for the next loop just in case
        incr results
      }
      # if we have nothing to send, we have no results :(
      if {$output == ""} {
        set output "${::incith::google::desc_modes}Sorry, found no results! \[system = gc/pc/ps2/ps3/wii/xbox/x360/ds/gba/psp/mobile/ngage/3d0/dc/gen/jag/n64/neo/ps1/sat/snes\] usage: !top system"
      }
      return "$output"
    }

    # Google Trends
    # fetches top search terms from google
    # -speechless supplied
    #
    proc trends {input} {

      # lots of variables, keeping them clean is important.
      ; set results 0 ; set output "" ; set tresult "" ; set no_results "" ; set no_search ""

      set html [fetch_html $input 13]

      # user input causing errors?
	if {[string match -nocase "*socketerrorabort*" $html]} {
            regsub {(.+?)\|} $html {} html
            return "${::incith::google::error_modes}Socket Error accessing '${html}' .. Does it exist?${::incith::google::error_demodes}" 
	}
	if {[string match -nocase "*timeouterrorabort*" $html]} {
		return "${::incith::google::error_modes}Connection has timed out...${::incith::google::error_demodes}" 
	}

      # give location results we are displaying.
      regexp -- {<table width=100%  cellpadding=2 cellspacing=0 bgcolor=#E5ECF9><tr><td>(.+?)</td>} $html - tresult
      if {$tresult != ""} { set output "$::incith::google::total_modes${tresult}$::incith::google::total_demodes${incith::google::seperator}" }

      # get what we call the no_search for any language.
      if {[string match "*system_down.html*" $html]} {
        set no_search "$::incith::google::error_modes\002Trends Error:\002 System appears to be down, try again later.$::incith::google::error_demodes"
      } else {
         if {[regexp -- {<br><br>(.+?)</p>} $html - no_search]} {
          regsub -- {<p>} $no_search { } no_search
        } else {
          if {![regexp -- {<ul><li>(.+?)</ul>} $html - no_search]} {
            regexp -- {</table><p>(.+?)</p>} $html - no_search
          }
        }
      }

      # remove the bold if it isn't desired.
      if {$incith::google::bold_descriptions == 0} {
        regsub -all -- "\002" $output {} output
      }

      # parse for results and loop until desired amount of results
      # is attempted to be reached if possible.
      while {$results < $incith::google::trends_results} {
        set link "$::incith::google::total_modes\002[expr $results + 1]\002$::incith::google::total_demodes"
        # grab our trend and cut it out
        regexp -- {<td class=num>.+?<a href=.+?>(.+?)</a>} $html {} desc
        regsub -- {<td class=num>.+?<a href=.+?>(.+?)</a>} $html "" html
        if {[info exists desc]} {
          append link " $incith::google::desc_modes$desc$::incith::google::desc_demodes"
        } else {
          if {$results == 0} {
            set reply "${no_search}"
            return "$::incith::google::desc_modes$reply$::incith::google::desc_demodes"
          } else {
            break
          }
        }

        # add the search result
        # add game to output if there is one
        if {[info exists desc]} {
          append output "${link}${incith::google::split_char}"
        }
        # increase the results, clear the variables for the next loop just in case
        unset desc; unset link
        incr results
      }
      # if we have nothing to send, we have no results :(
      if {$output == ""} {
        set output "$::incith::google::desc_modes${no_search}$::incith::google::desc_demodes"
      }
      return [string trim $output $incith::google::split_char]
    }

    # Gamespot Game Review
    # fetches review results from gamespot searches.
    # -speechless supplied
    #
    proc rev {input} {
      global incithcookie
      # lots of variables, keeping them clean is important..
      ; set results "" ; set output "" ; set tresult ""; set inputb ""
      ; set ebcU "" ; set ebcI "" ; set ebcPR "" ; set review ""
      ; set us "?" ; set them "?" ; set you "?" ; set stats "" ; set vid ""

      regexp -nocase -- {^(.+?) @ (.+?)$} $input - input inputb
      
      # fetch the html
      set html [fetch_html $input 12]
      regsub -all {\\n} $html "" html
      if {[string match "*NO RESULTS RETURNED*" $html]} {
        set reply "${::incith::google::desc_modes}Sorry, no search results were found."
        return $reply
      }

      if {$inputb != ""} {
        while {$results == ""} {
          # this could break any second, its cumbersome and long..i know, but for now it works.
          regexp -- {<div class=\\"result_title\\">.*?<a href=\\"(.+?)\">(.+?)<\\/a>} $html - ebcU ebcI
          set ebcU [string map {"\\" ""} $ebcU]
          if {[string match -nocase "*\(${inputb}\)*" $ebcI] == 1} { set results "true" }
          if {$ebcU == $ebcPR} { 
            regsub -all { } $input {%20} input
            return "${::incith::google::desc_modes}Sorry, game does not appear for that console when searching first page results. See for yourself @ http://www.gamespot.com/pages/search/index.php?qs=${input}#game"
          }
          regsub -- {<div class=\\"result_title\\">.*?<a href=\\".+?\\">.+?<\\/a>} $html "" html
          set ebcPR $ebcU
        }
      }

      # get url snippet where game review can be pulled
      if {$inputb == ""} {
        if {[regexp -- {<div class=\\"result_title\\">.*?<a href=\\"(.+?)\\">(.+?)<\\/a>} $html - ebcU ebcI]} {
          set ebcU [string map {"\\" ""} $ebcU]
        }
      }
      # if no snippet there is nothing more to do
      if {$ebcU == "" } { return "${::incith::google::desc_modes}Sorry, no search results were found." }
      # grab game review
      set query "${ebcU}"
      set ebcU ""; set ebcI ""; set ebcPR ""
      regexp -- {(.+?)&q=} $query {} query
      regexp -- {(.+?)\?q=} $query {} query
      if {![string match "*http*" $query]} {
        set query "http://www.gamespot.com${query}"
      } 

      # beware, changing the useragent will result in differently formatted html from Google.
      set ua "Lynx/2.8.5rel.1 libwww-FM/2.14 SSL-MM/1.4.1 OpenSSL/0.9.7e"
      set http [::http::config -useragent $ua]
      set http [::http::geturl $query -headers $::incith_hdr -timeout [expr 1000 * 10]]
      if {$::incith::google::debug > 0 } {
        putserv "privmsg $incith::google::debugnick :\002url \(<--[::http::ncode $http]\):\002 $query"
      }
      set redir [::http::ncode $http]
      upvar #0 $http state
      # iterate through the meta array
      foreach {name value} $state(meta) {
        # do we have cookies?                                                                                                                                                                             
          if {[string equal -nocase $name "Set-Cookie"]} {
          # yes, add them to cookie list                                                                                                                                                                          
          lappend reviewCookies [lindex [split $value {;}] 0]                                                                                                                                                             
        }                                                                                                                                                                                                             
      }
      if {[string match "*${redir}*" "307|303|302|301" ]} {
        foreach {name value} $state(meta) {
          if {[regexp -nocase ^location$ $name]} {
             putserv "privmsg $incith::google::debugnick :$::incith_hdr Cookie [join $reviewCookies {;}] Referer $query" 
             set http [::http::geturl "http://www.gamespot.com$value" -headers "$::incith_hdr Cookie [join $reviewCookies {;}] Referer $query" -timeout [expr 1000 * 10]]
             putserv "privmsg $incith::google::debugnick :\002url \(-->[::http::ncode $http]\):\002 http://www.gamespot.com$value"
             set redir [::http::ncode $http]
             upvar #0 $http state
          }
        }
      }
      set html [::http::data $http]
      ::http::cleanup $http
      # strip the html down
        #regsub -all "\t" $html "" html
        #regsub -all "\n" $html "" html
        #regsub -all "\r" $html "" html
        #regsub -all "\v" $html "" html
        #regsub -all "<script.*?>.*?</script>" $html "" html
      # DEBUG DEBUG                    
      set junk [open "ig-debug-5.txt" w]
      puts $junk $html
      close $junk

      if {![regexp -- {<h2 class="prodTitle">(.*?)</h2>} $html - name]} {
        regexp -- {<title>(.+?) \- } $html {} name
        # sometimes our game and system cut isn't pretty this cleans it up
        regexp -- {(.+?)<.+?title} $name - name
        set name [string trim $name]
      } else {
        regsub -- {</h1>} $name " " name
        regsub -all -- {<.*?>} $name "" name
	}

      if {[regexp -- {\&tag=scoresummary%3Bgs-score">(.+?)<} $html - us]} {
         regsub -- {<.*?>} $us "" us
      }
      if {[regexp -- {\&tag=scoresummary%3Bcritic-score">(.+?)<} $html - them]} {
        regsub -- {<.*?>} $them "" them
      }
      regexp -- {\?tag=scoresummary%3Buser-score">(.+?)<} $html - you
      if {[regexp -- {<ul class="stats">(.+?)<div class="actions">} $html - stats]} {
        regsub {<div class="label">Top 5 User Tags\:.+?</ol>} $stats "" stats
        regsub {<div class="desc">.+?</ul>} $stats "" stats
        regsub {<li class="stat universe">.+?</ul>} $stats "" stats
        regsub -all {<.+?>} $stats "" stats
        while {[string match "*  *" $stats]} {
          regsub -all -- {  } $stats " " stats
        }
        regsub {More Info Game Stats} $stats "» «" stats
        regsub {Tracking\:.+?Wish It&raquo;} $stats "» «" stats
        regsub -all {&raquo;} $stats "» «" stats
        regsub -all {/\s»} $stats "»" stats
        regsub -all {«\s/} $stats "«" stats
      }
      if {[regexp {<p class="review deck".*?>(.+?)</p>} $html - review]} {
        regsub -all -- {<.*?>} $review "" review
        set review " « $review »"
      } elseif {[regexp {<p class="product deck".*?>(.+?)</p>} $html - review]} {
        regsub -all -- {<.*?>} $review "" review
        set review " « $review »"
      } 
      if {[regexp -- {<ul class="videos">.+?<a href="(.+?)".*?">(.+?)</a>} $html - vurl vid]} {
        if {[regexp -nocase -- {a href=""} $vid]} {
          if {[regexp -- {<div class="module videos">.*?<div class="head">.*?href="(.*?)">(.*?)</a>} $html - vurl vid]} {
            set vurl "http://www.gamespot.com$vurl" 
          }
        } else {
          regexp -- {^(.+?)?tag=;} $vurl - vurl
        }
        if {[string match "/" [string index $vurl 0]]} { set vurl "http://www.gamespot.com$vurl" }
        set vid "$incith::google::desc_modes ... \002Video:\002 $vid$::incith::google::desc_demodes$::incith::google::break$::incith::google::link_modes$vurl$::incith::google::link_demodes"
      }
      set desc "[descdecode "${name} \(us\002$us\002 them\002$them\002 you\002$you\002\) «$stats»$review"]"
      # make sure we have something to send
      set output "$::incith::google::desc_modes${desc}$::incith::google::desc_demodes$::incith::google::break$::incith::google::link_modes${query}$::incith::google::link_demodes$vid"
      return $output
    }

    # IGN
    # fetches games results from ign searches.
    # -speechless supplied
    #
    proc ign {input} {

      # lots of variables, keeping them clean is important.
      # borrowed mostly from my ebay proc above.
      ; set results 0 ; set output "" ; set tresult ""
      ; set ebcU "" ; set ebcI "" ; set ebcBid "" ; set ebcPR ""
      ; set ebcCheck "" ; set match ""

      # fetch the html
      set html [fetch_html $input 26]

      if {$html == ""} { return "${::incith::google::error_modes}IGN search page appears to be blank... No results maybe?!" }

      # give results an output header with result tally.
      # regexp -- {All Products \(([,0-9]{1,})\)<br/>} $html - match
      set match "iGN"

      # format output according to variables.
      if {$match != ""} {
        set output "$::incith::google::total_modes\002${match}\002 results$::incith::google::total_demodes${incith::google::seperator}"
        if {$incith::google::bold_descriptions == 0} {
          regsub -all -- "\002" $output {} output
        }
      } else {
        regexp -- {<p.*?class="searchResultTitle">(.+?)</p>} $html - match
        set output "${match}$::incith::google::seperator"
      }

      if {[regexp -- {<p class="searchResultTitle".+?<strong>(.+?)<br} $html - no_search]} {
        return $no_search
      }

      # parse the html
      while {$results < $incith::google::ign_results} {
        # this could break any second, its cumbersome and long..i know, but for now it works.
        regexp -- {<h3 class="game-title"><a href="(.*?)">(.*?)</h3>} $html - ebcU ebcI 
        if {![regexp -- {class="publisherLink">(.*?)</a>(.*?)</p>} $html - ebcBid desc]} {
          regexp -- {<div id="articleType"><strong>(.+?)</strong>} $html - ebcBid
          set desc ""
        } else {
          set desc [string trim $desc "- "]
          regsub -all -- {\s+} $desc " " desc
          if {[string length $desc]} {
            set desc " - $desc"
          }
        }
        regsub -- {<h3 class="game-title">(.+?)</div>} $html "" html

        # check results are more than 0, return or stop looping, depending
        if {![string length $ebcU]} {
          if {$results == 0} {
            regexp -nocase -- {<p class="searchFail">(.*?)</p>} $html - reply
            return "$::incith::google::desc_modes$reply$::incith::google::desc_demodes"
          } else {
            break
          }
        }

        # this needs to be done for user formatting of links and descriptions.
        set link "${ebcU}"

        # prevent duplicate results is mostly useless here, but will at least
        # ensure that we don't get the exact same article.
        if {[string match "*$link*" $output] == 1} {
         break
        }

        # ign clutters with excess spacing to make parsing hard
        # this is a quick and dirty way to get through the mud.
 
        #clean up messy parsing.
        regsub -all {<script type=.+?script>} $ebcBid {} ebcBid
        regsub -all -- {<(.+?)>} $ebcBid {} ebcBid
        while {[string match "*  *" $ebcBid]} {
          regsub -all -- {  } $ebcBid " " ebcBid
        }
        set ebcBid [string trim $ebcBid]
        regexp -- {^(.*?)</a>(.*?)$} $ebcI - ebcI plat
        regexp -- {<span class="platform default">(.*?)</span>} $ebcI - plat
        regexp -- {^(.*?)</a>} $ebcI - ebcI
        regsub -all -- {\s+} $plat { } plat
        # set formatting.
        set desc "${ebcI} ([string totitle $plat] by ${ebcBid})$desc"
        if {[info exists desc]} { set desc "$incith::google::desc_modes[string trim $desc]$incith::google::desc_demodes" }
        if {[info exists link]} { set link "$incith::google::link_modes[string trim $link]$incith::google::link_demodes" }

        # add the search result
        if {$incith::google::link_only == 1} { 
          append output "${link}${incith::google::seperator}"
        } else {
          append output "[descdecode ${desc}]$::incith::google::break${link}${incith::google::seperator}"
        }

        # increase the results, clear the variables for the next loop just in case
        unset link ; set ebcCheck ""
        incr results
      }

      # make sure we have something to send
      if {[info exists output] == 0} {
        set reply "Sorry, no search results were found."
        return "$::incith::google::desc_modes$reply$::incith::google::desc_demodes"
      }
      return $output
    }

    # GameSpot
    # fetches games results from gamespot searches.
    # -speechless supplied
    #
    proc gamespot {input} {
      
      # lots of variables, keeping them clean is important.
      # borrowed mostly from my ebay proc above.
      ; set results 0 ; set output "" ; set tresult ""
      ; set type "" ; set name ""
      ; set details "" ; set deck ""

      # fetch the html
      set html [fetch_html $input 12]
      regsub -all {\\n} $html "" html

      # set up gamespot results header so results can be appended to it.
      regexp -- {,"num_results"\:"(.+?)"} $html {} tresult
      set tresult [string trim $tresult]
      # format output according to variables.
      if {$incith::google::total_results != 0} {
        set output "$::incith::google::total_modes\002[string trim ${tresult}]\002 games$::incith::google::total_demodes${incith::google::seperator}"
        if {$incith::google::bold_descriptions == 0} {
          regsub -all -- "\002" $output {} output
        }
      }

      # parse the html
      while {$results < $incith::google::gamespot_results} {
        # this could break any second, its cumbersome and long..i know, but for now it works.
        if {[regexp -- {<div class=\\"result_title\\">(.*?)<a href=\\"(.+?)\\">(.*?)<\\/a>.*?<div class=\\"details\\">(.*?)<\\/div>.+?<div class=\\"deck\\">(.*?)<\\/div>} $html - type link name details deck]} {
          regexp -- {^(.+?)\?tag=result} $link - link
          if {[string length $deck] > 0} {set deck " - [string trim $deck]"}
          regsub -- {<div class=\\"result_title\\">.+?<div class=\\"deck\\">.+?<\\/div>} $html "" html
          set details [string map {" | " "/"} $details]
          set link [string map {"\\" ""} $link]
          set desc "\002[string trim $type] [string trim $name]\002 \([string trim $details]\)$deck"
        }
        # check results are more than 0, return or stop looping, depending
        if {![info exists link]} {
          if {$results == 0} {
            set reply "Sorry, no search results were found."
            return "$::incith::google::desc_modes$reply$::incith::google::desc_demodes"
          } else {
            break
          }
        }
        regsub -all {<.+?>} $desc "" desc
        # prevent duplicate results is mostly useless here, but will at least
        # ensure that we don't get the exact same article.
        if {[string match "*$link*" $output] == 1} {
         break
        }

        if {[info exists desc]} { set desc "$incith::google::desc_modes[string trim $desc]$incith::google::desc_demodes" }
        if {[info exists link]} { set link "$incith::google::link_modes[string trim $link]$incith::google::link_demodes" }

        # add the search result
        if {$incith::google::link_only == 1} { 
          append output "${link}${incith::google::seperator}"
        } else {
          append output "${desc}$::incith::google::break${link}${incith::google::seperator}"
        }

        # increase the results, clear the variables for the next loop just in case
        unset link ; set name "" ; set deck "" ; set type "" ; set details ""
        incr results
      }

      # make sure we have something to send
      if {[info exists output] == 0} {
        set reply "Sorry, no search results were found."
        return "$::incith::google::desc_modes$reply$::incith::google::desc_demodes"
      }
      return $output
    }

    # TriggerBot
    # Displays all the triggers this scripts is capable of
    # explaining syntax, and also will let user know if trigger
    # is disabled or how many results are available.
    # -speechless supplied
    #

    proc helpbot {nick input} {
      set temp "" ; set output "" ; set num 0 ; set all 0
      set item "" ; set found ""
      if {[string tolower $input] == [lindex [split $incith::google::helplist " "] 0]} { set all 1 ; set found "all" }
      if {$all == 0} {
        foreach item [split $incith::google::helplist] {
          if {[string tolower $input] == $item} { set found $item }
        }
        if {$found == ""} {
           foreach item [split $incith::google::helplist " "] {
             append temp "${item},"
           }
           set temp [string trimright $temp ","]
           return "${incith::google::helpmsg1} ${temp}"
        }
      }
      puthelp "NOTICE $nick :--> Bot triggers available:"
      if {$found == "all" || $found == [lindex [split $incith::google::helplist " "] 1]} {
        foreach trig [split $incith::google::google_binds " "] {
          append temp "${incith::google::command_char}${trig},"
        }
        set temp [string trimright $temp ","]
        if {$incith::google::search_results > 0} {
          set item "${incith::google::helpmsg3}${incith::google::search_results}${incith::google::helpmsg4}"
        } else {
          set item "${incith::google::helpmsg2}"
        }
        puthelp "NOTICE $nick :${temp} ${incith::google::help1} ${item}"
      }
      set temp ""
      if {$found == "all" || $found == [lindex [split $incith::google::helplist " "] 2]} {
        foreach trig [split $incith::google::image_binds " "] {
          append temp "${incith::google::command_char}${trig},"
        }
        set temp [string trimright $temp ","]
        if {$incith::google::image_results > 0} {
          set item "${incith::google::helpmsg3}${incith::google::image_results}${incith::google::helpmsg4}"
        } else {
          set item "${incith::google::helpmsg2}"
        }
        puthelp "NOTICE $nick :${temp} ${incith::google::help2} ${item}"
      }
      set temp ""
      if {$found == "all" || $found == [lindex [split $incith::google::helplist " "] 3]} {
        foreach trig [split $incith::google::group_binds " "] {
          append temp "${incith::google::command_char}${trig},"
        }
        set temp [string trimright $temp ","]
        if {$incith::google::group_results > 0} {
          set item "${incith::google::helpmsg3}${incith::google::group_results}${incith::google::helpmsg4}"
        } else {
          set item "${incith::google::helpmsg2}"
        }
        puthelp "NOTICE $nick :${temp} ${incith::google::help3} ${item}"
      }
      set temp ""
      if {$found == "all" || $found == [lindex [split $incith::google::helplist " "] 4]} {
        foreach trig [split $incith::google::news_binds " "] {
          append temp "${incith::google::command_char}${trig},"
        }
        set temp [string trimright $temp ","]
        if {$incith::google::news_results > 0} {
          set item "${incith::google::helpmsg3}${incith::google::news_results}${incith::google::helpmsg4}"
        } else {
          set item "${incith::google::helpmsg2}"
        }
        puthelp "NOTICE $nick :${temp} ${incith::google::help4} ${item}"
      }
      set temp ""
      if {$found == "all" || $found == [lindex [split $incith::google::helplist " "] 5]} {
        foreach trig [split $incith::google::local_binds " "] {
          append temp "${incith::google::command_char}${trig},"
        }
        set temp [string trimright $temp ","]
        if {$incith::google::local_results > 0} {
          set item "${incith::google::helpmsg3}${incith::google::local_results}${incith::google::helpmsg4}"
        } else {
          set item "${incith::google::helpmsg2}"
        }
        puthelp "NOTICE $nick :${temp} ${incith::google::help5} ${item}"
      }
      set temp ""
      if {$found == "all" || $found == [lindex [split $incith::google::helplist " "] 6]} {
        foreach trig [split $incith::google::print_binds " "] {
          append temp "${incith::google::command_char}${trig},"
        }
        set temp [string trimright $temp ","]
        if {$incith::google::print_results > 0} {
          set item "${incith::google::helpmsg3}${incith::google::print_results}${incith::google::helpmsg4}"
        } else {
          set item "${incith::google::helpmsg2}"
        }
        puthelp "NOTICE $nick :${temp} ${incith::google::help6} ${item}"
      }
      set temp ""
      if {$found == "all" || $found == [lindex [split $incith::google::helplist " "] 7]} {
        foreach trig [split $incith::google::video_binds " "] {
          append temp "${incith::google::command_char}${trig},"
        }
        set temp [string trimright $temp ","]
        if {$incith::google::video_results > 0} {
          set item "${incith::google::helpmsg3}${incith::google::video_results}${incith::google::helpmsg4}"
        } else {
          set item "${incith::google::helpmsg2}"
        }
        puthelp "NOTICE $nick :${temp} ${incith::google::help7} ${item}"
      }
      set temp ""
      if {$found == "all" || $found == [lindex [split $incith::google::helplist " "] 8]} {
        foreach trig [split $incith::google::fight_binds " "] {
          append temp "${incith::google::command_char}${trig},"
        }
        set temp [string trimright $temp ","]
        if {$incith::google::google_fight > 0} {
          set item "${incith::google::helpmsg3}${incith::google::google_fight}${incith::google::helpmsg4}"
        } else {
          set item "${incith::google::helpmsg2}"
        }
        puthelp "NOTICE $nick :${temp} ${incith::google::help8} ${item}"
      }
      set temp ""
      if {$found == "all" || $found == [lindex [split $incith::google::helplist " "] 9]} {
        foreach trig [split $incith::google::youtube_binds " "] {
          append temp "${incith::google::command_char}${trig},"
        }
        set temp [string trimright $temp ","]
        if {$incith::google::youtube_results > 0} {
          set item "${incith::google::helpmsg3}${incith::google::youtube_results}${incith::google::helpmsg4}"
        } else {
          set item "${incith::google::helpmsg2}"
        }
        puthelp "NOTICE $nick :${temp} ${incith::google::help9} ${item}"
      }
      set temp ""
      if {$found == "all" || $found == [lindex [split $incith::google::helplist " "] 10]} {
        foreach trig [split $incith::google::trans_binds " "] {
          append temp "${incith::google::command_char}${trig},"
        }
        set temp [string trimright $temp ","]
        if {$incith::google::trans_results > 0} {
          set item "${incith::google::helpmsg3}${incith::google::trans_results}${incith::google::helpmsg4}"
        } else {
          set item "${incith::google::helpmsg2}"
        }
        puthelp "NOTICE $nick :${temp} ${incith::google::help10} ${item}"
      }
      set temp ""
      if {$found == "all" || $found == [lindex [split $incith::google::helplist " "] 11]} {
        foreach trig [split $incith::google::gamespot_binds " "] {
          append temp "${incith::google::command_char}${trig},"
        }
        set temp [string trimright $temp ","]
        if {$incith::google::gamespot_results > 0} {
          set item "${incith::google::helpmsg3}${incith::google::gamespot_results}${incith::google::helpmsg4}"
        } else {
          set item "${incith::google::helpmsg2}"
        }
        puthelp "NOTICE $nick :${temp} ${incith::google::help11} ${item}"
      }
      set temp ""
      if {$found == "all" || $found == [lindex [split $incith::google::helplist " "] 12]} {
        foreach trig [split $incith::google::gamefaq_binds " "] {
          append temp "${incith::google::command_char}${trig},"
        }
        set temp [string trimright $temp ","]
        if {$incith::google::gamefaq_results > 0} {
          set item "${incith::google::helpmsg3}${incith::google::gamefaq_results}${incith::google::helpmsg4}"
        } else {
          set item "${incith::google::helpmsg2}"
        }
        puthelp "NOTICE $nick :${temp} ${incith::google::help12} ${item}"
      }
      set temp ""
      if {$found == "all" || $found == [lindex [split $incith::google::helplist " "] 13]} {
        foreach trig [split $incith::google::blog_binds " "] {
          append temp "${incith::google::command_char}${trig},"
        }
        set temp [string trimright $temp ","]
        if {$incith::google::blog_results > 0} {
          set item "${incith::google::helpmsg3}${incith::google::blog_results}${incith::google::helpmsg4}"
        } else {
          set item "${incith::google::helpmsg2}"
        }
        puthelp "NOTICE $nick :${temp} ${incith::google::help13} ${item}"
      }
      set temp ""
      if {$found == "all" || $found == [lindex [split $incith::google::helplist " "] 14]} {
        foreach trig [split $incith::google::ebay_binds " "] {
          append temp "${incith::google::command_char}${trig},"
        }
        set temp [string trimright $temp ","]
        if {$incith::google::ebay_results > 0} {
          set item "${incith::google::helpmsg3}${incith::google::ebay_results}${incith::google::helpmsg4}"
        } else {
          set item "${incith::google::helpmsg2}"
        }
        puthelp "NOTICE $nick :${temp} ${incith::google::help14} ${item}"
      }
      set temp ""
      if {$found == "all" || $found == [lindex [split $incith::google::helplist " "] 15]} {
        foreach trig [split $incith::google::efight_binds " "] {
          append temp "${incith::google::command_char}${trig},"
        }
        set temp [string trimright $temp ","]
        if {$incith::google::google_fight > 0} {
          set item "${incith::google::helpmsg3}${incith::google::google_fight}${incith::google::helpmsg4}"
        } else {
          set item "${incith::google::helpmsg2}"
        }
        puthelp "NOTICE $nick :${temp} ${incith::google::help15} ${item}"
      }
      set temp ""
      if {$found == "all" || $found == [lindex [split $incith::google::helplist " "] 16]} {
        foreach trig [split $incith::google::wiki_binds " "] {
          append temp "${incith::google::command_char}${trig},"
        }
        set temp [string trimright $temp ","]
        if {$incith::google::wiki_results > 0} {
          set item "${incith::google::helpmsg3}${incith::google::wiki_results}${incith::google::helpmsg4}"
        } else {
          set item "${incith::google::helpmsg2}"
        }
        puthelp "NOTICE $nick :${temp} ${incith::google::help16} ${item}"
      }
      set temp ""
      if {$found == "all" || $found == [lindex [split $incith::google::helplist " "] 17]} {
        foreach trig [split $incith::google::wikimedia_binds " "] {
          append temp "${incith::google::command_char}${trig},"
        }
        set temp [string trimright $temp ","]
        if {$incith::google::wikimedia_results > 0} {
          set item "${incith::google::helpmsg3}${incith::google::wikimedia_results}${incith::google::helpmsg4}"
        } else {
          set item "${incith::google::helpmsg2}"
        }
        puthelp "NOTICE $nick :${temp} ${incith::google::help17} ${item}"
      }
      set temp ""
      if {$found == "all" || $found == [lindex [split $incith::google::helplist " "] 18]} {
        foreach trig [split $incith::google::locate_binds " "] {
          append temp "${incith::google::command_char}${trig},"
        }
        set temp [string trimright $temp ","]
        if {$incith::google::locate_results > 0} {
          set item "${incith::google::helpmsg3}${incith::google::locate_results}${incith::google::helpmsg4}"
        } else {
          set item "${incith::google::helpmsg2}"
        }
        puthelp "NOTICE $nick :${temp} ${incith::google::help18} ${item}"
      }
      set temp ""
      if {$found == "all" || $found == [lindex [split $incith::google::helplist " "] 19]} {
        foreach trig [split $incith::google::rev_binds " "] {
          append temp "${incith::google::command_char}${trig},"
        }
        set temp [string trimright $temp ","]
        if {$incith::google::rev_results > 0} {
          set item "${incith::google::helpmsg3}${incith::google::rev_results}${incith::google::helpmsg4}"
        } else {
          set item "${incith::google::helpmsg2}"
        }
        puthelp "NOTICE $nick :${temp} ${incith::google::help19} ${item}"
      }
      set temp ""
      if {$found == "all" || $found == [lindex [split $incith::google::helplist " "] 20]} {
        foreach trig [split $incith::google::mininova_binds " "] {
          append temp "${incith::google::command_char}${trig},"
        }
        set temp [string trimright $temp ","]
        if {$incith::google::mininova_results > 0} {
          set item "${incith::google::helpmsg3}${incith::google::mininova_results}${incith::google::helpmsg4}"
        } else {
          set item "${incith::google::helpmsg2}"
        }
        puthelp "NOTICE $nick :${temp} ${incith::google::help20} ${item}"
      }
      set temp ""
      if {$found == "all" || $found == [lindex [split $incith::google::helplist " "] 21]} {
        foreach trig [split $incith::google::recent_binds " "] {
          append temp "${incith::google::command_char}${trig},"
        }
        set temp [string trimright $temp ","]
        if {$incith::google::recent_results > 0} {
          set item "${incith::google::helpmsg3}${incith::google::recent_results}${incith::google::helpmsg4}"
        } else {
          set item "${incith::google::helpmsg2}"
        }
        puthelp "NOTICE $nick :${temp} ${incith::google::help21} ${item}"
      }
      set temp ""
      if {$found == "all" || $found == [lindex [split $incith::google::helplist " "] 22]} {
        foreach trig [split $incith::google::popular_binds " "] {
          append temp "${incith::google::command_char}${trig},"
        }
        set temp [string trimright $temp ","]
        if {$incith::google::popular_results > 0} {
          set item "${incith::google::helpmsg3}${incith::google::popular_results}${incith::google::helpmsg4}"
        } else {
          set item "${incith::google::helpmsg2}"
        }
        puthelp "NOTICE $nick :${temp} ${incith::google::help22} ${item}"
      }
      set temp ""
      if {$found == "all" || $found == [lindex [split $incith::google::helplist " "] 23]} {
        foreach trig [split $incith::google::daily_binds " "] {
          append temp "${incith::google::command_char}${trig},"
        }
        set temp [string trimright $temp ","]
        if {$incith::google::daily_results > 0} {
          set item "${incith::google::helpmsg3}${incith::google::daily_results}${incith::google::helpmsg4}"
        } else {
          set item "${incith::google::helpmsg2}"
        }
        puthelp "NOTICE $nick :${temp} ${incith::google::help23} ${item}"
      }
      set temp ""
      if {$found == "all" || $found == [lindex [split $incith::google::helplist " "] 24]} {
        foreach trig [split $incith::google::ign_binds " "] {
          append temp "${incith::google::command_char}${trig},"
        }
        set temp [string trimright $temp ","]
        if {$incith::google::ign_results > 0} {
          set item "${incith::google::helpmsg3}${incith::google::ign_results}${incith::google::helpmsg4}"
        } else {
          set item "${incith::google::helpmsg2}"
        }
        puthelp "NOTICE $nick :${temp} ${incith::google::help24} ${item}"
      }
      set temp ""
      if {$found == "all" || $found == [lindex [split $incith::google::helplist " "] 25]} {
        foreach trig [split $incith::google::myspacevids_binds " "] {
          append temp "${incith::google::command_char}${trig},"
        }
        set temp [string trimright $temp ","]
        if {$incith::google::myspacevids_results > 0} {
          set item "${incith::google::helpmsg3}${incith::google::myspacevids_results}${incith::google::helpmsg4}"
        } else {
          set item "${incith::google::helpmsg2}"
        }
        puthelp "NOTICE $nick :${temp} ${incith::google::help25} ${item}"
      }
      set temp ""
      if {$found == "all" || $found == [lindex [split $incith::google::helplist " "] 26]} {
        foreach trig [split $incith::google::trends_binds " "] {
          append temp "${incith::google::command_char}${trig},"
        }
        set temp [string trimright $temp ","]
        if {$incith::google::trends_results > 0} {
          set item "${incith::google::helpmsg3}${incith::google::trends_results}${incith::google::helpmsg4}"
        } else {
          set item "${incith::google::helpmsg2}"
        }
        puthelp "NOTICE $nick :${temp} ${incith::google::help26} ${item}"
      }
      set temp ""
      if {$found == "all" || $found == [lindex [split $incith::google::helplist " "] 27]} {
        foreach trig [split $incith::google::scholar_binds " "] {
          append temp "${incith::google::command_char}${trig},"
        }
        set temp [string trimright $temp ","]
        if {$incith::google::scholar_results > 0} {
          set item "${incith::google::helpmsg3}${incith::google::image_results}${incith::google::helpmsg4}"
        } else {
          set item "${incith::google::helpmsg2}"
        }
        puthelp "NOTICE $nick :${temp} ${incith::google::help27} ${item}"
      }
    }
      
    # FETCH_HTML
    # fetches html for the various *.google.com sites
    #
    proc fetch_html {input switch} {
    global incithcharset
    global incithcookie
    set country ""
#-->  # Begin urlencoding kludge
      if {($switch < 15) || ($switch > 23) && ($switch != 28) && ($switch !=29) && ($switch !=56) && ($switch !=58) && ($switch !=59)} {
        set helps $input
        regexp -nocase -- {^\.(.+?)\s(.+?)$} $input - country input
        # this is my input encoding hack, this will convert input before it goes
        # out to be queried.
        if {$incith::google::encoding_conversion_input > 0 && $country != "" } {
          set encoding_found [lindex [split [lindex $incith::google::encode_strings [lsearch -glob $incith::google::encode_strings "$country:*"]] :] 1]
          if {$encoding_found != "" && [lsearch -exact [encoding names] $encoding_found] != -1} { set input [encoding convertfrom $encoding_found $input] }
        } else { set encoding_found "" }
        set input [urlencode $input 0 "utf-8"]
        set country "" ;#reset country and input
      }
#<--  # End urlencoding kludge

      # GOOGLE
      if {$switch == 1} {
        # make it so people can search their country
        set country "" ; set flavor "search"
        regexp -nocase -- {^\.(.+?)\s(.+?)$} $helps - country dummy
        if {$country == ""} {
          set country "${incith::google::google_country}"
          set flavor "search"
        }
        if {[string match */* $country]} {
          if {![string length [set flavor [join [lrange [split $country /] 1 end] /]]]} {
            set flavor "search"
          }
          set country [lindex [split $country /] 0]
        }
        if {[string equal -nocase "intl" [lindex [split $flavor /] 0]]} {
          set lng [lindex [split $flavor /] 1]
          set uselang 1
        }
        # we don't want 'define:+<search>', so we'll just remove the space if there is one.
        regsub -nocase -- {^define:\s*} $input {define:} input
        # spell after define so 'spell: define: foo' doesn't turn into a define lookup
        if {[string match -nocase "spell%3a*" $input] == 1} {
          regsub -nocase -- {^spell%3a\s*} $input {} input
          set spell "&spell=1"
        } else {
          set spell ""
        }
        if {[info exists uselang]} {
          set query "http://www.google.${country}/search?hl=${lng}&q=${input}&safe=${incith::google::safe_search}&lr=lang_${incith::google::language}&ie=utf-8${spell}&nfpr=1"
        } else {
          set query "http://www.google.${country}/${flavor}?q=${input}&safe=${incith::google::safe_search}&lr=lang_${incith::google::language}&ie=utf-8${spell}&nfpr=1"
        }
      # IMAGES
      } elseif {$switch == 2} {
        # make it so people can search their country
        set country "" ; set flavor "search" 
        regexp -nocase -- {^\.(.+?)\s(.+?)$} $helps - country dummy
        if {$country == ""} {
          set country "${incith::google::google_country}"
          set flavor "search"
        }
        if {[string match */* $country]} {
          if {![string length [set flavor [join [lrange [split $country /] 1 end] /]]]} {
            set flavor "search"
          }
          set country [lindex [split $country /] 0]
        }
        if {[string equal -nocase "intl" [lindex [split $flavor /] 0]]} {
          set lng [lindex [split $flavor /] 1]
          set uselang 1
        }
        if {[info exists uselang]} {
          set query "http://images.google.${country}/images?hl=${lng}&q=${input}&safe=${incith::google::safe_search}&btnG=Search+Images&ie=utf-8&sout=1&nfpr=1"
        } else {
          set query "http://images.google.${country}/images?q=${input}&safe=${incith::google::safe_search}&btnG=Search+Images&ie=utf-8&sout=1&nfpr=1" 
        }
      # LOCAL
      } elseif {$switch == 3} {
        # make it so people can search their country
        set country ""
        regexp -nocase -- {^\.(.+?)\s(.+?)$} $helps - country dummy
        if {$country == ""} {
          set country "${incith::google::google_country}"
          set dummy $helps
        }
        #regexp -nocase -- {^(.+?) near (.+?)$} $dummy - search location
        #set query "http://maps.google.${country}/maps?f=q&q=${search}&near=${location}&ie=UTF8&filter=0&oi=lwp_thresh&sa=X&view=text&ct=clnk&cd=1&nfpr=1"
        set query "http://maps.google.${country}/maps?f=q&q=${input}&ie=utf-8&filter=0&oi=lwp_thresh&sa=X&view=text&ct=clnk&cd=1&nfpr=1"
      } elseif {$switch == 4} {
        # make it so people can search their country
        set country "" ; set flavor "search"
        regexp -nocase -- {^\.(.+?)\s(.+?)$} $helps - country dummy
        if {$country == ""} {
          set country "${incith::google::google_country}"
          set flavor "search"
        }
        if {[string match */* $country]} {
          if {![string length [set flavor [join [lrange [split $country /] 1 end] /]]]} {
            set flavor "search"
          }
          set country [lindex [split $country /] 0]
        }
        if {[string equal -nocase "intl" [lindex [split $flavor /] 0]]} {
          set lng [lindex [split $flavor /] 1]
          set uselang 1
        }
        if {[info exists uselang]} {
          set query "http://groups.google.${country}/groups/search?hl=${lng}&ie=UTF-8&q=${input}&qt_s=Search&safe=${incith::google::safe_search}&ie=utf-8&nfpr=1"
        } else {
          set query "http://groups.google.${country}/groups/search?ie=UTF-8&q=${input}&qt_s=Search&safe=${incith::google::safe_search}&ie=utf-8&nfpr=1"
        }
      } elseif {$switch == 5} {
        # make it so people can search their country
        set country "" ; set flavor "search"
        regexp -nocase -- {^\.(.+?)\s(.+?)$} $helps - country dummy
        if {$country == ""} {
          set country "${incith::google::google_country}"
          set flavor "search"
        }
        if {[string match */* $country]} {
          if {![string length [set flavor [join [lrange [split $country /] 1 end] /]]]} {
            set flavor "search"
          }
          set country [lindex [split $country /] 0]
        }
        if {[string equal -nocase "intl" [lindex [split $flavor /] 0]]} {
          set lng [lindex [split $flavor /] 1]
          set uselang 1
        }

        if {[info exists uselang]} {
          set query "http://news.google.${country}/news?hl=${lng}&q=${input}&ie=utf-8&nfpr=1"
        } else {
          set query "http://news.google.${country}/news?q=${input}&ie=utf-8&nfpr=1"
        }
      } elseif {$switch == 6} {
        # make it so people can search their country
        set country "" ; set flavor "search"
        regexp -nocase -- {^\.(.+?)\s(.+?)$} $helps - country dummy
        if {$country == ""} {
          set country "${incith::google::google_country}"
          set flavor "search"
        }
        if {[string match */* $country]} {
          if {![string length [set flavor [join [lrange [split $country /] 1 end] /]]]} {
            set flavor "search"
          }
          set country [lindex [split $country /] 0]
        }
        if {[string equal -nocase "intl" [lindex [split $flavor /] 0]]} {
          set lng [lindex [split $flavor /] 1]
          set uselang 1
        }
        if {[info exists uselang]} {
          set query "http://books.google.${country}/books?hl=${lng}&q=${input}&btnG=Search+Books&ie=utf-8&nfpr=1"
        } else {
          set query "http://books.google.${country}/books?q=${input}&btnG=Search+Books&ie=utf-8&nfpr=1"
        }
      } elseif {$switch == 7} {
        # make it so people can search their country
        set country "" ; set flavor "search"
        regexp -nocase -- {^\.(.+?)\s(.+?)$} $helps - country dummy
        if {$country == ""} {
          set country "${incith::google::google_country}"
          set flavor "search"
        }
        if {[string match */* $country]} {
          if {![string length [set flavor [join [lrange [split $country /] 1 end] /]]]} {
            set flavor "search"
          }
          set country [lindex [split $country /] 0]
        }
        if {[string equal -nocase "intl" [lindex [split $flavor /] 0]]} {
          set lng [lindex [split $flavor /] 1]
          set uselang 1
        }
        if {[info exists uselang]} {
          set query "http://www.google.${country}/search?hl=${lng}&q=${input}&tbs=vid:1&nfpr=1"
        } else {
          set query "http://www.google.${country}/search?q=${input}&tbs=vid:1&nfpr=1"
        }
        #set query "http://video.google.${country}/videosearch?q=${input}&btnG=Search+Video&ie=utf-8"
      } elseif {$switch == 8} {
        # make it so people can search their country
        set country "" ; set flavor "search"
        regexp -nocase -- {^\.(.+?)\s(.+?)$} $helps - country dummy
        if {$country == ""} {
          set country "${incith::google::google_country}"
          set flavor "search"
        }
        if {[string match */* $country]} {
          if {![string length [set flavor [join [lrange [split $country /] 1 end] /]]]} {
            set flavor "search"
          }
          set country [lindex [split $country /] 0]
        }
        if {[string equal -nocase "intl" [lindex [split $flavor /] 0]]} {
          set lng [lindex [split $flavor /] 1]
          set uselang 1
        }
        if {[info exists uselang]} {
          set query "http://www.google.${country}/search?hl=${lng}&q=${input}&safe=off&btnG=Search&lr=lang_all&num=1&ie=utf-8"
        } else {
          set query "http://www.google.${country}/search?hl=&q=${input}&safe=off&btnG=Search&lr=lang_all&num=1&ie=utf-8"
        }
      } elseif {$switch == 9} {
        # make it so people can search their country
        set country "" ; set hd ""
        if {[regsub -nocase -all -- "[urlencode $::incith::google::youtube_highdef 0]" $input "" input]} {
          set hd "&high_definition=1"
        }
        regexp -nocase -- {^\.(.+?)\s(.+?)$} $helps - country dummy
        if {$country == ""} {
          set country "${incith::google::youtube_country}"
        }
        if {$country == "com"} {
          set query "http://www.youtube.com/results?search_query=${input}&hl=en&ie=utf-8$hd"
        } else {
          set query "http://${country}.youtube.com/results?search_query=${input}&hl=${country}&ie=utf-8$hd"
        }
      } elseif {$switch == 10} {
        # make it so people can search their country
        set country ""
        regexp -nocase -- {^\.(.+?)\s(.+?)$} $helps - country dummy
        if {$country == ""} {
          set country "${incith::google::google_country}" 
        }
        set query "http://scholar.google.${country}/scholar?hl=all&lr=&safe=${incith::google::safe_search}&q=${input}&btnG=Search&ie=utf-8"
      } elseif {$switch == 11} {
        #set query "http://vidsearch.myspace.com/index.cfm?fuseaction=vids.fullsearch&searchText=${input}&fullSearch=Search%20Videos"
        #set query "http://vids.myspace.com/index.cfm?SearchBoxID=SplashHeader&fuseaction=vids.search&q=${input}&t=tvid"
        set query "http://searchservice.myspace.com/index.cfm?fuseaction=sitesearch.results&orig=search_Header&origpfc=VidsSplash&type=MySpaceTV&qry=${input}&submit=Search"
      } elseif {$switch == 12} {
        #set query "http://www.gamespot.com/search.html?qs=${input}&x=0&y=0"
        #set query "http://www.gamespot.com/pages/search/index.php?qs=${input}&sub=g"
        set query "http://www.gamespot.com/pages/search/search_ajax.php?q=${input}&type=game&offset=0&tags_only=false&sort=rank"
        #set query "http://www.gamespot.com/search.html?tag=search%3Bbutton&om_act=convert&om_clk=search&qs=${input}"
        #set query "http://www.gamespot.com/pages/search/index.php?qs=${input}#game"
        #set query "http://www.gamespot.com/search.html?qs=${input}"
        #set query "http://www.gamespot.com/pages/tags/index.php?type=game&tags=${input}"
      } elseif {$switch == 13} {
        # make it so people can search their country
        set country ""
        regexp -nocase -- {^\.(.+?)\s(.+?)$} $helps - country dummy
        if {$country == ""} {
          set country "${incith::google::google_country}" 
        }
        set query "http://www.google.${country}/trends/hottrends?date=${input}&sa=x&ctab=0&hl=en"
      } elseif {$switch == 14} {
        # make it so people can search their country
        set country ""
        regexp -nocase -- {^\.(.+?)\s(.+?)$} $helps - country dummy
        if {$country == ""} {
          set country "${incith::google::daily_country}" 
        }
        if {$country == "en"} {
          set query "http://www.dailymotion.com/relevance/search/${input}"
        } else {
          set query "http://www.dailymotion.com/${country}/relevance/search/${input}"
        }
      } elseif {$switch == 15} {
        set query "http://www.gamefaqs.com/ds/releases${input}"
      } elseif {$switch == 16} {
        set query "http://www.gamefaqs.com/iphone/releases${input}"
      } elseif {$switch == 17} {
        set query "http://www.gamefaqs.com/psp/releases${input}"
      } elseif {$switch == 18} {
        set query "http://www.gamefaqs.com/xbox360/releases${input}"
      } elseif {$switch == 19} {
        set query "http://www.gamefaqs.com/xbox/releases${input}"
      } elseif {$switch == 20} {
        set query "http://www.gamefaqs.com/gamecube/releases${input}"
      } elseif {$switch == 21} {
        set query "http://www.gamefaqs.com/ps2/releases${input}"
      } elseif {$switch == 22} {
        set query "http://www.gamefaqs.com/pc/releases${input}"
      } elseif {$switch == 23} {
        set query "http://www.gamefaqs.com/ps3/releases${input}"
      } elseif {$switch == 24} {
        # make it so people can search their country
        set country ""
        regexp -nocase -- {^\.(.+?)\s(.+?)$} $helps - country dummy
        if {$country == ""} {
          set country "${incith::google::google_country}" 
        }
        regsub -all -- {-} $input "%2d" input
        set query "http://blogsearch.google.${country}/blogsearch?q=${input}&lr=&sa=N&tab=gn&ie=utf-8"
      } elseif {$switch == 25} {
        # make it so people can search their country
        set country "" ; set shop ""
        regexp -nocase -- {^\.(.+?)\s(.+?)$} $helps - country dummy
        if {$country == ""} {
          if {![regexp -nocase -- {^\@(.+?)\s(.+?)$} $helps - shop input]} {
             set country $::incith::google::ebay_country
          }
        }
        regsub -all -- {-} $input "%2d" input
        regsub -all -- { } $input "-" input

        #set query "http://search.ebay.com/search/search.dll?sofocus=unknown&sbrftog=1&from=R10&_trksid=m37&satitle=${input}&sacat=-1%26catref%3DC6&sargn=-1%26saslc%3D2&sadis=200&fpos=95482&sabfmts=1&saobfmts=insif&ftrt=1&ftrv=1&saprclo=&saprchi=&fsop=1%26fsoo%3D1&coaction=compare&copagenum=1&coentrypage=search"
        #set query "http://search.ebay.${country}/${input}"
        #set query "http://shop.ebay.${country}/items/_W0QQ_nkwZ${input}QQ_armrsZ1QQ_fromZQQ_mdoZ"
        #set query "http://shop.ebay.${country}/${input}"
        #set query "http://shop.ebay.${country}/items/_W0QQ_nkwZ${input}QQ_armrsZ1QQ_fromZQQ_mdoZ"
        if {![string length $shop]} { 
          set query "http://www.ebay.${country}/sch/i.html?_nkw=${input}&_armrs=1&_from=&_ipg=&_dmd=1"
          #set query "http://shop.ebay.${country}/i.html?_nkw=${input}&_armrs=1&_from=&_ipg=&_dmd=1"
        } else {
          set query "http://$shop.shop.ebay.com/?_nkw=${input}&_armrs=1&_from=&_ipg=&_dmd=1"
        }
        #set query "http://search.ebay.${country}/${input}_W0QQpqryZ${input}"
      } elseif {$switch == 26} {
        set query "http://search.ign.com/products?sort=relevance&query=${input}&so=exact&objtName=all&origin=&startat=0&nc=false&ns=false"
        #set query "http://search.ign.com/products?query=${input}"
      } elseif {$switch == 27} {
        # place holder for wikipedia
        # eventually it will get put back into fetch_html
      } elseif {$switch == 28} {
        set query "http://www.gamefaqs.com/wii/releases${input}"
      } elseif {$switch == 29} {
        set query "http://www.gamefaqs.com/dreamcast/releases${input}"
      } elseif {$switch == 30} {
        set query "http://www.gamerankings.com/browse.html?site=gamecube&cat=0&year=2&numrev=0&sort=${input}&search="
      } elseif {$switch == 31} {
        set query "http://www.gamerankings.com/browse.html?site=pc&cat=0&year=0&numrev=2&sort=${input}&search="
      } elseif {$switch == 32} {
        set query "http://www.gamerankings.com/browse.html?site=ps2&cat=0&year=0&numrev=2&sort=${input}&search="
      } elseif {$switch == 33} {
        set query "http://www.gamerankings.com/browse.html?site=ps3&cat=0&year=0&numrev=2&sort=${input}&search="
      } elseif {$switch == 34} {
        set query "http://www.gamerankings.com/browse.html?site=wii&cat=0&year=0&numrev=2&sort=${input}&search="
      } elseif {$switch == 35} {
        set query "http://www.gamerankings.com/browse.html?site=xbox&cat=0&year=0&numrev=2&sort=${input}&search="
      } elseif {$switch == 36} {
        set query "http://www.gamerankings.com/browse.html?site=xbox360&cat=0&year=0&numrev=2&sort=${input}&search="
      } elseif {$switch == 37} {
        set query "http://www.gamerankings.com/browse.html?site=ds&cat=0&year=0&numrev=2&sort=${input}&search="
      } elseif {$switch == 38} {
        set query "http://www.gamerankings.com/browse.html?site=gba&cat=0&year=0&numrev=2&sort=${input}&search="
      } elseif {$switch == 39} {
        set query "http://www.gamerankings.com/browse.html?site=psp&cat=0&year=0&numrev=2&sort=${input}&search="
      } elseif {$switch == 40} {
        set query "http://www.gamerankings.com/browse.html?site=mobile&cat=0&year=0&numrev=2&sort=${input}&search="
      } elseif {$switch == 41} {
        set query "http://www.gamerankings.com/browse.html?site=ngage&cat=0&year=0&numrev=2&sort=${input}&search="
      } elseif {$switch == 42} {
        set query "http://www.gamerankings.com/browse.html?site=3do&cat=0&year=0&numrev=2&sort=${input}&search="
      } elseif {$switch == 43} {
        set query "http://www.gamerankings.com/browse.html?site=dreamcast&cat=0&year=0&numrev=2&sort=${input}&search="
      } elseif {$switch == 44} {
        set query "http://www.gamerankings.com/browse.html?site=genesis&cat=0&year=0&numrev=2&sort=${input}&search="
      } elseif {$switch == 45} {
        set query "http://www.gamerankings.com/browse.html?site=jaguar&cat=0&year=0&numrev=2&sort=${input}&search="
      } elseif {$switch == 46} {
        set query "http://www.gamerankings.com/browse.html?site=n64&cat=0&year=0&numrev=2&sort=${input}&search="
      } elseif {$switch == 47} {
        set query "http://www.gamerankings.com/browse.html?site=neo&cat=0&year=0&numrev=2&sort=${input}&search="
      } elseif {$switch == 48} {
        set query "http://www.gamerankings.com/browse.html?site=ps&cat=0&year=0&numrev=2&sort=${input}&search="
      } elseif {$switch == 49} {
        set query "http://www.gamerankings.com/browse.html?site=saturn&cat=0&year=0&numrev=2&sort=${input}&search="
      } elseif {$switch == 50} {
        set query "http://www.gamerankings.com/browse.html?site=snes&cat=0&year=0&numrev=2&sort=${input}&search="
      } elseif {$switch == 51} {
        set query "http://www.mininova.org/search/${input}/seeds"
        #set query "http://www.mnova.eu/search.php?term=${input}"
      } elseif {$switch == 52} {
        set query "http://www.gamerankings.com/browse.html?site=segacd&cat=0&year=0&numrev=2&sort=${input}&search="
      } elseif {$switch == 53} {
        set query "http://www.gamerankings.com/browse.html?site=gameboy&cat=0&year=0&numrev=2&sort=${input}&search="
      } elseif {$switch == 54} {
        set query "http://www.gamerankings.com/browse.html?site=gbc&cat=0&year=0&numrev=2&sort=${input}&search="
      } elseif {$switch == 55} {
        set query "http://www.gamerankings.com/browse.html?site=&cat=0&year=0&numrev=2&sort=${input}&search="
      } elseif {$switch == 56} {
        set query "http://www.gamefaqs.com/3ds/releases${input}"
      } elseif {$switch == 57} {
        set query "http://www.gamerankings.com/browse.html?site=3ds&cat=0&year=0&numrev=3&sort=${input}&search="
      } elseif {$switch == 58} {
        set query "http://www.gamerankings.com/browse.html?site=mac&cat=0&year=0&numrev=2&sort=${input}&search="
      } elseif {$switch == 59} {
        set query "http://www.gamefaqs.com/mac/releases${input}"
      }

      # didnt have this before, this is needed for google parsers to correctly
      # encode the 'do not include' tag, aka the hyphen.. hehe
      if {$switch < 9} {
        regsub -nocase -- {-} $input "%2d" input
      }
      regsub -all -- {\+} $query {%2B} query
      regsub -all -- {\"} $query {%22} query 
      if {$switch != 25} {
        regsub -all -- { } $query {+} query
      }
      
      if {$switch == 12} {
        # grab the ajax data
        set http [::http::geturl $query -headers "X-Requested-With XMLHttpRequest X-Request JSON Referer $query $::incith_hdr" -timeout [expr 1000 * 10]]
        upvar #0 $http state
        set incithcharset [string map -nocase {"UTF-" "utf-" "iso-" "iso" "windows-" "cp" "shift_jis" "shiftjis"} $state(charset)]
        set html [charenc [ungzip [string map {"\\n" "" "\\" ""} [::http::data $http]] $state(meta)] $state(charset)]
        set redir [::http::ncode $http]
        set cookies [list]
      } else {    
        # beware, changing the useragent will result in differently formatted html from Google.
        set ua "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.3) Gecko/2008092417 Firefox/3.0.3"
        #set ua "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:25.0) Gecko/20100101 Firefox/25.0"
        #set ua "Lynx/2.8.5rel.1 libwww-FM/2.14 SSL-MM/1.4.1 OpenSSL/0.9.7e"
        # enable proxy
        if {![string length $::incith::google::proxy_host]} { 
          set http [::http::config -useragent $ua]
        } else { 
         set http [::http::config -useragent $ua -proxyhost $::incith::google::proxy_host -proxyport $::incith::google::proxy_port]
        }
        # stole this bit from rosc2112 on egghelp forums
        # borrowed is a better term, all procs eventually need this error handler.

        catch {set http [::http::geturl "$query" -headers $::incith_hdr -timeout [expr 1000 * 12]]} error
        if {[string match -nocase "*couldn't open socket*" $error]} {
              return "socketerrorabort|${query}"
        }
        if { [::http::status $http] == "timeout" } {
	    return "timeouterrorabort"
	  }
        upvar #0 $http state
        set incithcharset [string map -nocase {"UTF-" "utf-" "iso-" "iso" "windows-" "cp" "shift_jis" "shiftjis"} $state(charset)]
        set html [charenc [ungzip [::http::data $http] $state(meta)] $state(charset)]
        set redir [::http::ncode $http]
        # CHECK CHECK
        upvar #0 $http state
        set incithcharset [string map -nocase {"UTF-" "utf-" "iso-" "iso" "windows-" "cp" "shift_jis" "shiftjis"} $state(charset)]
        # Are there cookies?
        set cookies [list]
        foreach {name value} $state(meta) {
          # do we have cookies?                                                                                                                                                                             
          if {[string equal -nocase $name "Set-Cookie"]} {
            # yes, add them to cookie list                                                                                                                                                                          
            lappend webCookies [lindex [split $value {;}] 0]                                                                                                                                                             
          }                                                                                                                                                                                                             
        }
        if {[info exists webCookies] && [llength $webCookies]} {
          set cookies "[string trim [join $webCookies {;}] {;}]"
        } else {
          set cookies ""
        }
        # REDIRECT
        while {[string match "*${redir}*" "303|302|301" ]} {
          foreach {name value} $state(meta) {
            if {[regexp -nocase ^location$ $name]} {
              if {![string match "http*" $value]} {
                if {![string match "/" [string index $value 0]]} {
                  set value "[join [lrange [split $query "/"] 0 2] "/"]/$value"
                } else {
                  set value "[join [lrange [split $query "/"] 0 2] "/"]$value"
                }
              }
              if {[string length $cookies]} {
                set http [::http::geturl "[string map {" " "%20"} $value]" -headers "$::incith_hdr Referer $query Cookie $cookies" -timeout [expr 1000 * 10]]
              } else {
                set http [::http::geturl "[string map {" " "%20"} $value]" -headers "$::incith_hdr Referer $query" -timeout [expr 1000 * 10]]
              }
              if { $::incith::google::debug > 0 } { putserv "privmsg $::incith::google::debugnick :\002redirected \($redir\):\002 $query -> $value :: \002Cookie:\002 [join $cookies]" }
              if {[string match -nocase "*couldn't open socket*" $error]} {
                return "socketerrorabort|${value}"
              }
              if { [::http::status $http] == "timeout" } {
		    return "timeouterrorabort"
              }
              upvar #0 $http state
              # Are there cookies?
              foreach {nam val} $state(meta) {
                # do we have cookies?                                                                                                                                                                             
                if {[string equal -nocase $nam "Set-Cookie"]} {
                  if {![info exists flagme]} {
                    set flagme 0
                    set cookies [list]
                  }
                  # yes, add them to cookie list                                                                                                                                                                          
                  lappend webCookies [lindex [split $val {;}] 0]                                                                                                                                                             
                }                                                                                                                                                                                                             
              }
              if {[info exists webCookies] && [llength $webCookies]} {
                set cookies "[string trim [join $webCookies {;}] {;}]"
              } else {
                set cookies ""
              }
              set redir [::http::ncode $http]
              set incithcharset [string map -nocase {"UTF-" "utf-" "iso-" "iso" "windows-" "cp" "shift_jis" "shiftjis"} $state(charset)]
              set query [string map {" " "%20"} $value]
            }
          } 
        }
      }
      set html [charenc [ungzip [::http::data $http] $state(meta)] $state(charset)]
      ::http::cleanup $http

      # generic pre-parsing
      regsub -all "\n" $html "" html
      regsub -all "(?:\x91|\x92|&#39;)" $html {'} html
      regsub -all "(?:\x93|\x94|&quot;)" $html {"} html
      regsub -all "&amp;" $html {\&} html
      regsub -all -nocase {<sup>(.+?)</sup>} $html {^\1} html
      if {![string match $switch "4"] && ![string match $switch "26"]} {
        regsub -all -nocase {<font.+?>} $html "" html
        regsub -all -nocase {</font>} $html "" html
        regsub -all -nocase {<script type=.*?script>} $html "" html
      }
      if {![string match *$switch* "|9|7|5|"]} {
         regsub -all -nocase {<span.*?>} $html "" html
         regsub -all -nocase {</span>} $html "" html
      }
      regsub -all -nocase {<input.+?>} $html "" html
      regsub -all -nocase {(?:<i>|</i>)} $html "" html
      regsub -all "&times;" $html {*} html
      regsub -all "&nbsp;" $html { } html
      regsub -all -nocase "&#215;" $html "x" html
      regsub -all -nocase "&lt;" $html "<" html
      regsub -all -nocase "&gt;" $html ">" html
      regsub -all {\x000f} $html "" html
      # '
      # regexps that should remain seperate go here
      # google specific regexps
      if {$switch == 1} {
        # regexp the rest of the html for a much easier result to parse
        regsub -all -nocase {<b>\[PDF\]</b>\s*} $html "" html
        regsub {<p class=g style="margin-top:0">(.+?)</p>} $html "" html
      } elseif {$switch == 2} {
        # these %2520 codes, I have no idea. But they're supposed to be %20's
        regsub -all {%2520} $html {%20} html
      } elseif {$switch == 3} {
        regsub -all -nocase { - <nobr>Unverified listing</nobr>} $html "" html
        regsub -all -- {&#160;} $html { } html  
      } elseif {$switch == 4} {
      } elseif {$switch == 5} {
      } elseif {$switch == 6} {
      } elseif {$switch == 7} {
      } elseif {$switch == 8} {
      } elseif {$switch == 9} { 
        regsub -all "\t" $html "" html
        regsub -all "\n" $html "" html
        regsub -all "\r" $html "" html
        regsub -all "\v" $html "" html
	  regsub -all "\f" $html "" html
	  regsub -all "\b" $html "" html
	  regsub -all "\a" $html "" html
      } elseif {$switch == 10} {
        regsub -all -nocase { - <nobr>Unverified listing</nobr>} $html "" html
        regsub -all -- {&#160;} $html { } html
      } elseif {$switch == 25} {
        regsub -all {<script.*?>.+?</script>} $html "" html
        regsub -all "\t" $html "" html
        regsub -all "\n" $html "" html
        regsub -all "\r" $html "" html
        regsub -all "\v" $html "" html
	  regsub -all "\f" $html "" html
	  regsub -all "\b" $html "" html
	  regsub -all "\a" $html "" html
        regsub -all "<wbr/>" $html "" html
      } elseif {$switch > 11 && $switch < 31 || $switch == 56 || $switch == 58 || $switch == 59} {
        regsub -all "\t" $html "" html
        regsub -all "\n" $html "" html
        regsub -all "\r" $html "" html
        regsub -all "\v" $html "" html
	  regsub -all "\f" $html "" html
	  regsub -all "\b" $html "" html
	  regsub -all "\a" $html "" html
        regsub -all "&#039;" $html "'" html
      } elseif {$switch == 51} {
        regsub -all "<strong>|</strong>" $html "\002" html
      }

      # no point having it so many times
      if {$incith::google::bold_descriptions > 0 && [string match "\002" $incith::google::desc_modes] != 1} {
        regsub -all -nocase {(?:<b>|</b>|<em>|</em>|<strong>|</strong>)} $html "\002" html
      } else {
        regsub -all -nocase {(<b>|</b>|<em>|</em>|<strong>|</strong>)} $html "" html
      }
      # DEBUG DEBUG                    
      set junk [open "ig-debug.txt" w]
      puts $junk $html
      close $junk
      return $html
    }

    # PUBLIC_MESSAGE
    # decides what to do with binds that get triggered
    #
    proc public_message {nick uhand hand chan input} {
      if {[lsearch -exact [channel info $chan] +google] != -1} {
        if {$incith::google::chan_user_level == 3} {
          if {[isop $nick $chan] == 0} {
            return
          }
        } elseif {$incith::google::chan_user_level == 2} {
          if {[ishalfop $nick $chan] == 0 && [isop $nick $chan] == 0} {
            return
          }
        } elseif {$incith::google::chan_user_level == 1} {
          if {[isvoice $nick $chan] == 0 && [ishalfop $nick $chan] == 0 && [isop $nick $chan] == 0} {
            return
          }
        }
        send_output "$input" "$chan" "$nick" "$uhand"
	return 1
      }
    }

    # PRIVATE_MESSAGE
    # decides what to do with binds that get triggered
    #
    proc private_message {nick uhand hand input} {
      if {$incith::google::private_messages >= 1} {
        send_output $input $nick $nick $uhand
	  return 1
      }
    }

    # SEND_OUTPUT
    # no point having two copies of this in public/private_message{}
    #
    proc send_output {input where nick uhand} {

      # this is my input encoding hack, this will convert input before it goes
      # out to be queried.
      if {$incith::google::encoding_conversion_input > 0} {
        if {[encoding system] != "identity" && [lsearch [encoding names] "utf-8"]} {
          set command_char [encoding convertfrom "utf-8" ${incith::google::command_char}]
          set input [encoding convertfrom "utf-8" $input]
        } elseif {[encoding system] == "identity"} {
          set command_char [encoding convertfrom identity ${incith::google::command_char}]
          set input [encoding convertfrom identity $input]
        } else {
          set command_char ${incith::google::command_char}
        }
      } else {
        set command_char ${incith::google::command_char}
      }

      #Specifically retrieve only ONE (ascii) character, then check that matches the command_char first
      set trigger_char [string index $input 0]
      if {[encoding system] == "identity"} {
        set trigger_char [encoding convertfrom identity $trigger_char]
      }

      #Sanity check 1 - If no match, stop right here. No need to match every (first word) of
      # every line of channel data against every bind if the command_char doesnt even match.
      if {$trigger_char != $command_char} {
        return
      }

      set trigger [string range [lindex [split $input] 0] 1 end]
      #Sanity check 2 - Stop if theres nothing to search for (quiet)
      if {$incith::google::aversion_vocabulary > 0} {
        set search [vocabaversion [string trim [string range $input [string wordend $input 1] end]]]
      } else {
        set search [string trim [string range $input [string wordend $input 1] end]]
      }
      if {$search == ""} { return }

      if {$incith::google::force_private == 1} { set where $nick }
      # check for !google
      if {$incith::google::search_results > 0} {
        foreach bind [split $incith::google::google_binds " "] {
          if {[string match -nocase $bind $trigger] == 1} {
            # channel filter check
            foreach c [split $incith::google::filtered " "] {
              if {[string match -nocase $where $c] == 1} {
                return
              }
            }
            # flood protection check
            if {[flood $nick $uhand]} {
              return
            }
            # call google
            foreach line [incith::google::parse_output [google $search]] {
              put_output $where "$incith::google::search_prepend$line"
            }
            break
          }
        }
      }
      # check for !images
      if {$incith::google::image_results > 0} {
        foreach bind [split $incith::google::image_binds " "] {
          if {[string match -nocase $bind $trigger] == 1} {
            # flood protection check
            if {[flood $nick $uhand]} {
              return
            }
            # call images
            foreach line [incith::google::parse_output [images $search]] {
              put_output $where "$incith::google::image_prepend$line"
            }
            break
          }
        }
      }
      # check for !local
      if {$incith::google::local_results > 0} {
        foreach bind [split $incith::google::local_binds " "] {
          if {[string match -nocase $bind $trigger] == 1} {
            # flood protection check
            if {[flood $nick $uhand]} {
              return
            }
            # local requires splitting of the search
            regexp -nocase -- {^(.+?) near (.+?)$} $search - what location
            if {![info exists what] || ![info exists location]} {
              put_output $where "Local searches should be the format of 'pizza near footown, bar'"
              return
            }
            foreach line [incith::google::parse_output [local $search]] {
              put_output $where "$incith::google::local_prepend$line"
            }
            break
          }
        }
      }
      # check for !groups
      if {$incith::google::group_results > 0} {
        foreach bind [split $incith::google::group_binds " "] {
          if {[string match -nocase $bind $trigger] == 1} {
            # flood protection check
            if {[flood $nick $uhand]} {
              return
            }
            # call groups
            foreach line [incith::google::parse_output [groups $search]] {
              put_output $where "$incith::google::group_prepend$line"
            }
            break
          }
        }
      }
      # check for !news
      if {$incith::google::news_results > 0} {
        foreach bind [split $incith::google::news_binds " "] {
          if {[string match -nocase $bind $trigger] == 1} {
            # flood protection check
            if {[flood $nick $uhand]} {
              return
            }
            # call news
            foreach line [incith::google::parse_output [news $search]] {
              put_output $where "$incith::google::news_prepend$line"
            }
            break
          }
        }
      }
      # check for !print
      if {$incith::google::print_results > 0} {
        foreach bind [split $incith::google::print_binds " "] {
          if {[string match -nocase $bind $trigger] == 1} {
            # flood protection check
            if {[flood $nick $uhand]} {
              return
            }
            # call print
            foreach line [incith::google::parse_output [print $search]] {
              put_output $where "$incith::google::print_prepend$line"
            }
            break
          }
        }
      }
      # check for !video
      if {$incith::google::video_results > 0} {
        foreach bind [split $incith::google::video_binds " "] {
          if {[string match -nocase $bind $trigger] == 1} {
            # flood protection check
            if {[flood $nick $uhand]} {
              return
            }
            # call video
            foreach line [incith::google::parse_output [video $search]] {
              put_output $where "$incith::google::video_prepend$line"
            }
            break
          }
        }
      }
      # check for !scholar
      if {$incith::google::scholar_results > 0} {
        foreach bind [split $incith::google::scholar_binds " "] {
          if {[string match -nocase $bind $trigger] == 1} {
            # flood protection check
            if {[flood $nick $uhand]} {
              return
            }
            # call video
            foreach line [incith::google::parse_output [scholar $search]] {
              put_output $where "$incith::google::scholar_prepend$line"
            }
            break
          }
        }
      }
      # check for !fight
      if {$incith::google::google_fight > 0} {
        foreach bind [split $incith::google::fight_binds " "] {
          if {[string match -nocase $bind $trigger] == 1} {
            # flood protection check
            if {[flood $nick $uhand]} {
              return
            }
            # fight requires splitting of the search
            regexp -nocase -- {^(.+?) vs (.+?)$} $search - word1 word2
            if {![info exists word1] || ![info exists word2]} {
              put_output $where "Google fights should be the format of 'word(s) one vs word(s) two'"
              return
            }
            # call fight
            foreach line [incith::google::parse_output [fight $search]] {
              put_output $where "$incith::google::fight_prepend$line"
            }
            break
          }
        }
      }
      # check for !ebayfight
      if {$incith::google::google_fight > 0} {
        foreach bind [split $incith::google::efight_binds " "] {
          if {[string match -nocase $bind $trigger] == 1} {
            # flood protection check
            if {[flood $nick $uhand]} {
              return
            }
            # fight requires splitting of the search
            regexp -nocase -- {^(.+?) vs (.+?)$} $search - word1 word2
            if {![info exists word1] || ![info exists word2]} {
              put_output $where "Ebay fights should be the format of 'word(s) one vs word(s) two'"
              return
            }
            # call ebayfight
            foreach line [incith::google::parse_output [ebayfight $search]] {
              put_output $where "$incith::google::ebayfight_prepend$line"
            }
            break
          }
        }
      }
      # check for !youtube
      if {$incith::google::youtube_results > 0} {
        foreach bind [split $incith::google::youtube_binds " "] {
          if {[string match -nocase $bind $trigger] == 1} {
            # flood protection check
            if {[flood $nick $uhand]} {
              return
            }
            # call youtube
            foreach line [incith::google::parse_output [youtube $search]] {
              put_output $where "$incith::google::youtube_prepend$line"
            }
            break
          }
        }
      }
      # check for !helpbot
      if {$incith::google::helpbot_results > 0} {
        foreach bind [split $incith::google::helpbot_binds " "] {
          if {[string match -nocase $bind $trigger] == 1} {
            # flood protection check
            if {[flood $nick $uhand]} {
              return
            }
            # call helpbot
            foreach line [incith::google::parse_output [helpbot $nick $search]] {
              put_output $where $line
            }
            break
          }
        }
      }
      # check for !myspacevids
      if {$incith::google::myspacevids_results > 0} {
        foreach bind [split $incith::google::myspacevids_binds " "] {
          if {[string match -nocase $bind $trigger] == 1} {
            # flood protection check
            if {[flood $nick $uhand]} {
              return
            }
            # call myspacevids
            foreach line [incith::google::parse_output [myspacevids $search]] {
              put_output $where "$incith::google::myspacevids_prepend$line"
            }
            break
          }
        }
      }
      # check for !mininova
      if {$incith::google::mininova_results > 0} {
        foreach bind [split $incith::google::mininova_binds " "] {
          if {[string match -nocase $bind $trigger] == 1} {
            # flood protection check
            if {[flood $nick $uhand]} {
              return
            }
            # call mininova
            foreach line [incith::google::parse_output [mininova $search]] {
              put_output $where "$incith::google::mininova_prepend$line"
            }
            break
          }
        }
      }
      # check for !recent
      if {$incith::google::recent_results > 0} {
        foreach bind [split $incith::google::recent_binds " "] {
          if {[string match -nocase $bind $trigger] == 1} {
            # flood protection check
            if {[flood $nick $uhand]} {
              return
            }
            # call recent game lookup
            foreach line [incith::google::parse_output [recent $search]] {
              put_output $where "$incith::google::recent_prepend$line"
            }
            break
          }
        }
      }
      # check for !wiki
      if {$incith::google::wiki_results > 0} {
        foreach bind [split $incith::google::wiki_binds " "] {
          if {[string match -nocase $bind $trigger] == 1} {
            # flood protection check
            if {[flood $nick $uhand]} {
              return
            }
            # call wiki
            foreach line [incith::google::parse_output [wiki $search]] {
              put_output $where "$incith::google::wiki_prepend$line"
            }
            break
          }
        }
      }
      # check for !wikimedia
      if {$incith::google::wikimedia_results > 0} {
        foreach bind [split $incith::google::wikimedia_binds " "] {
          if {[string match -nocase $bind $trigger] == 1} {
            # flood protection check
            if {[flood $nick $uhand]} {
              return
            }
            # call wiki
            foreach line [incith::google::parse_output [wikimedia $search]] {
              put_output $where "$incith::google::wikimedia_prepend$line"
            }
            break
          }
        }
      }
      # check for !review
      if {$incith::google::rev_results > 0} {
        foreach bind [split $incith::google::rev_binds " "] {
          if {[string match -nocase $bind $trigger] == 1} {
            # flood protection check
            if {[flood $nick $uhand]} {
              return
            }
            # call review
            foreach line [incith::google::parse_output [rev $search]] {
              put_output $where "$incith::google::rev_prepend$line"
            }
            break
          }
        }
      }
      # check for !ign
      if {$incith::google::ign_results > 0} {
        foreach bind [split $incith::google::ign_binds " "] {
          if {[string match -nocase $bind $trigger] == 1} {
            # flood protection check
            if {[flood $nick $uhand]} {
              return
            }
            # call ign
            foreach line [incith::google::parse_output [ign $search]] {
              put_output $where "$incith::google::ign_prepend$line"
            }
            break
          }
        }
      }
      # check for !trends
      if {$incith::google::trends_results > 0} {
        foreach bind [split $incith::google::trends_binds " "] {
          if {[string match -nocase $bind $trigger] == 1} {
            # flood protection check
            if {[flood $nick $uhand]} {
              return
            }
            # call trends
            foreach line [incith::google::parse_output [trends $search]] {
              put_output $where "$incith::google::trends_prepend$line"
            }
            break
          }
        }
      }
      # check for !gamespot
      if {$incith::google::gamespot_results > 0} {
        foreach bind [split $incith::google::gamespot_binds " "] {
          if {[string match -nocase $bind $trigger] == 1} {
            # flood protection check
            if {[flood $nick $uhand]} {
              return
            }
            # call gamespot
            foreach line [incith::google::parse_output [gamespot $search]] {
              put_output $where "$incith::google::gamespot_prepend$line"
            }
            break
          }
        }
      }
      # check for !trans
      if {$incith::google::trans_results > 0} {
        foreach bind [split $incith::google::trans_binds " "] {
          if {[string match -nocase $bind $trigger] == 1} {
            # flood protection check
            if {[flood $nick $uhand]} {
              return
            }
            # translation requires splitting of the search
            if {![regexp -nocase -- {^(.+?)@(.+?)\s(.+?)$} $search - word1 word2 word3]} {
              if {[regexp -nocase -- {^@(.+?)\s(.+?)$} $search - word2 word3]} {
                set search [join [lrange [split $search] 1 end]]
              } else {
                regexp -nocase -- {^(.+?)@\s(.+?)$} $search - word1 word3
              }
            }
            if {[info exists word2]} {
              if {[string equal [string index $word2 0] " "]} {
                regexp -nocase -- {^(.+?)@\s(.+?)$} $search - word1 word3
                set word2 $::incith::google::trans
              }
            }
            if {![info exists word1]} { set word1 "auto" }
            if {![info exists word2]} { set word2 $::incith::google::trans }
            if {![info exists word3]} { set word3 $search }
            set search "$word1@$word2 $word3"
            # call translate
            trans $search $where
          }
        }
      }
      # check for !dailymotion
      if {$incith::google::daily_results > 0} {
        foreach bind [split $incith::google::daily_binds " "] {
          if {[string match -nocase $bind $trigger] == 1} {
            # flood protection check
            if {[flood $nick $uhand]} {
              return
            }
            # call dailymotion
            foreach line [incith::google::parse_output [dailymotion $search]] {
              put_output $where "$incith::google::dailymotion_prepend$line"
            }
            break
          }
        }
      }
      # check for !gamefaqs
      if {$incith::google::gamefaq_results > 0} {
        foreach bind [split $incith::google::gamefaq_binds " "] {
          if {[string match -nocase $bind $trigger] == 1} {
            # flood protection check
            if {[flood $nick $uhand]} {
              return
            }
            # gamefaqs requires splitting of the search
            regexp -nocase -- {^(.+?) in (.+?)$} $search - system region
            if {![info exists system] || ![info exists region]} {
              put_output $where "Error! Correct usage: !gamefaqs system in region \[system = nds/gba/gc/wii/ps2/psp/ps3/xbox/x360/pc; region = usa/jap/eur/aus\]"
              return
            }
            # call gamefaqs
            foreach line [incith::google::parse_output [gamefaqs $system $region]] {
              put_output $where "$incith::google::gamefaqs_prepend$line"
            }
            break
          }
        }
      }
      # check for !locate
      if {$incith::google::locate_results > 0} {
        foreach bind [split $incith::google::locate_binds " "] {
          if {[string match -nocase $bind $trigger] == 1} {
            # flood protection check
            if {[flood $nick $uhand]} {
              return
            }
            # call locate
            if {![string match "*.*" $search]} {
              set nsearch [lindex [split [getchanhost $search $where] @] 1]
              if {[string length $nsearch]} { set search $nsearch }
            }
            foreach line [incith::google::parse_output [locate $search]] {
              put_output $where "$incith::google::locate_prepend$line"
            }
            break
          }
        }
      }
      # check for !blog
      if {$incith::google::blog_results > 0} {
        foreach bind [split $incith::google::blog_binds " "] {
          if {[string match -nocase $bind $trigger] == 1} {
            # flood protection check
            if {[flood $nick $uhand]} {
              return
            }
            # call blogsearch.google
            foreach line [incith::google::parse_output [blog $search]] {
              put_output $where "$incith::google::blog_prepend$line"
            }
            break
          }
        }
      }
      # check for !ebay
      if {$incith::google::ebay_results > 0} {
        foreach bind [split $incith::google::ebay_binds " "] {
          if {[string match -nocase $bind $trigger] == 1} {
            # flood protection check
            if {[flood $nick $uhand]} {
              return
            }
            # call ebay
            foreach line [incith::google::parse_output [ebay $search]] {
              put_output $where "$incith::google::ebay_prepend$line"
            }
            break
          }
        }
      }
      # check for !popular
      if {$incith::google::popular_results > 0} {
        foreach bind [split $incith::google::popular_binds " "] {
          if {[string match -nocase $bind $trigger] == 1} {
            # flood protection check
            if {[flood $nick $uhand]} {
              return
            }
            # call popular
            foreach line [incith::google::parse_output [popular $search]] {
              put_output $where "$incith::google::popular_prepend$line"
            }
            break
          }
        }
      }
      # check for customized any triggers
      if {$incith::google::my_custom > 0} {
        foreach bind $incith::google::my_customs {
          foreach sbind [split [lindex [split $bind :] 0]] {
            if {[string match -nocase $sbind $trigger] == 1} {
              # invoke customized trigger with phrase
              # no need to flood protect this, if we do
              # it may trigger erroneously
              set text [join [lrange [split $bind :] 2 end] :]
              if {$::incith::google::custom_words > 0} {
                set remaps [regexp -inline -all {%%((?:end|[0-9]{1,2}|[0-9]{1,2}-(?:[0-9]{1,2}|end)))%%} $text]
                foreach {junk remap} $remaps {
                  if {[regexp -nocase {^((?:end|[0-9]{1,2}))$} $remap - rnum]} {
                    if {[string equal -nocase "end" $rnum]} {
                      set real [llength [split $search]]
                    } else {
                      set real [expr {$remap -1}]
                    }
                    regsub -all "$junk" $text "[lindex [split $search] $real]" text
                  } elseif {[regexp -nocase {^([0-9]{1,2})-((?:[0-9]{1,2}|end))$} $remap - rstart rend]} {
                    if {![string equal -nocase "end" $rend]} { set real [expr {$rend -1}] } else { set real [llength [split $search]] }
                    regsub -all "$junk" $text "[join [lrange [split $search] [expr {${rstart}-1}] $real]]" text
                  }
                }
              }
              regsub -all -- {%search%} $text "$search" text
              send_output "$::incith::google::command_char[lindex [split $bind :] 1] $text" $where $nick $uhand
            }
          }
        }
      }
    }

    # PUT_OUTPUT
    # actually sends the output to the server
    proc put_output {where line} {
      if {$incith::google::notice_reply == 1} {
        putserv "NOTICE $where :$line"
      } else {
        putserv "PRIVMSG $where :$line"
      }
    }

    # STRIPCODES REPLACEMENT
    # eggdrops stripcodes command does in-place adjustments which is a no-no, we can no longer trust it. Here is a close cousin.
    proc strip {str} {
       return [regsub -all -- {\017|\035|\002|\037|\026|\003(\d{1,2})?(,\d{1,2})?} $str ""]
    }


    # PARSE_OUTPUT
    # prepares output for sending to a channel/user, calls line_wrap
    #
    proc parse_output {input} {
      set parsed_output [list] ; set parsed_current [list]
      if {[string match "*\n*" $incith::google::seperator] == 1} {
        set lastline ""
        foreach newline [split $input "\n"] {
          foreach line [incith::google::line_wrap $newline] {
            set fix ""
            # bold
            if {[expr {[regexp -all {\002} $lastline] & 1 }]} {
              append fix "\002"
            }
            # underline
            if {[expr {[regexp -all {\037} $lastline] & 1 }]} {
              append fix "\037"
            }
            # color
            if {[expr {[regexp -all {\003} $lastline] & 1 }]} {
              if {[set i [string last "\003" $lastline]] != -1} {
                set lc [string range $lastline [expr {$i + 1}] [expr {$i + 5}]] 
                if {![regexp {^[0-9]+\,[0-9+]$} $lc]} {
                  if {[regexp {^[0-9]+$} [string range $lc 0 1]]} {
                    append fix "\003[string range $lc 0 1]"
                  }
                } else {
                  append fix "\003$lc"
                }
              }
            }
            # add fix+line to output
            if {[string length [string map {" " ""} [strip $line]]]} {
              lappend parsed_output "$fix$line"
            }
            set lastline "$fix$line"
          }
        }
      } else {
        set input [string trimright $input $incith::google::seperator]
        set lastline ""
        foreach line [incith::google::line_wrap $input] {
          # initialize fix each iteration
          set fix ""
          # add bold
          if {[expr {[regexp -all {\002} $lastline] & 1 }]} {
            append fix "\002"
          }
          # add underline
          if {[expr {[regexp -all {\037} $lastline] & 1 }]} {
            append fix "\037"
          }
          # add color
          if {[expr {[regexp -all {\003} $lastline] & 1 }]} {
            if {[set i [string last "\003" $lastline]] != -1} {
              set lc [string range $lastline [expr {$i + 1}] [expr {$i + 5}]]
              if {![regexp {^[0-9]{1,2}\,[0-9]{1,2}$} $lc]} {
                if {[regexp {^[0-9]{1,2}} [string range $lc 0 1]]} {
                  append fix "\003[string range $lc 0 1]"
                } 
              } else {
                append fix "\003$lc"
              }
            }
          }
          # add fix+line to output
          if {[string length [string map {" " ""} [strip $line]]]} {
            lappend parsed_output "$fix$line"
          }
          set lastline "$fix$line"
        }
      }
      return $parsed_output
    }

    # LINE_WRAP
    # takes a long line in, and chops it before the specified length
    # http://forum.egghelp.org/viewtopic.php?t=6690
    #
    proc line_wrap {str {splitChr { }}} { 
      set out [set cur {}]
      set i 0
      set len $incith::google::split_length
      foreach word [split [set str][set str ""] $splitChr] { 
        if {[incr i [string len $word]] > $len} { 
          lappend out [join $cur $splitChr] 
          set cur [list $word] 
          set i [string len $word] 
        } else { 
          lappend cur $word 
        } 
        incr i 
      } 
      lappend out [join $cur $splitChr] 
    }

    # IS THE BOT PATCHED?!
    # thanks thommey :P
    proc botispatched { } { catch {botonchan #\uC0A0} e ; if {[string equal [string length $e] [string bytelength $e]]} { return 0 } { return 1 } }

    # CHARENC (aka, character encode)
    # based upon webby, yes, webby r0x!
    #
    proc charenc {html encoding} {
      global incithcharset
      if {[regexp -nocase {"Content-Type" content=".*?; charset=(.*?)".*?>} $html - char]} {
        set char [string trim [string trim $char "\"' /"] {;}]
        regexp {^(.*?)"} $char - char
        if {![string length $char]} { set char "None Given" ; set char2 "None Given" }
        set char2 [string tolower [string map -nocase {"UTF-" "utf-" "iso-" "iso" "windows-" "cp" "shift_jis" "shiftjis"} $char]]
      } else {
        if {[regexp -nocase {<meta content=".*?; charset=(.*?)".*?>} $html - char]} {
          set char [string trim $char "\"' /"]
          regexp {^(.*?)"} $char - char
          set mset $char
          if {![string length $char]} { set char "None Given" ; set char2 "None Given" }
          set char2 [string tolower [string map -nocase {"UTF-" "utf-" "iso-" "iso" "windows-" "cp" "shift_jis" "shiftjis"} $char]]
        } else {
          set char "None Given" ; set char2 "None Given" ; set mset "None Given"
        }
      }
      set char3 [string tolower [string map -nocase {"UTF-" "utf-" "iso-" "iso" "windows-" "cp" "shift_jis" "shiftjis"} $encoding]]
      if {[string equal $char $encoding] && [string equal $char $char2] && ![string equal -nocase "none given" $char]} {
        set char [string trim $encoding {;}]
        set incithcharset $encoding
      } else {
        if {![string equal -nocase $char2 $char3] && ![string equal -nocase "none given" $char2]} {
          set html [incithConflict $html $char2]
          set char [string trim $char2 {;}]
          set incithcharset "utf-8"
        } else {
          if {[catch {package present http 2.7}]} {
            # assume http package 2.5.3
            if {[string equal -nocase "utf-8" [encoding system]]} {
              if {![string equal -nocase "utf-8" $char3]} { 
                set html [encoding convertfrom $char3 $html]
                set incithcharset $char3
              } else {
		    if {![string length $::incith_hdr] && ![botispatched]} { set html [encoding convertto $char3 $html] }
                set incithcharset $char3
              }
            } elseif {![string equal -nocase "utf-8" [encoding system]]} {
              if {[string equal "utf-8" $char3]} {
                if {![string length $::incith_hdr]} { set html [encoding convertto $char3 $html] ; set incithcharset "utf-8" }
              } else {
	          set html [encoding convertto "utf-8" [encoding convertfrom $char3 $html]]
                set incithcharset "utf-8"
              }
            }
          } else {
            # we have http package 2.7
            if {![string equal -nocase "utf-8" [encoding system]]} {
              set html [encoding convertto $char3 $html]
              set incithcharset $char3
            }
          }
        }
      }
      return $html
    }
    # INCITH_CONFLICT
    # resolves conflicts during encodings between header charset and meta charset
    proc incithConflict {html out} {
      set html [encoding convertfrom $out $html]
	if {![string equal -nocase "utf-8" [encoding system]]} { set html [encoding convertto utf-8 $html] }
      return $html
    }

    # FLOOD_INIT
    # modified from bseen
    #
    variable flood_data
    variable flood_array
    proc flood_init {} {
      if {$incith::google::ignore < 1} {
        return 0
      }
      if {![string match *:* $incith::google::flood]} {
        putlog "$incith::google::version: variable flood not set correctly."
        return 1
      }
      set incith::google::flood_data(flood_num) [lindex [split $incith::google::flood :] 0]
      set incith::google::flood_data(flood_time) [lindex [split $incith::google::flood :] 1]
      set i [expr $incith::google::flood_data(flood_num) - 1]
      while {$i >= 0} {
        set incith::google::flood_array($i) 0
        incr i -1
      }
    }
    ; flood_init

    # FLOOD
    # updates and returns a users flood status
    #
    proc flood {nick uhand} {
      if {$incith::google::ignore < 1} {
        return 0
      }
      if {$incith::google::flood_data(flood_num) == 0} {
        return 0
      }
      set i [expr ${incith::google::flood_data(flood_num)} - 1]
      while {$i >= 1} {
        set incith::google::flood_array($i) $incith::google::flood_array([expr $i - 1])
        incr i -1
      }
      set incith::google::flood_array(0) [unixtime]
      if {[expr [unixtime] - $incith::google::flood_array([expr ${incith::google::flood_data(flood_num)} - 1])] <= ${incith::google::flood_data(flood_time)}} {
        putlog "$incith::google::version: flood detected from ${nick}."
        putserv "notice $nick :$incith::google::version: flood detected, placing you on ignore for $::incith::google::ignore minute(s)! :P"
        newignore [join [maskhost *!*[string trimleft $uhand ~]]] $incith::google::version flooding $incith::google::ignore
        return 1
      } else {
        return 0
      }
    }


    # AUTOMAGIC CHARSET ENCODING SUPPORT
    # on the fly encoding support
    #
    proc incithdecode {text} {
      global incithcharset
      if {[lsearch -exact [encoding names] $incithcharset] != -1} {
        set text [encoding convertfrom $incithcharset $text]
      }
      return $text
    }

    proc incithencode {text} {
      global incithcharset
      if {[lsearch -exact [encoding names] $incithcharset] != -1} {
        set text [encoding convertto $incithcharset $text]
      }
      return $text
    }

    # utf-8 sucks for displaying any language using extended ascii, this helps alleviate that.
    # correct utf-8 problems before they even appear.
    proc utf8encodefix {country input} {
      if {[lsearch -exact [encoding names] [set encoding_found [lindex [split [lindex $incith::google::encode_strings [lsearch -glob $incith::google::encode_strings "${country}:*"]] :] 1]]]} {
        if {![string match "" $encoding_found]} { set input [encoding convertto $encoding_found $input] }
      }
      return $input
    }

    # Wikipedia/Wikimedia subtag-decoder...
    # decodes those silly subtags
    #
    proc subtagDecode {text} {
      set url "" ; set ::incithcharset "utf-8"
      #if {![string equal $::incithcharset [encoding system]]} { set text [encoding convertfrom $::incithcharset $text] }
      regsub -all {\.([0-9a-fA-F][0-9a-fA-F])} $text {[format %c 0x\1]} text
      set text [subst $text]
      #if {![string equal $::incithcharset [encoding system]]} { set text [encoding convertto $::incithcharset $text] }
      regsub -all "\r\n" $text "\n" text
      foreach byte [split $text ""] {
        scan $byte %c i
        if { $i < 33 } {
          append url [format %%%02X $i]
        } else {
          append url $byte
        }
      }
      return [string map {% .} $url]
    }

    # Vocabulary Aversion
    # This converts swear words into appropriate words for IRC
    # this is rather rudementary, is probably a better way to do this but meh..
    #
    proc vocabaversion {text} {
      set newtext ""
      foreach element [split $text] {
        set violation 0
        foreach vocabulary $incith::google::aversion {
          set swear [lindex [split $vocabulary :] 0]
          set avert [join [lrange [split $vocabulary :] 1 end]]
          if {[string match -nocase "$swear" $element] && $avert != ""} {
            append newtext "$avert "
            set violation 1
            break
          }
        }
        if {$violation == 0} { append newtext "$element " }
      }
      return [string trim $newtext]
    } 

    # Description Decode 
    # convert html codes into characters - credit perplexa (urban dictionary)
    #
    proc descdecode {text} {
      global incithcharset
	# code below is neccessary to prevent numerous html markups
	# from appearing in the output (ie, &quot;, &#5671;, etc)
	# stolen (borrowed is a better term) from tcllib's htmlparse ;)
	# works unpatched utf-8 or not, unlike htmlparse::mapEscapes
	# which will only work properly patched....
      if {[string match *&* $text]} {
        set escapes {
		&#160; { } &nbsp; \xa0 &iexcl; \xa1 &cent; \xa2 &pound; \xa3 &curren; \xa4
		&yen; \xa5 &brvbar; \xa6 &sect; \xa7 &uml; \xa8 &copy; \xa9
		&ordf; \xaa &laquo; \xab &not; \xac &shy; \xad &reg; \xae
		&macr; \xaf &deg; \xb0 &plusmn; \xb1 &sup2; \xb2 &sup3; \xb3
		&acute; \xb4 &micro; \xb5 &para; \xb6 &middot; \xb7 &cedil; \xb8
		&sup1; \xb9 &ordm; \xba &raquo; \xbb &frac14; \xbc &frac12; \xbd
		&frac34; \xbe &iquest; \xbf &Agrave; \xc0 &Aacute; \xc1 &Acirc; \xc2
		&Atilde; \xc3 &Auml; \xc4 &Aring; \xc5 &AElig; \xc6 &Ccedil; \xc7
		&Egrave; \xc8 &Eacute; \xc9 &Ecirc; \xca &Euml; \xcb &Igrave; \xcc
		&Iacute; \xcd &Icirc; \xce &Iuml; \xcf &ETH; \xd0 &Ntilde; \xd1
		&Ograve; \xd2 &Oacute; \xd3 &Ocirc; \xd4 &Otilde; \xd5 &Ouml; \xd6
		&times; \xd7 &Oslash; \xd8 &Ugrave; \xd9 &Uacute; \xda &Ucirc; \xdb
		&Uuml; \xdc &Yacute; \xdd &THORN; \xde &szlig; \xdf &agrave; \xe0
		&aacute; \xe1 &acirc; \xe2 &atilde; \xe3 &auml; \xe4 &aring; \xe5
		&aelig; \xe6 &ccedil; \xe7 &egrave; \xe8 &eacute; \xe9 &ecirc; \xea
		&euml; \xeb &igrave; \xec &iacute; \xed &icirc; \xee &iuml; \xef
		&eth; \xf0 &ntilde; \xf1 &ograve; \xf2 &oacute; \xf3 &ocirc; \xf4
		&otilde; \xf5 &ouml; \xf6 &divide; \xf7 &oslash; \xf8 &ugrave; \xf9
		&uacute; \xfa &ucirc; \xfb &uuml; \xfc &yacute; \xfd &thorn; \xfe
		&yuml; \xff &fnof; \u192 &Alpha; \u391 &Beta; \u392 &Gamma; \u393 &Delta; \u394
		&Epsilon; \u395 &Zeta; \u396 &Eta; \u397 &Theta; \u398 &Iota; \u399
		&Kappa; \u39A &Lambda; \u39B &Mu; \u39C &Nu; \u39D &Xi; \u39E
		&Omicron; \u39F &Pi; \u3A0 &Rho; \u3A1 &Sigma; \u3A3 &Tau; \u3A4
		&Upsilon; \u3A5 &Phi; \u3A6 &Chi; \u3A7 &Psi; \u3A8 &Omega; \u3A9
		&alpha; \u3B1 &beta; \u3B2 &gamma; \u3B3 &delta; \u3B4 &epsilon; \u3B5
		&zeta; \u3B6 &eta; \u3B7 &theta; \u3B8 &iota; \u3B9 &kappa; \u3BA
		&lambda; \u3BB &mu; \u3BC &nu; \u3BD &xi; \u3BE &omicron; \u3BF
		&pi; \u3C0 &rho; \u3C1 &sigmaf; \u3C2 &sigma; \u3C3 &tau; \u3C4
		&upsilon; \u3C5 &phi; \u3C6 &chi; \u3C7 &psi; \u3C8 &omega; \u3C9
		&thetasym; \u3D1 &upsih; \u3D2 &piv; \u3D6 &bull; \u2022
		&hellip; \u2026 &prime; \u2032 &Prime; \u2033 &oline; \u203E
		&frasl; \u2044 &weierp; \u2118 &image; \u2111 &real; \u211C
		&trade; \u2122 &alefsym; \u2135 &larr; \u2190 &uarr; \u2191
		&rarr; \u2192 &darr; \u2193 &harr; \u2194 &crarr; \u21B5
		&lArr; \u21D0 &uArr; \u21D1 &rArr; \u21D2 &dArr; \u21D3 &hArr; \u21D4
		&forall; \u2200 &part; \u2202 &exist; \u2203 &empty; \u2205
		&nabla; \u2207 &isin; \u2208 &notin; \u2209 &ni; \u220B &prod; \u220F
		&sum; \u2211 &minus; \u2212 &lowast; \u2217 &radic; \u221A
		&prop; \u221D &infin; \u221E &ang; \u2220 &and; \u2227 &or; \u2228
		&cap; \u2229 &cup; \u222A &int; \u222B &there4; \u2234 &sim; \u223C
		&cong; \u2245 &asymp; \u2248 &ne; \u2260 &equiv; \u2261 &le; \u2264
		&ge; \u2265 &sub; \u2282 &sup; \u2283 &nsub; \u2284 &sube; \u2286
		&supe; \u2287 &oplus; \u2295 &otimes; \u2297 &perp; \u22A5
		&sdot; \u22C5 &lceil; \u2308 &rceil; \u2309 &lfloor; \u230A
		&rfloor; \u230B &lang; \u2329 &rang; \u232A &loz; \u25CA
		&spades; \u2660 &clubs; \u2663 &hearts; \u2665 &diams; \u2666
		&quot; \x22 &amp; \x26 &lt; \x3C &gt; \x3E O&Elig; \u152 &oelig; \u153
		&Scaron; \u160 &scaron; \u161 &Yuml; \u178 &circ; \u2C6
		&tilde; \u2DC &ensp; \u2002 &emsp; \u2003 &thinsp; \u2009
		&zwnj; \u200C &zwj; \u200D &lrm; \u200E &rlm; \u200F &ndash; \u2013
		&mdash; \u2014 &lsquo; \u2018 &rsquo; \u2019 &sbquo; \u201A
		&ldquo; \u201C &rdquo; \u201D &bdquo; \u201E &dagger; \u2020
		&Dagger; \u2021 &permil; \u2030 &lsaquo; \u2039 &rsaquo; \u203A
		&euro; \u20AC &apos; \u0027 &lrm; "" &rlm; "" &#8236; "" &#8237; ""
		&#8238; "" &#8212; \u2014
        }
        # enable transcoding html elements?
        if {$::incith::google::dirty_decode > 0} {
  		set text [string map [list "\]" "\\\]" "\[" "\\\[" "\$" "\\\$" "\\" "\\\\"] [string map $escapes $text]]
  		regsub -all -- {&#([[:digit:]]{1,5});} $text {[encoding convertto $incithcharset [format %c [string trimleft "\1" "0"]]]} text
  		regsub -all -- {&#x([[:xdigit:]]{1,4});} $text {[encoding convertto $incithcharset [format %c [scan "\1" %x]]]} text
          set text [subst "$text"]
        }
      }
      # correct possible bleedover of bold or underline
      set fix "" ; 
      if {[expr {[regexp -all {\002} $text] & 1 }]} {
        append fix "\002"
      }
      if {[expr {[regexp -all {\037} $text] & 1 }]} {
        append fix "\037"
      }
      if {[string length $fix]} { set text "$text$fix" }
      return $text  
    }

    # URL Decode
    # Decodes all of the %00 strings in a url and returns it
    #
    proc urldecode {text} {
      set url ""
      # tcl filter required because we are using SUBST command below
      # this will escape any sequence which could potentially trigger
      # the interpreter..
        regsub -all -- \\\\ $text \\\\\\\\ text
        regsub -all -- \\\[ $text \\\\\[ text
        regsub -all -- \\\] $text \\\\\] text
        regsub -all -- \\\} $text \\\\\} text
        regsub -all -- \\\{ $text \\\\\{ text
        regsub -all -- \\\" $text \\\\\" text
        regsub -all -- \\\$ $text \\\\\$ text
      # end tcl filter
      regsub -all {\%([0-9a-fA-F][0-9a-fA-F])} $text {[format %c 0x\1]} text
      set text [subst $text]
      foreach byte [split $text ""] {
        scan $byte %c i
        if { $i < 33 || $i > 127 } {
          append url [format %%%02X $i]
        } else {
          append url $byte
        }
      }
      return $url
    }
    # Un Gzip
    # Unzips those silly g-zipped wikis
    #
    proc ungzip {html metas} {
      if {$::incith::google::use_gzip > 0} {
        if {![info exists ::incith_nozlib]} {
          foreach {name value} $metas {
            if {[regexp -nocase ^Content-Encoding$ $name]} {
              if {[string equal -nocase "gzip" $value]} {
	          if {![info exists ::incith_trf]} {
                  if {[catch {set html [zlib inflate [string range $html 10 [expr { [string length $html] - 8 } ]]]} error]} { return $html }
                } else {
                  set html [zip -mode decompress -nowrap 1 [string range $html 10 [expr { [string length $html] - 8 } ]]]
                }
                break
              }
            }
          }
        }
      }
      return $html
    }

    # URL Encode
    # Encodes anything not a-zA-Z0-9 into %00 strings...
    #
    proc urlencode {text type {enc ""}} {
      if {[string length $enc]} {
        set text [encoding convertto $enc $text]
      }
      set url ""
      foreach byte [split $text ""] {
        scan $byte %c i
        if {$i < 65 || $i > 122} {
          append url [format %%%02X $i]
        } else {
          append url $byte
        }
      }
      if {$type == 1} {
        return [string map {%25 . %3A : %2D - %2F / %2E . %30 0 %31 1 %32 2 %33 3 %34 4 %35 5 %36 6 %37 7 %38 8 %39 9 %80 _ % .} $url]
      } else {
        return [string map {%2D - %30 0 %31 1 %32 2 %33 3 %34 4 %35 5 %36 6 %37 7 %38 8 %39 9 \[ %5B \\ %5C \] %5D \^ %5E \_ %5F \` %60} $url]
      }
    }
  }
}

putlog "${incith::google::version}: Loaded. (hrz version, long live hrz! Zanzibar I owe you a joint or three!)"
putlog "${incith::google::version} :: Http: [package present http];BotIsPatched: [incith::google::botispatched];EncodingSystem: [encoding system];Tcl: $tcl_version;Eggdrop: [lindex $version 0];Suzi: [if {[info exists ::sp_version]} { set a "YES $::sp_version" } { set a "NO" }]"

# EOF


