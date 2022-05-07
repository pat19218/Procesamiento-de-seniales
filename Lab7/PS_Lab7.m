%% Procesamiento de Se�ales - Laboratorio
%  Laboratorio 7
%  Cristhofer Isaac Patz�n Mart�nez 19218

Fs = 250;         % Frecuencia de muestreo                    
Ts = 1/Fs;        % Per�odo de muestreo
N = 500;          % Longitud de la se�al (n�mero de muestras). No necesariamente tiene que
                  % ser un m�ltiplo de Fs.
t = (0:(N-1))*Ts; % Vector de tiempo

%% 1) Se�ales en tiempo
% Cree una se�al, x1, que sea la suma de dos sinusoides. El primer sinusoide tiene una
% amplitud de A1 = 0.6 y una frecuencia f1 = 10 Hz. El segundo tiene una amplitud A2 = 1,
% y una frecuencia f2 = 100 Hz. Use el vector de tiempo creado arriba.
% Ayuda: A1*sin(2*pi*f1*t) devuelve un sinusoide de amplitud A1 y frecuencia f1.
% Cree tambi�n otra se�al, x2, que sea x1 m�s ruido aleatorio entre -1 y 1.
% Ayuda: use rand(size(t)).
% Cree una figura (figura 1) con dos subfiguras (una abajo de la otra). En la subfigura
% superior, grafique x1, y en la inferior, grafique x2. Grafique ambas versus el tiempo.
% Use plot para graficar. Coloque t�tulos adecuados para cada subfigura.

A1 = 0.6; f1 = 10;
A2 = 1; f2 = 100;
x1 = A1*sin(2*pi*f1*t) + A2*sin(2*pi*f2*t); %suma de se�ales
x2 = x1 + rand(size(t));

%empiezo a hacer grafica
figure('Name', 'figura 1 CRIS_PAT','NumberTitle','off');    %ventana
%Encabezado
hi = sgtitle('Se�alvstiempo,CrisPat 19218, 1IE30322020221, secci�n:22');
hi.FontSize = 18;
hi.Color = 'r';
hi.FontName = 'verdana';

subplot(2,1,1); %subplot(filas, columnas, ubicacion)
plot(t, x1, 'r', 'LineWidth', 1);%plot(eje X, eje Y, color, *modificar*, *valor modificacion*)
xlabel('tiempo');
ylabel('Sonido');

subplot(2,1,2); %subplot(filas, columnas, ubicacion)
plot(t, x2, 'g', 'LineWidth', 1);%plot(eje X, eje Y, color, *modificar*, *valor modificacion*)
xlabel('tiempo');
ylabel('Transmision de sonido');

%% 2) Se�ales en dominio de frecuencia
% Aplique la fft a x1 y x2. Llame a las variables resultantes X1 y X2, respectivamente.
% Nota: use s�lo un argumento de entrada para la funci�n fft (la se�al). Al usarse as�, la
%       salida ser� del mismo tama�o que la entrada. 
% En la figura 2, grafique la magnitud de X1/N en la subfigura superior, y la magnitud
% de X2/N en la subfigura inferior. Grafique ambas versus frecuencia discreta, en el
% intervalo de 0 a 2*pi rad/muestra. Use stem para graficar. Coloque t�tulos adecuados
% para cada subfigura.
% Ayuda: pueden usar el script discretefourieranalysis.m como referencia, para construir
%        el vector de frecuencia versus el cual debe graficar las magnitudes. Aunque note
%        que en dicho script se grafica vs. frecuencia normalizada. Para este ejercicio,
%        no normalice.


% Se calcula y visualiza la DFT de la se�al discreta mediante la FFT
X1 = fft(x1); %fft(se�al, punto/VectorDeMuestreo)
X2 = fft(x2); %fft(se�al, punto/VectorDeMuestreo)

k = 0:N-1;
dw = 2*pi/N; % Frecuencias arm�nicas
f_discreta = k*dw; %normalizada k*dw/pi (x pi rad/muestra)

%empiezo a hacer grafica
figure('Name', 'figura 2 CRIS_PAT','NumberTitle','off');    %ventana
%Encabezado
hi = sgtitle('Se�al-->fft , CrisPat 19218, 1IE30322020221, secci�n:22');
hi.FontSize = 18;
hi.Color = 'r';
hi.FontName = 'verdana';

subplot(2,1,1); %subplot(filas, columnas, ubicacion)
stem(f_discreta, abs(X1)/N, 'filled', 'k');
grid minor;
ylabel('$\left|X[k]\right|$', 'FontSize', 14, 'interpreter', 'latex');
xlabel('$\omega \ (\times \pi \ \mathrm{ rad/}\mathrm{muestra})$', 'FontSize', 14, 'interpreter', 'latex');


subplot(2,1,2); %subplot(filas, columnas, ubicacion)
stem(f_discreta, abs(X2)/N, 'filled', 'k');
grid minor;
ylabel('$\left|X[k]\right|$', 'FontSize', 14, 'interpreter', 'latex');
xlabel('$\omega \ (\times \pi \ \mathrm{ rad/}\mathrm{muestra})$', 'FontSize', 14, 'interpreter', 'latex');


% �Qu� diferencias observa entre las dos gr�ficas?
%Una leve diferencia entre las magnitudes y en la parte m�s baja no es
%estable

% �Cu�les son los valores m�ximos que observa en las gr�ficas? �Qu� relaci�n tienen estos
% valores con las amplitudes de los sinuosoides?
%


%% 3) Aliasing
% Cree una se�al, x3, que sea la suma de dos sinusoides, igual que antes. Pero esta vez,
% el primer sinusoide debe tener una frecuencia f3 = 260 Hz, con amplitud A3 = A1 = 0.6.
% El segundo sinusoide debe tener una frecuencia f4 = 350 Hz, con amplitud A4 = A2 = 1.
% Use el mismo vector de tiempo usado para x1 y x2.
% Luego, cree otra se�al, x4, que sea tambi�n la suma de dos sinusoides. Pero ahora, el
% primer sinusoide debe tener una frecuencia f5 = 240 Hz, con amplitud A5 = A1 = 0.6. 
% El segundo sinusoide debe tener una frecuencia f6 = 150 Hz, con amplitud A6 = A2 = 1.
% Use el mismo vector de tiempo usado para x1 y x2.

A3 = 0.6; f3 = 260;
A4 = 1; f4 = 350;
x3 = A3*sin(2*pi*f3*t) + A4*sin(2*pi*f4*t); %suma de se�ales

A5 = 0.6; f5 = 240;
A6 = 1; f6 =  150;
x4 = A5*sin(2*pi*f5*t) + A6*sin(2*pi*f6*t); %suma de se�ales


% En la figura 3, grafique x1 en la subfigura superior, x3 en la subfigura de en medio, y
% x4 en la subfigura inferior. Grafique todas versus el tiempo. 
% Use plot para graficar. Coloque t�tulos adecuados para cada subfigura.

figure('Name', 'figura 3 CRIS_PAT','NumberTitle','off');    %ventana
%Encabezado
hi = sgtitle('Se�alvstiempo,CrisPat 19218, 1IE30322020221, secci�n:22');
hi.FontSize = 18;
hi.Color = 'r';
hi.FontName = 'verdana';

subplot(3,1,1); %subplot(filas, columnas, ubicacion)
plot(t, x1, 'g', 'LineWidth', 1);%plot(eje X, eje Y, color, *modificar*, *valor modificacion*)
xlabel('tiempo');
ylabel('Sonido');

subplot(3,1,2); %subplot(filas, columnas, ubicacion)
plot(t, x3, 'r', 'LineWidth', 1);%plot(eje X, eje Y, color, *modificar*, *valor modificacion*)
xlabel('tiempo');
ylabel('Sonido1');

subplot(3,1,3); %subplot(filas, columnas, ubicacion)
plot(t, x4, 'r', 'LineWidth', 1);%plot(eje X, eje Y, color, *modificar*, *valor modificacion*)
xlabel('tiempo');
ylabel('Sonido2');


% �Nota alguna diferencia entre las se�ales? Explique sus observaciones.
%Son muy similares, quiza la unica diferencia ser�a el peque�o desfase que
%hay entre ellas.


% Aplique la fft a x3 y a x4. Nombre a las variables resultantes X3 y X4.
% En la figura 4, grafique la magnitud de X1/N en la subfigura superior, la magnitud de
% X3/N en la subfigura de en medio, y la magnitud de X4/N en la subfigura inferior.
% Grafique todas versus la frecuencia discreta, como lo hizo en el inciso 2). Use stem.

% Se calcula y visualiza la DFT de la se�al discreta mediante la FFT
X3 = fft(x3); %fft(se�al, punto/VectorDeMuestreo)
X4 = fft(x4); %fft(se�al, punto/VectorDeMuestreo)

%empiezo a hacer grafica
figure('Name', 'figura 4 CRIS_PAT','NumberTitle','off');    %ventana
%Encabezado
hi = sgtitle('Se�al-->fft , CrisPat 19218, 1IE30322020221, secci�n:22');
hi.FontSize = 18;
hi.Color = 'r';
hi.FontName = 'verdana';



subplot(3,1,1); %subplot(filas, columnas, ubicacion)
stem(f_discreta, abs(X1)/N, 'filled', 'k');
grid minor;
ylabel('$\left|X[k]\right|$', 'FontSize', 14, 'interpreter', 'latex');
xlabel('$\omega \ (\times \pi \ \mathrm{ rad/}\mathrm{muestra})$', 'FontSize', 14, 'interpreter', 'latex');


subplot(3,1,2); %subplot(filas, columnas, ubicacion)
stem(f_discreta, abs(X3)/N, 'filled', 'k');
grid minor;
ylabel('$\left|X[k]\right|$', 'FontSize', 14, 'interpreter', 'latex');
xlabel('$\omega \ (\times \pi \ \mathrm{ rad/}\mathrm{muestra})$', 'FontSize', 14, 'interpreter', 'latex');

subplot(3,1,3); %subplot(filas, columnas, ubicacion)
stem(f_discreta, abs(X4)/N, 'filled', 'k');
grid minor;
ylabel('$\left|X[k]\right|$', 'FontSize', 14, 'interpreter', 'latex');
xlabel('$\omega \ (\times \pi \ \mathrm{ rad/}\mathrm{muestra})$', 'FontSize', 14, 'interpreter', 'latex');



% �C�mo se comparan las gr�ficas correspondientes a X1, X3 y X4 entre s�? Explique sus
% observaciones. 
%Son iguales y esto se puede deber al aliasing


%% 4) Ajuste del espectro de frecuencia usando fftshift
% Investigue la funci�n fftshift y �sela para reordenar X1 y X2 tal que el componente de
% frecuencia cero est� al centro de los arrays. Llame a las variables resultantes X1s y
% X2s, respectivamente. En la figura 5, grafique la magnitud de X1s/N en la subfigura
% superior, y la magnitud de X2s/N en la subfigura inferior. Use la funci�n stem. El eje
% horizontal de cada gr�fica debe ser de frecuencia, en Hz, NO en radianes por muestra
% (como se hizo en el inciso 2). 
% Ayuda: el vector con las frecuencias que debe usar para el eje horizontal de las figuras
%        debe estar en el intervalo [-Fs/2, Fs/2), que corresponde a las frecuencias
%        discretas en el intervalo [-pi, pi). En el help de fftshift se muestra c�mo
%        obtener el vector (busque fshift). 

X1s = fftshift(X1);
X2s = fftshift(X2);

intervalo = linspace(-Fs/2, Fs/2,N); % (inicio, final, segmentado)

%empiezo a hacer grafica
figure('Name', 'figura 5 CRIS_PAT','NumberTitle','off');    %ventana
%Encabezado
hi = sgtitle('Se�al-->fft , CrisPat 19218, 1IE30322020221, secci�n:22');
hi.FontSize = 18;
hi.Color = 'r';
hi.FontName = 'verdana';

subplot(2,1,1); %subplot(filas, columnas, ubicacion)
stem(intervalo, abs(X1s)/N, 'filled', 'k');
grid minor;
ylabel('$\left|X[k]\right|$', 'FontSize', 14, 'interpreter', 'latex');
xlabel('Hz', 'FontSize', 14, 'interpreter', 'latex');


subplot(2,1,2); %subplot(filas, columnas, ubicacion)
stem(intervalo, abs(X2s)/N, 'filled', 'k');
grid minor;
ylabel('$\left|X[k]\right|$', 'FontSize', 14, 'interpreter', 'latex');
xlabel('Hz', 'FontSize', 14, 'interpreter', 'latex');



% �Seg�n sus gr�ficas, en qu� frecuencias aparecen los picos del espectro (los m�ximos)?

% sin ruido a los 100.5Hz
% con ruido a los 100.5Hz
% con un max de 0.5

% �Cu�nto son los valores m�ximos observados? �Qu� relaci�n tienen con las amplitudes A1 y
% A2 de los sinusoides?

%En la se�al sin ruido son 2 (0.5 y 0.3)
%En la se�al con ruido son 3 (0.5, 0.49 y 0.3)
%Ocurren a la misma frecuencia


%% 5) Espectro de amplitud unilateral
% Siga las indicaciones del help de la funci�n fft para obtener y graficar el "espectro
% de amplitud unilateral" (single-sided amplitude spectrum) de x1 y x2. Use la funci�n
% stem. Las gr�ficas deben mostrarse como subfiguras en la figura 6. El eje horizontal de
% cada gr�fica debe ser de frecuencia, en Hz.

%X1 -->fft(x1)
%X2 -->fft(x2)


P2 = abs(X1/N); %abs( trans_Fourier / Largo_senial);
P1 = P2(1:N/2+1);
P1(2:end-1) = 2*P1(2:end-1);

P22 = abs(X2/N); %abs( trans_Fourier / Largo_senial);
P11 = P22(1:N/2+1);
P11(2:end-1) = 2*P11(2:end-1);

f = Fs*(0:(N/2))/N;

%empiezo a hacer grafica
figure('Name', 'figura 6 CRIS_PAT','NumberTitle','off');    %ventana
%Encabezado
hi = sgtitle('Se�al-->fft , CrisPat 19218, 1IE30322020221, secci�n:22');
hi.FontSize = 18;
hi.Color = 'r';
hi.FontName = 'verdana';

subplot(2,1,1); %subplot(filas, columnas, ubicacion)
stem(f, P1, 'filled', 'k');
grid minor;
ylabel('|P1(f)|', 'FontSize', 14, 'interpreter', 'latex');
xlabel('Hz', 'FontSize', 14, 'interpreter', 'latex');


subplot(2,1,2); %subplot(filas, columnas, ubicacion)
stem(f, P11, 'filled', 'k');
grid minor;
ylabel('|P1(f)|', 'FontSize', 14, 'interpreter', 'latex');
xlabel('Hz', 'FontSize', 14, 'interpreter', 'latex');


% �Cu�l es el rango de frecuencias del eje horizontal?
% es de 0-124HZ

% �Seg�n sus gr�ficas, en qu� frecuencias aparecen los picos del espectro?
% sin ruido, a 100hz y 10hz
% con ruido, a 100hz, 10hz y 0hz

% �Cu�nto son los valores m�ximos observados? �Qu� relaci�n tienen con las amplitudes A1 y
% A2 de los sinusoides?

% 1 y 0.6, son los valores m�ximos
% Tienden a ser la misma m�gnitud ya que se derivan de la misma se�al

