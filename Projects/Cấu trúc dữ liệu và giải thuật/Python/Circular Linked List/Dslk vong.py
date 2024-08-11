class Node:
    def __init__(self,data):
        self.data=data
        self.next=None

class CircularLinkedList:
    def __init__(self):
        self.head=None
        self.tail=None

    def push(self,x):
        new_node=Node(x)
        cur=self.head
        while cur.next!=self.head:
            cur=cur.next
        cur.next=new_node
        new_node.next=self.head
        self.head=new_node
    def append(self, x):
        new_node=Node(x)
        if self.head==None:
            self.head=new_node
            self.head.next=self.head
        else:
            cur=self.head
            while cur.next!=self.head:
                cur=cur.next
            cur.next=new_node
            new_node.next=self.head
    def length(self):
        cur=self.head
        count=0
        while True:
            count+=1
            cur = cur.next
            if cur==self.head:
                break
        return count
    def print(self):
        cur=self.head
        while cur:
            print(cur.data, end=" ")
            cur=cur.next
            if cur==self.head:
                break
    def remove_last(self):
        if self.head==None:
            return
        cur=self.head
        prev=None
        len=self.length()
        for i in range(len-1):
            prev=cur
            cur=cur.next
        prev.next=self.head
    def remove_first(self):
        if self.head==None:
            return
        prev=None
        cur=self.head
        while cur.next!=self.head:
            cur=cur.next
            prev=cur.next
        cur.next=prev.next
        self.head=self.head.next

    def remove(self,k):
        if self.head==None:
            self.head.next=self.head
        if k==1:
            self.remove_first()
        else:
            cur=self.head
            for i in range(1,k-1):
                cur=cur.next
            cur.next=cur.next.next
    def remove_data(self,k):
        if self.head==None:
            return
        if self.head.data==k:
            cur=self.head
            while cur.next!=self.head:
                cur=cur.next
            cur.next=self.head.next
            self.head=self.head.next
        else:
            prev=None
            cur=self.head
            while cur.next!=self.head:
                prev=cur
                cur=cur.next
                if cur.data==k:
                    prev.next=cur.next
                    cur=cur.next
    def Josephus(self, k):
        cur = self.head
        n=self.length()
        while n > 1:
            for i in range(1, k):
                cur=cur.next
            print("Kill node at position: ", k)
            self.remove(k)
            self.head=cur.next
            self.print()
            print("\n")
            n-=1
Clist=CircularLinkedList()
Clist.append(1)
Clist.append(2)
Clist.append(3)
Clist.append(4)
Clist.append(5)
Clist.print()
k=2
print("\n")
Clist.Josephus(k)
