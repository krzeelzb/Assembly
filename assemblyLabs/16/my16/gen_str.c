#include <stdio.h>
#include <stdlib.h>

extern char*  generate_str(char*  s, char c, int n, int inc);
#define n 7

int main() {
	char* s = malloc((n + 1) * sizeof(char));

	char* str = generate_str(s, 'b', n, 1);
	printf("|%s|\n", s);
	return 0;
}



