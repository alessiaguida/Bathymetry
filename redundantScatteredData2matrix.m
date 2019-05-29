function [M] = redundantScatteredData2matrix(XY, Z, dim_x, dim_y)
    M = zeros(dim_x, dim_y);
    C = zeros(dim_x, dim_y);
    [num_points, num_coord] = size(Z);
    for i = 1:1:num_points
        %filling matrix with coordinates
        M(XY(i, 1), XY(i, 2)) = M(XY(i, 1), XY(i, 2)) + Z(i);
        C(XY(i, 1), XY(i, 2)) = C(XY(i, 1), XY(i, 2)) + 1;
    end
    for i = 1:dim_x
        for j = 1:dim_y
            M(i,j) = M(i,j) / C(i,j);
        end
    end
end