function [S] = eco(R, SL, DT, TS, alfa, N)
    TL = 20 * log10(R) + alfa * R;
    S = SL - 2 * TL + TS;
    SNR = S - N;
    if SNR < DT
        %signal lost
        S = 0;
    end
end