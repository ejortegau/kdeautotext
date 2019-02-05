# kdeautotext
Text expander based on KDE's Klipper

This tool allows you to expand pre-configured short texts into longer text, with optional replacement of a placeholder with  the current contents of your clipboard. Eg. You type in 'done' and what gets typed into your window is 'Done in commit <contents of your clipboard>'. 

I built this as a quick hack, so don't expect a lot of updates or maintenance. Contributions are welcome.

## Requirements
kdeautotext depends on the following being installed and available on your system:

1. KDE's clipboard manager, as included on Plasmashell 5.12.7. Other versions might work. 
1. KDE's [kdialog](https://techbase.kde.org/Development/Tutorials/Shell_Scripting_with_KDE_Dialogs). Tested on kdialog 2.0, others might work.
1. [jq](https://stedolan.github.io/jq/) json processor.
1. GNU's [gawk](https://www.gnu.org/software/gawk/). It might work with other types of awk, but this has not been tested.
1. [xdotool](https://www.semicomplete.com/projects/xdotool/) 3.20160805. Other versions might work.

## Installation
1. Clone the repo.
1. Ensure all requirements above are met.
1. Make sure kdeautotext.sh is on your path.
1. Copy autotext.conf_sample.json from the repo to $HOME/.autotext.conf.json
1. Go to KDE's system settings -> shortcuts -> Custom Shortcuts -> Edit -> New -> Global shortcut -> Command/URL.
   1. Rename the new action as 'KDE autotext'.
   1. On the trigger tab, select a shortcut to invoke auto-text.
   1. On the action tab, fill the Command/URL field with the path to kdeautotext.sh

## Test your installation
1. Open a text editor (Eg. kate).
1. Press the shortcut key defined durint installation. 
1. Enter the text 'done' and press enter.
1. Watch kate being filled with the text "This is my first kdeautotext test!". 

## Define your own text shortcuts and expansions
kdeautotext expansions are configured through templates in .autotext.conf.json. It is a simple JSON with the form 
```json
{
  "shortcut1": "expanded text 1",
  "shortcut2": "expanded text 2"
}
```

Notice that any occurrence of the string ___PLACEHOLDER___ on the expanded text template is replaced by the current contents of your clipboard. The default config file has a few examples. Add yours as desired.

