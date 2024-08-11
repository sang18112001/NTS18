class Node:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None
        self.level = None

    def __str__(self):
        return str(self.data)

class BinarySearchTree:
    def __init__(self):
        self.root = None

    def insert(self, root, key):

        # Step 1 - Perform normal BST
        if not root:
            return Node(key)
        elif key < root.data:
            root.left = self.insert(root.left, key)
        else:
            root.right = self.insert(root.right, key)
        return root
    def preOrder(self,root):
        if root == None:
            return
        print(root.data, end=" ")
        self.preOrder(root.left)
        self.preOrder(root.right)
    def find_leftest(self,root):
        current = root

        # loop down to find the leftmost leaf
        while (current.left is not None):
            current = current.left
        return current
    def delete_is_lead(self,root,key):
        if root is None:
            return root
        #if value of root<key so turn left to delete
        if root.data>key:
            root.left=self.delete_is_lead(root.left,key)
        if root.data<key:
            root.right=self.delete_is_lead(root.right,key)
        else:
            if root.left is None:
                temp=root.right
                root=None
                return temp
            if root.right is None:
                temp=root.left
                root=None
                return temp
            temp=self.find_leftest(root.right)
            root.data=temp.data
            root.right=self.delete_is_lead(root.right,temp.data)
        return root


tree = BinarySearchTree()
t = int(input())
root=None
arr = list(map(int, input().split()))
for i in range(t):
    root=tree.insert(root,arr[i])
key=int(input())
tree.delete_is_lead(root,key)
tree.preOrder(root)
