
clc
clear all , close all,
A = imread('cameraman.tif');
A = A([150:199],[150:199]);
x = double(A(:));
n = length(x);


m = 1250; 
Phi = randn(m,n);
%__ALTERNATIVES TO THE ABOVE MEASUREMENT MATRIX___ 
%Phi = (sign(randn(m,n))+ones(m,n))/2; % micro mirror array (mma) e.g. single
%pixel camera Phi = orth(Phi')'; 


y = Phi*x;

Theta = zeros(m,n);
for ii = 1:n
    ii
    ek = zeros(1,n);
    ek(ii) = 1;
    psi = idct(ek)';
    Theta(:,ii) = Phi*psi;
end

mu = MutulaCoherence(Theta)
for z = 1:n
    H(:,z) = Theta(:,z) /( norm(Theta(:,z))^1 * (1+ mu) );
end


%___l2 NORM SOLUTION___ s2 = Theta\y; %s2 = pinv(Theta)*y
s2 = pinv(Theta)*y;

%___SOLUTION___

cvx_begin
    variable s1(n)
    minimize(norm(s1 ,1))
    subject to
            %%% uncomment each line if you want other methods of solution%%%
            %norm( H' * (Theta * s1 - y), Inf ) <= 1e-6       %proposed H%
            %norm( Theta' * (Theta * s1 - y), Inf ) <= 1e-6   %Dantzing Selector%
            norm(Theta * s1 - y, 2) <= 1e-6                  %Basis Pursuit Dennoising%           
cvx_end


%___DISPLAY SOLUTIONS___
plot(s2,'b'), hold
plot(s1,'r.-')
legend('least squares','basis pursuit')
title('solution to y = \Theta s')

%___IMAGE RECONSTRUCTIONS___
x2 = zeros(n,1);
for ii = 1:n
    ii
    ek = zeros(1,n);
    ek(ii) = 1;
    psi = idct(ek)';
    x2 = x2+psi*s2(ii);
end

x1 = zeros(n,1);
for ii = 1:n
    ii
    ek = zeros(1,n);
    ek(ii) = 1;
    psi = idct(ek)';
    x1 = x1+psi*s1(ii);
end

figure('name','Compressive sensing image reconstructions')
subplot(1,3,1), imagesc(reshape(x,50,50)), xlabel('original'), axis image
subplot(1,3,2), imagesc(reshape(x2,50,50)), xlabel('least squares'), axis image
subplot(1,3,3), imagesc(reshape(x1,50,50)), xlabel('Proposed H'), axis image
colormap gray
