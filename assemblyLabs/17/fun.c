#include <stdlib.h>
#include <stdio.h>

#define BUFSIZE 100

char* fun(char* buf, char* a, char* b);

int main(){
	char* buf = malloc(BUFSIZE*sizeof(char));
	
	printf("%s \n", fun(buf, "bbcsc", "12345") );
	
	free(buf);

	return 0;
}
