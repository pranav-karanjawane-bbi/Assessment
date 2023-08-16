def tic_tac_toe (grid):
    n=3
    for i in range(n):
        if(grid[i][0] == grid[i][1] == grid[i][2] != ''):
            return grid[i][0]
        
        if(grid[0][i] == grid[1][i] == grid[2][i] != ''):
            return grid[0][i]
        
    if(grid[0][0] == grid[1][1] == grid[2][2] != ''):
        return grid[0][0]
    if(grid[2][0] == grid[1][1] == grid[0][2] != ''):
        return grid[2][0]
    
    for i in range(n):
        if(grid[i][0] == '' or grid[i][1] == '' or grid[i][2] ==''):
            return 'pending'
    return 'draw'
    
grid = [['x','x','o'],
        ['o','o','x'],
        ['x','o','o']]
    
result = tic_tac_toe(grid)
print("Winner is : ", result)