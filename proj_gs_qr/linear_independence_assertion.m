
function linear_independence_assertion(A)
  size_data = size(A);
  ncols = size_data(2);
  assert(rank(A) == ncols, "Matrix not linearly independent")
end