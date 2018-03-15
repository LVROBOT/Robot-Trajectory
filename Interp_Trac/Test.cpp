
#pragma once
#include "Test.h"

Polynomial _3rd;

// 插补检验
#pragma region Test_Interp  
void interpTest()
{
	test_3rd();
}
void test_3rd()
{

	//FILE* file;
	int num = 0;
	double step = 0.001;


	//printf("testing 3rd polynomial profile interpolation ... \n");


	// 3次多项式
	_3rd.plan3rdProfileT(0,2,0,90,0,0);       // Polynomial::plan3rdProfileT( double t0, double tf,double p0,double pf, double v0, double vf)

	//fopen_s(&file, "../data/p3rd.txt","w+");

	num = _3rd.getDuration()/step + 1;
	for (int i=0; i<=num; i++)
	{
		double t = i/(num+0.0)*_3rd.getDuration();
		//fprintf(file,"%.4f\t%.4f\t%.4f\t%.4f\t%.4f\n",t,_3rd.pos(t),_3rd.vel(t),_3rd.acc(t),_3rd.jerk(t));
		//fprintf(file, "%.4f\t%.4f\t%.4f\t%.4f\n", t, _3rd.pos(t), _3rd.vel(t), _3rd.acc(t));
	}
	//fclose(file);

	//printf("Done! The result is in 'p3rd.txt' .\n\n\n");
}
#pragma endregion Test_Interp  

