def num_islands(grid)
    return 0 if grid.length == 0
    cols = grid[0].length
    rows = grid.length
    count = 0
    
    0.upto(rows-1) do |r|
        0.upto(cols-1) do |c|
            if (grid[r][c] == "1")
                dfs(grid,r,c,rows,cols)
                count += 1
            end
        end
    end
    count
end
        
        
def dfs(my_grid, i, j, rows, cols)
    if ((i >= 0) && (i < rows) && (j >=0) && (j < cols))
        if my_grid[i][j] == "1"
            my_grid[i][j] = "2"
            dfs(my_grid,i+1,j,rows,cols)
            dfs(my_grid,i-1,j,rows,cols)
            dfs(my_grid,i,j-1,rows,cols)
            dfs(my_grid,i,j+1,rows,cols)
        end
    end
end