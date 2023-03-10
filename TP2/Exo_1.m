clear variables;close all;
i=complex(0,1);

%Variables
M1=12;% Longueur de la séquence de la fonction 
M2=5;
M3=40;
N=2048; %Pas du vecteur des fréquences TFTD

%Création du vecteur des fréquences de la TFTD
f=-1.5:1/N:(1.5-1/N);
%Création du vecteur de fréquence réduite
fr=0:1/N:1-1/N;
%Création du veteur de fréquence reduite addapter a la FFTSHIFT
frt=fr-0.5;

%TFD
[S1,s1]=fun_exo_1(M1);
[S2,s2]=fun_exo_1(M2);
[S3,s3]=fun_exo_1(M3);

%Partie Reéle de S(n)
RS1=real(S1);
RS2=real(S2);
RS3=real(S3);
%Partie imaginaire de S(n)
IS1=imag(S1);
IS2=imag(S2);
IS3=imag(S3);

%TFTD
X=1./(1-0.91.*exp(-2*i*pi*f));

%Partie reéle de X
RX=real(X);
%Partie imaginaire de X
IX=imag(X);

%FFTSHIFT
SF1=fftshift(S1);
SF2=fftshift(S2);
SF3=fftshift(S3);

%Partie reéle de SF
RSF1=real(SF1);
RSF2=real(SF2);
RSF3=real(SF3);
%Partie imaginaire de SF
ISF1=imag(SF1);
ISF2=imag(SF2);
ISF3=imag(SF3);

%Affichage des résultats
figure(2);
          subplot(221);plot(f,RX,fr,RS1,fr,RS2,fr,RS3);title('Partie reéles');legend('TFTD','TFD M=10','TFD M=5','TFD M=40');
          subplot(222);plot(f,IX,fr,IS1,fr,IS2,fr,IS3);title('Partie imaginaires');legend('TFTD','TFD M=10','TFD M=5','TFD M=40');
          subplot(223);plot(f,abs(X),fr,abs(S1),fr,abs(S2),fr,abs(S3));title('Modules');legend('TFTD','TFD M=10','TFD M=5','TFD M=40');
          subplot(224);plot(f,angle(X),fr,angle(S1),fr,abs(S2),fr,abs(S3));title('Phases');legend('TFTD','TFD M=10','TFD M=5','TFD M=40');

figure(3);
          subplot(221);plot(f,RX,frt,RSF1,frt,RSF2,frt,RSF3);title('Partie reéles');legend('TFTD','FFTSHIFT pour M=12','FFTSHIFT pour M=5','FFTSHIFT pour M=40');
          subplot(222);plot(f,IX,frt,ISF1,frt,ISF2,frt,ISF3);title('Partie imaginaires');legend('TFTD','FFTSHIFT pour M=12','FFTSHIFT pour M=5','FFTSHIFT pour M=40');
          subplot(223);plot(f,abs(X),frt,abs(SF1),frt,abs(SF2),frt,abs(SF3));title('Modules');legend('TFTD','FFTSHIFT pour M=12','FFTSHIFT pour M=5','FFTSHIFT pour M=40');
          subplot(224);plot(f,angle(X),frt,angle(SF1),frt,angle(SF3),frt,angle(SF3));title('Phases');legend('TFTD','FFTSHIFT pour M=12','FFTSHIFT pour M=5','FFTSHIFT pour M=40');
