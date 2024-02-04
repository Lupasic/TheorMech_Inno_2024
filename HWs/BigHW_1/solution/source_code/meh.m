% Trajectory
A = 5;
om = 3;
theta_0 = 0.2;
curve = @(x) A*sin(om*x + theta_0);
max_x = 4;

sigm = 5;


temp_func = @(cur_x) abs(sigm - integral(@(x) sqrt((15*cos(3*x + 1/5)).^2 + 1),0,cur_x));

[asolution,intval] = fminbnd(temp_func,0,3)

% epsilon = 1e-10;
% curve_dot = @(x) (curve(x+epsilon) - curve(x)) / epsilon;
% curve_dot_dot = @(x) (curve_dot(x+epsilon) - curve_dot(x)) / epsilon;
% len_temp = @(x) sqrt(curve_dot(x).^2 + 1);
% curve_len_func = @(cur_x) integral(len_temp,0,cur_x);
% curve_len = curve_len_func(max_x);
% 
% 
% 
% 
% %find x(sigm)
% sigm = 37.61;
% temp_func = @(cur_x) sigm - curve_len_func(cur_x);
% % options = optimoptions('fmincon','Display','iter','Algorithm','sqp');
% options = optimset('PlotFcns',@optimplotfval);
% fmincon(temp_func,36,1,curve_len)

