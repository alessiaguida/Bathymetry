function [R] = eco2R(S, SL, TS, alfa)
    syms r;
    %assuming N = 0, alfa = 0
    %R = 10.^((SL - S + TS) / 40);
    TL = 20 * log10(r) + alfa * r;
    R = solve(S == SL - 2 * TL + TS);
    
end