function fun_exo_2(f0,N)
i=complex(0,1);

k=0:1:34;
s=cos(2*pi*f0*k);
S=fft(s,N);

f=0:1/N:1-1/N;

figure(1);stem(k,s);title('Séquance du signale s');
figure(2);subplot(221);stem(f,real(S));title('Partie reéle de S');
          subplot(222);stem(f,imag(S));title('Partie imaginaire de S');
          subplot(223);stem(f,abs(S));title('Module de S');
          subplot(224);stem(f,angle(S));title('Phase de S');
end
