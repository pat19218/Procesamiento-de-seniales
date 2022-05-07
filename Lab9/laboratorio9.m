%Se que la frecuencia de muestreo es de 100Hz, por lo que en 5 segundos
%obtendre 500 datos

datos = zeros(500,1);
N = 1:500;

%exist

s = serialport("COM4",115200); 
%data = read(s,500,"uint32"); %(puerto, cantidad de datos, tipo de variable)
%%
flush(s);

for i = N
    leo = readline(s);
    datos(i) = str2double(leo);
end

volt = (3.3/4095) .* datos;

VOLT = fft(volt);




largo = length(VOLT);

P2 = abs(VOLT/largo); %abs( trans_Fourier / Largo_senial);
P1 = P2(1:largo/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = 100*(0:(largo/2))/largo;

%empiezo a hacer grafica
figure('Name', 'figura 1 CRIS_PAT','NumberTitle','off');    %ventana
%Encabezado
hi = sgtitle('Señal-->fft , CrisPat 19218, 1IE30322020221, sección:22');
hi.FontSize = 18;
hi.Color = 'r';
hi.FontName = 'verdana';

subplot(3, 1, 1)
stairs(datos)
grid minor;
xlabel('Tiempo', 'FontSize', 14, 'interpreter', 'latex');
ylabel('dato', 'FontSize', 14, 'interpreter', 'latex');

subplot(3, 1, 2)
plot(volt)
grid minor;
xlabel('Tiempo', 'FontSize', 14, 'interpreter', 'latex');
ylabel('dato', 'FontSize', 14, 'interpreter', 'latex');

subplot(3, 1, 3)
stem(f, P1);
grid minor;
ylabel('|P1(f)|', 'FontSize', 14, 'interpreter', 'latex');
xlabel('F(Hz)', 'FontSize', 14, 'interpreter', 'latex');
