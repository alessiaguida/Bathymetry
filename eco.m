%--------------eco.m--------------
function [S] = eco(R, SL, DT, TS, alfa, N)
    %alfa coefficiente di attenuazione
    TL = 20 * log10(R) + alfa * R;
    S = SL - 2 * TL + TS;
    SNR = S - N;
    if SNR < DT
        S = 0;
    end
end