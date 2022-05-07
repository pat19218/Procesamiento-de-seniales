% =========================================================================
% IE3032 - Análisis de Fourier (discreto)
% -------------------------------------------------------------------------
% Se calcula y visualiza la DFT de una señal discreta x[n] dada.
% =========================================================================
% Selección de ejemplo
% 1. Señal discreta aleatoria
% 2. Audio, sinusoide con tono A7
% 3. EMG
ejsel = 1; 

% Se define la señal discreta a analizar
switch ejsel
    case 1
        x = [-1, 2, 3, 0, -5, -2];
%         x = [1, -1, 1, -1, 1, -1];
        %x = [1, 3, 0, -1, 4, 2];
    case 2
        fs = 44100;
        fd = 3520;
        %n = 0:fs-1;
        n = 0:fs/500 - 1;
        x = 0.5*sin((fd/fs)*pi*n);
        %sound(x, fs);
    case 3
        load emg_example_data;
        idx = 2000;
        x = healthy_val(idx:idx+500);
end
        
% Se obtiene el tamaño/intervalo de definición de la señal discreta
N = length(x);
n = 0:N-1;

% Se visualiza un stemplot de la señal discreta
figure;
subplot(2,2,1);
stem(n, x, 'filled', 'k');
xlabel('$n$', 'FontSize', 16, 'interpreter', 'latex');
ylabel('$x[n]$', 'FontSize', 16, 'interpreter', 'latex');
grid minor;

% Se define la 'resolución' con la que se calculará la FFT
fftres = 1*2*2*5*10;

% Se calcula y visualiza la DFT de la señal discreta mediante la FFT
M = fftres*N;
X = fft(x, M);
k = 0:M-1;
dw = 2*pi/M; % Frecuencias armónicas
w = k*dw/pi; % Ticks de frecuencia normalizada (x pi rad/muestra)

absplot = subplot(2,2,2);
stem(w, abs(X), 'filled', 'k');
grid minor;
ylabel('$\left|X[k]\right|$', 'FontSize', 14, 'interpreter', 'latex');
xlabel('$\omega \ (\times \pi \ \mathrm{ rad/}\mathrm{muestra})$', 'FontSize', 14, 'interpreter', 'latex');

argplot = subplot(2,2,4);
stem(w, angle(X), 'filled', 'k');
grid minor;
ylabel('$\angle X[k]$', 'FontSize', 14, 'interpreter', 'latex');
xlabel('$\omega \ (\times \pi \ \mathrm{ rad/}\mathrm{muestra})$', 'FontSize', 14, 'interpreter', 'latex');