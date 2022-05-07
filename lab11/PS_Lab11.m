%% Procesamiento de Señales - Laboratorio (2022)
%  Laboratorio 11
% Cristhofer Isaac Patzán Martínez 
% Carne: 19218, IE3032 seccion 20

%% Primera Parte
% Cargue los datos del archivo PS_Lab11_datos.mat. Verá tres señales, x1, x2 y x3, la
% frecuencia de muestreo usada, y un vector de tiempo.
% Investigue las funciones sound y soundsc en el help de Matlab. Úselas para reproducir
% las señales x1, x2 y x3.
% NOTA: antes de subir su script a Canvas, comente las líneas con los llamados a las
% funciones sound y soundsc.

%%% PARA CARGAR LA DATA, USE EL BOTON DE "IMPORT DATA" 

%%%%% escuhando el audio x1 
%sound(x1) 
%soundsc(x1)
%%%%% escuhando el audio x2
%sound(x2) 
%soundsc(x2)
%%%%% escuhando el audio x3
%sound(x3) 
%soundsc(x3)

% 1.1) ¿Nota alguna diferencia entre usar sound y soundsc para alguna de las señales? De
%      ser así, ¿cuál cree que sea la razón?
% RESPUESTA:

% en x3 si se escucha una diferencia de tono al reproducirlo,
% pareciera que suaviza los tonos de alta frecuencua para que sea más
% agradable al oido. 

% 1.2) Según lo que escuchó, ¿cree que hay alguna relación entre x3 y las otras dos
%      señales? 
% RESPUESTA:

% si, quiza x3 es la combinacion de x1 y x2. 

% Obtenga el espectro de amplitud unilateral de x1, x2 y x3. Grafique los tres como
% subfiguras en la figura 1 (subfigura superior para x1, central para x2, inferior para
% x3). Use stem. El eje horizontal de cada gráfica debe ser de frecuencia, en Hz. Incluya
% títulos adecuados para cada subfigura.

X1 = fft(x1); 
X2 = fft(x2);
X3 = fft(x3);

N = length(t);

P2 = abs(X1/N);  % calculo del especto unilateral de x1
P1 = P2(1:N/2+1);
P1(2:end-1) = 2*P1(2:end-1);

P4 = abs(X2/N); % calculo del especto unilateral de x2
P3 = P4(1:N/2+1);
P3(2:end-1) = 2*P3(2:end-1);

P6 = abs(X3/N); % calculo del especto unilateral de x3
P5 = P6(1:N/2+1);
P5(2:end-1) = 2*P5(2:end-1);

f = Fs*(0:(N/2))/N;

%empiezo a hacer grafica
figure('Name', 'figura 1 CRIS_PAT','NumberTitle','off');    %ventana
%Encabezado
hi = sgtitle('Audios , CrisPat 19218, 1IE30322020221, sección:22');
hi.FontSize = 18;
hi.Color = 'r';
hi.FontName = 'verdana';

subplot(3,1,1)
stem(f, P1, 'filled', 'k')
grid minor                              
title('FFT inilateral de x1')
ylabel('|P1(f)|', 'FontSize', 14, 'interpreter', 'latex')
xlabel('Hz', 'FontSize', 14, 'interpreter', 'latex')
subplot(3,1,2)
stem(f, P3, 'filled', 'k')
grid minor                               
title('FFT inilateral de x2')
ylabel('|P3(f)|', 'FontSize', 14, 'interpreter', 'latex')
xlabel('Hz', 'FontSize', 14, 'interpreter', 'latex')
subplot(3,1,3)
stem(f, P5, 'filled', 'k')
grid minor                               
title('FFT inilateral de x3')
ylabel('|P5(f)|', 'FontSize', 14, 'interpreter', 'latex')
xlabel('Hz', 'FontSize', 14, 'interpreter', 'latex')

% 1.3) Según lo que observó, ¿qué tipo de señales cree que son x1 y x2? ¿Cómo cree que se
%      generaron?
% RESPUESTA:

% son notas de audio puras generadas por un sinusoide, las cuales estan 
% generados con una unica frecuencia armonica. 

% 1.4) Según lo que observó, ¿cree que hay alguna relación entre x3 y las otras dos
%      señales? ¿Coincide con lo que contestó en la pregunta 1.2)? Explique.
% RESPUESTA:

% si coincide con las respuesta de la pregunta 1.2 , ya que podemos ver en
% el espectro unilateral de x3 que es la combinacion de la señal x1 y x2. 

%% Segunda Parte
% Obtenga variables tipo tf discreto correspondientes a las funciones de transferencia H1
% y H2 descritas en la guía. Recuerde usar el parámetro de período de muestreo. Use las
% variables para obtener las respuestas de H1 y H2 a la señal de entrada x3. Llame a las
% respuestas y3H1 y y3H2.
% Ayuda: Hicieron algo similar en el lab 10.

L1 = 0.8; %% valor de landa1 para la funcione de transferencia H1
L2 = 0.5; %% valor de landa2 para la funcione de transferencia H2 

num1 = [1-L1,0];   % valores del numerador y denominador de la funcion de 
den1 = [1,-L1];    % transferencia 1

num2 = [L2,-L2];    % valores del numerador y denominador de la funcion de 
den2 = [1,-L2];    % transferencia 2

H1 = tf(num1, den1, 1/Fs); % funcion de transferencia 1
H2 = tf(num2, den2, 1/Fs); % funcion de transferencia 2

y3H1 = lsim(H1, x3, t);   % respuesta de funcion de transferencia 1
y3H2 = lsim(H2, x3, t);   % respuesta de funcion de transferencia 2

% Use la función soundsc para escuchar las respuestas obtenidas con H1 y H2.
% NOTA: antes de subir su script a Canvas, comente las líneas con los llamados a la
% función soundsc.

%%%%% escuhando la respuesta de H1 con la señal x3
%soundsc(y3H1)
%%%%% escuhando la respuesta de H2 con la señal x3 
%soundsc(y3H2)

% 2.1) Describa lo que escuchó. ¿Qué le hizo H1 a x3? ¿Qué le hizo H2 a x3?
% RESPUESTA:

% para H1 se escucha mas la vibración que el sonido agudo. Para H2 es lo    
% contrario suena mas fuerte el sonido agudo que la vibracion.  

% Obtenga el espectro de amplitud unilateral de y3H1 y y3H2. Grafique los dos como
% subfiguras en la figura 2 (subfigura superior para y3H1, e inferior para y3H2). Use
% stem. El eje horizontal de cada gráfica debe ser de frecuencia, en Hz. Incluya
% títulos adecuados para cada subfigura.

Y3H1 = fft(y3H1);
Y3H2 = fft(y3H2);

P8 = abs(Y3H1/N);  % calculo del especto unilateral de y3H1
P7 = P8(1:N/2+1);
P7(2:end-1) = 2*P7(2:end-1);

P10 = abs(Y3H2/N); % calculo del especto unilateral de y3H2
P9 = P10(1:N/2+1);
P9(2:end-1) = 2*P9(2:end-1);

%empiezo a hacer grafica
figure('Name', 'figura 1 CRIS_PAT','NumberTitle','off');    %ventana
%Encabezado
hi = sgtitle('Audios , CrisPat 19218, 1IE30322020221, sección:22');
hi.FontSize = 18;
hi.Color = 'r';
hi.FontName = 'verdana';

subplot(2,1,1)
stem(f, P7, 'filled', 'k')
grid minor                               
title('FFT inilateral de y3H1')
ylabel('|P7(f)|', 'FontSize', 14, 'interpreter', 'latex')
xlabel('Hz', 'FontSize', 14, 'interpreter', 'latex')
subplot(2,1,2)
stem(f, P9, 'filled', 'k')
grid minor                               
title('FFT inilateral de y3H2')
ylabel('|P9(f)|', 'FontSize', 14, 'interpreter', 'latex')
xlabel('Hz', 'FontSize', 14, 'interpreter', 'latex')

% 2.2) Describa lo que observa en los espectros. ¿Qué pasó con los picos, comparándolos
%      con lo observado en la Primera Parte? ¿Qué le hizo H1 a x3? ¿Qué le hizo H2 a x3?
% RESPUESTA:

% la magnitud ha disminuido en comparacion de la parte1.
% H1 hizo que el pico del sonido agudo disminuyera de tamaño y en el caso de H2
% hizo que el pico de la vibración disminuyera de tamaño. 

% 2.3) Según lo observado y escuchado, ¿qué tipo de filtros cree que son H1 y H2?
% RESPUESTA:

% podriamos decir que H1 es un filtro pasa bajas y que H2 es un pasa altas.

%% Tercera Parte
% Investigue la función audioread en el help de Matlab. Úsela para obtener un vector con
% la información de la señal de audio contenida en el archivo Lab11_audio.wav, así como la
% frecuencia de muestreo correspondiente. Llame al vector x_audio, y a la frecuencia Fs_a.
% Obtenga un vector de tiempo, en segundos, empezando en 0. Haga que el vector de tiempo
% sea un vector columna.
% Ayuda: el vector de tiempo lo puede obtener a partir del número de muestras del vector
% de audio y de la frecuencia de muestreo.

[x_audio, Fs_a] = audioread('Lab11_audio.wav');

% Use la función soundsc para escuchar la señal de audio.
% NOTA: antes de subir su script a Canvas, comente la línea con el llamado a soundsc.

%%%%% escuhando la cancion del archivo wav
%soundsc(x_audio)
%sound(x_audio)

% 3.1) ¿Nota algo extraño en el audio? Describa lo que escuchó.
% RESPUESTA:

% Se produce cierta interferencia como feedback en el audio, lo cual
% distorsiona la cancion

% En la figura 3, grafique x_audio versus tiempo en la subfigura superior (use plot), y
% grafique el espectro de amplitud unilateral de x_audio en la subfigura inferior. 
% Grafique el espectro versus frecuencia, en Hz. Use stem.

M = length(x_audio);
Ts_a = 1/Fs_a;
ta = (0:(M-1))*(Ts_a);

X_audio = fft(x_audio); 

Q2 = abs(X_audio/M);  % calculo del especto unilateral de x_audio
Q1 = Q2(1:M/2+1);
Q1(2:end-1) = 2*Q1(2:end-1);

f1 = Fs_a*(0:(M/2))/M;

%empiezo a hacer grafica
figure('Name', 'figura 1 CRIS_PAT','NumberTitle','off');    %ventana
%Encabezado
hi = sgtitle('Audios , CrisPat 19218, 1IE30322020221, sección:22');
hi.FontSize = 18;
hi.Color = 'r';
hi.FontName = 'verdana';

subplot(2,1,1)
plot(ta,x_audio)
title('Señal de audio');
ylabel('voltaje');
xlabel('tiempo');
subplot(2,1,2)
stem(f1, Q1, 'filled', 'k');
grid minor;                               
title('FFT inilateral de la señal de audio');
ylabel('|Q1(f)|', 'FontSize', 14, 'interpreter', 'latex');
xlabel('Hz', 'FontSize', 14, 'interpreter', 'latex');

% 3.2) ¿Nota algo en el espectro que explique lo extraño que haya escuchado? ¿Qué podría
%      haberlo causado?
% RESPUESTA:

% Se aprecia cierta cantidad de frecuencias y magnitudes pero llegando a
% frecuencias altas (agudos) destaca una sola señal, la cual podria ser el
% ruido en la señal de audio

% Obtenga nuevamente variables tipo tf discreto correspondientes a H1 y H2, pero usando el
% período de muestreo correspondiente a Fs_a. Use las variables para obtener las
% respuestas de H1 y H2 a la señal de entrada x_audio. Llame a las respuestas yaH1 y yaH2.

H1_a = tf(num1, den1, Ts_a); % funcion de transferencia 1 con Ts del audio
H2_a = tf(num2, den2, Ts_a); % funcion de transferencia 2 con Ts del audio

yaH1 = lsim(H1_a, x_audio, ta);   % respuesta de funcion de transferencia 1
yaH2 = lsim(H2_a, x_audio, ta);   % respuesta de funcion de transferencia 2

% Use la función soundsc para escuchar las respuestas obtenidas con H1 y H2.
% NOTA: antes de subir su script a Canvas, comente las líneas con los llamados a la
% función soundsc.

%%%%% escuhando la respuesta de H3 con la señal x_audio
%soundsc(yaH1)
%%%%% escuhando la respuesta de H4 con la señal x_audio 
%soundsc(yaH2)

% 3.3) Describa lo que escuchó. ¿Qué le hizo H1 a x_audio? ¿Qué le hizo H2 a x_audio?
% RESPUESTA:

% lo que realizo H1:a fue rebajar el efecto del ruido del pitido del fondo.
% al contrario de H2_a que realzo el pitido haciendo que sea mucho mas
% fuerte.

% En la figura 4, grafique yaH1 versus tiempo en la subfigura superior (use plot), y
% grafique el espectro de amplitud unilateral de yaH1 en la subfigura inferior. 
% Grafique el espectro versus frecuencia, en Hz. Use stem.

YAH1 = fft(yaH1);

Q4 = abs(YAH1/M);  % calculo del especto unilateral de yaH1
Q3 = Q4(1:M/2+1);
Q3(2:end-1) = 2*Q3(2:end-1);

%empiezo a hacer grafica
figure('Name', 'figura 1 CRIS_PAT','NumberTitle','off');    %ventana
%Encabezado
hi = sgtitle('Audios , CrisPat 19218, 1IE30322020221, sección:22');
hi.FontSize = 18;
hi.Color = 'r';
hi.FontName = 'verdana';

subplot(2,1,1)
plot(ta,yaH1)
title('Respuesta del audio ante H1_a');
ylabel('voltaje');
xlabel('tiempo');
subplot(2,1,2)
stem(f1, Q3, 'filled', 'k');
grid minor;                               
title('FFT inilateral de yaH1');
ylabel('|Q3(f)|', 'FontSize', 14, 'interpreter', 'latex');
xlabel('Hz', 'FontSize', 14, 'interpreter', 'latex');

% En la figura 5, grafique yaH2 versus tiempo en la subfigura superior (use plot), y
% grafique el espectro de amplitud unilateral de yaH2 en la subfigura inferior. 
% Grafique el espectro versus frecuencia, en Hz. Use stem.

YAH2 = fft(yaH2);

Q6 = abs(YAH2/M);  % calculo del especto unilateral de yaH1
Q5 = Q6(1:M/2+1);
Q5(2:end-1) = 2*Q5(2:end-1);

%empiezo a hacer grafica
figure('Name', 'figura 1 CRIS_PAT','NumberTitle','off');    %ventana
%Encabezado
hi = sgtitle('Audios , CrisPat 19218, 1IE30322020221, sección:22');
hi.FontSize = 18;
hi.Color = 'r';
hi.FontName = 'verdana';

subplot(2,1,1)
plot(ta,yaH2)
title('Respuesta del audio ante H2_a');
ylabel('voltaje');
xlabel('tiempo');
subplot(2,1,2)
stem(f1, Q5, 'filled', 'k');
grid minor;                               
title('FFT inilateral de yaH2');
ylabel('|Q5(f)|', 'FontSize', 14, 'interpreter', 'latex');
xlabel('Hz', 'FontSize', 14, 'interpreter', 'latex');

% 3.4) Describa lo que observa en los espectros. ¿Es consistente con lo escuchado?
% RESPUESTA:

% Para el caso de H1_a se ve que se a las frecuencias mayores se les redujo
% su magnitud, lo contrario sucede con H2_a a frecuias mayores se les
% incrementa la magnitud.

