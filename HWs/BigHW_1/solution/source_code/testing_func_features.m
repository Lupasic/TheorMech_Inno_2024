% epsilon = 1e-10;
% f = @(x) x^2;
% f1 = @(x) (f(x+epsilon) - f(x)) / epsilon;
% 
% f1(5)
% исходные данные в X0, Y0
% интерполировать в X, Y
X = 0:0.1:20;
Y = sin(X);
% найдём производную dy/dx = (y(x+dx) - y(x-dx)) / (2*dx)
dX = X(2:end-1);
dY = (Y(3:end) - Y(1:end-2)) ./ (X(3:end) - X(1:end-2));
% построим анимацию
for i = 2:length(dX)-1
   x1 = X(i)-0.5;
   y1 = dY(i) * x1 + Y(i) - dY(i) * X(i); %  + X(i)
   x2 = X(i)+0.5;
   y2 = dY(i) * x2 + Y(i) - dY(i) * X(i);
   plot(X, Y, 'b-', [x1 x2], [y1 y2], 'r-');
   xlim([min(X) max(X)]);
   ylim([min(Y)-0.1 max(Y)+0.1]);
   curve_tangent_vec(@(x) sin(x), @(x) cos(x),X(i));
   prev_point = curve_tangent_vec(@(x) sin(x), @(x) cos(x),X(i-1));
   next_point = curve_tangent_vec(@(x) sin(x), @(x) cos(x),X(i+1));
   curvature = norm((next_point - prev_point)/(2*dX(1)))
   drawnow;
   pause(0.1)
 end