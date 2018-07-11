#include <stdio.h>
#include <string.h>

extern char * spa(char * buf, int mask);

int main() {
    
    char* str = malloc((100)*sizeof(char));
    str= "bc d";
    printf("%s \n", spa(str, 0));

    return 0;
    }