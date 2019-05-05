function [R] = eco2R(S, SL, TS)
    %suppongo N = 0, alfa = 0
    R = 10.^((SL - S + TS) / 40);
end