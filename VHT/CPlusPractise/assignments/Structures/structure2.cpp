// Bài 2. Khai báo cấu trúc học sinh. Biết rằng thông tin của một học sinh bao gồm:
// họ tên (30 ký tự), điểm toán, điểm văn và điểm trung bình (tất cả là số thực).
// -Nhập thông tin cho n sinh viên, với n được nhập từ bàn phím.
// -Hiển thị danh sách các sinh viên có trong danh sách.
// -Liệt kê các học sinh có điểm toán nhỏ hơn 5 trong danh sách.
// -Đếm số lượng học sinh có điểm toán và điểm văn lớn hơn 8 điểm
// -Viết hàm sắp xếp các học sinh giảm dần theo điểm trung bình.

#include <iostream>
#include <vector>
#include <algorithm> // Để sử dụng std::sort

using namespace std;

struct Student {
  char name[30];
  double math;
  double literature;
  double average;
};

void showMenu() {
    cout << "1. Nhập thông tin cho n sinh viên, với n được nhập từ bàn phím." << endl;
    cout << "2. Hiển thị danh sách các sinh viên có trong danh sách." << endl;
    cout << "3. Liệt kê các sinh viên có điểm toán nhỏ hơn 5." << endl;
    cout << "4. Đếm số lượng sinh viên có điểm toán và văn lớn hơn 8." << endl;
    cout << "5. Sắp xếp các sinh viên giảm dần theo điểm trung bình" << endl;
    cout << "6. Thoát." << endl;
}

void inputStudents (vector<Student> &students) {
  int n;
  cout << "Nhap so luong sinh vien muon them vao: "; cin >> n;
  for (int i = 0; i < n; i++) { 
    Student st;
    cout << "Nhập tên của sinh viên: ";
    cin.ignore();  // Bỏ qua ký tự newline còn lại trong bộ đệm
    cin.getline(st.name, 30); // Read the name with spaces
    cout << "Nhập điểm toán của sinh viên: "; cin >> st.math;
    cout << "Nhập điểm văn của sinh viên: "; cin >> st.literature;
    st.average = (st.math + st.literature) / 2.0;
    students.push_back(st);
  }
 
}

void showStudents (vector<Student> &students) {
  cout << "Danh sach sinh viên: " << endl;
  for (Student st : students) {
    cout << "Tên sinh viên: " << st.name << "; " << "Điểm toán: " << st.math << "; " << "Điểm văn: " << st.literature << "; " << "Điểm trung bình: " << st.average << endl;
  }
}

void studentsWithMathLess5(vector<Student> &students) {
  cout << "Danh sách sinh viên có điểm toán nhỏ hơn 5: " << endl;
  for (Student st: students) {
    if (st.math <= 5) {
      cout << "Tên sinh viên: " << st.name << "; " << "Điểm toán: " << st.math << "; " << "Điểm văn: " << st.literature << "; " << "Điểm trung bình: " << st.average << endl;
    }
  }
}

int countOver8(vector<Student> &students){
  int count = 0;
  for(Student &st : students) {
    if (st.math >= 8 && st.literature >= 8) {
      count++;
    }
  }
  return count;
}

bool compareByAverage(Student& a, Student& b) {
  return a.average > b.average;
}

void sortStudentAverage(vector<Student> &students) {
  return sort(students.begin(), students.end(), compareByAverage);
}

int main () {
  int choice;
  vector<Student> students;
  while (choice != 6) {
    showMenu();
    cout << "Nhập lựa chọn của bạn: "; cin >> choice;
    switch (choice)
    {
    case 1:
      inputStudents(students);
      break;
    case 2: 
      showStudents(students);
      break;
    case 3: 
      studentsWithMathLess5(students);
      break;
    case 4: 
      cout << "Số lượng sinh viên với có điểm toán và văn lớn hơn 8 là: "<< countOver8(students) << endl;
      break;
    case 5: 
      sortStudentAverage(students);
      showStudents(students);
      break;
    default:
      break;
    }
  }
  return 0;
}