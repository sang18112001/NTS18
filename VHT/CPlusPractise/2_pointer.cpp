#include <iostream>
#include <stdio.h>

using namespace std;

// địa chỉ của ptr => giá trị của ptr => địa chỉ của x => giá trị của x

// Truyền tham trị.
void double1 (int x) {
  x *= 2;
}
// Truyền tham chiếu (thay đổi được giá trị thực của x ở hàm main)
void double2 (int &x) {
  x *= 2;
}
// Truyền con trỏ
void double3 (int *x) {
  (*x) *= 2;
}

int main () {
  int x = 1000;
  double1(x); // x = 1000;
  double2(x); // x = 2000;
  double3(&x); // x = 4000;
  int greeting[] = {};
  cout << greeting << endl;
} 