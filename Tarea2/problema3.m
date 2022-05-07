% Cargar archivos de audio
% -> x = guitarra
% -> h1, h2, h3, h4 = respuestas impulsionales
[x, fs] = audioread('riff.wav');
h1 = audioread('ir_church.wav'); %efecto de eco -lugar abierto-
h2 = audioread('ir_pringles.wav');%sonido tapado
h3 = audioread('ir_pyramid.wav'); %efecto auditorio -lugar cerrado-
h4 = audioread('ir_wc.wav'); %supresor de bajos

% Efectuar la reverberación por convolución con el audio de la guitarra y
% la respuesta impulsional deseada
y = convreverb(x, h1); %a la señal se le da el efecto deseado

% Se normaliza el audio para que esté dentro del rango permitido
y = y / max(abs(y));

% Probar si los resultados son los esperados
sound(y, fs);

N1 = 0:length(x)-1;
N2 = 0:length(h1)-1;
N = length(N1)+length(N2)-2;
N3 = 0:N;
%empiezo a hacer grafica
figure('Name', 'figura 1 CRIS_PAT','NumberTitle','off');%ventana Encabezado
hi = sgtitle('Guitarra , CrisPat 19218, 1IE30322020221, sección:22');
hi.FontSize = 18;
hi.Color = 'r';
hi.FontName = 'verdana';

subplot(3,1,1)
plot(N1,x);
grid minor                              
title('Guitarra')
ylabel('Magnitud', 'FontSize', 14, 'interpreter', 'latex')
xlabel('Hz', 'FontSize', 14, 'interpreter', 'latex')
subplot(3,1,2)
plot(N2,h1);
grid minor                               
title('Respuesta impulsional')
ylabel('Magnitud', 'FontSize', 14, 'interpreter', 'latex')
xlabel('Hz', 'FontSize', 14, 'interpreter', 'latex')
subplot(3,1,3)
plot(N3,y)
grid minor                               
title('Convolucion')
ylabel('Magnitud', 'FontSize', 14, 'interpreter', 'latex')
xlabel('Hz', 'FontSize', 14, 'interpreter', 'latex')
