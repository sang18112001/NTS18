#include <stdio.h>
#include <iostream>
using namespace std;
void printParallelogram(int n) {
    // Vòng lặp để in các hàng
    for (int i = 0; i < n; ++i) {
        // In các khoảng trắng để tạo độ nghiêng của hình bình hành
        for (int j = 0; j < n - i - 1; ++j) {
            printf(" ");
        }
        // In các ký tự sao để tạo thành cạnh của hình bình hành
        for (int k = 0; k < n; ++k) {
            printf("*");
        }
        // Xuống dòng sau mỗi hàng
        printf("\n");
    }
}

void printHollowInvertedRightTriangle(int n) {
    for (int i = 0; i < n; i++) { 
        for (int j = 0; j < n - i; j++) { 
            if ( j > 0 && j < n - i -1 && i> 0) {
                printf(". ");
            } else {
                printf("* ");
            }
            
        }
        printf("\n");
    }
}

void printDiamond(int n) {
    // In phần trên của hình thoi
    for (int i = 0; i < n; ++i) {
        cout << string(n - i - 1, ' ') << string(2 * i + 1, '*') << endl;
    }

    // In phần dưới của hình thoi
    for (int i = n - 2; i >= 0; --i) {
        cout << string(n - i - 1, ' ') << string(2 * i + 1, '*') << endl;
    }
}
int main() {
    int n;
    printf("Nhap vao do dai canh: ");
    scanf("%d", &n);
    printf("\n Hinh binh hanh voi %d canh \n", n);
    printParallelogram(n);
    printf("\n Tam giac vuong nguoc rong voi %d canh: \n", n);
    printHollowInvertedRightTriangle(n);
    printf("\n Hinh thoi voi %d canh: \n", n);
    printDiamond(n);
    return 0;
}
