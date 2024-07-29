static int topbar=1;
static const char *fonts[]={"Inconsolata-SemiCondensedSemiBold:style=Semi Condensed SemiBold:size=12:antialias=true:autohint=false"};
static const char *prompt=NULL;
static const char *colors[SchemeLast][2]={[SchemeNorm]={ "#bbbbbb", "#222222" },[SchemeSel]={ "#eeeeee", "#005577" },[SchemeOut]={ "#000000", "#00ffff" },};
static unsigned int lines=0;
static const char worddelimiters[]=" ";