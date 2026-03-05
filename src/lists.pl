clear :- shell("clear").

% member
mem(X,[H|_]):- X=H.
mem(X,[_|T]):- mem(X,T).

% append
app([], L, L).
app([H|T],L2,[H|T1]):-
    app(T,L2,T1).

% rev
rev([], []).
rev([H|T], L) :-
    rev(T,T1),
    app(T1,[H],L).

% del
delete(X, [X|T], T).
delete(X, [H|T], [H|S]) :- delete(X, T, S).

% insert
insert(X, L, [X|L]).
insert(X, [H|T], [H|S]) :- insert(X, T, S).

% insert using deletion
insertD(X, L, R) :- delete(X, R, L).

% sum
sum([], [], 0).
sum([H|_], [], H).
sum([], [H|_], H).
sum([H1|T1], [H2|T2], Z) :-
    sum(T1, T2, Z1),
    Z is H1 + H2 + Z1.
