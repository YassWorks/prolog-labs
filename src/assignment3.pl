clear :- shell("clear").

% exercise 3-1

list_len([], 0).
list_len([_|T], N) :-
    list_len(T, N1),
    N is N1+1.

% exercise 3-3

mem(X,[H|_]):- X=H.
mem(X,[_|T]):- mem(X,T).

union([], Z, Z).
union([X|T], Y, Z) :-
    mem(X, Y),
    union(T, Y, Z).
union([X|T], Y, [X|W]) :-
    \+ mem(X, Y),
    union(T, Y, W).

% exercise 3-4

intersect([], _, []).
intersect([X|T], Y, [X|W]) :-
    mem(X, Y),
    intersect(T, Y, W).
intersect([X|T], Y, Z) :-
    \+ mem(X, Y),
    intersect(T, Y, Z).

% exercise 3-5

replace_all([], _, _, []).
replace_all([H|T], H, Y, Z) :-
    replace_all(T, H, Y, Z1),
    Z = [Y|Z1].
replace_all([X|T], H, Y, Z) :-
    X \= H,
    replace_all(T, H, Y, Z1),
    Z = [X|Z1].

% exercise 3-6

insert(X, L, [X|L]).
insert(X, [H|T], [H|R]) :-
    insert(X, T, R).

perm([], []).
perm([H|T], L) :-
    perm(T, P),
    insert(H, P, L).

% exercise 3-7

check_sequence([]).
check_sequence([H|T]) :-
    (H \= 0,
        last(T, 0));
    (H = 0, 
        last(T, 1)).

% exercise 3-8

sum_if([], _, _, 0).
sum_if([H|T], Min, Max, S) :-
    H >= Min, H =< Max,
    sum_if(T, Min, Max, S1),
    S is S1+H.
sum_if([H|T], Min, Max, S) :-
    \+ (H >= Min, H =< Max),
    sum_if(T, Min, Max, S).
