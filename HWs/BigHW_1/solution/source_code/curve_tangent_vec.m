function vector = curve_tangent_vec(curve, curve_dot, cur_x)
    y = @(x) curve(cur_x) + curve_dot(cur_x)*(x-cur_x);
    eps = 1e-2;
    vector = [eps; y(cur_x+eps) - y(cur_x)];
    vector = vector/norm(vector);
end