def mergeSort1(arr):
    if len(arr)<2:
        return arr
    add=[]
    mid=len(arr)//2
    left=mergeSort(arr[:mid])
    right=mergeSort(arr[mid:])
    # Run while loop with left and right are not empty
    # iterate through each element in left and right:
        # if left[0] > right[0]: add right[0] to new array and remove right[0] from right array
    while left!=[] and right!=[]:
        if left[0]>right[0]:
            add.append(right[0])
            right=right[1:]
        else:
            add.append(left[0])
            left=left[1:]
    print(add)
    add+=left
    add+=right
    return add


def mergeSort(arr):
    if len(arr) > 1:
        # Finding the mid of the array
        mid = len(arr) // 2
        # Dividing the array elements
        L = arr[:mid]
        # into 2 halves
        R = arr[mid:]
        # Sorting the first half
        mergeSort(L)
        # Sorting the second half
        mergeSort(R)
        i = j = k = 0
        # Copy data to temp arrays L[] and R[]
        while i < len(L) and j < len(R):
            if L[i] < R[j]:
                arr[k] = L[i]
                i += 1
            else:
                arr[k] = R[j]
                j += 1
            k += 1
        # Checking if any element was left
        while i < len(L):
            arr[k] = L[i]
            i += 1
            k += 1
        while j < len(R):
            arr[k] = R[j]
            j += 1
            k += 1
###arr=list(map(int,input().strip().split()))
arr = [7, 3, 4, 2, 1, 6, 9, 8]
mergeSort(arr)
print(arr)