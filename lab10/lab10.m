%% Laboratorio 10
% Cristhofer Isaac Patzán Martínez 
% Carne: 19218, IE3032 seccion 20

%% Primera parte
f = 10;     % Frecuencia de 10 Hz 
Ts = 0.001; % Tiempo de muestreo 

[u, t] = gensig('square',1/f , 5*(1/f) , Ts); %(forma, periodo, duracion, muestreo) 

x = 3*not(u); % ajustando la amplitud y ciclo de trabajo para empezar en on 

L = 0.9; %lambda(1,2) para las funciones de transferencia 

numerador1 = [1-L,0];   % valores del numerador y denominador de la funcion de 
denominador1 = [1,-L];  % transferencia 1
numerador2 = [L,-L];    % valores del numerador y denominador de la funcion de 
denominador2 = [1,-L];  % transferencia 2
numerador3 = [1e-3,1e-3];% valores del numerador y denominador de la funcion de 
denominador3 = [2,-2];   % transferencia 3

H1 = tf(numerador1, denominador1, Ts); % funcion de transferencia 1
H2 = tf(numerador2, denominador2, Ts); % funcion de transferencia 2
H3 = tf(numerador3, denominador3, Ts); % funcion de transferencia 3

R1 = lsim(H1, x, t);   % respuesta de funcion de transferencia 1
R2 = lsim(H2, x, t);   % respuesta de funcion de transferencia 2
R3 = lsim(H3, x, t);   % respuesta de funcion de transferencia 3


% %empiezo a hacer grafica
% figure('Name', 'figura 1 CRIS_PAT','NumberTitle','off');    %ventana
% %Encabezado
% hi = sgtitle('Transferencias discretas, CrisPat 19218, 1IE30322020221, sección:22');
% hi.FontSize = 18;
% hi.Color = 'r';
% hi.FontName = 'verdana';

% graficando la señal de entrada y la respuesta de la H1(Z) 
% subplot(3, 1, 1)
figure(1)
stairs(t,x)
hold on 
title('Señal de entrada y respuesta de función de transferencia 1')
stairs(t,R1)
legend('Cuadrada','Suavizador')
xlabel('Tiempo (s)', 'FontSize', 14, 'interpreter', 'latex');
ylabel('Voltaje (V)', 'FontSize', 14, 'interpreter', 'latex');
hold off


% graficando la señal de entrada y la respuesta de la H2(Z)
%subplot(3, 1, 2)
figure(2)
stairs(t,x)
hold on 
title('Señal de entrada y respuesta de función de transferencia 2')
stairs(t,R2)
legend('Cuadrada','Afilador')
xlabel('Tiempo (s)', 'FontSize', 14, 'interpreter', 'latex');
ylabel('Voltaje (V)', 'FontSize', 14, 'interpreter', 'latex');
hold off

% graficando la señal de entrada y la respuesta de la H3(Z)
%subplot(3, 1, 3)
figure(3)
stairs(t,x)
hold on 
title('Señal de entrada y respuesta de función de transferencia 3')
stairs(t,R3)
legend('Cuadrada','Integrador')
ylabel('tiempo (s)', 'FontSize', 14, 'interpreter', 'latex');
xlabel('Voltaje (v)', 'FontSize', 14, 'interpreter', 'latex');
hold off

%% RESPUESTAS

% La primer funcion de transferencia es un filtro suavizador ya que vemos
% que eliminar el comportamientos de los pulsos verticales de la señal
% cuadrada por un curva suave que asciendo a 1 y desciende a 0. 


% La tercer funcion de transferencia es el sistema integrador ya que vemos
% que en las partes en donde la señal cuadrada esta en el ciclo activo la
% señal de respuesta es una recta positiva y cuando el ciclo es bajo, vemos
% que se comporta como una recta constante hasta que haya un nuevo ciclo de
% trabajo activo. 

% Por ultimo por descarte, la segunda funcion de transferencia es el filtro
% afilador. 


