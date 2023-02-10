/*
 * A small program illustrating how to call the max_of_three function
 * we wrote in assembly language.
 */
#include <inttypes.h>
#include <stdio.h>

// function prototype
int64_t max_of_three(int64_t, int64_t, int64_t);

int main() {

  printf("%ld\n", max_of_three(1, -4, -7));
  printf("%ld\n", max_of_three(2, -6, 1));
  printf("%ld\n", max_of_three(2, 3, 1));
  printf("%ld\n", max_of_three(-2, 4, 3));
  printf("%ld\n", max_of_three(2, -6, 5));
  printf("%ld\n", max_of_three(2, 4, 6));

  return 0;
}
