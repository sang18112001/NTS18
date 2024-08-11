def selectionSort(a):
    for i in range(len(a)):
        index=i
        for j in range(i + 1, len(a)):
            if a[index] > a[j]:
                index=j
                print(*a)
        a[i],a[index]=a[index],a[i]

def bubbleSort(a):
    for i in range(len(a)):
        for j in range(len(a)):
            if a[i]<a[j]:
                a[i],a[j]=a[j],a[i]

def insertSort(a):
    for i in range(1,len(a)):
        j=i-1
        t=a[i]
        while t< a[j] and j>=0:
            a[j+1]=a[j]
            print(*a)
            j-=1
        a[j+1]=t
arr = [ 8, 7, 12, 56, 43, 25, 9]
selectionSort(arr)
print(*arr)
