%% Your code here

%cell(X,Y).         % the cell (X,Y) belongs to the grid
%area(X,Y,A).       % the cell (X,Y) belongs to area A
%number(X,Y,N).     % the cell (X,Y) initially contains number N
%goal(A,G).         % the goal number of area A is number G

%target(X,Y,X,YY).  % the number in the cell (X,Y) is moved to the cell (XX,YY).


%question 1: go to any area box, must be straight line

%for every N at position (X,Y) , target is at 1 cell
{target(X,Y, XX, YY) : cell(XX, YY)} = 1 :- number(X,Y,N).

%not valid if same X but different Y, not valid if different X but same y
%not valid if same x and same y
:- target(X,Y,XX,YY), X != XX, Y != YY.
:- target(X,Y,XX,YY), X = XX, Y = YY.
:- target(X,Y,XX,YY), not area(XX,YY, _).
%if want only unique answers per square
%:- target(X,Y,XX,YY), target(X1,X2,XX,YY), X = X2, Y = Y2.


%question 2: for each area, have at least 1 target

%just like, for each table, have 1 guest
area(A) :- area(X, Y, A).
number_areas(NA) :- NA = #count{A, X, Y : area(A, X, Y)}.
target_area(XX,YY, A) :- target(X, Y, XX, YY), area(XX, YY, A).

%for every unique area and target in given area, must be at least 1 number
:- {target_area(XX, YY, A) : number(X, Y, N) } < 1, area(A).


%question 3 - no crossing paths
% X <= item <= XX; XX >= item >= X --> if this, AND Ypath falls on it

%if X1 inline with X2; Y2 at same height as Y1 -- if start coords are in

%check intersection by checking if 1 falls in path of 2, and checking intersection point
:- target(X,Y,XX,YY), target(X2,Y2,XX2,YY2), (X, Y) != (X2, Y2),
X3 = (X..XX;XX..X), Y3 = (Y..YY;YY..Y), %falls on T1's path
X3 = (X2..XX2;XX2..X2), Y3 =(Y2..YY2;YY2..Y2). %AND falls on T2's path



%question 4 b- cant exceed sum
%for a table, cant have more guests than chairs
%for area, cant have more sum than goal

sumarea(A, SA) :- SA = #sum{ A : area(_, _, A)}, area(XX, YY, A), target(X, Y, XX, YY).
:- sumarea(A, SA), goal(A, G), SA != G, A = A.


#show target/4.