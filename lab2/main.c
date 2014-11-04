#include <stdio.h>

unsigned int bignum(const char * );

int main(int argc, char ** argv)
{
	int i;
	for(i = 1; i < argc; ++i)
	{
		printf("%2d: %u\n" ,i ,bignum(argv[i]));
    }
	return 0;
}
