function q = slope_field(func, t_range, y_range, t_intervals, y_intervals, f_type)
       
    assert( max(size(t_range))  == 2, "Only two values for t required, start and end")
    assert( max(size(y_range))  == 2, "Only two values for y required, start and end")
    t_vals =  t_range(1):t_intervals:t_range(2);
    y_vals =  y_range(1):y_intervals:y_range(2);

    assert((f_type) == 1 || (f_type) == 2 || (f_type) == 3, "Invalid function type, use 1, 2, or 3")
    [T,Y] = meshgrid(t_vals, y_vals);
    

    U = ones(size(T)) * t_intervals;
    if f_type == 1
        V = func(T);
    elseif f_type == 2
        V = func(Y);
    else % f_type == 3
        V = func(T,Y);
    end 
    V = V.*U;
    q = quiver(T,Y,U,V);
    q.ShowArrowHead = "off";
    q; 
    axis tight;
end