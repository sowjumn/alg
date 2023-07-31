=begin
There are n cities. Some of them are connected, while some are not. If city a is connected directly with city b, and city b is connected directly with city c, then city a is connected indirectly with city c.

A province is a group of directly or indirectly connected cities and no other cities outside of the group.

You are given an n x n matrix isConnected where isConnected[i][j] = 1 if the ith city and the jth city are directly connected, and isConnected[i][j] = 0 otherwise.

Return the total number of provinces.

 

Example 1:


Input: isConnected = [[1,1,0],[1,1,0],[0,0,1]]
Output: 2
Example 2:


Input: isConnected = [[1,0,0],[0,1,0],[0,0,1]]
Output: 3
 

Constraints:

1 <= n <= 200
n == isConnected.length
n == isConnected[i].length
isConnected[i][j] is 1 or 0.
isConnected[i][i] == 1
isConnected[i][j] == isConnected[j][i]

=end

def find_circle_num(is_connected)
    n = is_connected.length
    visited = Hash.new
    count = 0
    
    0.upto(n-1) do |i|
        if !visited[i]
            dfs(is_connected,visited,i,n)
            count += 1
        end
    end
    count
end

def dfs(is_connected,visited,i,n)
    0.upto(n-1) do |j|
        if is_connected[i][j] == 1 && !visited[j]
            visited[j] = true
            dfs(is_connected,visited,j,n)
        end
    end     
end
