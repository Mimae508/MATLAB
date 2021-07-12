function [X] = Grams(x1,x2,x3)
%does a Gram-Schmidth process with the input vectors

v1 = x1
v2 = x2 - (dot(x2,v1)/dot(v1,v1))*v1
v3 = x3 - (dot(x3,v1)/dot(v1,v1))*v1 - (dot(x3,v2)/dot(v2,v2))*v2
%v4 = x4 - (dot(v4,v1)/dot(v1,v1))*v1 - (dot(v4,v2)/dot(v2,v2))*v2 - (dot(v4,v3)/dot(v3,v3))*v3

X = [v1 v2 v3]