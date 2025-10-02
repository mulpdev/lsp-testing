#include "thing1.h"
#include "thing2.h"

void t2_a(int x)
{
	t2_b(x);
}
void t2_b(int x)
{
	t1_print(x);
}
int t2_from_t1(int x)
{
	return x;
}
