function [L, U] = CroutMain(A,n)

%L - Lower-triangular matrix
%U - Upper-triangular matrix 
%A - Main nxn matrix
%n - size of matrix



%This function decompose the square matrix of any size into a 
% product of a Lower-triangular matrix (L)
% and an Upper-triangular matrix (U). 
% When all the entries of the main diagonal in the U matrix are 1's
% It uses Crout's method 

% Matrix L :      
% L1,1  0      0
% L2,1  L2,2   0
% L3,1  L3,2   L3,3 
% 
% Matrix U : 
% 1  U1,2   U1,3
% 0  1      U2,3
% 0  0      1

% initializing L and U,to prevent dynamic allocation during the process
L = zeros(n,n);
U = zeros(n,n);
        

%Starting finding L and U
%Substituting 1's im the diagonal of U
for i=1:n
    U(i,i)=1;
end

%Calculating the 1st column of L
%the first column of L in Crout's factorization is always equal to the
%first column of A

for i=1:n
    L(i,1) = A(i,1);
end


%Calculating the elements in the first row of U(Except U11 which already
%was already calculated
for i=2:n
    U(1,i) = A(1,i) / L(1,1);
end

%calculating the remaining  elements row after row.The elements of  L are calculated first
%because they are used for calculating the elements of U
for i = 2:n
    for j = 2:i
        L(i, j) = A(i, j) - L(i, 1:j - 1) * U(1:j - 1, j);%%%formula
    end
            
    for j = i + 1:n
        U(i, j) = (A(i, j) - L(i, 1:i - 1) * U(1:i - 1, j)) / L(i, i);%%%formula
    end  
end
end