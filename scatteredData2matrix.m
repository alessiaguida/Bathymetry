function [M] = scatteredData2matrix(XY, Z, dim_x, dim_y)
    M = zeros(dim_x, dim_y);
    [num_points, num_coord] = size(Z);
    for i = 1:1:num_points
        %filling matrix with coordinates
        M(XY(i, 1), XY(i, 2)) = Z(i);
    end
end