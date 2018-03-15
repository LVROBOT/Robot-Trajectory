#include <iostream>
using namespace std;
#pragma once
#include "Test.h"


extern Polynomial _3rd;

int main(int argc, char* argv[])
{	

	interpTest();

	double test[100];
	for (int i = 0; i < 100; i++)
	{
		test[i] = 2.0 / 100 * i;
	}
	double pTest[100];
	for (int i = 0; i < 100; i++)
	{
		pTest[i] = _3rd.pos(test[i]);
	}

	printf("Press enter to quit \r\n");
	getchar();
	return 0;
}