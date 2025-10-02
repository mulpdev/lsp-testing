#include "thing1.h"
#include "thing2.h"
#include <stdio.h>

const int t1_global1 = 7;
int t1_global2 = 1337;

int t1_print(int x) {
  int ret = t1_square(x);
  printf("do_print: %d %d %d\n", x, t1_global2, t1_global1);
  return ret;
}

int t1_square(int a) { return t1_mult(a, a); }

// "private" / uncalled externally function
int t1_mult(int number, int times) {
  int sum = 0;
  for (int i = 0; i < times; i++) {
    sum += number;
  }
  return sum;
}

void t1_to_t2(int x)
{
	int y = t2_from_t1(x);
	t1_global2 = y;
}
