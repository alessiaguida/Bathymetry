function [XY, Z] = matrix2scatteredData(M, step_x, step_y, res_x, res_y)
    [n, m] = size(M);
    XY = zeros((n * m), 2);
    Z = zeros((n * m), 1);
    for i=1:1:n
        for j=1:1:m
            XY(((i - 1) * m + j), 1) = (i - 1) * step_x + 1;
            %if mod(i, 2) == 1
            XY(((i - 1) * m + j), 2) = (j - 1) * step_y + 1;
            %else
            %    XY(((i - 1) * m + j), 2) = (j - 1) * step_y + 1 + res_y - (m-1) * step_y -1;
            %end
            Z(((i - 1) * m + j), 1) = M(i, j);
        end
    end
end