%% Your code here

cell(X,Y).         % the cell (X,Y) belongs to the grid
area(X,Y,A).       % the cell (X,Y) belongs to area A
number(X,Y,N).     % the cell (X,Y) initially contains number N
goal(A,G).         % the goal number of area A is number G

target(X,Y,XX,YY).  % the number in the cell (X,Y) is moved to the cell (XX,YY).

%for each sudoku number, go to one cell
{number(X,Y,N) : target(X,Y, XX, YY)} = 1.

%straight line
%not valid if same X but different Y, not valid if different X but same y
%not valid if same x and same y
:- number(X1,Y1,_), area(X2,Y2,A), X1 = X2, Y1 != Y2.
:- number(X1,Y1,_), area(X2,Y2,A), X1 != X2, Y1 = Y2.
:- number(X1,Y1,_), area(X2,Y2,A), X1 = X2, Y1 = Y2.

#show target/4.