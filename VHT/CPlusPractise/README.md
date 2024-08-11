# Các định nghĩa

- typedef: sử dụng một tên mới thay cho kiểu dữ liệu cũ.
  vd:
  ```cpp
  typedef long long ll;
  ```
- define: sử dụng một tên mới thay cho kiểu dữ liệu cũ (định nghĩa lại được cả kiểu giá trị và giá trị).
  vd:
  ```cpp
  #define ll long long
  #define PI 3.14
  ```
- enum: kiểu dữ liệu cố định, đảm bảo giá trị các biến chỉ nhận các giá trị mong đợi.
  vd: Mình định nghĩa kiểu Enum là dayOfWeek và chỉ nhận các giá trị là ngày trong tuần (từ thứ 2 đến chủ nhật). Mỗi lần có tính toán tới ngày trong tuần thì mình dùng dayOfWeek sẽ giúp tránh các giá trị nằm ngoài khoảng từ thứ hai đến chủ nhât.

  ```cpp
  enum dayOfWeek{Mon=2, Tue=3, Wed=4, Thur=5, Fri=6, Sat=7, Sun=8};

  int main()
  {
    enum dayOfWeek day;
    day = Wed;

    printf("Wednesday: %d n", day);

    printf("All day of week: %d - %d - %d - %d - %d - %d - %d", Mon, Tue, Wed, Thur, Fri, Sat, Sun);

    return 0;
  }
  ```

- toán tử **&**: có nghĩa là **tham chiếu đến** chứ không phải là **địa chỉ của**.

# Tham chiếu và tham trị.

- Tham trị (pass by value):
  - Khi bạn khai báo một hàm và truyền đối số vào hàm đó, giá trị của đối số sẽ được sao chép vào một bản sao mới.
  - Thay đổi giá trị của tham trị bên trong hàm không ảnh hưởng đến giá trị ban đầu của biến được truyền vào.
- Tham chiếu (pass by reference): Là một kiểu dữ liệu cơ bản (giống như tạo ra một tên khác cho biến).
  - Biến mới sẽ có cùng giá trị so với biến gốc và 2 biến này cùng kiếm soát một địa chỉ (địa chỉ bằng nhau).
  - Một biến tham chiếu chỉ được phép tham chiếu đến biến cùng kiểu và chỉ được tham chiếu 1 biến duy nhất.
  - Không thể khai báo một biến tham chiếu tới một hằng số, vì hằng số không thể thay đổi mà biến tham chiếu thì có, do vậy sẽ gây xung đột.

# Con trỏ:

- Khác với tham chiếu, con trỏ là một biến có địa chỉ độc lập để lưu địa chỉ của biến khác.
- Giá trị trong vùng nhớ của con trỏ là địa chỉ của biến mà nó trỏ tới.
- Khi khai báo một biến con trỏ, thì biến đó chỉ được phép trỏ vào địa chỉ của các biến có cùng kiểu đã khai báo.
  vd:
  ```cpp
  void double1 (int *x) { // *x là khởi tạo một con trỏ x.
    (*x) *= 2; // (*x) là giá trị mà của biến mà con trỏ x trỏ tới.
  }
  ```

# Type qualifiers:

- const: cannot be changed during execution.

  ```cpp
  const int a = 10; // a là hằng số và không thể thay đổi giá trị

  void foo(const int x) {
    // x là hằng số và không thể thay đổi giá trị bên trong hàm
  }

  void bar(const int* ptr) {
    // ptr trỏ tới một giá trị không thể thay đổi
    // *ptr = 10; // Lỗi: không thể thay đổi giá trị mà ptr trỏ tới
    cout << "Value: " << *ptr << endl;
  }

  void baz(int* const ptr) {
    // ptr là một con trỏ không thể thay đổi địa chỉ mà nó trỏ tới
    *ptr = 10; // Có thể thay đổi giá trị mà ptr trỏ tới
    cout << "Value: " << *ptr << endl;
    // ptr = nullptr; // Lỗi: không thể thay đổi địa chỉ của ptr
  }

  void qux(const int* const ptr) {
    // ptr là một con trỏ không thể thay đổi địa chỉ và giá trị mà nó trỏ tới
    // *ptr = 10; // Lỗi: không thể thay đổi giá trị mà ptr trỏ tới
    cout << "Value: " << *ptr << endl;

    // ptr = nullptr; // Lỗi: không thể thay đổi địa chỉ của ptr  }

  ```

# Structures:

- Difinitions: Define a new data type.
- Format:
  ```cpp
  struct [structure tag] {
    member definition;
    member definition;
    ...
    member definition;
  } [one or more structure variables]; //Define variables that belong to this structure.
  struct Books {
    char  title[50];
    char  author[50];
    char  subject[100];
    int   book_id;
  } book;
  ```
- Structures with pointers: Using **->** to access the members of the structure.

# Collections:
- Pair: <a href="https://www.geeksforgeeks.org/pair-in-cpp-stl/">Link tham khảo</a>
- Set: Used to store only keys.
- Map: Used to store key and value pairs.

# OOP in C++: 
- Khi một lớp (class) kế thừa từ một lớp khác, nó thừa hưởng tất cả các thuộc tính và phương thức của lớp cha. Tuy nhiên, trong một số trường hợp, lớp con muốn cung cấp cách thực hiện riêng cho một số phương thức mà nó thừa hưởng từ lớp cha. Đây gọi là ghi đè (override) phương thức.

- Đa hình (polymorphism) là khả năng trong đó một hàm hoặc phương thức có thể có nhiều hình thức thực hiện khác nhau. Trong C++, đa hình được thực hiện chủ yếu thông qua con trỏ và các phương thức ảo (virtual functions).

Phương thức ảo (Virtual Function)
Phương thức ảo là phương thức trong lớp cơ sở (base class) mà bạn mong muốn sẽ được ghi đè (override) trong các lớp dẫn xuất (derived class). Khi bạn sử dụng một con trỏ kiểu lớp cơ sở để trỏ đến một đối tượng của lớp dẫn xuất, phương thức được gọi sẽ là phương thức của lớp dẫn xuất nếu phương thức đó được khai báo là ảo trong lớp cơ sở.

Ví dụ
Giả sử bạn có lớp Shape và lớp dẫn xuất Rectangle. Nếu bạn khai báo phương thức area trong Shape là phương thức ảo, khi bạn gọi area thông qua con trỏ kiểu Shape, C++ sẽ đảm bảo rằng phiên bản của Rectangle::area sẽ được gọi nếu con trỏ thực sự trỏ đến một đối tượng Rectangle.