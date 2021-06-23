function Y = vl_nnL2(X,c,dzdy)

if nargin <= 2 
Y = sum((X-c).^2);

else
    
Y = (X-c)*dzdy;
Y = reshape(Y,size(X));

end