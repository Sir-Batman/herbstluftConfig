# herbstluftConfig
================
This project is to create a working, awesome setup for Herbstluftwm, my new favorite wm.

This code's purpose is to do:
  * Run the autostart file, which gets called by startx, at the time of login.
  * Run a status bar.
  * Create functionality for keyboard shortcuts for volume, backlight control, and launching of favorite programs.
  * Dynamically apply new backgrounds using feh, creatate new X color schemes, and apply this new color scheme to
   the relevent programs/files (urxvt, the status bar, herbstluftwm colors)
  
=================
The dependencies required for this to work out of the box are (as far as I know):
 * feh, for assigning a new background.
 * PIL, the python image library. To satisfy this in Arch Linux, get the `python-pillow` package. 
 * urxvt, for the terminal.
 * scrot, to take screenshots
 * firefox
 * lemonbar, to render the status bar
 * dmenu
 * libnotify, for the usage of notify-send in the low battery messages. I also use the dunst package as the backend for the notifications.
 * xorg-xprop, for status bar information
 * bc, for the status bar processing
 * some packages for the power reading in the status bar. Currently not sure which packages hold the commands...


=================
This work would not be possible without some big thanks to people:

  * The Herbstluftwm team, for their base autostart file.
  * Charles Leifer, whose code from [this blog post](http://charlesleifer.com/blog/using-python-and-k-means-to-find-the-dominant-colors-in-images/) does some cool stuff with images, to extract colors. Go check it out, its pretty crazy awesome.
  * Reddit user /u/radiosilence, who [wrote some nice code](https://gist.github.com/radiosilence/3946121) that normalizes images.
  * everet1992, whose [post in /r/UnixPorn](http://www.reddit.com/r/unixporn/comments/1os54a/archherbstluftwm_i_have_a_script_that_can/) inspired this mad-house project.
  * z3bra, whose [blog post](http://blog.z3bra.org/2014/04/meeting-at-the-bar.html) really really helped me to create a working status bar.
  
If anyone else feels that they are unrepresented here, please let me know!
