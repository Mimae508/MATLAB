function [P] = proj(A,w)
%Outputs the projection of w on Col(A)
%   A = [u1 u2 ... u]
P = A*inv(A'*A)*A'*w;
end