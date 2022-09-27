#include <X11/XF86keysym.h>
#include "movestack.c"

/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 15;       /* snap pixel */
static const unsigned int gappx     = 15;        /* gap pixel between windows */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int horizpadbar        = 2;        /* horizontal padding for statusbar */
static const int vertpadbar         = 0;        /* vertical padding for statusbar */
static const char *fonts[]          = { "Weather Icons:size=15", "Apple Color Emoji:size=15" ,"MesloLGS Nerd Font:size=15"};
static const char dmenufont[]       = "MesloLGS Nerd Font:size=10";
static const char col_gray1[]       = "#3c3836";
static const char col_gray2[]       = "#689d6a";
static const char col_gray3[]       = "#ebdbb2";
static const char col_gray4[]       = "#98971a";
static const char col_cyan[]        = "#3c3836";
static const unsigned int baralpha = 0xd0;
static const unsigned int borderalpha = OPAQUE;
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};
static const unsigned int alphas[][3]      = {
	/*               fg      bg        border     */
	[SchemeNorm] = { OPAQUE, baralpha, borderalpha },
	[SchemeSel]  = { OPAQUE, baralpha, borderalpha },
};

/* tagging */
static const char *tags[] = { "", "", "ﭮ", "", "", "", "", "", "ﴬ" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = {"rofi -show drun -show-icons", NULL };
static const char *roficmd[] = { "rofi", "-show", "drun", "-show-icons", NULL };
static const char *rofiEmojiCmd[] = { "rofi", "-modi", "emoji", "-show", "emoji", "-kb-custom-1", "Ctrl+C", NULL };
static const char *termcmd[]  = { "alacritty", "--command", "nvim", NULL };
static const char *webBrowser[]  = { "google-chrome-stable", NULL };
static const char *spotify[]  = { "spotify", NULL };
static const char *discord[]  = { "discord", NULL };
static const char *zathura[]  = { "zathura", NULL };

// Brightness
void brightnessUp(const Arg * arg) {system("light -A 5");}
void brightnessDown(const Arg * arg) {system("light -U 5");}

// Lock screen
void lockScreen(const Arg * arg) { system("betterlockscreen -l dimblur");}

// Screenshot
void screenshot(const Arg * arg) { system(" scrot  ~/screenshots/$(date +\"%F_%T\").jpg && dunstify -t 1000 \"Screenshot saved to: ~/screenshots\""); }
void selectedscreenshot(const Arg * arg) { system(" scrot -s ~/screenshots/$(date +\"%F_%T\").jpg && dunstify -t 1000 \"Screenshot saved to: ~/screenshots\"");}

// Audio
void lowerVolume(const Arg * arg) { system("pactl set-sink-volume @DEFAULT_SINK@ -10%");}
void raiseVolume(const Arg * arg) { system("pactl set-sink-volume @DEFAULT_SINK@ +10%");}
void audioMute(const Arg * arg) { system("pactl set-sink-mute @DEFAULT_SINK@ toggle");}
void audioMicMute(const Arg * arg) { system("pactl set-source-mute @DEFAULT_SOURCE@ toggle");}


// Multimedia
void multiPlay(const Arg * arg) { system("playerctl play-pause");}
void multiPause(const Arg * arg) { system("playerctl play-pause");}
void multiNext(const Arg * arg) { system("playerctl next");}
void multiPrevious(const Arg * arg) { system("playerctl previous");}


static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = roficmd} },
	{ MODKEY,                       XK_e,      spawn,          {.v =rofiEmojiCmd} },
	{ MODKEY|ShiftMask,     XK_z,      spawn,          {.v = zathura} },
    {0,         XF86XK_MonBrightnessUp, brightnessUp,            {0}},
    {0,         XF86XK_MonBrightnessDown, brightnessDown,        {0}},
    {0,       XF86XK_AudioRaiseVolume, raiseVolume,              {0}},
    {0,       XF86XK_AudioLowerVolume, lowerVolume ,              {0}},
    {0,       XF86XK_AudioMute,       audioMute,                 {0}},
    {0,       XF86XK_AudioMicMute,        audioMicMute,                 {0}},


    {0,       XF86XK_AudioPlay,        multiPlay,                 {0}},
    {0,       XF86XK_AudioPause,       multiPause,                 {0}},
    {0,       XF86XK_AudioNext ,       multiNext,                 {0}},
    {0,       XF86XK_AudioPrev ,       multiPrevious,                 {0}},
	{ MODKEY,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,             XK_b, spawn,          {.v = webBrowser} },
	{ MODKEY,             XK_s, spawn,          {.v = spotify} },
	{ MODKEY,             XK_d, spawn,          {.v = discord} },
	{ MODKEY,             XK_f,      togglefullscr,  {0} },
	{ MODKEY|ShiftMask,                       XK_b,      togglebar,      {0} },
	{ ControlMask|MODKEY,           XK_l,      lockScreen,      {0} },
	{ ControlMask|MODKEY,           XK_p,      screenshot,      {0} },
	{ ControlMask|ShiftMask|MODKEY, XK_p,       selectedscreenshot, {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY|ShiftMask,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY|ShiftMask,             XK_j,      movestack,      {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_k,      movestack,      {.i = -1 } },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,             XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY|ShiftMask,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
