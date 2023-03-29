% Test function

% LU factorization with lu(A) matlab function is NOT unique. 

% [L,U] = lu(A) factorizes the full or sparse matrix 
% A into an upper triangular matrix U and
% a PERMUTED lower triangular matrix L such that A = L*U.

% linsolve() - function to solve the linear equation 

% det()- function to find the determinant 

%eye(n) - returns an array with ones on the main diagonal and zeros
%elsewhere. Matlab Identity matrix

% We dont get correct Y via matlab function because we can not get unique L and U,
%but det(A), X,are correct
%Additional proof of correct Implementation of CroutMain(A,n) 
%in "Mathematical Solution Of Example 5 and 6 in details.pdf



function [L,U,d,Y,X] = testerCrout(A,B)

%example 5
% Please, uncomment to use
%Please uncomment an example you prefer to use, or type it on
%command window your example

%example 1
%A=[5 4 1; 10 9 4; 10 13 15]
%B=[3.4;8.8;19.2]
%n=3
 
%example 2 
%A = [2 1 4; 8 -3 2; 4 11 -1]
%B = [12 ;20 ;33]
%n=3

%example 3
%A = [4 -2 -3 6; -6 7 6.5 -6; 1 7.5 6.25 5.5; -12 22 15.5 -1]
%B = [ 12; -6.5; 16; 17 ]
%n=4

%example 4
%A = [9 -4 -2 0; -4 17 -6 -3; -2 -6 14 -6; 0 -3 -6 11]
%B = [24; -16; 0; 18]
%n=4

A = [10 3 4; 2 -10 3; 3 2 -10];
B = [15 ;37; -10];
n= 3;

        [L,U] = lu(A);
        multi = L * U;% shows that L*U = A,so decomposotion is correct
        d = det(A) % function to find the determinant
        Y = linsolve(L,B) %function to solve the linear equation LY=B for Y
        X = linsolve(U,Y)%function to solve the linear equation Ux=Y for x
        t = transpose(A) % function to find a transpose matrix
      
        

        
end

% Testing of the CroutLin()
%If we compare the result of matlab function - linsolve and our function
%CroutLin, we could notice a lit bit difference in result. 

% linsolve (MATLAB Functions) X = linsolve(A,B) solves 
% the linear system A*X = B using LU factorization with partial pivoting 
% when A is square and QR factorization 
% with column pivoting otherwise. 
% The number of columns of A must equal the number of rows of B .
% If A is m-by-n and B is n-by-k, then X is m-by-k.


