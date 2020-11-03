function a = amdf(s)
% function a = amdf(s)
%
% computes the average magnitude difference function of s
N = length(s);
a = zeros(2*N-1,1);
for k = 0:N-1
    a(k+N) = sum( abs(s(1:N-k) - s(k+1:N)) )/N;
end
a(1:N-1) = a(2*N-1:-1:N+1);