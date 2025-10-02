#include "thing1.h"
#include "joint.h"

#include <stdio.h>

int main() {
  int z = 3;

  // DEFINITION: ./inc/thing1.h
  // DECLARATION: ./thing1.c
  t1_print(z);
  int sqrd = t1_square(z);

  // DEFINITION: ./inc/thing1.h
  // DECLARATION: ./thing1.c
  int y = t1_global1;

  // DEFINITION: ./inc/thing1.h
  // DECLARATION: ./thing1.c
	// 2nd degree/indirect DEFINITION: ./inc/thing2.h
	// 2nd degree/indirect DECLARTION: ./thing2.c
	t1_to_t2(y);

  // DEFINITION: ./inc/joint.h
  // DECLARATION: ./jointa.c
	int ja2 = joint_A2(y, z);

  // DEFINITION: ./inc/joint.h
  // DECLARATION: ./jointb.c
	int jb1 = joint_B2(z);
	printf("Done\n");

  return z;
}
