import XMonad

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

import XMonad.Util.EZConfig
import XMonad.Util.Loggers
import XMonad.Util.Ungrab

import XMonad.Layout.Magnifier
import XMonad.Layout.ThreeColumns

import XMonad.Hooks.EwmhDesktops


main :: IO ()
main = xmonad
     . ewmhFullscreen
     . ewmh
     . withEasySB (statusBarProp "xmobar" (pure myXmobarPP)) defToggleStrutsKey
     $ myConfig

myConfig = def
  { 
    modMask    = mod4Mask,      -- Rebind Mod to the Super key
    layoutHook = myLayout,      -- Use custom layouts
    manageHook = myManageHook,  -- Match on certain windows
    terminal = "alacritty"
  }
  `additionalKeysP`
  [ 
    -- Spawn
    ("M-Return", spawn "alacritty"),
    ("M-p", spawn "rofi -show drun -show-icons"),
    ("M-e", spawn "rofi -modi emoji -show emoji -kb-custom-1 Ctrl+C"),
    ("M-b", spawn "google-chrome-stable"),
    ("M-s", spawn "spotify"),
    ("M-d", spawn "discord"),
    ("M-Shift_L-z", spawn "zathura"),
    
    -- Screenshot
    ("Control_L-M-l", unGrab *> spawn "scrot  ~/screenshots/$(date +\"%F_%T\").jpg && dunstify -t 1000  "\"Screenshot saved to: ~/screenshots\""),
    ("Control_L-Shift_L-M-l", unGrab *> spawn "scrot -s ~/screenshots/$(date +\"%F_%T\").jpg && dunstify -t 1000  "\"Screenshot saved to: ~/screenshots\""),

    -- Lock screen
    ("Control_L-M-l", spawn "betterlockscreen -l dimblur"),
    
    -- Brightness
    ("XF86MonBrightnessUp", spawn "light -A 5"),
    ("XF86MonBrightnessDown", spawn "light -U 5"),
    
    -- Audio
    ("XF86AudioLowerVolume", spawn "pactl set-sink-volume @DEFAULT_SINK@ -5%"),
    ("XF86AudioRaiseVolume", spawn "pactl set-sink-volume @DEFAULT_SINK@ +5%"),
    ("XF86AudioMute", spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle && pactl set-source-mute @DEFAULT_SOURCE@ toggle"),
    
    -- Multimedia
    ("XF86AudioPlay", spawn "playerctl play-pause"),
    ("XF86AudioPause", spawn "playerctl play-pause"),
    ("XF86AudioNext", spawn "playerctl next"),
    ("XF86AudioPrev", spawn "playerctl previous"),
    
  ]

myManageHook :: ManageHook
myManageHook = composeAll
    [ 
      className =? "Gimp" --> doFloat,
      isDialog            --> doFloat
    ]

myLayout = tiled ||| Mirror tiled ||| Full ||| threeCol
  where
    threeCol = magnifiercz' 1.3 $ ThreeColMid nmaster delta ratio
    tiled    = Tall nmaster delta ratio
    nmaster  = 1      -- Default number of windows in the master pane
    ratio    = 1/2    -- Default proportion of screen occupied by master pane
    delta    = 3/100  -- Percent of screen to increment by when resizing panes

myXmobarPP :: PP
myXmobarPP = def
    { 
      ppSep             = magenta " • ",
      ppTitleSanitize   = xmobarStrip,
      ppCurrent         = wrap " " "" . xmobarBorder "Top" "#8be9fd" 2,
      ppHidden          = white . wrap " " "",
      ppHiddenNoWindows = lowWhite . wrap " " "",
      ppUrgent          = red . wrap (yellow "!") (yellow "!"),
      ppOrder           = \[ws, l, _, wins] -> [ws, l, wins],
      ppExtras          = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused   = wrap (white    "[") (white    "]") . magenta . ppWindow
    formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . blue    . ppWindow

    -- | Windows should have *some* title, which should not not exceed a
    -- sane length.
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30

    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta  = xmobarColor "#ff79c6" ""
    blue     = xmobarColor "#bd93f9" ""
    white    = xmobarColor "#f8f8f2" ""
    yellow   = xmobarColor "#f1fa8c" ""
    red      = xmobarColor "#ff5555" ""
    lowWhite = xmobarColor "#bbbbbb" ""