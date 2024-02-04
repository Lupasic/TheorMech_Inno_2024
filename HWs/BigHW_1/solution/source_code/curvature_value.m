function k = curvature_value(curve_dot, curve_dot_dot,cur_x)
k = curve_dot_dot(cur_x)/((1+(curve_dot(cur_x)).^2)^(3/2));
end

