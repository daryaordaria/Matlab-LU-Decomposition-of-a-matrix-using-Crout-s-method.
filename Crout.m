
% Main script
% This program computes LU decomposition of Crout's method, det(A), and
% the system of linear equations M * z = f where 
% M is a block matrix which consists
% of Identity matrix, A matrix, transpose of A matrix and zero:
%  I     A
%  A^(T) 0

%Mathematically, I can rewrite and solve via the system of matrix
%equations:

% (1) z1 + A*z2 = f1

% (2) A^(T) * z1 = f2 where 

% z is the solution of the system of linear equations
% z1 is first part of vector z
% z2 is second part of vector z

% and

%f1 is first part(block) of vector f
%f2 is fsecond part(block) of vector f

%Please, uncomment any example to see the result

%example rand
%A=rand(n) , B= rand(n,1)

%example 5 (pdf) Solution is represented
%in  "Mathematical Solution Of Example 5 and 6 in details.pdf"
A = [10 3 4; 2 -10 3; 3 2 -10];
B = [15 ;37; -10];
n= 3;

% %example 6 (pdf)  Solution is represented
%in  "Mathematical Solution Of Example 5 and 6 in details.pdf
% A = [9 3 3 3; 3 10 -2 -2; 3 -2 18 10; 3 -2 10 10]
% B = [24; 17; 45; 29]
% n = 4


[L,U] = CroutMain(A,n)

f = rand(n*2,1)

% Use for simple calculations 
%f = [1;1;1;1;1;1];

z = CroutLin(L,U,f,n)

%Deeterminant 
detA=1;
for i=1:n
    detA=detA*L(i,i);
end

detA







