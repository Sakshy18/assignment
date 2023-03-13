#adding vertex to dictionary(graph representation with adjacency list)
def add_vertex(v):
    global graph
    global vertex_no
    if v in graph:
        print('Vertex' +v+ 'is already in graph')
    else:
        vertex_no += 1
        graph[v] = []


#adding edge between v1 and v2(undirected)
def add_edge(v1, v2):
    global graph
    if v1 not in graph:
        print('Vertex' +v1+ 'does not exist')
    elif v2 not in graph:
        print('Vertex' +v2+ 'does not exist')
    else:
        graph[v1].append(v2)
        graph[v2].append(v1)


def input_edges():
    v1, v2 = [int(x) for x in input('Enter an edge(v1 v1):').split()]
    add_edge(v1, v2)


def show_graph():
    global graph
    for vertex in graph:
        for edge in graph[vertex]:
            print(vertex, '->', edge)




#implementing BFS on the adjacency list
def bfs(queue, visited):

    if not queue:
        return

    s = queue.pop(0)
    print(s, end=' ')
    
    for i in graph[s]:
        if i not in visited:
            queue.append(i)
            visited.append(i)
    
    bfs(queue, visited)




#implementing DFS on the adjacency list
def dfs(stack, visited):

    if not stack:
        return

    s = stack.pop()
    print(s, end=' ')
    
    for i in graph[s]:
        if i not in visited:
            stack.append(i)
            visited.append(i)
    
    dfs(stack, visited)

    


graph = {}

vertex_no = 0

for i in range(int(input('Enter number of vertices: '))):
    v = int(input('Enter vertex: '))
    add_vertex(v)

for i in range(1, vertex_no):
    input_edges()

    
while True:
    more = (input('Enter more edges?(Y/N): '))
    if more == 'Y' or more == 'y':
        input_edges()
    else:
        break

show_graph()

print('Internal representation:', graph)

#Queue, BFS
visited = []
queue = []

i = int(input('Enter starting vertex for BFS: '))
queue.append(i)
visited.append(i)

print('BFS:', end='')
bfs(queue, visited)


#Stack, DFS
visited = []
stack = []

i = int(input('\n\nEnter starting vertex for DFS: '))
stack.append(i)
visited.append(i)

print('DFS:', end='')
dfs(stack, visited)
