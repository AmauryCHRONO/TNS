function [S,s] = fun_exo_1(M)

%Entrés
% M = le nombre de point de la séquence

% Création du veteur point
k=0:1:M-1;

%Création de la séquence s
s=0.91.^k;

%Calcule de la TFD de s sur 2048 points
S=fft(s,2048);
R=real(S);
I=imag(S);
%Affichage des résultats
figure(1);subplot(311);stem(k,s);title('Séquance s sur M point');
          subplot(312);plot(R);title('Parite reéle de la TFD de s sur 2048 points');axis([0 2048 0 10]);
          subplot(313);plot(I);title('Parite imaginaire de la TFD de s sur 2048 points');axis([0 2048 -5 5]);
end