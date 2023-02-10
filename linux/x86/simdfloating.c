#include <stdio.h>

// function prototypes
void add_four_floats(float[], float[]);
void add_four_double(double[], double[]);

int main() {

  float x[] = {-29.750, 244.333, 887.29, 48.1E22};
  float y[] = {29.750, 199.333, -8.29, 22.1E23};

  double dx[] = {-29.750, 244.333, 887.29, 48.1E22};
  double dy[] = {29.750, 199.333, -8.29, 22.1E23};

  add_four_floats(x, y);
  printf("add_four_floats:\n%f\n%f\n%f\n%f\n\n", x[0], x[1], x[2], x[3]);

  add_four_double(dx, dy);
  printf("add_four_double:\n%lf\n%lf\n%lf\n%lf\n", dx[0], dx[1], dx[2], dx[3]);

  return 0;
}
