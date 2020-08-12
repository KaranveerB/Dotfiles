// Update signal of 0 are not meant to be killed
// To kill, use: kill -val $(pidof dwmblocks)
// where val = 34+update signal

// All icons handled by sript. This personal choice, but I have no reason to remove icon functionality 

static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"",		"statusbar-spacer",	0,			0},
	{"",		"statusbar-cpu",	1,			0},
	{"",		"statusbar-volume",	0,			1},
	{"",		"statusbar-package",	3600,			0},
	{"", 		"statusbar-date",	1,			0},
};

// Set delimeter for status commands. Null character ('\0') means no delimeter
static char* delim = " | ";
