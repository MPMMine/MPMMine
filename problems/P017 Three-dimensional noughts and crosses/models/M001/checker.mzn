int: n;
int: total_black_balls;
int: total_blocks = n^3;
int: total_lines = 3*n^2 + 6*n + 4;
array[1..total_blocks] of 0..1: balls;
array[1..total_lines] of 0..1: lines; 
int: count_ortho = 3 * n^2;
int: count_2d    = 6 * n;
int: count_3d    = 4;
int: end_ortho = count_ortho;
int: end_2d    = end_ortho + count_2d;
int: end_3d    = end_2d + count_3d;


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

test check(bool: b, string: s) = 
    if b then true else trace_stdout("ERROR: " ++ s ++ "\n", false) endif;

function string: line_type_name(int: i) =
    if i <= n^2 then "Orthogonal X-Line (Row)"
    elseif i <= 2 * n^2 then "Orthogonal Y-Line (Column)"
    elseif i <= end_ortho then "Orthogonal Z-Line (Pillar)"
    elseif i <= end_ortho + 2*n then "2D Diagonal on XY Plane"
    elseif i <= end_ortho + 4*n then "2D Diagonal on XZ Plane"
    elseif i <= end_2d then "2D Diagonal on YZ Plane"
    else "3D Main Space Diagonal"
    endif;

array[int] of bool: checks = 
    % Monochromatic lines count
    [ check(
        sum(j in 1..n)(balls[line_cells[i, j]]) - lines[i] <= n - 1 /\
        sum(j in 1..n)(balls[line_cells[i, j]]) + lines[i] >= 1,
        "Line " ++ show(i) ++ " (" ++ line_type_name(i) ++ ") is incorrectly marked. " ++
        "Cell values are: " ++ show([balls[line_cells[i, j]] | j in 1..n]) ++ 
        ", but lines[" ++ show(i) ++ "] = " ++ show(lines[i]))
    | i in 1..total_lines ]
    ++
    % Total black balls count
    [ check(
        sum(j in 1..total_blocks)(balls[j]) = total_black_balls,
        "The number of black balls do not match the number of total black balls. Expected " ++ 
        show(total_black_balls) ++ " but got " ++ show(sum(j in 1..total_blocks)(balls[j]))
    )];

output [
    if forall(checks)
    then "CORRECT: all constraints hold.\n"
    else "INCORRECT: See error log above for specific violations.\n"
    endif
];