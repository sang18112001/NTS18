// Bài 1. Khai báo cấu trúc nhânviên. Biết rằng thông tin của một nhân viên bao gồm:
// họ tên (30 ký tự), ngày sinh (kiểu ngày), lương (số thực), giới tính (0. Nữ, 1.Nam).
// -Nhập thông tin cho n nhân viên, với n được nhập từ bàn phím.
// -Hiển thị danh sách các nhân viên có trong danh sách.
// -Liệt kê các nhân viên trên 40 tuổi trong danh sách.
// - Đếm số lượng nhân viên có lương lớn hơn 1.000.000 đồng trong
// danh sách.
// -Viết hàm sắp xếp các nhân viên giảm dần theo năm sinh (không quan tâm ngày và
// tháng sinh).

#include <iostream>
#include <cstring> // Để sử dụng các hàm xử lý chuỗi như strcpy
#include <vector>
#include <algorithm> // Để sử dụng std::sort

using namespace std;

struct Date {
    int day;
    int month;
    int year;
};

struct Employee {
    char name[30];
    Date birth_date;
    float salary;
    int gender; // 0: Nữ, 1: Nam
};

void showMenu() {
    cout << "1. Nhập thông tin cho n nhân viên, với n được nhập từ bàn phím." << endl;
    cout << "2. Hiển thị danh sách các nhân viên có trong danh sách." << endl;
    cout << "3. Liệt kê các nhân viên trên 40 tuổi trong danh sách." << endl;
    cout << "4. Đếm số lượng nhân viên có lương lớn hơn 1.000.000 đồng." << endl;
    cout << "5. Sắp xếp các nhân viên giảm dần theo năm sinh." << endl;
    cout << "6. Thoát." << endl;
}

void inputEmployees(vector<Employee>& employees, int n) {
    for (int i = 0; i < n; ++i) {
        Employee emp;
        cout << "Nhập thông tin cho nhân viên thứ " << i + 1 << ":" << endl;
        cout << "Họ tên: ";
        cin.ignore();
        cin.getline(emp.name, 30);
        cout << "Ngày sinh (ngày tháng năm): ";
        cin >> emp.birth_date.day >> emp.birth_date.month >> emp.birth_date.year;
        cout << "Lương: ";
        cin >> emp.salary;
        cout << "Giới tính (0: Nữ, 1: Nam): ";
        cin >> emp.gender;
        employees.push_back(emp);
    }
}

void displayEmployees(const vector<Employee>& employees) {
    for (const auto& emp : employees) { // auto: define data types automatically with complicated data types
        cout << "Họ tên: " << emp.name << ", Ngày sinh: " << emp.birth_date.day << "/" << emp.birth_date.month << "/" << emp.birth_date.year << ", Lương: " << emp.salary << ", Giới tính: " << (emp.gender == 0 ? "Nữ" : "Nam") << endl;
    }
}

void listEmployeesOver40(const vector<Employee>& employees) {
    int currentYear = 2024; // Giả sử năm hiện tại là 2024
    for (const auto& emp : employees) {
        if (currentYear - emp.birth_date.year > 40) {
            cout << "Họ tên: " << emp.name << ", Ngày sinh: " << emp.birth_date.day << "/" << emp.birth_date.month << "/" << emp.birth_date.year << ", Lương: " << emp.salary << ", Giới tính: " << (emp.gender == 0 ? "Nữ" : "Nam") << endl;
        }
    }
}

int countHighSalaryEmployees(const vector<Employee>& employees) {
    int count = 0;
    for (const auto& emp : employees) {
        if (emp.salary > 1000000) {
            count++;
        }
    }
    return count;
}

bool compareByYearOfBirth(const Employee& a, const Employee& b) {
    return a.birth_date.year > b.birth_date.year;
}

void sortEmployeesByYearOfBirth(vector<Employee>& employees) {
    sort(employees.begin(), employees.end(), compareByYearOfBirth);
}

int main() {
    vector<Employee> employees;
    int choice;
    do {
        showMenu();
        cout << "Nhập lựa chọn của bạn: ";
        cin >> choice;
        switch (choice) {
            case 1: {
                int n;
                cout << "Nhập số lượng nhân viên: ";
                cin >> n;
                inputEmployees(employees, n);
                break;
            }
            case 2:
                displayEmployees(employees);
                break;
            case 3:
                listEmployeesOver40(employees);
                break;
            case 4: {
                int count = countHighSalaryEmployees(employees);
                cout << "Số lượng nhân viên có lương lớn hơn 1.000.000 đồng: " << count << endl;
                break;
            }
            case 5:
                sortEmployeesByYearOfBirth(employees);
                cout << "Danh sách nhân viên sau khi sắp xếp theo năm sinh giảm dần:" << endl;
                displayEmployees(employees);
                break;
            case 6:
                cout << "Thoát chương trình." << endl;
                break;
            default:
                cout << "Lựa chọn không hợp lệ. Vui lòng chọn lại." << endl;
        }
    } while (choice != 6);
    
    return 0;
}
