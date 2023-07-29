function norm_mat = normal_matrix(A)
  norm_mat = zeros(size(A));
  size_data = size(A);
  ncols = size_data(2);
  for i = 1:ncols
    norm_mat(1:end, i) = norm_mat(1:end, i) + vector_normalize(A(1:end,i));
  end
end