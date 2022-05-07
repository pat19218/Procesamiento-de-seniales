%% Procesamiento de Señales - Laboratorio (2022)
%  Laboratorio 12
% Cristhofer Isaac Patzán Martínez 
% Carne: 19218, IE3032 seccion 20

%% Primera Parte
% especifico landas
landa1 = 0.9;
landa2 = 0.9;

x_n = 0;
x_n_1 = 0;
y_n = 0;
y_n_1 = 0;
% -------------------------------------------------------------------------
%   Ecuación de diferencias: 
%   y1[n] = (1-landa1) * x[n] + landa1 * y[n-1]
%   y2[n] = landa2 * x[n] - landa2 * x[n-1] + landa2 * y[n-1]
%   Definición de variables:
%   y[n] -> y_n
%   x[n] -> x_n
%   x[n-1] -> x_n_1
%   y[n-1] -> y_n_1

f = 10;     % Frecuencia de 10 Hz 
Ts = 0.001; % Tiempo de muestreo 
[u, t] = gensig('square',1/f , 5*(1/f) , Ts); %(forma, periodo, duracion, muestreo)
x_n = 3*not(u); % ajustando la amplitud y ciclo de trabajo para empezar en on 

y1_n = sistema(x_n,1);
y2_n = sistema(x_n,2);

figure(1)
stairs(t,x_n)
hold on 
title('Señal de entrada y respuesta de función de transferencia 1')
stairs(t,y1_n)
legend('Cuadrada','Suavizador')
xlabel('Tiempo (s)', 'FontSize', 14, 'interpreter', 'latex');
ylabel('Voltaje (V)', 'FontSize', 14, 'interpreter', 'latex');
hold off

figure(2)
stairs(t,x_n)
hold on 
title('Señal de entrada y respuesta de función de transferencia 2')
stairs(t,y2_n)
legend('Cuadrada','Afilador')
xlabel('Tiempo (s)', 'FontSize', 14, 'interpreter', 'latex');
ylabel('Voltaje (V)', 'FontSize', 14, 'interpreter', 'latex');
hold off

%Las graficas respecto al laboratorio 10 no han tenido ningun cambio

