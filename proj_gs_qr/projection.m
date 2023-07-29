function proj = projection(x,y)
  % Project x onto y
  assert(all(size(x) == size(y)))
  proj = (dot(y,x)/dot(y,y))*y;
end






% A = [1 1 0; 0 0 -1; 0 -2 -1]
% A_orthogonal = gramschmidt(A)
% 
% [Q, R] = qr(A)
