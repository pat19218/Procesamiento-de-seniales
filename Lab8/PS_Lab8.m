%% Procesamiento de Señales - Laboratorio (1er semestre, 2022)
%  Laboratorio 8
%  ESCRIBA SU IDENTIFICACIÓN EN ESTE ESPACIO

%% 1) Transformada inversa
% Cargue las variables X1 y Fs1 almacenadas en el archivo PS_Lab8_datos.mat. X1
% corresponde a la transformada discreta de Fourier de cierta señal x1, la cual fue
% muestreada con una frecuencia de muestreo de 1000 Hz.
% Grafique el espectro de amplitud unilateral de x1 en la figura 1. Grafique versus
% frecuencia, en Hz.


load PS_Lab8_datos.mat X1 Fs1;

%X1 -->fft(x1)
N = length(X1);

P2 = abs(X1/N); %abs( trans_Fourier / Largo_senial);
P1 = P2(1:N/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs1*(0:(N/2))/N;
% de esta manera los picos me indican la amplitud del o los sinusoides y en
% que frecuencia suceden.

%empiezo a hacer grafica
figure('Name', 'figura 1 CRIS_PAT','NumberTitle','off');    %ventana
%Encabezado
hi = sgtitle('Señal-->fft , CrisPat 19218, 1IE30322020221, sección:22');
hi.FontSize = 18;
hi.Color = 'r';
hi.FontName = 'verdana';

stem(f, P1);
grid minor;
ylabel('|P1(f)|', 'FontSize', 14, 'interpreter', 'latex');
xlabel('F(Hz)', 'FontSize', 14, 'interpreter', 'latex');


% Según el espectro, ¿qué componentes de frecuencia son los predominantes? Asumiendo que
% la señal original en tiempo x1 fuese una combinación de sinusoides, ¿qué amplitudes 
% tendrían dichos sinusoides?
% Respuesta:

%Las frecuencias dominantes son 10Hz y 160Hz
%Seria una amplitud de 3 para una frecuencia de 10Hz
%Seria una amplitud de 0.5 para una frecuencia de 160Hz
%x = A1*sin(2*pi*f1*t) + A2*sin(2*pi*f2*t)
%x = 3*sin(2*pi*10*t) + 0.5*sin(2*pi*160*t);

% Investigue la función ifft en el help de Matlab. Use la ifft para obtener x1.
% En la subfigura superior de la figura 2, grafique el resultado de la ifft versus tiempo
% discreto (de 0 al número de muestras de x1 menos 1).
% En la subfigura inferior de la figura 2, grafique el resultado de la ifft versus tiempo,
% en segundos.
% Ayuda: puede obtener el vector de tiempo en segundos a partir del vector de tiempo
% discreto y la frecuencia de muestreo.

x1 = ifft(X1);
t_discreto = 0:N-1;
t = t_discreto/Fs1;

%empiezo a hacer grafica
figure('Name', 'figura 2 CRIS_PAT','NumberTitle','off');    %ventana
%Encabezado
hi = sgtitle('fft-->Señal(ifft), CrisPat 19218, 1IE30322020221, sección:22');
hi.FontSize = 18;
hi.Color = 'r';
hi.FontName = 'verdana';

subplot(2,1,1); %subplot(filas, columnas, ubicacion)
stem(t_discreto, x1);
grid minor;
ylabel('$\left|X[k]\right|$', 'FontSize', 14, 'interpreter', 'latex');
xlabel('t', 'FontSize', 14, 'interpreter', 'latex');


subplot(2,1,2); %subplot(filas, columnas, ubicacion)
plot(t,x1);
grid minor;
ylabel('$\left|X[k]\right|$', 'FontSize', 14, 'interpreter', 'latex');
xlabel('segundos', 'FontSize', 14, 'interpreter', 'latex');



% ¿Tienen sentido las gráficas de x1 observadas en la figura 1? Explique brevemente.
% Respuesta:

%Totalmente ya que estas son las indicadas para la amplitud y frecuencia de
%la senial dada.


%% 2) Análisis de una señal ECG
% Cargue las variables x_ecg y Fs_ecg almacenadas en el archivo PS_Lab8_datos.mat. x_ecg
% contiene las muestras de una señal electrocardiográfica (ECG), muestreada a Fs_ecg Hz.
% En la figura 3, grafique x_ecg versus tiempo discreto en la subfigura superior (use
% plot), y grafique el espectro de amplitud unilateral de x_ecg en la subfigura inferior.
% Grafique el espectro versus frecuencia, en Hz. Use stem.

load PS_Lab8_datos.mat x_ecg Fs_ecg

N_ecg = length(x_ecg);
t_discreto_ecg = 0:N_ecg-1;
X_ecg = fft(x_ecg);

P2_ecg = abs(X_ecg/N_ecg); %abs( trans_Fourier / Largo_senial);
P1_ecg = P2_ecg(1:N_ecg/2+1);
P1_ecg(2:end-1) = 2*P1_ecg(2:end-1);

f_ecg = Fs_ecg*(0:(N_ecg/2))/N_ecg;

%empiezo a hacer grafica
figure('Name', 'figura 3 CRIS_PAT','NumberTitle','off');    %ventana
%Encabezado
hi = sgtitle('fft-->Señal(ifft), CrisPat 19218, 1IE30322020221, sección:22');
hi.FontSize = 18;
hi.Color = 'r';
hi.FontName = 'verdana';

subplot(2,1,1); %subplot(filas, columnas, ubicacion)
plot(t_discreto_ecg, X_ecg);
grid minor;
ylabel('$\left|X[k]\right|$', 'FontSize', 14, 'interpreter', 'latex');
xlabel('t discreto', 'FontSize', 14, 'interpreter', 'latex');


subplot(2,1,2); %subplot(filas, columnas, ubicacion)
stem(f_ecg, P1_ecg, 'filled', 'k');
grid minor;
ylabel('$\left|X[k]\right|$', 'FontSize', 14, 'interpreter', 'latex');
xlabel('F(Hz)', 'FontSize', 14, 'interpreter', 'latex');


% Según sus observaciones, ¿qué rango de frecuencias es significativo para la señal ECG?
% Respuesta:0Hz, 4.68Hz, 7.83Hz


% Calcule el valor promedio de la señal x_ecg.
promedio = mean(x_ecg);



% ¿Cuál es el valor máximo observado en el espectro de amplitud unilateral? ¿A qué
% frecuencia corresponde? ¿Tiene sentido?
% Respuesta: 0.3172-0Hz 



%% 3) Análisis de una señal EMG
% Cargue las variables x_emg y Fs_emg almacenadas en el archivo PS_Lab8_datos.mat. x_emg
% contiene las muestras de una señal electromiográfica (EMG) de superficie, muestreada a
% Fs_emg Hz. 
% En la figura 4, grafique x_emg versus tiempo discreto en la subfigura superior (use
% plot), y grafique el espectro de amplitud unilateral de x_emg en la subfigura inferior.
% Grafique el espectro versus frecuencia, en Hz. Use stem.

load PS_Lab8_datos.mat x_emg Fs_emg;

N_emg = length(x_emg);
t_discreto_emg = 0:N_emg-1;
X_emg = fft(x_emg);

P2_emg = abs(X_emg/N_emg); %abs( trans_Fourier / Largo_senial);
P1_emg = P2_emg(1:N_emg/2+1);
P1_emg(2:end-1) = 2*P1_emg(2:end-1);

f_emg = Fs_emg*(0:(N_emg/2))/N_emg;

%empiezo a hacer grafica
figure('Name', 'figura 4 CRIS_PAT','NumberTitle','off');    %ventana
%Encabezado
hi = sgtitle('fft-->Señal(ifft), CrisPat 19218, 1IE30322020221, sección:22');
hi.FontSize = 18;
hi.Color = 'r';
hi.FontName = 'verdana';

subplot(2,1,1); %subplot(filas, columnas, ubicacion)
plot(t_discreto_emg, x_emg);
grid minor;
ylabel('$\left|X[k]\right|$', 'FontSize', 14, 'interpreter', 'latex');
xlabel('t discreto', 'FontSize', 14, 'interpreter', 'latex');


subplot(2,1,2); %subplot(filas, columnas, ubicacion)
stem(f_emg, P1_emg, 'filled', 'k');
grid minor;
ylabel('$\left|X[k]\right|$', 'FontSize', 14, 'interpreter', 'latex');
xlabel('F(Hz)', 'FontSize', 14, 'interpreter', 'latex');


% ¿Cuál es el valor máximo en el espectro de amplitud unilateral? ¿A qué frecuencia
% corresponde?
% Respuesta:2.314-0Hz


% A veces se requiere hacer un pre-procesamiento de las señales, antes de usarlas,
% analizarlas y/o aplicarles algoritmos como la FFT. Algo común es centrar las señales en
% cero, cuando estas tienen un componente DC (lo cual puede deberse al equipo de medición).

% Calcule el valor promedio de la señal x_emg, y résteselo a la señal x_emg. Llame a la
% señal centrada x_emg_centrada.

x_emg_centrada = x_emg - mean(x_emg);


% En la figura 5, grafique x_emg_centrada versus tiempo discreto en la subfigura superior
% (use plot), y grafique el espectro de amplitud unilateral de x_emg_centrada en la
% subfigura inferior. Grafique el espectro versus frecuencia, en Hz. Use stem.


N_emg_centrada = length(x_emg_centrada);
t_discreto_emg = 0:N_emg_centrada-1;
X_emg_centrada = fft(x_emg_centrada);

P2_emg = abs(X_emg_centrada/N_emg_centrada); %abs( trans_Fourier / Largo_senial);
P1_emg = P2_emg(1:N_emg_centrada/2+1);
P1_emg(2:end-1) = 2*P1_emg(2:end-1);

f_emg = Fs_emg*(0:(N_emg_centrada/2))/N_emg_centrada;

%empiezo a hacer grafica
figure('Name', 'figura 5 CRIS_PAT','NumberTitle','off');    %ventana
%Encabezado
hi = sgtitle('fft-->Señal(ifft), CrisPat 19218, 1IE30322020221, sección:22');
hi.FontSize = 18;
hi.Color = 'r';
hi.FontName = 'verdana';

subplot(2,1,1); %subplot(filas, columnas, ubicacion)
plot(t_discreto_emg, X_emg_centrada);
grid minor;
ylabel('$\left|X[k]\right|$', 'FontSize', 14, 'interpreter', 'latex');
xlabel('t discreto', 'FontSize', 14, 'interpreter', 'latex');


subplot(2,1,2); %subplot(filas, columnas, ubicacion)
stem(f_emg, P1_emg, 'filled', 'k');
grid minor;
ylabel('$\left|X[k]\right|$', 'FontSize', 14, 'interpreter', 'latex');
xlabel('F(Hz)', 'FontSize', 14, 'interpreter', 'latex');



% ¿Qué pasó con el componente de frecuencia 0 en el espectro de amplitud unilateral?
% Respuesta:  Se hace 0

% Según sus observaciones, ¿qué rango de frecuencias es significativo para la señal EMG?
% Respuesta: las tres que más destacan son: 20.5Hz 46Hz 62.5Hz

%% Del Osciloscopio
% 
% %Leo solo las columnas del doc, lo guardo en forma de vector
% datos = readmatrix('data_10hz.csv', 'Range', 'D:E'); 
% t_10 = datos(:,1);  %Defino el vector tiempo
% v = datos(:,2);  %Defino el vector voltaje
% 
% %Obtenemos información útil de los datos del documento
% ind_t = t_10>= -0.8 & t_10 < 0.8;    %Definimos el intervalo de tiempo donde
%        %los datos tienen información útil
% t_recortado = datos(ind_t, 1); % obtenemos los nuevos tiempos
% v_recortado = datos(ind_t, 2); % obtenemos los nuevos voltajes
% 
% V_recortado = fft(v_recortado);
% N_10 = length(v_recortado);
% 
% P2_10 = abs(V_recortado/N_10); %abs( trans_Fourier / Largo_senial);
% P1_10 = P2_10(1:N_10/2+1); %(1: Largo_senial/2+1)
% P1_10(2:end-1) = 2*P1_10(2:end-1);
% 
% %Para encontrar frecuencia de muestreo utilizo la siguiente expresion
% %1 ./mean(diff(t))     , donde t, es mi variable de tiempo en segundos
% 
% Fs_10 = 1 ./mean(diff(t_10));  %frecuencia de muestreo
% f_10 = Fs_10*(0:(N_10/2))/N_10; %frecuencia
% 
% figure('Name', 'figura 6 CRIS_PAT','NumberTitle','off');    %ventana
% %Encabezado
% hi = sgtitle('10HZ, CrisPat 19218, 1IE30322020221, sección:22');
% hi.FontSize = 18;
% hi.Color = 'r';
% hi.FontName = 'verdana';
% 
% subplot(2,1,1);
% plot(t_recortado(1:151), v_recortado(1:151)); %agarro de (1:150) a graficar
% grid minor;
% ylabel('Voltaje', 'FontSize', 14, 'interpreter', 'latex');
% xlabel('tiempo', 'FontSize', 14, 'interpreter', 'latex');
% 
% subplot(2,1,2);
% stem(f_10(1:151), P1_10(1:151), 'filled', 'k');
% grid minor;
% ylabel('$\left|X[k]\right|$', 'FontSize', 14, 'interpreter', 'latex');
% xlabel('F(Hz)', 'FontSize', 14, 'interpreter', 'latex');
% 
% %--------------------------------------------------------------------------
% 
% %Leo solo las columnas del doc, lo guardo en forma de vector
% datos = readmatrix('data_100hz.csv', 'Range', 'D:E'); 
% t_10 = datos(:,1);  %Defino el vector tiempo
% v = datos(:,2);  %Defino el vector voltaje
% 
% %Obtenemos información útil de los datos del documento
% ind_t = t_10>= -0.08 & t_10 < 0.08;    %Definimos el intervalo de tiempo donde
%        %los datos tienen información útil
% t_recortado = datos(ind_t, 1); % obtenemos los nuevos tiempos
% v_recortado = datos(ind_t, 2); % obtenemos los nuevos voltajes
% 
% V_recortado = fft(v_recortado);
% N_10 = length(v_recortado);
% 
% P2_10 = abs(V_recortado/N_10); %abs( trans_Fourier / Largo_senial);
% P1_10 = P2_10(1:N_10/2+1); %(1: Largo_senial/2+1)
% P1_10(2:end-1) = 2*P1_10(2:end-1);
% 
% %Para encontrar frecuencia de muestreo utilizo la siguiente expresion
% %1 ./mean(diff(t))     , donde t, es mi variable de tiempo en segundos
% 
% Fs_10 = 1 ./mean(diff(t_10));  %frecuencia de muestreo
% f_10 = Fs_10*(0:(N_10/2))/N_10; %frecuencia
% 
% figure('Name', 'figura 7 CRIS_PAT','NumberTitle','off');    %ventana
% %Encabezado
% hi = sgtitle('100HZ, CrisPat 19218, 1IE30322020221, sección:22');
% hi.FontSize = 18;
% hi.Color = 'r';
% hi.FontName = 'verdana';
% 
% subplot(2,1,1);
% plot(t_recortado(1:151), v_recortado(1:151));
% grid minor;
% ylabel('Voltaje', 'FontSize', 14, 'interpreter', 'latex');
% xlabel('tiempo', 'FontSize', 14, 'interpreter', 'latex');
% 
% subplot(2,1,2);
% stem(f_10(1:151), P1_10(1:151), 'filled', 'k');
% grid minor;
% ylabel('$\left|X[k]\right|$', 'FontSize', 14, 'interpreter', 'latex');
% xlabel('F(Hz)', 'FontSize', 14, 'interpreter', 'latex');
% 
% %--------------------------------------------------------------------------
% 
% %Leo solo las columnas del doc, lo guardo en forma de vector
% datos = readmatrix('data_260hz.csv', 'Range', 'D:E'); 
% t_10 = datos(:,1);  %Defino el vector tiempo
% v = datos(:,2);  %Defino el vector voltaje
% 
% %Obtenemos información útil de los datos del documento
% ind_t = t_10>= -0.016 & t_10 < 0.016;    %Definimos el intervalo de tiempo donde
%        %los datos tienen información útil
% t_recortado = datos(ind_t, 1); % obtenemos los nuevos tiempos
% v_recortado = datos(ind_t, 2); % obtenemos los nuevos voltajes
% 
% 
% V_recortado = fft(v_recortado);
% N_10 = length(v_recortado);
% 
% P2_10 = abs(V_recortado/N_10); %abs( trans_Fourier / Largo_senial);
% P1_10 = P2_10(1:N_10/2+1); %(1: Largo_senial/2+1)
% P1_10(2:end-1) = 2*P1_10(2:end-1);
% 
% %Para encontrar frecuencia de muestreo utilizo la siguiente expresion
% %1 ./mean(diff(t))     , donde t, es mi variable de tiempo en segundos
% 
% Fs_10 = 1 ./mean(diff(t_10));  %frecuencia de muestreo
% f_10 = Fs_10*(0:(N_10/2))/N_10; %frecuencia
% 
% figure('Name', 'figura 8 CRIS_PAT','NumberTitle','off');    %ventana
% %Encabezado
% hi = sgtitle('260HZ, CrisPat 19218, 1IE30322020221, sección:22');
% hi.FontSize = 18;
% hi.Color = 'r';
% hi.FontName = 'verdana';
% 
% subplot(2,1,1);
% plot(t_recortado(1:151), v_recortado(1:151));
% grid minor;
% ylabel('Voltaje', 'FontSize', 14, 'interpreter', 'latex');
% xlabel('tiempo', 'FontSize', 14, 'interpreter', 'latex');
% 
% subplot(2,1,2);
% stem(f_10(1:151), P1_10(1:151), 'filled', 'k');
% grid minor;
% ylabel('$\left|X[k]\right|$', 'FontSize', 14, 'interpreter', 'latex');
% xlabel('F(Hz)', 'FontSize', 14, 'interpreter', 'latex');
% 
% %--------------------------------------------------------------------------
% 
% %Leo solo las columnas del doc, lo guardo en forma de vector
% datos = readmatrix('data_1000hz.csv', 'Range', 'D:E'); 
% t_10 = datos(:,1);  %Defino el vector tiempo
% v = datos(:,2);  %Defino el vector voltaje
% 
% %Obtenemos información útil de los datos del documento
% ind_t = t_10>= -0.008 & t_10 < 0.008;    %Definimos el intervalo de tiempo donde
%        %los datos tienen información útil
% 
% t_recortado = datos(ind_t, 1); % obtenemos los nuevos tiempos
% v_recortado = datos(ind_t, 2); % obtenemos los nuevos voltajes
% 
% V_recortado = fft(v_recortado);
% N_10 = length(v_recortado);
% 
% P2_10 = abs(V_recortado/N_10); %abs( trans_Fourier / Largo_senial);
% P1_10 = P2_10(1:N_10/2+1); %(1: Largo_senial/2+1)
% P1_10(2:end-1) = 2*P1_10(2:end-1);
% 
% %Para encontrar frecuencia de muestreo utilizo la siguiente expresion
% %1 ./mean(diff(t))     , donde t, es mi variable de tiempo en segundos
% 
% Fs_10 = 1 ./mean(diff(t_10));  %frecuencia de muestreo
% f_10 = Fs_10*(0:(N_10/2))/N_10; %frecuencia
% 
% figure('Name', 'figura 9 CRIS_PAT','NumberTitle','off');    %ventana
% %Encabezado
% hi = sgtitle('1000HZ, CrisPat 19218, 1IE30322020221, sección:22');
% hi.FontSize = 18;
% hi.Color = 'r';
% hi.FontName = 'verdana';
% 
% subplot(2,1,1);
% plot(t_recortado(1:151), v_recortado(1:151));
% grid minor;
% ylabel('Voltaje', 'FontSize', 14, 'interpreter', 'latex');
% xlabel('tiempo', 'FontSize', 14, 'interpreter', 'latex');
% 
% subplot(2,1,2);
% stem(f_10(1:151), P1_10(1:151), 'filled', 'k');
% grid minor;
% ylabel('$\left|X[k]\right|$', 'FontSize', 14, 'interpreter', 'latex');
% xlabel('F(Hz)', 'FontSize', 14, 'interpreter', 'latex');
% 
% %--------------------------------------------------------------------------
% 
% %Leo solo las columnas del doc, lo guardo en forma de vector
% datos = readmatrix('data_100hz_cuadrada.csv', 'Range', 'D:E'); 
% t_10 = datos(:,1);  %Defino el vector tiempo
% v = datos(:,2);  %Defino el vector voltaje
% 
% %Obtenemos información útil de los datos del documento
% ind_t = t_10>= -0.032 & t_10 < 0.8;    %Definimos el intervalo de tiempo donde
%        %los datos tienen información útil
% 
% t_recortado = datos(ind_t, 1); % obtenemos los nuevos tiempos
% v_recortado = datos(ind_t, 2); % obtenemos los nuevos voltajes
% 
% V_recortado = fft(v_recortado);
% N_10 = length(v_recortado);
% 
% P2_10 = abs(V_recortado/N_10); %abs( trans_Fourier / Largo_senial);
% P1_10 = P2_10(1:N_10/2+1); %(1: Largo_senial/2+1)
% P1_10(2:end-1) = 2*P1_10(2:end-1);
% 
% %Para encontrar frecuencia de muestreo utilizo la siguiente expresion
% %1 ./mean(diff(t))     , donde t, es mi variable de tiempo en segundos
% 
% Fs_10 = 1 ./mean(diff(t_10));  %frecuencia de muestreo
% f_10 = Fs_10*(0:(N_10/2))/N_10; %frecuencia
% 
% figure('Name', 'figura 10 CRIS_PAT','NumberTitle','off');    %ventana
% %Encabezado
% hi = sgtitle('100HZ cuadrada, CrisPat 19218, 1IE30322020221, sección:22');
% hi.FontSize = 18;
% hi.Color = 'r';
% hi.FontName = 'verdana';
% 
% subplot(2,1,1);
% plot(t_recortado(1:151), v_recortado(1:151));
% grid minor;
% ylabel('Voltaje', 'FontSize', 14, 'interpreter', 'latex');
% xlabel('tiempo', 'FontSize', 14, 'interpreter', 'latex');
% 
% subplot(2,1,2);
% stem(f_10(1:151), P1_10(1:151), 'filled', 'k');
% grid minor;
% ylabel('$\left|X[k]\right|$', 'FontSize', 14, 'interpreter', 'latex');
% xlabel('F(Hz)', 'FontSize', 14, 'interpreter', 'latex');