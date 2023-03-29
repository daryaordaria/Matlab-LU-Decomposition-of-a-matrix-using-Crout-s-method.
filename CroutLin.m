function z = CroutLin(L,U,f,n) 

% function - CroutLin(L,U,f,n), solve systems of linear equation using
% Crout's Method. The function returns z.
% function gets L,U from the Crout's LU decomposition from CroutMain(),
% f - vector 
% n - size of matrix
% z is the solution of the system of linear equations
% z1 is first part of vector z
% z2 is second part of vector z

%f1 is first part(block) of vector f
%f2 is fsecond part(block) of vector f
f1 = f(1:n);
f2 = f((n+1):2*n);


% Part1 


%TRANSPOSE MATRIX L
% LT - transpose of L
[m,n] = size(L); % m and n are the rows of matrix x
LT = zeros(n,m); % when we transpose, rows and columns are exchanged
for i= 1:n
    for j=1:m 
        LT(i,j) = L(j,i);
    end
end


%TRANSPOSE MATRIX U
% UT - transpose of U
[m,n] = size(U); % m an n are the rows of matrix x
UT = zeros(n,m); % when we transpose, rows and columns are exchanged
for i= 1:n
    for j=1:m 
        UT(i,j) = U(j,i);
    end
end

% AT*z1 = f2 =>
% LT*UT*z1 = f2 where both z1,f1 are vectors
%forward substitution 

Y = zeros(n,1); %Intializing Y
Y(1) = f2(1)/LT(1,1);

for m=2:n
    Y(m) = (f2(m) - LT(m,1:m-1)*Y(1:m-1))/LT(m,m);
end
    
      
%backward substitution 

z1 = zeros(n,1); %Intializing z1
z1(n) = Y(n)/UT(n,n);

for m=n-1:-1:1
    z1(m) = (Y(m) - UT(m,m+1:n)*z1(m+1:n))/UT(m,m);   
end

% Part2
% z1 + A *z2 = f1 =>
% A * z2 = f1 - z1 =>
% L * U * z2 = v, where v = f1 - z1
%
v = f1 - z1;

%forward substitution 

Y1 = zeros(n,1); %Intializing Y
Y1(1) = v(1)/L(1,1);

for m=2:n
    Y1(m) = (v(m) - L(m,1:m-1)*Y1(1:m-1))/L(m,m);
end
    
      
%backward substitution 

z2 = zeros(n,1);
z2(n) = Y1(n)/U(n,n);

for m=n-1:-1:1
    z2(m) = (Y1(m) - U(m,m+1:n)*z2(m+1:n))/U(m,m);   
end



% joining two parts of vector z
z = zeros(n*2,1);
for i = 1 : n
    z(i) = z1(i);
end
for j = 1 : n
    z(j+n) = z2(j);
end

end

