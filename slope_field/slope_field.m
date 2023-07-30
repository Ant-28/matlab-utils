function q = slope_field(func, t_range, y_range, t_intervals, y_intervals, f_type, varargin)
       
    assert( max(size(t_range))  == 2, "Only two values for t required, start and end")
    assert( max(size(y_range))  == 2, "Only two values for y required, start and end")
    t_vals =  t_range(1):t_intervals:t_range(2);
    y_vals =  y_range(1):y_intervals:y_range(2);

    assert((f_type) == 1 || (f_type) == 2 || (f_type) == 3, "Invalid function type, use 1, 2, or 3")
    [T,Y] = meshgrid(t_vals, y_vals);
    

    U = ones(size(T));
    if f_type == 1
        V = func(T);
    elseif f_type == 2
        V = func(Y);
    else % f_type == 3
        V = func(T,Y);
    end 
%     V = V;

    
    

    
% manual scaling, looks kinda off though
    

    dist_mat = sqrt(U.^2 + V.^2);
    max_dist = 0.95 * sqrt(t_intervals^2 + y_intervals^2);
    min_dist = 0.5 * max_dist;
    max_ind =  dist_mat > max_dist;
    min_ind =  dist_mat < min_dist;
    U(max_ind) = U(max_ind) ./ dist_mat(max_ind) * max_dist ;
    V(max_ind) = V(max_ind) ./ dist_mat(max_ind) * max_dist ;
    U(min_ind) = U(min_ind) ./ dist_mat(min_ind) * min_dist ;
    V(min_ind) = V(min_ind) ./ dist_mat(min_ind) * min_dist ;
    dist_mat = sqrt(U.^2 + V.^2);
    wide = U > t_intervals;
    U(wide) = U(wide) ./ dist_mat(wide) * t_intervals;
    V(wide) = V(wide) ./ dist_mat(wide) * t_intervals;

    tall = V > y_intervals;
    U(tall) = U(tall) ./ dist_mat(tall) * y_intervals;
    V(tall) = V(tall) ./ dist_mat(tall) * y_intervals;
 
%     q = quiver(T,Y,U,V, varargin{:});
    q = quiver(T,Y,U,V, "AutoScale", "off");
    q.ShowArrowHead = "off";
    
    axis tight;
end