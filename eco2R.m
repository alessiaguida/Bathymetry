%function that computes distance from returned signal using sonar equation
function [R] = eco2R(S, SL, TS, alfa)
    syms r;
    TL = 20 * log10(r) + alfa * r;
    R = solve(S == SL - 2 * TL + TS);
end