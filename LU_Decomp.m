% https://youtu.be/WgaFycuL8z0

% this video shows LU dicomposition method A=L*U where U=same upper
% triangular matrix generated by guass elimination, then L=B*inv(U)
% where B is same as A (all elements are same) just the position of its
% rows may be changed according to swapping of rows in U while gauss
% elimination if pivot came out to be zero.  

% A zero at pivot is never excepted during elementry operation in that
% scenario we replace that whole row of Aug matrix with some lower row
% where the element in the current pivot column has maximum magnitude

% https://youtu.be/dwu2A3-lTGU

%%
clc;
A=[3 -7 -2 2;-3 5 1 0;6 -4 0 -5;-9 5 -5 12];
U=[3 -7 -2 2;-3 5 1 0;6 -4 0 -5;-9 5 -5 12];
idx=0;
D=zeros(1,4);

%LU decomposition has nothing to do with partial pivoting (Hear we may maximize our pivots before gauss elimination, pivots never maximixed after every column)

z=0;
for i=1:3
    for j=(i+1):4
        U(j,:)=U(j,:)-(U(j,i)/U(i,i)).*U(i,:);        
    end
end
disp('matrix A=')
disp(A);
disp(' ');
disp('Upper triangular matrix U=');
disp(U);
L=A*inv(U);
disp(' ');
disp('Lower triangular matrix L=');
disp(L);

% Now Our LU decomposition is done, But for solving set of equations by LU
% decomposition we will need B also, B becomes B1 if any row changes are
% involved before starting LU decomposition of A(to remove zero from pivot)
% corresponding row interchanges need to be made in vector B and it becomes B1

% Then we solve via back substitution twice in steps shown below.
% AX=B1 => LUX=B1 => LY=B1 => Y=B1*inv(L) => UX=Y => X=Y*inv(U); 

%%
%   INBUILT lu factorization.
%   [L,U] = lu(A) returns an upper triangular matrix in U and a permuted
%   lower triangular matrix in L, such that A = L*U. The input matrix A can
%   be full or sparse.
%   FOR MORE DETAILS    >>help lu