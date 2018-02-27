clear all
close all

%Valeur maximale de sur 12 bits.
n = 2^12;

%Création des différents array nécessaires pour les calculs.
Nv = zeros(1,n);
d = zeros(1,n);
marche = zeros(1,(n-1));

%Coefficients déterminés par la régression
COEFFS = [6.7965 -9.5149 11.0775 -7.0173 2.1136 -0.2425];

%Boucle pour créer les 2^12 valeurs de tension.
for i = 1:n
    Nv(i) = ((i - 1) / n * 3.3);
end

%Boucle pour calculer les valeurs de d selon les tensions.
for i = 1:n
   d(i) = (COEFFS(6) * (Nv(i).^5.0)) + (COEFFS(5) * (Nv(i).^4.0))...
       + (COEFFS(4) * (Nv(i).^3.0)) + (COEFFS(3) * (Nv(i).^2.0))...
       + (COEFFS(2) * Nv(i)) + COEFFS(1);
end

%Boucle pour calculer les marches.
for i = 1:(n - 1)
    marche(i) = d(i) - d(i+1);
end

figure;
plot(Nv,d);
title('Régression sur 2^{12} valeurs');
xlabel('Nv (V)');
ylabel('d (cm)');
grid on

%Suppression de la dernière valeur pour avoir des array de même dimension
Nv(:,n) = [];

figure;
plot(Nv,marche);
title('Résolution théorique');
xlabel('Nv (V)');
ylabel('marche (cm)');
grid on