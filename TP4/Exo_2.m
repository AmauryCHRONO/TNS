clear variables; close all;hold on

% Lecture du signal n°8
[y,Fs]= audioread('signal8.wav');

% Ecoute du signal
soundsc(y,Fs);

% Affichage des caractéristique du signal
sgram(y,Fs,70,1)

% Variables
Fc=3000; % Fréquence de coupure
Frc=Fc/Fs; % Fréquence de coupure réduite
M=40; % Longeur du filtre
N=0:M; % Vecteur pour afficher la réponce impultionnelle

% Fenêtre des filtres
w1=rectwin(M+1); % Fenêtre rectangulaire du filtre
w2=hamming(M+1); % Fenêtre Hamming du filtre
w3=hann(M+1);  % Fenêtre Hanning du filtre
w4=blackman(M+1);  % Fenêtre Blackman du filtre

% Création du filtre
b1=fir1(M,Frc*2,w1); % Filtre rectangulaire
b2=fir1(M,Frc*2,w2); % Filtre Hamming
b3=fir1(M,Frc*2,w3); % Filtre Hanning
b4=fir1(M,Frc*2,w4); % Filtre Blackman

% Récupération de la réponce fréquencielle du filtre
[h1,f1]=freqz(b1,1,2000,Fs); % Rectangulaire
[h2,f2]=freqz(b2,1,2000,Fs); % Hamming
[h3,f3]=freqz(b3,1,2000,Fs); % Hanning
[h4,f4]=freqz(b4,1,2000,Fs); % Blackman

% Affichage des résultats
figure(2); % Rectangulaire
subplot(221);stem(N,b1);title('Réponce  impulsionnelle');
subplot(222);zplane(roots(b1),[]);xlabel('Partie réele');ylabel('Partie Imaginaire');title('Diagramme pôle-zéro');
subplot(223);plot(f1,20*log(abs(h1)));xlabel('Fréquence (en Hz)');ylabel('Gain (en dB)');title('Diagramme de bode du gain');
subplot(224);plot(f1,unwrap(angle(h1)));xlabel('Fréquence (en Hz)');ylabel('Phase (en rad)');title('Diagramme de bode de la phase');

figure(3); % Hamming
subplot(221);stem(N,b2);title('Réponce  impulsionnelle');
subplot(222);zplane(roots(b2),[]);xlabel('Partie réele');ylabel('Partie Imaginaire');title('Diagramme pôle-zéro');
subplot(223);plot(f2,20*log10(abs(h2)));xlabel('Fréquence (en Hz)');ylabel('Gain (en dB)');title('Diagramme de bode du gain');
subplot(224);plot(f2,unwrap(angle(h2)));xlabel('Fréquence (en Hz)');ylabel('Phase (en rad)');title('Diagramme de bode de la phase');

figure(4); % Hanning
subplot(221);stem(N,b3);title('Réponce  impulsionnelle');
subplot(222);zplane(roots(b3),[]);xlabel('Partie réele');ylabel('Partie Imaginaire');title('Diagramme pôle-zéro');
subplot(223);plot(f3,20*log(abs(h3)));xlabel('Fréquence (en Hz)');ylabel('Gain');title('Diagramme de bode du gain');
subplot(224);plot(f3,unwrap(angle(h3)));xlabel('Fréquence (en Hz)');ylabel('Phase (en rad)');title('Diagramme de bode de la phase');

figure(5); % Blackman
subplot(221);stem(N,b4);title('Réponce  impulsionnelle');
subplot(222);zplane(roots(b4),[]);xlabel('Partie réele');ylabel('Partie Imaginaire');title('Diagramme pôle-zéro');
subplot(223);plot(f4,20*log10(abs(h4)));xlabel('Fréquence (en Hz)');ylabel('Gain (en dB)');title('Diagramme de bode du gain');
subplot(224);plot(f4,unwrap(angle(h4)));xlabel('Fréquence (en Hz)');ylabel('Phase (en rad)');title('Diagramme de bode de la phase');

