close all; clear variables;i=1i;
%Variables
mue=20000; % Fréquence d'échantillonage

mu1=2625; % Fréquence de perturbation n°1 
mu2=7280; % Fréquence de perturbation n°1 
mu3=10000; % Fréquence demandée

load signal7.mat;

s1=8*sin(2*pi*mu1*t);
s2=8*sin(2*pi*mu2*t);
signalB=s+s1+s2;


% Fréquence normaliser
f1=mu1/mue; 
f2=mu2/mue;
f3=mu3/mue;

% Zéros du filtre 
zf11=exp(2*i*pi*f1);
zf12=conj(zf11);
zf21=exp(2*i*pi*f2);
zf22=conj(zf21);
zf3=exp(2*i*pi*f3);

% Polynome du filtre
P=real(poly([zf11,zf12,zf21,zf22,zf3]));

% Calcule de vlaeur pour le filtre
fzero=[zf11,zf21,zf3];
Zpoly=polyval(P,fzero);

% Recherche du gain pour le filtre
poly1=polyval(P,1);
b0=1/poly1;

% Application du gain pour le filtre
P=b0.*P;

% Réponce fréquencielle du filtre
[h,w]=freqz(P,1,2000);


signalF=filter(P,1,signalB);

TFS=fft(s,20000);
TFSB=fft(signalB,20000);
TFSF=fft(signalF,20000);

fs=0:1/mue:1-(1/mue);

% Affichage du résultat
figure (1);
subplot(221);zplane(roots(P),[]);xlabel('Partie réele');ylabel('Partie Imaginaire');title('Diagramme pôle-zéro');
subplot(222);stem(0:1:5,P);title('Réponce  impulsionnelle');
subplot(223);plot(w,20*log10(abs(h)));xlabel('Fréquence');ylabel('Gain (dB)');title('Diagramme de bode du gain');
subplot(224);plot(w,unwrap(angle(h)));xlabel('Fréquence');ylabel('Phase (rad)');title('Diagramme de bode de la phase');

% Affichage du signal
figure(2);
subplot(311);plot(t,s);title('signal n°7');
subplot(312);plot(t,signalB);title('signal n°7 bruité');
subplot(313);plot(t,signalF);title('signal n°7 filtré');

figure(3);
subplot(311);plot(fs,abs(TFS));title('FFT sur 20000 points du signal n°7');
subplot(312);plot(fs,abs(TFSB));title('FFT sur 20000 du signal n°7 bruité');
subplot(313);plot(fs,abs(TFSF));title('FFT sur 20000 du signal n°7 filtré');