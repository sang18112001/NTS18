#include<iostream>
#include<math.h>

using namespace std;
// tìm số đảo ngược;
int SoDaoNguoc(int n, int tong) {
	// Điều khiện thoát đệ quy là khi return hàm đến n=0 thì return lại tổng;
	if (n == 0) {
		return tong;
	}
	tong = tong * 10 + n % 10;

	return SoDaoNguoc(n / 10, tong);
}

int main() {
	int n;
	int tong = 0;
	cin >> n;
	cout << SoDaoNguoc(n, tong);
	return 0;
}