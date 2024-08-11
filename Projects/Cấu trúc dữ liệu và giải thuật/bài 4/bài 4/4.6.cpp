#include<iostream>

using namespace std;

void nhap(int* a, int n) {
	cout << "nhap phan tu mang a";
	for (int i = 0; i < n; i++) {
		cin >> a[i];
	}
}

void dem(int* a, int n) {
	int t = 0;
	for (size_t i = 0; i < n; i++)
	{
		t = 0;
		for (size_t j = 0; j < i; j++)
		{
			if (a[i] == a[j]) {
				t++;
			}
			cout << a[i] << ":" << t << endl;
		}
	}
}

int main() {
	int n;
	cin >> n;
	int* a = new int[n];
	nhap(a, n);
	dem(a, n);
	return 0;
}