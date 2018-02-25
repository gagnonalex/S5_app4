function [ P ] = Approximation(Xk, Yk, NM)

N = length(Xk);
M = N - NM;
A = ones(M);	%Mem prealloc.

for i = 1:length(Yk)
    for j = 1:M
        A(i,j) = Xk(i).^(j-1);
    end
end
P = pinv(A)*Yk';	%matrice resultante.
end