#include <stdio.h>
#include <string.h>
#include<stdlib.h>

extern char * spacja(char * buf, int mask);

int main() {
    
    char* str = malloc((100)*sizeof(char));
    str= "bc d";
    printf("%s \n", spacja(str, 0));

    return 0;
    }