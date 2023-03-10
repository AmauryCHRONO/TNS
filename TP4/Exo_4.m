clear variables; close all;hold on

% Lecture du signal n°8
[y,Fs]= audioread('signal8.wav');

%Variables
Fc=2800; %Fréquence de coupure
Frc=Fc/Fs; % Fréquence de coupure réduite
n=7; % Ordre du filtre
Rs=60;
Rp=1;

%Création du filtre analogique
[b,a]=ellip(n,Rp,Rs,Fc*2*pi,'s');

[h,f]=freqs(b,a,2000);

figure(1); 
subplot(211);plot(f/(2*pi),20*log(abs(h)));xlabel('Fréquence (en Hz)');ylabel('Gain (en dB)');title('Diagramme de bode du gain');
subplot(212);plot(f/(2*pi),unwrap(angle(h)));xlabel('Fréquence (en Hz)');ylabel('Phase (en rad)');title('Diagramme de bode de la phase');

[numd,dend]=bilinear(b,a,Fs,Fc);
[g,t]=impz(numd,dend,[],Fs);
[G, T] = freqz(numd, dend, 2000, Fs);
Yfiltre = filter(numd, dend, y);
sgram(Yfiltre, Fs, 70,4);

soundsc(Yfiltre,Fs);


figure(2); 
subplot(221);plot(t,g);title('Réponse impultionelle');
subplot(222);zplane(roots(b),roots(a));xlabel('Partie réele');ylabel('Partie Imaginaire');title('Diagramme pôle-zéro');
subplot(223);plot(T,abs(G));xlabel('Fréquence (en Hz)');ylabel('Gain (en dB)');title('Diagramme de bode du gain');
subplot(224);plot(T,unwrap(angle(G)));xlabel('Fréquence (en Hz)');ylabel('Phase (en rad)');title('Diagramme de bode de la phase');
