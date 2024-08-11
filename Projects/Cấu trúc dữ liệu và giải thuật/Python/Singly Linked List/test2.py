# Khoi tao cau truc mot node trong danh sach
import os
class node:

    def __init__(self, data):
        self.data=data
        self.next=None

class Linkedlist:

    def __init__(self):
        self.head=None

    def push(self,x):
        new_node=node(x)  #khoi tao data cua node new_node
        new_node.next=self.head # con tro cua new_node tro den node dau de lien ket voi node dau
        self.head=new_node # gan lai new_node thanh node dau

    def append(self, x):
        new_node=node(x)
        # neu node dau bang none thi gan node moi la node dau
        if(self.head==None):
            self.head=new_node
            return
        last=self.head
        while(last.next!=None): #lap den khi nao con tro cua node cuoi bang none
            last=last.next # Duyet den cuoi danh sach node cuoi la node co next bang none
        last.next=new_node  #lien ket con tro cua node cuoi bang node moi

    def insertNode(self, k, x):
        p= self.head
        new_node=node(x)
        if (self.head == None):
            self.head = new_node
            return
        for i in range(0,k-1):
            p=p.next
        #khai bao node mới với giá trị data là x
        new_node.next=p.next # làm cho con trỏ của node mới bằng với con trỏ của node k-1
        p.next=new_node # liên kết con trỏ của node k-1 với node mới

    def demPhanTu(self, x):
        dem=0
        while(self.head.next):
            if self.head.data==x:
                dem+=1
            self.head = self.head.next
        return dem

    def delete_begin(self):
        if self.head is None:
            print("Linked List is empty can't delete!")
        else:
            self.head=self.head.next

    def deleteAt(self, m):
        p=self.head
        count=0
        while(count!=m-1):
            count += 1
            p=p.next
        p.next= p.next.next

    def max(self):
        p=self.head
        max = p.data
        while (p):
            if max<p.data:
                max=p.data
            p=p.next
        return max

    def printList(self):
        temp=self.head
        while(temp):
            print(temp.data, end=" ")
            temp=temp.next
llist=Linkedlist()
n=int(input("Nhập số lượng phần tử của danh sách: "))
for i in range(n):
    llist.append(int(input()))
llist.printList()
while 69:
    print("\n1: Chèn node có giá trị x vào vị trí k.")
    print("2: Đếm số lượng phần tử có giá trị x.")
    print("3: Xóa node tại một vị trí k bất kì.")
    print("Nhap giá trị cần lựa chọn: ")
    luachon = int(input())
    if luachon== 1:
        k=int(input("Nhập vị trí cần chèn (0<=k<=n): "))
        x=int(input("Nhập giá trị của vị trí cần chèn: "))
        if k==0:
            llist.push(x)
        elif k==n:
            llist.append(x)
        else:
            llist.insertNode(k,x)
        llist.printList()
    elif luachon== 2:
        x=int(input("Nhap gia tri cua x: "))
        print(llist.demPhanTu(x))
    elif luachon== 3:
        k=int(input("Nhập ví trí k cần xóa: "))
        if k==0:
            llist.delete_begin()
        else:
            llist.deleteAt(k)
        llist.printList()
    else:
        break



