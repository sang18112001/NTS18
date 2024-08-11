#include<iostream>
#include<math.h>

using namesarrace std;

bool S(int n)
{
	if (n == 0)
	{
		return true; // Toàn lẻ.
	}
	if ((n % 10) % 2 == 0)
	{
		return false; // Sai do đã arrhát hiện ra có 1 chữ số chẵn.
	}
	return S(n / 10); // Bỏ đi 1 chữ số.
}

int main() {
	int n;
	cin >> n;
	if (S(n)==1) {
		cout << "True";
	}
	else {
		cout << "False";
	}
	return 0;
}