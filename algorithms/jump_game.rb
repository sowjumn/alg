=begin
Given an array of non-negative integers arr, you are initially positioned at start index of the array. When you are at index i, you can jump to i + arr[i] or i - arr[i], check if you can reach to any index with value 0.

Notice that you can not jump outside of the array at any time.

 

Example 1:

Input: arr = [4,2,3,0,3,1,2], start = 5
Output: true
Explanation: 
All possible ways to reach at index 3 with value 0 are: 
index 5 -> index 4 -> index 1 -> index 3 
index 5 -> index 6 -> index 4 -> index 1 -> index 3 
Example 2:

Input: arr = [4,2,3,0,3,1,2], start = 0
Output: true 
Explanation: 
One possible way to reach at index 3 with value 0 is: 
index 0 -> index 4 -> index 1 -> index 3
Example 3:

Input: arr = [3,0,2,1,2], start = 2
Output: false
Explanation: There is no way to reach at index 1 with value 0.
 

Constraints:

1 <= arr.length <= 5 * 104
0 <= arr[i] < arr.length
0 <= start < arr.length

#Solution:

Is a breadth first approach where we maintain a queue of nodes that could be a possible path
=end

def can_reach(arr, start)
    len = arr.length
    return false if len == 0
    return  arr[0] == 0 if len == 1
    return false if start >= len
    
    visited = Array.new(len,false)
    que = [start]
    
    while que.length > 0
        i = que.shift
        if !visited[i]
            if arr[i] == 0
                return true
            else
                if arr[i] + i < len
                    visited[i] = true
                    que.push(i + arr[i])
                end
                if i - arr[i] >= 0
                    visited[i] = true
                    que.push(i - arr[i])
                end
            end
         end
     end
    return false
end