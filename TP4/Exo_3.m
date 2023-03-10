clear variables; close all;hold on

% Lecture du signal n°8
[y,Fs]= audioread('signal8.wav');

%Variables
Fc=2800; %Fréquence de coupure
Frc=Fc/Fs; % Fréquence de coupure réduite
M=300; % Longeur du filtre
N=0:M; % Vecteur pour afficher la réponce impultionnelle

% Fenêtre des filtres
w1=rectwin(M+1); % Fenêtre du filtre
w3=hann(M+1); % Fenêtre Hanning

% Création du filtre
b1=fir1(M,Frc*2,w1); % Filtre rectangulaire
b3=fir1(M,Frc*2,w3); % Filtre Hanning


% Récupération de la réponce fréquencielle du filtre
[h1,f1]=freqz(b1,1,2000,Fs);
[h3,f3]=freqz(b3,1,2000,Fs);

% Création des filtres
yF1=filter(b1,1,y);
yF3=filter(b3,1,y);

% Affichage des signaux
sgram(yF1,Fs,70,3)
sgram(yF3,Fs,70,7)

% Ecoute du signal filtré
soundsc(yF3,Fs);

