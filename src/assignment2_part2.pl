clear :- shell("clear").

% exercise 3-7

eval(plus(X, Y), Z) :-
    eval(X, Z1),
    eval(Y, Z2),
    Z is Z1+Z2.
eval(minus(X, Y), Z) :-
    eval(X, Z1),
    eval(Y, Z2),
    Z is Z1-Z2.
eval(times(X, Y), Z) :-
    eval(X, Z1),
    eval(Y, Z2),
    Z is Z1*Z2.
eval(divide(X, Y), Z) :-
    eval(X, Z1),
    eval(Y, Z2),
    Z is Z1/Z2.
eval(X, X) :- number(X).
