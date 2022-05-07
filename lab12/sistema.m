% EJEMPLO de implementaci�n de una ecuaci�n de diferencias
% -------------------------------------------------------------------------
%   Ecuaci�n de diferencias: 
%   y[n] = 0.5 * x[n] - 0.25 * x[n-1] + 0.75 * y[n-1]
%   Definici�n de variables:
%   y[n] -> y_n
%   x[n] -> x_n
%   x[n-1] -> x_n_1
%   y[n-1] -> y_n_1

function y_n = sistema(x_n, quien)
    % Inicializaci�n de memoria (variables con los valores anteriores)
    x_n_1 = 0;
    y_n_1 = 0;

    % Duraci�n de la se�al de entrada
    N = length(x_n);

    % Inicializaci�n de la se�al de salida
    y_n = zeros(size(x_n));
    
    if quien == 0
        for i = 1:N
        y_n(i) = 0.5 * x_n(i) - 0.25 * x_n_1 + 0.75 * y_n_1;
        x_n_1 = x_n(i);
        y_n_1 = y_n(i);
        end
    elseif quien == 1
        for i = 1:N
        y_n(i) = (1-0.9) * x_n(i)+ 0.9 * y_n_1;
        y_n_1 = y_n(i);
        end
    elseif quien == 2
        for i = 1:N
        y_n(i) = (0.9) * x_n(i)- 0.9 * x_n_1 + 0.9 * y_n_1;
        y_n_1 = y_n(i);
        x_n_1 = x_n(i);
        end
    end
end

