#xset +fp ~/Library/Fonts/X11; xset fp- /Library/Fonts; xset fp- /System/Library/Fonts &
xset +fp ~/.fonts; xset fp- /Library/Fonts; xset fp- /System/Library/Fonts &
xset fp rehash &
xrdb -merge ~/.Xresources &
xsetroot -solid '#505075' &
#/opt/pkg/bin/9menu -font -*-profont-*-r-*-*-11-*-*-*-*-*-*-* -popdown -teleport -iconic 'urxvt:/opt/pkg/bin/urxvt' 'gburg: urxvt -e "ssh -XC -c blowfish-cbc,arcfour gbcs21.cc.gettysburg.edu -p 222 -l duncjo01"' 'xmms: /opt/pkg/bin/xmms; ' 'xmahjongg: /opt/pkg/bin/xmahjongg;' 'catclock: /opt/pkg/bin/catclock;' 'xcalc: /opt/X11/bin/xcalc;' 'xfontsel: /opt/X11/bin/xfontsel;' 'exit: killall w9wm' &
/opt/pkg/bin/urxvtd --quiet --opendisplay --fork &
#/opt/pkg/bin/wmitime -12 &
#/opt/pkg/bin/wmnd -i lo0 -w lines &
#/opt/pkg/bin/wmnd -i en1 -w lines &
#/opt/pkg/bin/wmcpuload --light-color rgb:25/E3/DC --backlight &
#/opt/pkg/bin/wmweather -s KIAD &
##/opt/pkg/bin/wmmemmon --light-color rgb:25/E3/DC --backlight &
#/opt/pkg/bin/wmnd -i off -w needle &
#/opt/pkg/bin/wmusic &
#export MPD_HOST=localhost
#export MPD_PORT=6600
#/opt/pkg/bin/WMmp --light-color rgb:25/E3/DC &
#/usr/local/bin/wmMatrix &
#/usr/local/bin/wmSpaceWeather &

#exec /opt/pkg/bin/w9wm -font -*-profont-*-r-*-*-11-*-*-*-*-*-*-* -term urxvt -nostalgia -virtuals 9
#exec /opt/pkg/bin/mwm
#xinit .xinitrc -- /opt/X11/bin/Xnest :3 -geometry 800x600
#exec quartz-wm

/opt/pkg/bin/wmsetbg /Users/John/Desktop/OS\ X\ 10.11\ Restore\ Package/Retro/Retro_Tiles/MacOS6_7_8_9/macos8.png -t &
exec /opt/pkg/bin/wmaker

