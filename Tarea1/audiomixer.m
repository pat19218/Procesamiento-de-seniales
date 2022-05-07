% Cargar archivos de audio
% -> x1 = bater�a
% -> x2 = bajo
% -> x3 = armon�a
[x1, fs] = audioread('beat.wav');
x2 = ;
x3 = ;

% Tama�os de las se�ales
N1 = length(x1);
N2 = length(x2);
N = length(x3);

% Arrays para almacenar la extensi�n peri�dica de x1[n] y x2[n]
y1 = zeros(size(x3));
y2 = zeros(size(x3));

% Realizar extensi�n peri�dica por medio de modulo indexing. La funci�n
% mod de MATLAB puede ser �til. Recordar tambi�n que el primer �ndice en 
% los arrays de MATLAB es 1, no 0 como es usual en los lenguajes de 
% programaci�n.
for n = 0:(N-1)
    y1(n+1, :) = ;
    y2(n+1, :) = ;
end

% Se genera una se�al rampa que cambie desde 0 hasta 1, con la misma 
% longitud que la pista de armon�a.
w = ;
% Implementar el fade-in como la multiplicaci�n de la se�al rampa con la
% pista de armon�a.
y3 = ;

en_fade_in = true; % Seleccionar si se desea o no el efecto de fade-in.

% Implementar el mixer digital que combine la pista de armon�a con las
% extensiones peri�dicas de las pistas de bater�a y bajo.
if(en_fade_in)
    x_mix = ;
else
    x_mix = ;
end

% Probar si los resultados son los esperados
sound(x_mix, fs);