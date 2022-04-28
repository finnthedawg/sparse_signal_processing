function y = MutulaCoherence(A)

% nCoulms is the number of coulms A
% for our case nCoulms = 2*N*(N+2)
% A the input Matrix
% normalization Step
[nr,nc] = size(A);
for i = 1:nc
    A(:,i) = A(:,i)/ norm(A(:,i));
end

A_InnerProduct = A' * A;

% removing the effect of diagonal part
D = diag(diag(A_InnerProduct));
a = A_InnerProduct - D;

y = max(abs(a(:)));

end