%Autor: Cristhofer Patzán
%Matlab R2020a
%Gráficas
%
hi = sgtitle('Cristhofer Isaac Patzán Martínez, 19218, 1IE30322020221, sección:22')
hi.FontSize = 18;
hi.Color = 'r';
hi.FontName = 'verdana'
subplot(2,4,1) %subplot(filas, columnas, ubicacion)
a = 5; b = 12; N = 50; 
x1 = linspace(a, b, N);
y1 = sqrt(x1.^3) .* sin(x1);
plot(x1, y1, 'r', 'LineWidth', 5);
xlabel('abscisas');
ylabel('ordenadas');
hold on 
x2 = x1;
y2 = sin(2*x2);
plot(x2, y2, 'g', 'LineWidth', 1);
x3 = x2;
y3 = abs(x3);
plot(x3, y3, 'b', 'LineWidth', 2);
title('primero')
subplot(2,4,2)
a = 0; b = 2*pi; N = 500;
g = 0;  c= 2*pi; M = 500;
t = linspace(a,b,N);
u = linspace(g,c,M);
x4 = 3 .* cos(2.*t);
y4 = 3 .* sin(u.*t);
z4 = t;
plot3(x4,y4,z4, 'Color', [0,0.7,0.9]);
xlabel('abscisas')
ylabel('ordenadas')
zlabel('elevación')
title('segundo')
subplot(2,4,3)
r1 = 0.3.*t;
polarplot(t.*u, r1, 'Color', [0.5,0.5,0.3]);
thetaticks(0:45:315)
hold on
r1 = sin(2.*t);
polarplot(t, r1, 'Color', 'r');
title('tercer')
subplot(2,4,[4 8]) %para abarcar dos espacios verticales []
                   %para abarcar dos espacios horizontales :
[X, Y] = meshgrid(-10:0.25:10,-5:0.25:5);
Z = X.*Y;
surfc(X, Y, Z);
xlabel('x'); ylabel('y'); zlabel('z');
title('octavo')
xlabel('abscisas')
ylabel('ordenadas')
zlabel('elevación')
subplot(2,4,5)
fimplicit(@(x,y) x.^2 + (y - nthroot(x.^2,3)).^2 - 1, 'r', 'LineWidth', 2)
hold on
fimplicit(@(x,y) x.^3 + y.^3 - 6.*x.*y, 'g', 'LineWidth', 1)
xlabel('abscisas')
ylabel('ordenadas')
title('cuarto')
subplot(2,4,6)
%In general, you can generate N random numbers in the interval (a,b) 
%with the formula r = a + (b-a).*rand(N,1).
x = -3 + (4+5)*rand(100,1);
y = 1 + (6-1)*rand(100,1);  
scatter(x,y, 'filled', 'g')
title('quinto')
xlabel('eventos')
ylabel('tiempo')
subplot(2,4,7)
load wind
[sx,sy,sz] = meshgrid(80,20:10:50,0:5:15);
verts = stream3(x,y,z,u,v,w,sx,sy,sz);
div = divergence(x,y,z,u,v,w);
streamtube(verts,x,y,z,-div);
view(3);
axis tight
shading interp
camlight 
lighting gouraud
title('sexto')
xlabel('abscisas')
ylabel('ordenadas')
zlabel('elevación')