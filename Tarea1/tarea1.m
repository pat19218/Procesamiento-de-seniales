%Tarea 1
%Cristhofer Isaac Patzán Martínez 19218
%
%
%% Problema 1
%[x, fs] = audioread('filename.extension'); para leer audios

[x1, fs1] = audioread('beat.wav');
[x2, fs2] = audioread('bass.wav');
%sound(x1, fs1);
%sound(x1, 0.5 * fs1);
%sound(x1, 0.75 * fs1);
%sound(x1, 1.5 * fs1);
%sound(x1, 2 * fs1);

%si el valor a multiplicar es entre 0 y 1 el audio va más lento, por otro
%lado si el valor a multiplicar es mayor a 1 entonces el audio aumenta de
%velocidad

%sound(x1, fs1);
%sound(x2, fs2);
x_mix = (0.3 * x1) + (0.85 * x2);
%max(x_mix)
%sound(x_mix, fs1);


%empiezo a hacer grafica
figure('Name', 'figura 1 CRIS_PAT','NumberTitle','off');    %ventana
%Encabezado
hi = sgtitle('Mixer, CrisPat 19218, 1IE30322020221, sección:22');
hi.FontSize = 18;
hi.Color = 'r';
hi.FontName = 'verdana';

subplot(3,2,1); %subplot(filas, columnas, ubicacion)
plot(x1(:,1));
grid minor;
ylabel('Amplitud senial 1 L', 'FontSize', 14, 'interpreter', 'latex');
xlabel('tiempo segundos', 'FontSize', 14, 'interpreter', 'latex');

subplot(3,2,2); %subplot(filas, columnas, ubicacion)
plot(x1(:,2));
grid minor;
ylabel('Amplitud senial 1 R', 'FontSize', 14, 'interpreter', 'latex');
xlabel('tiempo segundos', 'FontSize', 14, 'interpreter', 'latex');


subplot(3,2,3); %subplot(filas, columnas, ubicacion)
plot(x2(:,1));
grid minor;
ylabel('Amplitud senial 2 L', 'FontSize', 14, 'interpreter', 'latex');
xlabel('tiempo segundos', 'FontSize', 14, 'interpreter', 'latex');

subplot(3,2,4); %subplot(filas, columnas, ubicacion)
plot(x2(:,2));
grid minor;
ylabel('Amplitud senial 2 R', 'FontSize', 14, 'interpreter', 'latex');
xlabel('tiempo segundos', 'FontSize', 14, 'interpreter', 'latex');


subplot(3,2,5); %subplot(filas, columnas, ubicacion)
plot(x_mix(:,1));
grid minor;
ylabel('Amplitud mixer L', 'FontSize', 14, 'interpreter', 'latex');
xlabel('tiempo segundos', 'FontSize', 14, 'interpreter', 'latex');

subplot(3,2,6); %subplot(filas, columnas, ubicacion)
plot(x_mix(:,2));
grid minor;
ylabel('Amplitud mixer R', 'FontSize', 14, 'interpreter', 'latex');
xlabel('tiempo segundos', 'FontSize', 14, 'interpreter', 'latex');


%x_mix = (0.6 * x1) + (0.5 * x2);
%max(x_mix)


[x3, fs3] = audioread('harmony.wav');
%sound(x3, fs3);

% Cargar archivos de audio
% -> x1 = batería
% -> x2 = bajo
% -> x3 = armonía

% Tamaños de las señales
N1 = length(x1);
N2 = length(x2);
N = length(x3);

% Arrays para almacenar la extensión periódica de x1[n] y x2[n]
y1 = zeros(size(x3));
y2 = zeros(size(x3));

% Realizar extensión periódica por medio de modulo indexing. La función
% mod de MATLAB puede ser útil. Recordar también que el primer índice en 
% los arrays de MATLAB es 1, no 0 como es usual en los lenguajes de 
% programación.

%Debido a que los sonidos que tenemos solo tienen hasta 264600 datos del
%sonido, mientras que harmony tiene un poco más del doble. Para ello
%debemos dividir/segmentar harmony para que saber cuantas veces se debe
%repetir las señales ya guardadas.
for n = 0:(N-1)
    
    if n > 529199
        y1(n+1, :) = x1(n-529199, :);
        y2(n+1, :) = x2(n-529199, :);
    elseif n > 264599
        y1(n+1, :) = x1(n-264599, :);
        y2(n+1, :) = x2(n-264599, :);
    elseif n <= 264599
        y1(n+1, :) = x1(n+1, :);
        y2(n+1, :) = x2(n+1, :);
    end
        
end

%x_mix_2 = (0.1 * y1) + (0.8 * y2) + (0.4 * x3);
%max(x_mix_2)
%sound(x_mix_2, fs1);

% Se genera una señal rampa que cambie desde 0 hasta 1, con la misma 
% longitud que la pista de armonía.
w = 0:1/(N-1):1;


%empiezo a hacer grafica
figure('Name', 'figura 2 CRIS_PAT','NumberTitle','off');    %ventana
%Encabezado
hi = sgtitle('artificio, CrisPat 19218, 1IE30322020221, sección:22');
hi.FontSize = 18;
hi.Color = 'r';
hi.FontName = 'verdana';

plot(w)
grid minor;
ylabel('senial lineal', 'FontSize', 14, 'interpreter', 'latex');
xlabel('muestras', 'FontSize', 14, 'interpreter', 'latex');


% Implementar el fade-in como la multiplicación de la señal rampa con la
% pista de armonía.
y3 = w' .* x3;
%sound(y3, fs1);
max(y3);

en_fade_in = true; % Seleccionar si se desea o no el efecto de fade-in.

% Implementar el mixer digital que combine la pista de armonía con las
% extensiones periódicas de las pistas de batería y bajo.
if(en_fade_in)
    x_mix =(0.1 * y1) + (0.7 * y2) + (0.8 * y3);
else
    x_mix =(0.1 * y1) + (0.75 * y2) + (0.4 * x3);
end

% Probar si los resultados son los esperados
sound(x_mix, fs1);
max(x_mix);

%% %Problema 5

load ecg_data.mat

%transformo las señales y veo el largo
x_ecg = fft(ecg);
x_ecg_noisy = fft(ecg_noisy);
N = length(x_ecg);


x_xcmd_centrada = ecg_noisy - mean(ecg_noisy);

x_noisy = fft(x_xcmd_centrada);
N = length(ecg_noisy);

%db = mag2db(abs(x_noisy));
k = 0:N-1;
dw = 2*pi/N; % Frecuencias armónicas
f_discreta = k*dw/pi; %normalizada k*dw/pi (x pi rad/muestra)

figure(3)
stem(f_discreta, abs(x_noisy));
grid minor;
ylabel('$\left|X[k]\right|$', 'FontSize', 14, 'interpreter', 'latex');
xlabel('$\omega \ (\times \pi \ \mathrm{ rad/}\mathrm{muestra})$', 'FontSize', 14,'interpreter', 'latex');

%dB = -254.7   rad/muestra = 0.8
%dB = -254.7   rad/muestra = 1.2
%magnitud = 90110

for lugar = 1:N
    if (abs(x_noisy(lugar)) > 90000 )
       x_noisy(lugar) = 0;
    end    
end

figure(4)
stem(f_discreta, abs(x_noisy));
grid minor;
ylabel('$\left|X[k]\right|$', 'FontSize', 14, 'interpreter', 'latex');
xlabel('$\omega \ (\times \pi \ \mathrm{ rad/}\mathrm{muestra})$', 'FontSize', 14,'interpreter', 'latex');

resultante = ifft(x_noisy) + mean(ecg_noisy);

figure(5)
plot(abs(resultante));
grid minor;


noisy = x_ecg_noisy - x_ecg ;

problema = ifft(noisy);
limpia = ecg_noisy - problema;
%----------------------------------------cagadales-----------------------
%empiezo a hacer grafica
figure('Name', 'figura 2 CRIS_PAT','NumberTitle','off');    %ventana
%Encabezado
hi = sgtitle('ECG retiro de ruido, CrisPat 19218, 1IE30322020221, sección:22');
hi.FontSize = 18;
hi.Color = 'r';
hi.FontName = 'verdana';


subplot(2,1,1)
plot(ecg)
grid minor;
ylabel('Amplitud', 'FontSize', 14, 'interpreter', 'latex');
xlabel('t', 'FontSize', 14, 'interpreter', 'latex');
title('ECG original')

subplot(2,1,2)
plot(limpia)
grid minor;
ylabel('Amplitud', 'FontSize', 14, 'interpreter', 'latex');
xlabel('t', 'FontSize', 14, 'interpreter', 'latex');
title('ECG sin ruido')
% subplot(4,1,1)
% plot(ecg)
% grid minor;
% ylabel('Amplitud', 'FontSize', 14, 'interpreter', 'latex');
% xlabel('t', 'FontSize', 14, 'interpreter', 'latex');
% subplot(4,1,2)
% plot(ecg_noisy)
% grid minor;
% ylabel('Amplitud', 'FontSize', 14, 'interpreter', 'latex');
% xlabel('t', 'FontSize', 14, 'interpreter', 'latex');
% subplot(4,1,3)
% plot(problema)
% grid minor;
% ylabel('Amplitud', 'FontSize', 14, 'interpreter', 'latex');
% xlabel('t', 'FontSize', 14, 'interpreter', 'latex');
% subplot(4,1,4)
% plot(limpia)
% grid minor;
% ylabel('Amplitud', 'FontSize', 14, 'interpreter', 'latex');
% xlabel('t', 'FontSize', 14, 'interpreter', 'latex');
