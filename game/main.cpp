#include <CDependencyWhoAmI.h>
#include <CGameWhoAmI.h>

#include <stdio.h>

int main(int argc, char** argv)
{
	CDependencyWhoAmI dependencyTest;
	CGameWhoAmI gameWhoAmI;

	printf("%s\n", dependencyTest.TellWhoAmI());
	printf("%s\n", gameWhoAmI.TellWhoAmI());

	getchar();
}
