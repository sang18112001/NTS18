def quickSort(arr):
    if len(arr) < 1:
        return arr
    pivot = arr[0]
    lefts = [left for left in arr if left < pivot]
    print("left:", lefts)
    rights = [right for right in arr if right > pivot]
    print("right:", rights)
    mids = [mid for mid in arr if mid == pivot]
    print("mid:", mids)
    arr = quickSort(lefts) + mids + quickSort(rights)
    return arr


a = [4, 1, 7, 2, 3, 5, 0, 6]
print(*quickSort(a))
