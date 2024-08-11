class node:
    def __init__(self, data):
        self.data=data
        self.next=None

class Linkedlist:

    def __init__(self):
        self.head=None
        self.tail=None

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
    def printList(self):
        temp=self.head
        while temp:
            print(temp.data, end=" ")
            temp=temp.next
def sortedInsert(head):
    while head:
        while head.next:
            if head.data>head.next.data:
                a=head.data
                head.data=head.next.data
                head.next.data=a
            head.next = head.next.next
        head=head.next

llist=Linkedlist()
n=int(input())
for i in range(n):
    llist.append(int(input()))
x=int(input())
llist.append(x)
llist.printList()
print("\n")
sortedInsert(llist.head)
llist.printList()
