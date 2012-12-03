//included through mission specific inits
#define GETGRIDPOS(X, Y) [(X) - ((X) % 100) + 50, (Y) - ((Y) % 100) + 50]
#define DEBUG

#ifndef DEBUG
	#define loadScreen(X) startLoadingScreen [X]
#else
	#define loadScreen(X) player globalChat X
#endif