function y = convreverb(x, h)
    N1 = length(x);
    N2 = length(h);
    N = N1 + N2 - 1;
    y = 0:N;
    y = conv(x,h); %como es convolucion el orden de operador no importa
    
end
