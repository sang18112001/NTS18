class Node:
    def __init__(self, data, node_next=None):
        self.data = data
        self.next = node_next
        self.prev = None


class DoublyLinkedList:
    def __init__(self):
        self.head = None

    # Them vao dau danh sach lien ket
    def prepend(self, data):
        new_node = Node(data)
        if self.head == None:
            new_node.prev = self.head
            self.head = new_node
        else:
            self.head.prev = new_node
            new_node.next = self.head
            self.head = new_node
            new_node.prev = None

    # them vao cuoi danh sach lien ket
    def append(self, data):
        if self.head is None:
            new_node = Node(data)
            new_node.prev = None
            self.head = new_node
        else:
            new_node = Node(data)
            cur = self.head
            while cur.next:
                cur = cur.next
            cur.next = new_node
            new_node.prev = cur
            new_node.next = None

    # them vao mot vi tri bat ki cua danh sach lien ket
    def insert_at(self, k, data):
        new_node = Node(data)
        if k == 0:
            Dllist.prepend(data)
        else:
            if self.head == None:
                new_node.prev = None
                self.head = new_node
            cur = self.head
            count = 0
            for count in range(k - 1):
                cur = cur.next
            new_node.next = cur.next
            new_node.prev = cur
            cur.next = new_node

    # them vao sau vi tri k cua danh sach lien ket
    def insert_after(self, k, data):
        new_node = Node(data)
        if self.head == None:
            new_node.prev = None
            self.head = new_node
        cur = self.head
        for i in range(k):
            cur = cur.next
        new_node.next = cur.next
        new_node.prev = cur
        cur.next = new_node

    # them vao truoc vi tri k cua danh sach lien ket
    def insert_before(self, k, data):
        new_node = Node(data)
        if k == 1:
            Dllist.prepend(data)
        else:
            if self.head is None:
                new_node.prev = None
                self.head = new_node
            cur = self.head
            for i in range(k - 2):
                cur = cur.next
            new_node.next = cur.next
            cur.next = new_node
            new_node.prev = cur

    def delete(self, k):
        if k == 0:
            self.head = self.head.next
        else:
            cur = self.head
            for i in range(k - 1):
                cur = cur.next
            cur.next = cur.next.next

    def reversePrint(self):
        cur = self.head
        prev = cur.prev
        while cur != None:
            next = cur.next  # đặt node tiếp theo sau cur là next
            cur.next = prev  # gắn con trỏ của cur vào nút đằng trước
            prev = cur  # cập nhật lại prev là nút hiện tại
            cur = next  # gắn cur vào node tiếp theo để tiếp tục vòng lặp
        self.head = prev

    def print(self):
        cur = self.head
        while cur:
            print(cur.data, end=" ")
            cur = cur.next


Dllist = DoublyLinkedList()
n = int(input("Nhap so luong phan tu cua danh sach: "))
for i in range(n):
    Dllist.append(int(input()))
while 60:
    print("\n1: Them vao mot vi tri bat ki cua danh sach lien ket.")
    print("2: Them gia tri x vao sau vi tri k.")
    print("3: Them gia tri x vao truoc vi tri k.")
    print("4: Xoa mot node o vi tri k bat ky.")
    print("5: Dao nguoc danh sach lien ket. ")
    luachon = int(input("Nhap lenh can lam: "))
    if luachon == 1:
        k = int(input("Nhap vi tri can them: "))
        data = int(input("Nhap gia tri can them: "))
        Dllist.insert_at(k, data)
        Dllist.print()
    if luachon == 2:
        k = int(input("Nhap vi tri can them: "))
        data = int(input("Nhap gia tri can them: "))
        Dllist.insert_after(k, data)
        Dllist.print()
    if luachon == 3:
        k = int(input("Nhap vi tri can them: "))
        data = int(input("Nhap gia tri can them: "))
        Dllist.insert_before(k, data)
        Dllist.print()
    if luachon == 4:
        k = int(input("Nhap vi tri can xoa: "))
        Dllist.delete(k)
        Dllist.print()
    if luachon == 5:
        Dllist.reversePrint()
        Dllist.print()
