#include <inttypes.h>
#include <stdio.h>

uint64_t factorial(uint64_t n);

int main() {

  for (uint64_t i = 0; i < 20; i++) {
    printf("factorial(%2I64u) = %I64u\n", i, factorial(i));
  }

  return 0;
}