int: n;
int: total_black_balls;

int: total_blocks = n^3;
int: total_lines = 3*n^2 + 6*n + 4;

% 1 if black ball, 0 if white ball
array[1..total_blocks] of var 0..1: balls;

% 1 if line is monochromatic, 0 otherwise
array[1..total_lines] of var 0..1: lines; 

% Helper function to convert 3D coordinates (x, y, z) to a flat 1D index (1..3^n)
function int: idx(int: x, int: y, int: z) = 
    let {
        int: val = x + (y - 1) * n + (z - 1) * n^2
    } in val;


array[1..total_lines, 1..n] of int: line_cells = 
    let {
        array[int] of int: ortho_x = [ idx(i, y, z) | y, z in 1..n, i in 1..n ],
        array[int] of int: ortho_y = [ idx(x, i, z) | x, z in 1..n, i in 1..n ],
        array[int] of int: ortho_z = [ idx(x, y, i) | x, y in 1..n, i in 1..n ],
        
        array[int] of int: diag2d_xy1 = [ idx(i, i, z) | z in 1..n, i in 1..n ],
        array[int] of int: diag2d_xy2 = [ idx(i, n - i + 1, z) | z in 1..n, i in 1..n ],
        
        array[int] of int: diag2d_xz1 = [ idx(i, y, i) | y in 1..n, i in 1..n ],
        array[int] of int: diag2d_xz2 = [ idx(i, y, n - i + 1) | y in 1..n, i in 1..n ],
        
        array[int] of int: diag2d_yz1 = [ idx(x, i, i) | x in 1..n, i in 1..n ],
        array[int] of int: diag2d_yz2 = [ idx(x, i, n - i + 1) | x in 1..n, i in 1..n ],
        
        array[int] of int: diag3d_1 = [ idx(i, i, i) | i in 1..n ],
        array[int] of int: diag3d_2 = [ idx(i, i, n - i + 1) | i in 1..n ],
        array[int] of int: diag3d_3 = [ idx(i, n - i + 1, i) | i in 1..n ],
        array[int] of int: diag3d_4 = [ idx(i, n - i + 1, n - i + 1) | i in 1..n ],
        
        array[int] of int: all_flat = ortho_x ++ ortho_y ++ ortho_z ++ 
                                      diag2d_xy1 ++ diag2d_xy2 ++ 
                                      diag2d_xz1 ++ diag2d_xz2 ++ 
                                      diag2d_yz1 ++ diag2d_yz2 ++ 
                                      diag3d_1 ++ diag3d_2 ++ diag3d_3 ++ diag3d_4
    } in array2d(1..total_lines, 1..n, all_flat);


constraint forall(i in 1..total_lines) (
    sum(j in 1..n)(balls[line_cells[i, j]]) - lines[i] <= n - 1
);

constraint forall(i in 1..total_lines) (
    sum(j in 1..n)(balls[line_cells[i, j]]) + lines[i] >= 1
);

constraint sum(j in 1..total_blocks)(balls[j]) = total_black_balls;

solve minimize sum(i in 1..total_lines)(lines[i]);