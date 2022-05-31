%% Procesamiento de Señales (2022)
% Parcial 2
% Cristhofer Isaac Patzán Martínez 
% Carne: 19218, IE3032 seccion 20


%% Primera Parte
[audio_in, audio_freq_samp1] = audioread('pista1.mp3');
%sound(audio_in, audio_freq_samp1);
% duracion = length(y)/Fs;

%Al ser un audio estereo tiene dos canales distintos, por lo que lo
%convertire a uno tipo mono y la transpongo para que sea de iguales
%dimensiones
% LeftChanel = audio_in(:,1);
% RigthChanel = audio_in(:,2);
% 
% vacio = LeftChanel - RigthChanel;
 audio_mono = 0.5*((audio_in(:,1))+(audio_in(:,2)))';

 
%ALINEANDO LOS VALORES A LA LONGITUD DEL AUDIO, Y DF ES EL RANGO DE 
%FRECUENCIA MINIMO

length_audio = length(audio_in);
df = audio_freq_samp1/length_audio;
 
%CALCULAR LOS VALORES DE FRECUENCIA A ASIGNAR EN EL EJE X DEL GRÁFICO
frequency_audio = -audio_freq_samp1/2:df:audio_freq_samp1/2-df;


%% En frecuencia
%APLICANDO LA TRANSFORMADA DE FOURIER AL ARCHIVO DE AUDIO
FFT_audio_in = fftshift(fft(audio_in)/length(fft(audio_in)));
 
% PLOT
plot(frequency_audio, abs(FFT_audio_in) );
title('FFT of input Audio');
xlabel('frequency(HZ)');
ylabel('Amplitude');


%% Filtros ideales
% Sabiendo que la voz femenina esta en un rango de 150-350Hz se realizara
% un pasa banda para capturar solo la voz y luego esta señal se le restara
% al audio original

%bPF
% lpf = 1.*( abs(f)<=1500 ); %350 es la frecuencia de corte en Hz
% hpf = 1.*( abs(f)>=1000 ); %150 es la frecuencia de corte en Hz
% 
% figure(3);
% subplot(2,1,1); %subplot(filas, columnas, ubicacion)
% plot (f, lpf, 'r');
% title("Filtro pasa bajos");
% xlabel("Frecuencia [Hz]");
% ylabel("Amplitud");
% grid on, grid minor;
% ax = gca;   %propiedades de la gráfica
% ax.XAxis.Exponent = 3; %eje x que se en escala de 3
% subplot(2,1,2); %subplot(filas, columnas, ubicacion)
% plot (f, hpf, 'r');
% title("Filtro pasa altas");
% xlabel("Frecuencia [Hz]");
% ylabel("Amplitud");
% grid on, grid minor;
% ax = gca;   %propiedades de la gráfica
% ax.XAxis.Exponent = 3; %eje x que se en escala de 3

%% Filtro en Audio

% figure(4);
% stem(f, mag_A/max(mag_A));
% hold on
% plot (f, hpf, 'r');
% 
% legend("Audio","Filtro");
% title("Filtro pasa bajos");
% xlabel("Frecuencia [Hz]");
% ylabel("Amplitud");
% grid on, grid minor;
% ax = gca;   %propiedades de la gráfica
% ax.XAxis.Exponent = 3; %eje x que se en escala de 3


%% Filtrado

%AHORA VAMOS A SEPARAR LOS DISTINTOS COMPONENTES CORTÁNDOLOS EN RANGO DE
%FRECUENCIAS
lower_threshold = 150;
upper_threshold = 2500;

%CUANDO LOS VALORES EN EL ARRAY ESTÁN EN EL RANGO DE FRECUENCIA ENTONCES
%TENEMOS 1 EN ESE ÍNDICE Y O PARA LOS DEMÁS, ES DECIR, CREAR UNA MATRIZ DE
%INDICES BOOLEANOS
 
val = abs(frequency_audio)<upper_threshold & abs(frequency_audio)>lower_threshold;
FFT_ins = FFT_audio_in(:,1);
FFT_voc = FFT_audio_in(:,1);

%POR LA MATRIZ LÓGICA DE FOURIER EN EL RANGO DE FRECUENCIA SE MANTIENE EN 
%VOCALES;Y EL RESTO EN INSTRUMENTAL Y EL RESTO DE LOS VALORES A CERO
FFT_ins(val) = 0;
FFT_voc(~val) = 0;

% A_lpf = A_m .* hpf;   %filtro pasa bajas
% H_lpf = A_lpf .* lpf; %filtro pasa altas

% bajos = A_m .* lpf;
% altos = A_m .* hpf;

% 
% figure(5);
% plot(f, abs(H_lpf)/max(abs(H_lpf))); %pasa bandas
% hold on
% plot (f, lpf, 'r');
% 
% legend("Audio filtrado","Filtro");
% title("Filtro pasa bajos");
% xlabel("Frecuencia [Hz]");
% ylabel("Amplitud");
% grid on, grid minor;
% ax = gca;   %propiedades de la gráfica
% ax.XAxis.Exponent = 3; %eje x que se en escala de 3

%% Inversa fft

% unida = bajos + altos;
% a_bpf = ifft(fftshift(unida));
% a_bpf = real(a_bpf);
% 
% a_bpf = ifft(fftshift(H_lpf));
% a_bpf = real(a_bpf);


%AHORA REALIZAMOS LA TRANSFORMADA INVERSA DE FOURIER PARA RECUPERAR LA
%SENIAL

FFT_a = ifftshift(FFT_audio_in);
FFT_a11 = ifftshift(FFT_ins);
FFT_a31 = ifftshift(FFT_voc);

%% Retroalimentacion
% resultado = vacio' - audio_mono;
%resultado = audio_mono - (a_bpf);
%resultado = a_bpf;

%% Reproducir Audio

 
%CREACIÓN DE LA SENIAL EN EL DOMINIO DEL TIEMPO
s1 = ifft(FFT_a11*length(fft(audio_in)));  
s3 = ifft(FFT_a31*length(fft(audio_in)));

% sound(s1,audio_freq_samp1); %fondo
% sound(s3,audio_freq_samp1); %voces

%ESCRIBIENDO EL ARCHIVO
audiowrite('sound_background.mp4',s1,audio_freq_samp1); %instrumento
audiowrite('sound_voice.mp4',s3,audio_freq_samp1);      %voz


% sound(resultado, Fs);
%pause(duracion+1);
 
% sound(y, Fs);
% pause(duracion+1);

%% problema 4 diseño de filtro que acepta solo 2 frecuencias


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

