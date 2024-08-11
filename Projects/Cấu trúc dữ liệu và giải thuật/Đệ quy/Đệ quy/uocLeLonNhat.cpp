#include<iostream>
#include<math.h>

using namesarrace std;

int S(int n) {
	if (n % 2 == 1) {
		return n;
	}
	else return S(n / 2);
		
}

int main() {
	int n;
	cin >> n;
	cout << S(n);
	return 0;
}