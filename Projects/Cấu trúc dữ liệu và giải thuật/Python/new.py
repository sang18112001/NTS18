# Bài toán tìm kiếm:
# Cây tìm kiếm nhị phân
# Bản chất của cây nhị phân:
# Bao gồm các phần tử xếp thành các node theo một nhánh cây, với tính chất
# Node nhỏ hơn node gốc thì nằm bên trái, lớn hơn thì nằm bên phải.
# Ta luôn phải chú ý các node sau so sánh với node gốc
# Để tìm kiếm được, ta lấy node gốc để so sánh.
# Nếu node cần tìm nhỏ hơn node gốc thì bên trái, lớn hơn bên phải
# Tương tự lấy nút con tiếp theo ở bên trái hoặc phải làm gốc sẽ tìm được.
# Độ phức tạp thuật toán:O(logn)
# Trong TH xấu nhất là cây lệch trái hoặc phải thì độ phức tạp là O(n)
# Code xác định node gốc (parent node)
class Node:  # tạo class các node của tree
    # Hàm khởi tạo node cha và các node con
    def __init__(self, data):
        self.left_child = None
        self.right_child = None
        self.parent_node = data

    # Hàm in ra tree (thứ tự từ trái đến gốc rồi đến phải)
    def print_tree(self):
        # nếu k có lef_child thì k in
        if self.left_child:
            self.left_child.print_tree()

        print(self.parent_node)
        # nếu k có right_child thì k in
        if self.right_child:
            self.right_child.print_tree()

    # Hàm thêm node vào tree
    def insert_node(self, input_node):
        if self.parent_node:  # xét trường hợp tồn tại node cha
            if input_node < self.parent_node:  # nếu node nhập vào nhỏ hơn node cha thì nó nằm bên trái
                if self.left_child is None:  # Xét tiếp nếu chưa tồn tại left_child
                    self.left_child = Node(input_node)  # gán giá trị left_child cho node nhập vào
                else:  # nếu đã tồn tại left child
                    self.left_child.insert_node(input_node)  # dùng đệ quy để gán node nhập vào cho left_child
            elif input_node > self.parent_node:
                if self.right_child is None:
                    self.right_child = Node(input_node)
                else:
                    self.right_child.insert_node(input_node)
        else:  # Xét trường hợp nếu chưa tồn tại node cha
            self.parent_node = Node(input_node)  # gán node nhập vào cho node cha

    # Hàm tìm kiếm phần tử trong cây nhị phân
    def find_node(self, input_node):
        # Xét TH node cần tìm nhập vào nhỏ hơn node cha,đệ quy tìm bên trái
        if input_node < self.parent_node:
            if self.left_child is None:  # nếu không tồn tại left_child
                return str(input_node) + " is not found"  # Trả về không tìm được
            return self.left_child.find_node(input_node)  # đệ quy
        # Xét TH node cần tìm nhập vào lớn hơn node cha,đệ quy tìm bên phải
        elif input_node > self.parent_node:
            if self.right_child is None:
                return str(input_node) + " is not found"
            return self.right_child.find_node(input_node)
        else:  # <=> self.parent_node = input_node -> trả về node cần tìm
            return str(input_node) + " is found"

    # Hàm xóa Node bất kỳ trong cây
    def deleteNode(self, input_node):
        # nếu node cần xóa nhỏ hơn node cha thì đệ quy tìm xóa bên trái
        if input_node < self.parent_node:
            return self.left_child.deleteNode(input_node)
        # nếu node cần xóa nhỏ hơn node cha thì đệ quy tìm xóa bên trái
        elif input_node > self.parent_node:
            return self.right_child.deleteNode(input_node)
        else:
            X = self.parent_node  # gán X cho Node tìm được để xóa
            if self.left_child is None:
                self.parent_node = self.right_child
            elif self.right_child is None:
                self.parent_node = self.left_child
        del X


root = Node(69)  # gán giá trị cho node gốc là 69
root.insert_node(39)
root.insert_node(79)
root.insert_node(68)
root.insert_node(75)
root.insert_node(30)
root.insert_node(80)
root.deleteNode(75)
root.print_tree()