n = 0:4;
k = pi .*n;
re = cos(k); 
ima = sin(k);
%empiezo a hacer grafica
figure('Name', 'figura 1 CRIS_PAT','NumberTitle','off');    %ventana
%Encabezado
hi = sgtitle('señales');
hi.FontSize = 18;
hi.Color = 'r';
hi.FontName = 'verdana';

subplot(2,1,1); %subplot(filas, columnas, ubicacion)
stem(n, re, 'filled', 'k');
xlabel('n');
ylabel('real');
grid minor;
subplot(2,1,2); %subplot(filas, columnas, ubicacion)
stem(n, ima, 'filled', 'k'); 
xlabel('n');
ylabel('imaginario');
grid minor;


X = [1,-1,1,-1]; %senial dada
X = fft(X, 1); % fft(senial, cantidad de k)
abs(X)   %magnitud
angle(X) %angulo

