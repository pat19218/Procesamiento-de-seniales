close all;
clear all;

priorPorts=instrfind;
delete(priorPorts);
s = serial('COM4', 'Baudrate',115200)
fopen(s);
i = 1
while(1)
    data(i) = str2double(fscanf(s));
    plot(data);
    pause(0.01)
    i = i+1;
end
fclose(s)  