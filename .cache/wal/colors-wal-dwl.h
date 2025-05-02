/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x222436ff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xe0def4ff, 0x222436ff, 0x2f334dff },
	[SchemeSel]  = { 0xe0def4ff, 0xc3e88dff, 0xff5370ff },
	[SchemeUrg]  = { 0xe0def4ff, 0xff5370ff, 0xc3e88dff },
};
