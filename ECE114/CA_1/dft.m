function [f]=dft(x)
%
% get the size, and zero some arrays
%
N=max(size(x,1),size(x,2));
f=zeros(1,N);
real=zeros(1,N);
imag=zeros(1,N);

%
% compute the transform; the slow way
% 
% Recall that: e^jx = cos(x) + j*sin(x)
%
sprintf('starting %d-point dft...',N)
for k=0:N-1,
  for n=0:N-1,
    % Note in matlab, 'pi' is 3.14159...
    % The first element of an array is element 1, not 0
    % The next two lines must be completed/fixed
    real(k+1) = x(n+1)*cos(2*(pi/N)*k*n) + real(k+1);
    imag(k+1) = -x(n+1)*sin(2*(pi/N)*k*n)+ imag(k+1);
  end
end
sprintf('finished %d point dft',N)

%
% find the magnitude of the complex function
%
f = (real.^2 + imag.^2).^0.5;

