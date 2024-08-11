#include <iostream>
using namespace std;
using ll = long long;

void OddEvenInN(ll n) {
    int odd = 0, even = 0; // Sửa lỗi khai báo ban đầu

    while (n != 0) {
        int remainder = n % 10;
        if (remainder % 2 == 0) {
            even += 1;
        } else {
            odd += 1;
        }
        n /= 10;
    }

    cout << even << " " << odd; // In số lượng chữ số chẵn trước rồi đến số lượng chữ số lẻ
}

int main() {
    ll n;
    cin >> n;
    OddEvenInN(n);
    return 0; // Thêm return 0 để kết thúc hàm main đúng chuẩn
}
