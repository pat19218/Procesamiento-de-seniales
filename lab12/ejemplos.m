n = 0:50;
x_n = sin((2*pi*n)/10);
% x_n = exp(-0.01*n);
% x_n = ones(1,50);
% x_n = zeros(1,50); x_n(1) = 1;
figure;
subplot(1,2,1);
stem(x_n, 'k','filled');

y_n = sistema(x_n);
subplot(1,2,2);
stem(y_n, 'k', 'filled');