





function gs_mat = gramschmidt(A)
  linear_independence_assertion(A);
  gs_mat = zeros(size(A));
  size_data = size(A);
  ncols = size_data(2);
  nrows = size_data(1);
  gs_mat(1:end,1) = A(1:end,1);
  for i = 2:ncols
    proj_diff = zeros(nrows,1);
    j = 1;
    while j < i
       proj_diff = proj_diff -1*projection(A(1:end,i), gs_mat(1:end,j));
      j = j+1;
    end
    gs_mat(1:end, i) = A(1:end,i) + proj_diff;
  end
  
end