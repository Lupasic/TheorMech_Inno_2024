clear;
%% Input data
input_data;

% We assuming that the best strategy is trapez velocity, let's calculate
% time.
t_a = v_max/a_max;
t_b = curve_len/v_max;


n_a = ceil(t_a/step);
n_b = n_a + ceil((t_b-t_a)/step);

%Discret one
t_a = n_a*step;
t_b = n_b*step;

t_full = t_a+t_b;

if mod(t_full,2*step) ~= 0
    t_full = t_full + step;
end


v_max_real = curve_len/(t_full - t_a);
t_b = curve_len/v_max_real;
a_max_real = v_max_real/t_a;

% v_max_real = v_max;
% a_max_real = a_max;

v = [0];
a = [a_max_real 0];
X = [];
sigm = [0];
cur_step = step;
R = [];




while true
    
    % finding x(sigm)
    temp_func = @(cur_x) abs(sigm(end) - curve_len_func(cur_x));
    cur_x = fminbnd(temp_func,0,max_x);
    X = [X; cur_x curve(cur_x)];
    
    %calculating needed acc
    if v(end) ~= v_max && (v_max-v(end))/step > a_max
        
    end
    
    if cur_step < t_a
        cur_v = v(end) + a_max_real*step;
    end
    %t_b+step is very important stuff
    if cur_step >= t_a && cur_step < t_b+step
        cur_v = v(end);
    end
    
    if cur_step >= t_b+step
        cur_v = v(end) - a_max_real*step;
    end
    
    v = [v; cur_v];
    
    cur_a_tan = (v(end)-v(end-1))/step;
    cur_a_n = abs(v(end)^2*curvature_value(curve_dot,curve_dot_dot,X(end,1)));
    
    a = [a;cur_a_tan  cur_a_n];
    sigm = [sigm; sigm(end) + v(end-1)*step + a(end,1)*step^2/2];
    cur_step = cur_step + step;
    
    if cur_step > t_full+step
        break
    end
    
    
end
% Make all data in the same dimentions
X = [X; X(end,:)];

%% Plots
% amount of subplots
n = 5;
x = 0:step:max_x;
time = (1:length(a))*step';

subplot(n,1,1)
plot(time,X(:,2))
grid on
xlabel('t')
ylabel('y')

subplot(n,1,2)
plot(time,v)
grid on
xlabel('t')
ylabel('v')

subplot(n,1,3)
plot(time,a(:,1))
grid on
xlabel('t')
ylabel('a_t')

subplot(n,1,4)
plot(time,a(:,2))
grid on
xlabel('t')
ylabel('a_n')
% 
subplot(n,1,5)
plot(X(:,1),X(:,2))
grid on
xlabel('x')
ylabel('y')
