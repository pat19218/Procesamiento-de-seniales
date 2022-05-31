%% Procesamiento de Señales - Laboratorio (2022)
%  Laboratorio 13
% Cristhofer Isaac Patzán Martínez 
% Carne: 19218, IE3032 seccion 20


%% Primera Parte
% Use la función freqz para obtener vectores con la respuesta en frecuencia y la
% frecuencia angular para el sistema H1 descrito en la guía. 
% Ayuda: llame a la función así: [h, w] = freqz(num, den);
% Nota: podría agregar un tercer argumento en la función freqz, con el número de puntos
% deseados. Si no se incluye, la función usa un número por defecto.
% En la figura 1, grafique la magnitud (NO en dB) de la respuesta versus la frecuencia
% angular en la subfigura superior, y la fase (en grados) de la respuesta versus la
% frecuencia angular en la subfigura inferior. Use plot para graficar. Active la
% cuadrícula para las gráficas.
% Ayuda: para verificar que sus gráficas son correctas, puede usar la función fvtool.
% NO INCLUYA EL LLAMADO A fvtool EN SU SCRIPT FINAL QUE SUBIRÁ A CANVAS.

landa1 = 0.8;
landa2 = 0.5;


num = [0.6561, 0, 0.002012, 0, 1]; %función de transferencia 1
den = [1, 0, 0.000604, 0, 1];

[h1, w1] = freqz(num, den);

figure(1)
subplot(2,1,1); %subplot(filas, columnas, ubicacion)
plot(w1/pi, abs(h1))
grid minor;
title('Señal de entrada y respuesta de función de transferencia 1')
xlabel('Frecuencia angular (rad/muestra)', 'FontSize', 14, 'interpreter', 'latex');
ylabel('Magnitud', 'FontSize', 14, 'interpreter', 'latex');

subplot(2,1,2); %subplot(filas, columnas, ubicacion)
plot(w1/pi, rad2deg(angle(h1)))
grid minor;
title('Señal de entrada y respuesta de función de transferencia 1')
xlabel('Frecuencia angular (rad/muestra)', 'FontSize', 14, 'interpreter', 'latex');
ylabel('Fase (grados)', 'FontSize', 14, 'interpreter', 'latex');

% Repita lo anterior para el sistema H2. Grafique la magnitud y fase (en grados) de la
% respuesta en frecuencia en la figura 2.

num = [landa2, -landa2]; %función de transferencia 1
den = [1, -landa2];

[h2, w2] = freqz(num, den);

figure(2)
subplot(2,1,1); %subplot(filas, columnas, ubicacion)
plot(w2/pi, abs(h2))
grid minor;
title('Señal de entrada y respuesta de función de transferencia 1')
xlabel('Frecuencia angular (rad/muestra)', 'FontSize', 14, 'interpreter', 'latex');
ylabel('Magnitud', 'FontSize', 14, 'interpreter', 'latex');

subplot(2,1,2); %subplot(filas, columnas, ubicacion)
plot(w2/pi, rad2deg(angle(h2)))
grid minor;
title('Señal de entrada y respuesta de función de transferencia 1')
xlabel('Frecuencia angular (rad/muestra)', 'FontSize', 14, 'interpreter', 'latex');
ylabel('Fase (grados)', 'FontSize', 14, 'interpreter', 'latex');

% Repita lo anterior para el sistema H3. Grafique la magnitud (ESTA VEZ EN dB), y fase (en
% grados) de la respuesta en frecuencia en la figura 3.

num = [10^(-3), 10^(-3)]; %función de transferencia 1
den = [2, -2];

[h3, w3] = freqz(num, den);

figure(3)
subplot(2,1,1); %subplot(filas, columnas, ubicacion)
plot(w3/pi, abs(h3))
grid minor;
title('Señal de entrada y respuesta de función de transferencia 1')
xlabel('Frecuencia angular (rad/muestra)', 'FontSize', 14, 'interpreter', 'latex');
ylabel('Magnitud', 'FontSize', 14, 'interpreter', 'latex');

subplot(2,1,2); %subplot(filas, columnas, ubicacion)
plot(w3/pi, rad2deg(angle(h3)))
grid minor;
title('Señal de entrada y respuesta de función de transferencia 1')
xlabel('Frecuencia angular (rad/muestra)', 'FontSize', 14, 'interpreter', 'latex');
ylabel('Fase (grados)', 'FontSize', 14, 'interpreter', 'latex');

%% 2) Segunda Parte
% En la figura 4, en la subfigura superior, grafique la magnitud (NO en dB)
% correspondiente a H1, y en la subfigura inferior, grafique la magnitud (NO en dB)
% correspondiente a H2, pero esta vez, grafique versus la frecuencia en Hz (NO en
% rad/muestra). Igual que antes, use plot para graficar. Para obtener el vector de
% frecuencias en Hz, use cualquiera de los vectores w obtenidos con freqz en la Primera
% Parte y la frecuencia de muestreo Fs usada en la Primera y Segunda partes del Lab 11
% (dicha variable está en el archivo PS_Lab11_datos.mat).
% Active la cuadrícula para las gráficas.
load('PS_Lab11_datos.mat')
f = Fs*w1/length(w1)*100;
figure(4)
subplot(2,1,1); %subplot(filas, columnas, ubicacion)
plot(w1/(length(h1)-1)*1000, abs(h1))
%plot(f, abs(h1))
grid minor;
title('Señal de entrada y respuesta de función de transferencia 1')
xlabel('Frecuencia angular (kHz)', 'FontSize', 14, 'interpreter', 'latex');
ylabel('Magnitud', 'FontSize', 14, 'interpreter', 'latex');

subplot(2,1,2); %subplot(filas, columnas, ubicacion)
plot(w2/(length(h2)-1)*1000, abs(h2))
%plot(f, abs(h2))
grid minor;
title('Señal de entrada y respuesta de función de transferencia 1')
xlabel('Frecuencia angular (kHz)', 'FontSize', 14, 'interpreter', 'latex');
ylabel('Magnitud', 'FontSize', 14, 'interpreter', 'latex');

% 2.1) Compare con atención la figura 4 y la figura 2 DEL LAB 11 (en dicha figura se
%      graficaron los espectros de amplitud unilateral de y3H1 y y3H2, que eran los
%      resultados de aplicar H1 y H2 a x3, respectivamente). Discuta brevemente si  
%      lo observado en las gráficas tiene sentido y es consistente.
%      Ayuda: puede graficar el espectro de amplitud unilateral de y3H1 en la subfigura
%      superior de la figura 4, y el espectro de amplitud unilateral de y3H2 en la
%      subfigura inferior de la figura 4 (use hold on, grafique con stem, y use un color
%      distinto). Al graficar los espectros junto con las respuestas en frecuencia podrá
%      ver más claramente el efecto de H1 y H2 sobre x3. Lo anterior es OPCIONAL, pero
%      recomendado.
% RESPUESTA: Totalmente tiene sentido, ya que se puede ver de forma clara
% las ubicaciones de donde se ha aplicado el filtro y de esta manera
% determinar que tipo de filtro es, en el caso de y3H1 es un filtro pasa
% bajos justo como se ve en la figura 4, lo mismo sucede para la otra
% gráfica con la diferencia que es un filtro pasa altas. De hecho hasta las
% magnitudes concuerdan
