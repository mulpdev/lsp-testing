#include "joint.h"

int joint_A1(int x)
{
	int a = x;
	a += 3;
	a = a * 2;
	return x * a;
}

int joint_A2(int x, int y)
{
	int a = x + y;
	int b = x - y;
	return a - b;
}
