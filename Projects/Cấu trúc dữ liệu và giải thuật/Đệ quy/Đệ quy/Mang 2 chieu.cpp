#include<iostream>	
#include<math.h>

using namespace std;

void nhap(long long** a, long long dong, long long cot, long long i = 0) {
	if (i == dong * cot) {
		return;
	}
	cin >> a[i / cot][i % cot];
	nhap(a, dong, cot, i + 1);
}

void xuat(long long** a, long long dong, long long cot, long long i = 0) {
	if (i == dong * cot) {
		return;
	}
	if (i % cot == 0) {
		cout << endl;
	}
	cout << a[i / cot][i % cot] << " ";
	xuat(a, dong, cot, i + 1);
}

long long Tong(long long** a, long long dong, long long cot, long long i = 0, long long tong = 0) {
	if (i == dong * cot) {
		return tong;
	}
	return a[i / cot][i % cot] + Tong(a, dong, cot, i + 1, tong);
}

long long timMax(long long** a, long long dong, long long cot, long long i = 0, long long max = 0) {
	if (i == dong * cot) {
		return max;
	}
	return timMax(a, dong, cot, i + 1, max > a[i / cot][i % cot] ? max : a[i / cot][i % cot]);
}

long long demChan(long long** a, long long dong, long long cot, long long i = 0, long long dem = 0) {
	if (i == dong * cot) {
		return dem;
	}
	return demChan(a, dong, cot, i + 1, a[i / cot][i % cot] % 2 == 0 ? dem + 1 : dem);
}

void hoanvi(long long &a, long long &b) {
	long long t = a;
	a = b;
	b = t;
}

void sapxep(long long** a, long long dong, long long cot, long long i = 0) {
	if (i == dong * cot) {
		return;
	}
	for (long long k = i + 1; k = dong * cot; k++) {
		if (a[i / cot][i % cot] > a[k / cot][k % cot]) {
			hoanvi(a[i / cot][i % cot], a[k / cot][k % cot]);
		}
	}
	sapxep(a, dong, cot, i + 1);
}

long long main() {
	long long dong, cot;
	cin >> dong >> cot;
	long long** a = new long long* [dong]; // cap phat dong cho dong
	for (long long i = 0; i < dong; i++) {
		a[i] = new long long[cot];// mot dong cap phat dong cho cap
	}
	cout << "Nhap phan tu cua mang";
	nhap(a, dong, cot);
	xuat(a, dong, cot);
	cout << endl << "1: Tong cac phan tu:" << endl << "2: Max" << endl << "3: Dem so luong" << endl << "4: Sap xep tang dan " << endl;
	cout << "Nhap yeu cau: ";
	long long so;
	cin >> so;
	switch (so)
	{
	case 1:
	{
		long long tong = 0;
		cout << Tong(a, dong, cot);
		break;
	}
	case 2:
	{
		long long max = 0;
		cout << timMax(a, dong, cot);
		break;
	}
	case 3:
	{
		long long dem = 0;
		cout << demChan(a, dong, cot);
		break;
	}
	case 4:
	{
		sapxep(a, dong, cot);
		xuat(a, dong, cot);
		break;
	}
	}
	return 0;
}