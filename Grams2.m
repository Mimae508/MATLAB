function [X] = Grams2(V)
%does a Gram-Schmidth process with the input vectors
X = V(:,1);
for n=2:(size(V,2))
    v = V(:,n);
    vnext = v;
    for k=1:n-1
        vnext = vnext - (dot(v,X(:,k))/dot(X(:,k),X(:,k)))* X(:,k);
    end
    %vnext = v - symsum((dot(v,X(:,k))/dot(X(:,k),X(:,k)))* X(:,k),k,1,n-1);
    X = [X vnext];
end
%v4 = x4 - (dot(v4,v1)/dot(v1,v1))*v1 - (dot(v4,v2)/dot(v2,v2))*v2 - (dot(v4,v3)/dot(v3,v3))*v3