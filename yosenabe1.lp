%% Your code here

%cell(X,Y).         % the cell (X,Y) belongs to the grid
%area(X,Y,A).       % the cell (X,Y) belongs to area A
%number(X,Y,N).     % the cell (X,Y) initially contains number N
%goal(A,G).         % the goal number of area A is number G

%target(X,Y,X,YY).  % the number in the cell (X,Y) is moved to the cell (XX,YY).

%choice

%for each target, there is 1 cell - given each number item
{target(X,Y, XX, YY) : cell(XX, YY)} = 1 :- number(X,Y,N).


%straight line
%not valid if same X but different Y, not valid if different X but same y
%not valid if same x and same y
:- target(X,Y,XX,YY), X = XX, Y != YY.
:- target(X,Y,XX,YY), X != XX, Y = YY.
:- target(X,Y,XX,YY), not area(XX,YY, _).

#show target/4.