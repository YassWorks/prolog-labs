clear :- shell("clear").

% isNumber
isNumber(0).
isNumber(s(X)) :- isNumber(X).

% valueOf
valueOf(0, 0).
valueOf(s(X), Y) :- 
    valueOf(X, Y1),
    Y is Y1+1.

% add
add(0, Y, Y).
add(s(X), Y, s(Z)) :- add(X, Y, Z).

% gt
gt(s(_), 0).
gt(s(X), s(Y)) :- gt(X, Y).

% minus
minus(X, 0, X).
minus(s(X), s(Y), Z) :- minus(X, Y, Z).

% sub
sub(s(X), s(Y), Z) :- 
    gt(X, Y),
    minus(s(X), s(Y), Z).

% mult
mult(0, _, 0).
mult(s(X), Y, Z) :-
    mult(X, Y, Z1),
    add(Y, Z1, Z).
