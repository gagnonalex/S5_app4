% Auteurs : Axel Bosco et Alexandre Gagnon
% CIPs : bosa2002 et gaga2515
% Date : 28 f�vrier 2018
% Description : Code qui permet de calculer les coefficients du
% polyn�me d'ordre 5 du senseur � effet Hall.
clear all;
close all;

%Array des 16 valeurs mesur�es. Allant de +4 � -2cm en valeur nominale.
d = [0 0.4 0.8 1.2 1.6 2.0 2.4 2.8 3.2 3.6 4.0 4.4 4.8 5.2 5.6 6.0];
Nv = [3.2 3.16 2.96 2.74 2.38 2.06 1.62 1.34 1.02 0.73 0.55 0.39 0.27 0.21 0.14 0.11];

%Array des valeurs calcul�es par la r�gression.
dreg = zeros(1,length(Nv));

% 16 - 6
NmoinsM = 10;
COEFFS = Coefficients(Nv, d, NmoinsM);

%Calcul des valeurs � l'aide de la fonction.
for i = 1:length(Nv)
   dreg(i) = (COEFFS(6) * (Nv(i).^5.0)) + (COEFFS(5) * (Nv(i).^4.0))...
       + (COEFFS(4) * (Nv(i).^3.0)) + (COEFFS(3) * (Nv(i).^2.0))...
       + (COEFFS(2) * Nv(i)) + COEFFS(1);
end

plot(Nv,d, 'b-o', Nv, dreg, 'r-*');
title('Comparaison des valeurs mesur�es et des valeurs par r�gression');
xlabel('Nv (V)');
ylabel('d (cm)');
grid on
legend('Valeurs mesur�es','Valeurs par r�gression');