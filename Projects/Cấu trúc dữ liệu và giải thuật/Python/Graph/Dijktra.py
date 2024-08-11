import collections
import queue

N = 7
edges = [
    [0, 2, 1],
    [0, 1, 2],
    [0, 6, 3],
    [1, 5, 10],
    [1, 4, 15],
    [2, 1, 4],
    [2, 3, 2],
    [3, 4, 3],
    [4, 5, 5],
    [6, 1, 3]
]
graph = collections.defaultdict(list)
for edge in edges:
    src, des, weight = edge
    graph[src].append((des, weight))

# defaultdict(list,
#            {0: [(2, 1), (1, 2), (6, 3)],
#             1: [(5, 10), (4, 15)],
#             2: [(1, 4), (3, 2)],
#             3: [(4, 3)],
#             4: [(5, 5)],
#             6: [(1, 3)]})

dist = collections.defaultdict(int)
for i in range(N):
    dist[i] = float('inf')

path = collections.defaultdict(int)
for i in range(N):
    path[i] = -1

class HeapNode:
    def __init__(self, id, weight):
        self.id = id
        self.weight = weight

    def __lt__(self, other):
        return self.weight <= other.weight


def dijkstra(src, graph, dist, path):
    minHeap = queue.PriorityQueue()
    #     src = 0
    dist[src] = 0
    minHeap.put(HeapNode(src, 0))
    while minHeap.qsize() > 0:
        u = minHeap.get()
        for v in graph[u.id]:
            vID, vWeight = v
            # Nếu tìm được đường nhỏ hơn từ gốc đến một điểm bất kỳ thì cập nhật lại độ dài và đường đi
            if u.weight + vWeight < dist[vID]:
                dist[vID] = u.weight + vWeight
                path[vID] = u.id
                minHeap.put(HeapNode(vID, u.weight + vWeight))

dijkstra(0, graph, dist, path)
print(dist)
