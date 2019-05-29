function [XY, Z] = sparseMatrix2scatteredData(M, step_x, step_y)
    [n, m] = size(M);
    h = sum(sum(isfinite(M)));
    XY = zeros(h, 2);
    Z = zeros(h, 1);
    h = 1;
    for i=1:1:n
        for j=1:1:m
            %step_x is how much we move along the row (how many column indexes)
            %step_y is how much we move along the column (how many row indexes)
            if isfinite(M(i,j))
                XY(h, 1) = (i - 1) * step_x + 1;
                XY(h, 2) = (j - 1) * step_y + 1;
                Z(h, 1) = M(i, j);
                h = h + 1;
            end
        end
    end
end