## Exports
# set silly terminal title
echo -n -e "\033]0;Spooky Shell\007"
# set language to English UTF-8
LC_ALL=en_US.UTF-8
LANG=en_US.UTF-8
LANGUAGE=en_US.UTF-8
# setup vars for export
# make the history size infinite
HISTSIZE="GOTCHA"
HISTFILE="${HOME}/.history/$(date +%Y/%m/%d-%I_%M_%S%p)_${USER}_$$"
# set default editor
VISUAL=/Applications/Emacs.app/Contents/MacOS/Emacs 
EDITOR="$VISUAL"
# os/build info
OS="`uname | tr A-Z a-z`"
ARCH="`uname -m | sed 's;i.86;x86;'`"
# default wine architecture to 32-bits
WINEARCH=win32
# plan9port install path
PLAN9=/opt/plan9port
# set font plan9 stuff
font=$PLAN9/font/fixed/unicode.6x12.font
#font=/mnt/font/Chicacoal/16/font
#export font=/mnt/font/ComicSansMS/16a/font
# Let gs find the plan9port document fonts.
GS_FONTPATH=$PLAN9/postscript/font
# Make sure mpage prints in letter mode.
MPAGE="-t -bLetter"
# Get rid of backspace characters in Unix man output.
PAGER=nobs
# This is still needed on OS X
CVS_RSH=ssh
#for programs that depend on mpd declarations
MPD_HOST=localhost
MPD_PORT=6600

export \
PATH \
EDITOR \
OS \
ARCH \
WINEARCH \
PLAN9 \
font \
CVS_RSH \
GS_FONTPATH \
MPAGE \
PAGER \
HISTSIZE \
HISTFILE \
LC_ALL \
LANG \
LANGUAGE \
MPD_HOST \
MPD_PORT \

# append user stuff to system $PATH
PATH=/Applications/mpv.app/Contents/MacOS:$PATH
PATH=/Applications/Wine\ Staging.app/Contents/Resources/wine/bin:$PATH
PATH=/Users/John/.local/bin:$PATH
PATH=$PATH:$PLAN9/bin
#PATH=/opt/wine-staging/bin:$PATH
#PATH=/opt/pkg/gcc47/bin:$PATH

## Evaluate system PATH
# This will read the values in /etc/paths, and /etc/paths.d/*
#   for valid system paths to append to the $PATH env variable
if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi

## Aliases
alias spot='mdfind -onlyin \`pwd\`'
alias locate='mdfind '
alias ll='ls -la'
alias cd..='cd ..'
alias wget='wget -c'
alias sha1='openssl sha1'
alias md5='openssl md5'
alias md5s='md5sum'
alias mount='mount |column -t'
alias rmds='find . -name '*.DS_Store' -type f -delete'
# aesthetically pleasing date command
alias ndate='date +"%A, %B %d %Y - %I:%M:%S %p"'
# make ls colorful
alias ls="ls -G"
alias scrot="import screenshot-$(date +%F)--$(date +%T).png"
# remove border from mpv
#alias m="open -a mpv.app --args --no-border"
alias m="open -a mpv.app"
# stream stuff from the web at the given quality
function str () { livestreamer -p "mpv" $1 best; }
# easier to type
alias import="screencapture"
# set acme font
alias acme="acme -f $font"
# create a smooth screencast, even on bad hardware
alias screencast='ffmpeg -framerate 30 -f avfoundation -i "1:" -c:v libx264 -qp 0 -preset ultrafast out.mkv; ffmpeg -i out.mkv -q:v 10 -c:v libvpx -b:v 1.5M -c:a libvorbis -threads 0 -an output.webm'
# convert m4a to mp3 from the command line
function m4a2mp3 () { for f in *.m4a; do ffmpeg -i "$f" -acodec libmp3lame -ab 256k "${f%.m4a}.mp3"; done; }
# listen to UVB-76
alias conet='tmpv http://stream.priyom.org:8000/buzzer.ogg.m3u'
# fc-cache reset
alias ffccache='fc-cache --really-force --verbose'
alias fdupes='find -not -empty -type f -printf "%s\n" | sort -rn | uniq -d | xargs -I{} -n1 find -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 --all-repeated=separate'

# connect to Gettysburg Xubuntu workstations
alias ssx="ssh -Y -c blowfish-cbc,arcfour cs20.cc.gettysburg.edu -p 222 -l duncjo01"
alias parallela="ssh -Y -c blowfish-cbc,arcfour 138.234.44.100 -p 222 -l duncjo01"
function gput () { scp -P 222 $1 duncjo01@cs21.cc.gettysburg.edu:~/public_html/; }
function gget () { scp -P 222  duncjo01@cs21.cc.gettysburg.edu:~/Desktop/$1 ~/Desktop/; }

# Alias some git commands
alias status="git status"
alias check="git checkout"
alias checkout="git checkout"
alias pull="git pull"
alias branch="git branch"
alias tag="git tag"
alias fetch="git fetch"
alias clone="git clone"
alias commit="git commit"
alias push="git push"
function cherry() { git cherry-pick $1; }
function cherrypick() { git cherry-pick $1; }
alias undo="git reset --soft ^HEAD"

# Git FTP
alias ftpush="git ftp push"
alias ftpull="git ftp pull"
alias ftpinit="git ftp init"
alias ftpdown="git ftp bootstrap"
alias ftphelp="git ftp help --man"
alias ftplog="git ftp log"
alias ftpshow="git ftp show"

gitstats() {
    git log --stat --author $(git config --get user.email) --since="last year" --until="last month" | awk -F',' '/files? changed/ {
        files += $1
        insertions += $2
        deletions += $3
        print
    }
    END {
        print "Files Changed: " files
        print "Insertions: " insertions
        print "Deletions: " deletions
        print "Lines changed: " insertions + deletions
    }'
}

## Text Colors
TXTBLK='\e[0;30m'          # Black - Regular
TXTRED='\e[0;31m'          # Red
TXTGRN='\e[0;32m'         # Green
TXTYLW='\e[0;33m'         # Yellow
TXTBLU='\e[0;34m'          # Blue
TXTPUR='\e[0;35m'          # Purple
TXTCYN='\e[0;36m'         # Cyan
TXTWHT='\e[0;37m'        # White
BLDBLK='\e[1;30m'          # Black - Bold
BLDRED='\e[1;31m'          # Red
BLDGRN='\e[1;32m'         # Green
BLDYLW='\e[1;33m'         # Yellow
BLDBLU='\e[1;34m'          # Blue
BLDPUR='\e[1;35m'          # Purple
BLDCYN='\e[1;36m'         # Cyan
BLDWHT='\e[1;37m'        # White
UNDBLK='\e[4;30m'         # Black - Underline
UNDRED='\e[4;31m'         # Red
UNDGRN='\e[4;32m'         # Green
UNDYLW='\e[4;33m'         # Yellow
UNDBLU='\e[4;34m'          # Blue
UNDPUR='\e[4;35m'          # Purple
UNDCYN='\e[4;36m'          # Cyan
UNDWHT='\e[4;37m'        # White
BAKBLK='\e[40m'             # Black - Background
BAKRED='\e[41m'             # Red
BAKGRN='\e[42m'             # Green
BAKYLW='\e[43m'             # Yellow
BAKBLU='\e[44m'             # Blue
BAKPUR='\e[45m'             # Purple
BAKCYN='\e[46m'             # Cyan
BAKWHT='\e[47m'             # White
BAKTST='\e[28m'             # White
TXTRST='\e[0m'              # Text Reset

TXTDGY='\e[38;5;000m'       # Dark Grey
TXTBRD='\e[38;5;088m'       # Bright Red
TXTPGR='\e[38;5;193m'
TXTBBR='\e[38;5;196m'       # Brightest Red
TXT232='\e[38;5;232m'       # Black
TXT233='\e[38;5;233m'       # Darkest Grey - Regular
TXT234='\e[38;5;234m'
TXT235='\e[38;5;235m'
TXT236='\e[38;5;236m'       # Darkest Grey - Regular
TXT237='\e[38;5;237m'       # Pretty Dark Gray
TXT238='\e[38;5;238m'       # Darker Grey
TXTGRY='\e[38;5;241m'       # Grey
TXTPNK='\e[38;5;255m'

BAKBRD='\e[48;5;130m'       # Bright Red
BAKBBR='\e[48;5;166m'       # Brightest Red
BAKPGR='\e[48;5;193m'
BAK233='\e[48;5;233m'       # Darkest Grey - Background
BAKTRM='\e[48;5;234m'       # Terminal Background
BAK235='\e[48;5;235m'
BAK236='\e[48;5;236m'
BAKGRY='\e[48;5;241m'       # Darker Grey
BAKPNK='\e[48;5;255m'
BAKPBL='\e[48;5;270m'
BAK000='\e[48;5;000m'       # Dark Grey


## Prompt
################################################################################
# cool prompt stuff
# based on a function found in bashtstyle-ng 5.0b1
# Original author Christopher Roy Bratusek (http://www.nanolx.org)
# Last arranged by zach Fri Jan 18 17:03:08 EST 2013
# Last arranged by john Sat Nov  7 17:38:32 EST 2015

get_previous_command_status() {
    # check if previous command exited cleanly or not
    if [ $? = 0 ]; then
        # previous command exited cleanly
        local pre="${TXT238}${BAK233}" #uncomment this for dark
        #local pre="${TXT238}${BAKPUR}" #uncomment this for light
        local post="${TXT233}${BAK235}" #uncomment this for dark
        #local post="${TXTPUR}${BAKBLK}" #uncomment this for light
        local symbol='$'
    else
        # previous command exited uncleanly
        local pre="${TXTBLK}${BAKRED}" #uncomment for dark
        #local pre="${TXTBLK}${BAKRED}" #uncomment for light
        local post="${TXTRED}${BAK235}" #uncomment for dark
        #local post="${TXTRED}${BAKBLK}" #uncomment for light
        local symbol='!'
    fi
    previous_command_status="$pre $symbol $post"
}

get_who_where() {
    local separator="⮀" # field separator
    #local separator=""
    local user=$(whoami) # the current user name
    #local user
    #local host=${HOSTNAME%.*} # a shortened host name
    local host
    local format_string="${separator}${TXTGRN}${BAK235} %s${BLDBLK}${BLDCYN}%s ${TXT235}${BAKBLU}${separator}${TXTRST}${BAKBLU}${BLDBLU}" #uncomment this for dark
    #local format_string="${separator}${TXTCYN}${BAKBLK} %s ${BLDBLK}${BLDCYN}%s${TXTBLK}${BAKPNK}${separator}${TXTRST}${BAKPNK}${BLDBLU}" #uncomment this for bright
    prompt_string=".....$user.$host..." # placeholder string
    #             ^ $ ⮀ $user@$host ⮀ $bread_crumbs
    who_where=$(printf "$format_string" $user $host)
}

get_bread_crumbs() {
    local separator="⮁" # path separator

    # substitute '~' for $HOME at the front of $PWD and ' / ' for all '/'
    local path=$(
        sed -e "s|^$HOME| ~|" \
            -e 's|/| / |g' \
        <<< $PWD
    )
    local fill_size=$(( ${#path} )) # space to fill
    # determine whether $bread_crumbs should be left or right justified
    # '' for right justification, '-' for left justification
    local justification='-'
    bread_crumbs=$(printf "%${justification}*b" $fill_size "$path")
    # truncate the crumbs if the length of $path is greater than $COLUMNS
    if [[ ${#path} -gt $fill_size ]]; then
        # preserve the root directory
        root="${bread_crumbs%% / *} $separator …"
        # truncate the crumbs beginning with the first subdirectory
        bread_crumbs="$root${bread_crumbs:${#root}-$fill_size}"
    fi
    # substitute $separator for all '/' and '/' for all ':' in $bread_crumbs
    bread_crumbs=$(
        sed -e "s|/|$separator|g" \
            -e 's|:|/|g' \
        <<< "$bread_crumbs "
    )
}

pre_prompt() {
    get_previous_command_status # determine previous command status
    get_who_where               # determine user and host
    get_bread_crumbs            # determine the working directory bread crumbs
    # set the prompt
    #PS1="${previous_command_status}${who_where}${bread_crumbs}${TXTPNK}${BAKPBL}⮀${TXTRST}\n" # uncomment for light
    PS1="${previous_command_status}${who_where}${bread_crumbs}${TXTBLU}${BAKRST}${TXTRST}\n" # uncomment for dark
}

PROMPT_COMMAND=pre_prompt
PS2="${TXTDGY}${TXTRST}"

colortest() {
    T=' x '   # The test text
    for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' '  36m' '1;36m' '  37m' '1;37m';
    do FG=${FGs// /}
        echo -en "\033[$FG  $T  "
    for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
        do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
    done
        echo;
    done
}
