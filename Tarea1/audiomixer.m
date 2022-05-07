% Cargar archivos de audio
% -> x1 = batería
% -> x2 = bajo
% -> x3 = armonía
[x1, fs] = audioread('beat.wav');
x2 = ;
x3 = ;

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
for n = 0:(N-1)
    y1(n+1, :) = ;
    y2(n+1, :) = ;
end

% Se genera una señal rampa que cambie desde 0 hasta 1, con la misma 
% longitud que la pista de armonía.
w = ;
% Implementar el fade-in como la multiplicación de la señal rampa con la
% pista de armonía.
y3 = ;

en_fade_in = true; % Seleccionar si se desea o no el efecto de fade-in.

% Implementar el mixer digital que combine la pista de armonía con las
% extensiones periódicas de las pistas de batería y bajo.
if(en_fade_in)
    x_mix = ;
else
    x_mix = ;
end

% Probar si los resultados son los esperados
sound(x_mix, fs);