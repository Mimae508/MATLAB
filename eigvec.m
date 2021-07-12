function [e] = eigvec(x,l)
% returns rref of the system that helps provide correpsonding eigenvector
z = zeros(size(x,1),1);
v = l*eye(size(x,1))-x;
e = rref([v z]);
end

