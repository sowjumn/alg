=begin
Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.

An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

 

Example 1:

Input: grid = [
  ["1","1","1","1","0"],
  ["1","1","0","1","0"],
  ["1","1","0","0","0"],
  ["0","0","0","0","0"]
]
Output: 1
Example 2:

Input: grid = [
  ["1","1","0","0","0"],
  ["1","1","0","0","0"],
  ["0","0","1","0","0"],
  ["0","0","0","1","1"]
]
Output: 3
=end
def num_islands(grid)
    num_rows = grid.length
    num_cols = grid[0].length

    i = 0
    j = 0
    count = 0
    while i >= 0 && i < num_rows
      while j >=0 && j < num_cols
        if grid[i][j] == "1"
            dfs(grid,i,j,num_rows,num_cols)
            count += 1
        end
        j = j + 1
      end
      i = i + 1
      j = 0
    end 
    count
end

def dfs(grid,i,j,num_rows,num_cols)
    return if i < 0 || i >= num_rows || j < 0 || j >= num_cols
    if grid[i][j] == "1"
        grid[i][j] = 'X'
        dfs(grid,i+1,j,num_rows,num_cols)
        dfs(grid,i-1,j,num_rows,num_cols)
        dfs(grid,i,j+1,num_rows,num_cols)
        dfs(grid,i,j-1,num_rows,num_cols)
    else
      return
    end
end