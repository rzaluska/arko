#include <stdio.h>

char * dig2star(char * string);

int main(int argc, char ** argv)
{
	int i;
	for(i = 1; i < argc; ++i)
	{
		printf("%2d: %s\n" ,i ,dig2star(argv[i]));
        }
	return 0;
}
