#include<iostream>
#include<math.h>

using namespace std;

int S(int n, int min) {
	if (n < 10) {
		return min;
	}
	return S(n / 10, min > n % 10 ? n % 10 :min);
}

int main() {
	int n, min=0;
	cin >> n;
	cout << S(n, min);
	return 0;
}