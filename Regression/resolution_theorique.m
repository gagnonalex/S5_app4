clear all
close all

n = 2^16;
Nv = zeros(1,n);
d = zeros(1,n);
marche = zeros(1,(n-1));

COEFFS = [6.7965 -9.5149 11.0775 -7.0173 2.1136 -0.2425];

for i = 1:n
    Nv(i) = ((i - 1) / n * 3.3);
end

for i = 1:n
   d(i) = (COEFFS(6) * (Nv(i).^5.0)) + (COEFFS(5) * (Nv(i).^4.0)) + (COEFFS(4) * (Nv(i).^3.0)) + (COEFFS(3) * (Nv(i).^2.0)) + (COEFFS(2) * Nv(i)) + COEFFS(1);
end

for i = 1:(n - 1)
    marche(i) = d(i) - d(i+1);
end

figure;
plot(Nv,d);
title('Régression sur 2^{16} valeurs');
xlabel('Nv (V)');
ylabel('d (cm)');
grid on

Nv(:,n) = [];

figure;
plot(Nv,marche);
title('Résolution théorique');
xlabel('Nv (V)');
ylabel('marche (cm)');
grid on