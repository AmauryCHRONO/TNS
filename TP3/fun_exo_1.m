function fun_exo_1(N)
% entrées
% N : nombre de points de la TFD

% les vecteurs abcisses des séquences x et h 
k_x = 0:1:10;
k_h = 5:1:11;


% calcul des séquences x et h
x = 6-abs(k_x -5);
h = abs(k_h -8)-1;

h=[zeros(1,5) h];
k_h=[zeros(1,5) k_h];

% on affiche les séquences
figure(1); 
subplot(411); stem(k_x, x);title('séquence x');
subplot(412); stem(k_h, h);title('séquence h');


% calcul des TFD
X = fft(x,N);
H = fft(h,N);

% convolution dans fourrier
Y = X.*H;
% abscisses de la convolution
k_y = 0:1:N-1;

y=ifft(Y,N);

% affichage concvolution 
subplot(413); stem(k_y, Y);title('convolution dans fourier');
subplot(414);stem(k_y,y);title('convolution x et h');
end