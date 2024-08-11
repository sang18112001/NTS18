#Tìm kiếm nhị phân bằng đệ quy
def binary_search_recursive(arr, low, high, x):
    # Check base case
    if high >= low:

        mid = (high + low) // 2

        # If element is present at the middle itself
        if arr[mid] == x:
            return mid

        # If element is smaller than mid, then it can only
        # be present in left subarray
        elif arr[mid] > x:
            return binary_search_recursive(arr, low, mid - 1, x)

        # Else the element can only be present in right subarray
        else:
            return binary_search_recursive(arr, mid + 1, high, x)

    else:
        # Element is not present in the array
        return -1

#Tìm kiếm nhị phân bằng khử đệ quy
def binary_search_interative(arr, x):
    low = 0
    high = len(arr) - 1
    mid = 0

    while low <= high:

        mid = (high + low) // 2

        # If x is greater, ignore left half
        if arr[mid] < x:
            low = mid + 1

        # If x is smaller, ignore right half
        elif arr[mid] > x:
            high = mid - 1

        # means x is present at mid
        else:
            return mid

    # If we reach here, then the element was not present
    return -1
n=int(input())
a=[]
for i in range(n):
    a.append(int(input()))
k=int(input())
sorted(a)
print(binary_search_interative(a,k))