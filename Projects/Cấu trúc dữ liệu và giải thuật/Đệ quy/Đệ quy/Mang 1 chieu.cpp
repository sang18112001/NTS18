#include<iostream>
#include<math.h>

using namespace std;

void nhap(long long a[], long long n, long long i = 0) {
	if (i == n) {
		return;
	}
	cin >> a[i];
	nhap(a, n, i + 1);
}

void xuat(long long a[], long long n, long long i = 0) {
	if (i == n) {
		return;
	}
	cout << a[i]<<" ";
	xuat(a, n, i + 1);
}

long long dem(long long a[], long long n, long long i = 0, long long dem = 0) {
	if (i == n) {
		return dem;
	}
	return dem(a, n, i + 1, dem + a[i]);
}

long long Max(long long a[], long long n, long long i=0, long long max = 0) {
	if (i == n) {
		return max;
	}
	return Max(a, n, i + 1, max > a[i] ? max : a[i]);
}

long long Min(long long a[], long long n, long long i = 0, long long min = 0) {
	if (i == n) {
		return min;
	}
	return Min(a, n, i + 1, min < a[i] ? min : a[i]);
}

long long demSoChan(long long a[], long long n, long long i = 0, long long dem=0) {
	if (i == n) {
		return dem;
	}
		return demSoChan(a, n, i + 1, a[i] % 2 == 0 ? dem+1 : dem);
}

void doicho(long long &a, long long &b) {
	long long t = a;
	a = b;
	b = t;
}

void sapXepTangDan(long long a[], long long n, long long i = 0) {
	if (i == n) {
		return;
	}
	for (long long k = i + 1; k < n; k++) {
		if (a[i] > a[k]) {
			doicho(a[i], a[k]);
		}
	}
	sapXepTangDan(a, n, i + 1);
}

long long main() {
	long long a[100], n, i=0, so;
	cout << "Nhap so phan tu cua mang";
	cin >> n;
	nhap(a, n);
	xuat(a, n);
	cout <<"\n" << "1: dem cac chu so"<< endl;
	cout << "2: Max"<< endl << "3: Min" << endl << "4: Dem so luong" << endl << "5: Sap xep tang dan"<< endl;
	cout << "Nhap yeu cau";
	cin >> so ;
	switch (so)
	{
	case 1:	
	{
		long long dem = 0;
		cout << dem(a, n, i, dem);
		break;
	}
	case 2:
	{
		long long max = 0;
		cout << Max(a, n, i, max);
		break;
	}
	case 3:
	{
		long long min = 0;
		cout << Min(a, n, i, min);
		break;
	}
	case 4:
	{
		long long dem = 0;
		cout << demSoChan(a, n, i, dem);
		break;
	}
	case 5:
		sapXepTangDan(a, n);
		xuat(a, n);
		break;
	}
}