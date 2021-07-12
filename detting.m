function [N2,A] = detting(X, n )
% Outputs the Dettinger's forecast
%   X is the input matrix, n is the number of forecast, N2 is the forecast
%   matrix and A is the mean of forcast.

M=mean(X,2); %matrix of means
S2=std(X,0,2); %Population Standard div
N=normalize(X, 2); %Normalizes Data
C=(1/(n-1))*N*(N'); %Cross Correlation Matrix
[E,D]=eig(C); %obtain E, a matrix of right eigenvectors of columns, and D the diagonal of corresponding eigenvalues 
P=(N')*E; %“power” coefficient matrix
P2=[];

for x=1:n
    b=[];
    for i=1:(size(X,1))
        b=[b P(randi([1 (size(X,2))]),i)];
    end
    P2=[P2;b];
end % For Loop to get power coefficient matrix for n new “forecasts” 
N2 = E*(P2'); %matrix of new normalized “forecasts”
for i = 1:(size(X,1))
    N2(i,:)=arrayfun(@(x) x*S2(i,1)+M(i,1),N2(i,:));  
end %For Loop to denormalize the matrix to original values centred around original mean and distributed along an original standard deviation

%Plots the Forecast on a graph
A=mean(N2,2);
tiledlayout(3,1);
nexttile;
plot(X);
nexttile;
plot(N2);
nexttile;
plot(A);


end

