static const char norm_fg[] = "#e0def4";
static const char norm_bg[] = "#222436";
static const char norm_border[] = "#2f334d";

static const char sel_fg[] = "#e0def4";
static const char sel_bg[] = "#ff5370";
static const char sel_border[] = "#e0def4";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
};
