"""Check an explicit 19-sheeted cyclic cover whose shortest power-of-two cycle has length 32."""
from collections import deque

# Orient the base edges as listed. The final entries give translations mod 19.
edges = [(0,4,0), (4,1,0), (0,2,0), (0,3,0), (1,2,1), (1,3,8), (2,3,0)]
graph = [set() for _ in range(95)]
for u,v,shift in edges:
    for i in range(19):
        a = 19*u+i
        b = 19*v+(i+shift)%19
        graph[a].add(b)
        graph[b].add(a)

queue = deque([0])
visited = {0}
while queue:
    for v in graph[queue.popleft()] - visited:
        visited.add(v)
        queue.append(v)
assert len(visited) == 95

cycle = [0,76,19,39,1,58,31,88,12,69,50,30,87,11,68,22,
         79,3,60,41,21,67,48,10,86,29,75,56,18,94,37,38]
assert len(cycle) == len(set(cycle)) == 32
assert all(b in graph[a] for a,b in zip(cycle,cycle[1:] + cycle[:1]))

def search(root, current, path):
    if len(path) in (4,8,16) and root in graph[current]:
        raise ValueError(f"short cycle from {root}, length {len(path)}")
    if len(path) < 16:
        for v in graph[current]:
            # The smallest vertex of a cycle is a sufficient starting point.
            if v > root and v not in path:
                path.add(v)
                search(root,v,path)
                path.remove(v)

for root in range(95):
    search(root,root,{root})
print("Connected 95-vertex cyclic cover: lengths 4, 8, 16 excluded; 32-cycle verified.")
