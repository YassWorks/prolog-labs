clear :- shell("clear").

% exercise 2-1

maximum(A, B, A) :- A >= B.
maximum(A, B, B) :- B >= A.

seq(X, Y, X) :- X =< Y.
seq(X, Y, Z) :-
    X < Y,
    X1 is X+1,
    seq(X1, Y, Z).

mult(_, 0, 0).
mult(X, Y, Z) :-
    Y > 0,
    Y1 is Y-1,
    mult(X, Y1, Z1),
    Z is Z1+X.

exp(_, 0, 1).
exp(X, Y, Z) :-
    Y > 0,
    Y1 is Y-1,
    exp(X, Y1, Z1),
    mult(X, Z1, Z).

% exercise 3-2

ackermann(0, Y, Z) :- Z is Y+1.
ackermann(X, 0, Z) :- 
    X > 0,
    X1 is X-1,
    ackermann(X1, 1, Z).
ackermann(X, Y, Z) :-
    X > 0, Y > 0,
    Y1 is Y-1,
    ackermann(X, Y1, Z1),
    X1 is X-1,
    ackermann(X1, Z1, Z).

% exercise 3-3

month(1, january, 31).
month(2, february, 28).
month(3, march, 31).
month(4, april, 30).
month(5, may, 31).
month(6, june, 30).
month(7, july, 31).
month(8, august, 31).
month(9, september, 30).
month(10, october, 31).
month(11, november, 30).
month(12, december, 31).

days_left(M, D, X) :-
    month(M, _, N),
    X is N-D.

% exercise 3-4

course(prolog,timing(wednesday,1),lecturer(med, khalgui),room(c,h14)).
course(compiler,timing(monday,1),lecturer(med, khalgui),room(b,h3)).

schedule(R, Name) :-
    course(Name,_,_,room(_,R)).

busy(R, D, S) :-
    course(_,timing(D,S),_,room(_,R)).

% exercise 3-5

depth(nil, 0).
depth(bt(_,Left,Right), D) :-
    depth(Left, D1),
    depth(Right, D2),
    maximum(D1, D2, D_sub),
    D is D_sub+1.

% exercise 3-6

sum(X, 0, X).
sum(X, s(Y), s(Z)) :-
    sum(X, Y, Z).

gt(s(_), 0).
gt(s(X), s(Y)) :- gt(X, Y).

minus(X, 0, X).
minus(s(X), s(Y), Z) :-
    minus(X, Y, Z).

sub(X, Y, Z) :-
    gt(X, Y),
    minus(X, Y, Z).

mult_S(_, 0, 0).
mult_S(X, s(Y), Z) :-
    mult_S(X, Y, Z1),
    sum(X, Z1, Z).

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
