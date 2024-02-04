a_max = 2;
v_max = 3;
a_n_max = 3;

% Trajectory
A = 3;
om = 3;
theta_0 = 0.2;
curve = @(x) A*x*log(x/6);
max_x = 4;


%% Solution

step = 0.05;


% Find a curve length
epsilon = 1e-10;
syms t;
curve_dot = matlabFunction(diff(curve(t)));
curve_dot_dot = matlabFunction(diff(curve_dot(t)));
len_temp = @(x) sqrt(curve_dot(x).^2 + 1);
curve_len_func = @(x) integral(len_temp,0,x);
curve_len = curve_len_func(max_x);

%find x(sigm) example
% sigm = 37.6
% temp_func = @(cur_x) abs(sigm - curve_len_func(cur_x));
% [asolution,intval] = fminbnd(temp_func,0,max_x);
