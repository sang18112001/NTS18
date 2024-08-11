#include<iostream>
using namespace std;
int main () {
    // Static array.
    int arr[10];
    int arr1[9] = {1,2,3,4,5,6,7,8,9};
    int arr2[10];
    for (int &x : arr) cin >> x; // Nhap gia tri vao mang;
    for (int x : arr) cout << x; // In ra gia tri cua mang;
}