def songuyento(n):
    dem = 0
    for i in range(2, n):
        if n % i == 0:
            dem += 1
    if dem == 0:
        return True


class node:

    def __init__(self, data):
        self.data = data
        self.next = None


class Linkedlist:

    def __init__(self):
        self.head = None
        self.tail = None

    def push(self, x):
        new_node = node(x)  # khoi tao data cua node new_node

        # con tro cua new_node tro den node dau de lien ket voi node dau
        new_node.next = self.head

        # gan lai new_node thanh node dau
        self.head = new_node

    def append(self, x):
        new_node = node(x)
        # neu node dau bang none thi gan node moi la node dau
        if self.head == None:
            self.head = new_node
            return
        tmp = self.head

        # lap den khi nao con tro cua node cuoi bang none
        while tmp.next != None:
            tmp = tmp.next
        tmp.next = new_node  # lien ket con tro cua node cuoi bang node moi
            
    def insertAfter(self, prev_node, new_data):
        # 1. check if the given prev_node exists
        if prev_node is None:
            print("The given previous node must inLinkedList.")
            return

        # 2. Create new node &
        # 3. Put in the data
        new_node = Node(new_data)

        # 4. Make next of new Node as next of prev_node
        new_node.next = prev_node.next  # lien ket với node sau

        # 5. make next of prev_node as new_node
        prev_node.next = new_node

    def deleteNodeAtPosition(self, position):
        if self.head is None:
            return
        index = 0
        current = self.head
        if position == 0:
            self.head = current.next
            return
        # chạy đến node trước node cần xóa và gắn con trỏ đến node mà sau node cần xóa
        while current.next:
            if index == position - 1:
                current.next = current.next.next
                return
            current = current.next
            index += 1

    def reversePrint(self):
        cur = self.head
        while cur != None:
            next = cur.next  # đặt node tiếp theo sau cur là next
            cur.next = prev  # gắn con trỏ của cur vào nút đằng trước
            prev = cur  # cập nhật lại prev là nút hiện tại
            cur = next  # gắn cur vào node tiếp theo để tiếp tục vòng lặp
        self.head = prev

    def printList(self):
        temp = self.head
        while temp:
            print(temp.data, end=" ")
            temp = temp.next
llist = Linkedlist()
n = 6
for i in range(n):
    llist.append(i)
print("Singly Linked List: ")
llist.deleteNodeAtPosition(5)
llist.printList()
