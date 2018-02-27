% Auteurs : Axel Bosco et Alexandre Gagnon
% CIPs : bosa2002 et gaga2515
% Date : 28 février 2018
% Description : Fonction pour trouver les coefficients d'un polynôme par
% approximation par projection orthogonale.
function [ P ] = Coefficients(Xk, Yk, NM)

N = length(Xk);
M = N - NM;
A = ones(M);	%Mem prealloc.

% Approximation par projection orthogonale
for i = 1:length(Yk)
    for j = 1:M
        A(i,j) = Xk(i).^(j-1);
    end
end
P = pinv(A)*Yk';	%matrice resultante.
end