#include<iostream>
#include<math.h>

using namespace std;

float S(int n) {

	if (n == 1) {
		return 2;
	}
	else return (float)1+1/S(n-1);
}
 
int main() {
	int n;
	cin >> n;
	cout << S(n);
	return 0;
}