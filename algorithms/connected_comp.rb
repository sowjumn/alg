=begin
Given n nodes labeled from 0 to n - 1 and a list of undirected edges (each edge is a pair of nodes), write a function to find the number of connected components in an undirected graph.

Example 1:

Input: n = 5 and edges = [[0, 1], [1, 2], [3, 4]]

     0          3
     |          |
     1 --- 2    4 

Output: 2
Example 2:

Input: n = 5 and edges = [[0, 1], [1, 2], [2, 3], [3, 4]]

     0           4
     |           |
     1 --- 2 --- 3

Output:  1
Note:
You can assume that no duplicate edges will appear in edges. Since all edges are undirected, [0, 1] is the same as [1, 0] and thus will not appear together in edges.


=end

def count_components(n, edges)
    graph = Hash.new { Array.new }
    
    edges.each do |e|
        graph[e[0]] += [e[1]]
        graph[e[1]] += [e[0]]
    end
    
    visited = Hash.new
    count = 0
    puts graph
    
    vertices = graph.keys
    
    vertices.each do |v|
        if !visited[v]
            visited[v] = true
            dfs(graph,visited,v)
            count += 1
        end
    end
    count += (n - vertices.length)
end

def dfs(graph,visited,v)
    graph[v].each do |n_v|
        if !visited[n_v]
            visited[n_v] = true
            dfs(graph,visited,n_v)
        end
    end
end