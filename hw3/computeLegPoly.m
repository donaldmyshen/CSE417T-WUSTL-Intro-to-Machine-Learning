function [ z ] = computeLegPoly( x, Q )
%COMPUTELEGPOLY Return the Qth order Legendre polynomial of x
%   Inputs:
%       x: vector (or scalar) of reals in [-1, 1]
%       Q: order of the Legendre polynomial to compute
%   Output:
%       z: matrix where each column is the Legendre polynomials of order 0 
%          to Q, evaluated at the corresponding x value in the input
    [rows, ~] = size(x);
    z = zeros(rows, Q+1);
    for index = 1:rows
            z(index,1) = 1;
            z(index,2) = x(index);
            
            for k = 3:Q+1
                z(index,k) = ((2*k-1)/k)*x(index)*z(index, k-1)-((k-1)/k)*z(index,k-2);
            end
            
    end
end