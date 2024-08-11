def swap(ds, i, j):
    t = ds[i]
    ds[i] = ds[j]
    ds[j] = t


# Hàm chọn giá trị lớn nhất trên các lá và hoán đổi cho 1 gốc
def BranchSort(ds, g, l):
    if 2 * g + 1 == l:
        if ds[2 * g + 1] > ds[g]:
            swap(ds, 2 * g + 1, g)
    else:
        if ds[2 * g + 1] > ds[2 * g + 2]:
            j = 2 * g + 1
        else:
            j = 2 * g + 2
        if ds[j] > ds[g]:
            swap(ds, j, g)


def HeapSort(ds):
    l = len(ds) - 1
    g = len(ds) // 2 - 1  # g bat dau tu goc cuoi
    while l >= 0:
        for i in range(g, -1, -1):  # i chay tu goc cuoi den goc 0
            BranchSort(ds, i, l)
        swap(ds, 0, l)
        l -= 1
        g = (l + 1) // 2 - 1
        print(*ds)


n = [7, 5, 19, 15, 6, 1]
print(*n)
HeapSort(n)
