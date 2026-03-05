clear :- shell("clear").

% exercise 4-1

insert(X, L, [X|L]).
insert(X, [H|T], [H|R]) :-
    insert(X, T, R).

perm([], []).
perm([H|T], L) :-
    perm(T, P),
    insert(H, P, L).

is_sorted([]).
is_sorted([_]).
is_sorted([X,Y|T]) :-
    X =< Y,
    is_sorted([Y|T]).

sort_perm([], []).
sort_perm(L, R) :-
    perm(L, R),
    is_sorted(R).

sort_ins([], []).
sort_ins(L, R) :-
    work(L, [], R).

insert_correc(X, [], [X]).
insert_correc(X, [Y|T], [X,Y|T]) :- X =< Y.
insert_correc(X, [Y|T], [Y|NT]) :- 
    X > Y,
    insert_correc(X, T, NT).

work([], X, X).
work([H|T], Acc, R) :-
    insert_correc(H, Acc, Z),
    work(T, Z, R).

% exercise 4-2

sum_list([], 0).
sum_list([H|T], S) :-
    sum_list(T, S1),
    S is S1+H.

sum_of(L, N, R) :-
    subset_sum(L, N, [], R).

subset_sum(_, 0, Acc, R) :- reverse(Acc, R).
subset_sum([H|T], N, Acc, R) :-
    N > 0,
    N1 is N - H,
    N1 >= 0,
    subset_sum(T, N1, [H|Acc], R).
subset_sum([_|T], N, Acc, R) :-
    N > 0,
    subset_sum(T, N, Acc, R).

% exercise 4-3

int_to_bin(X, Y) :-
    work2(X, Y, null).

work2(0, Acc, Acc).
work2(X, Y, Acc) :-
    X > 0,
    X1 is X//2,
    1 is X mod 2,
    NewAcc = s1(Acc),
    work2(X1, Y, NewAcc).
work2(X, Y, Acc) :-
    X > 0,
    X1 is X//2,
    0 is X mod 2,
    NewAcc = s0(Acc),
    work2(X1, Y, NewAcc).

% exercise 4-4

same_l([]).
same_l([_]).
same_l([H1,H2|T]) :-
    \+ is_list(H1),
    \+ is_list(H2),
    same_l([H2|T]).
same_l([H1,H2|T]) :-
    same_l(H1),
    same_l(H2),
    is_list(H1),
    is_list(H2),
    length(H1, L),
    length(H2, L),
    same_l([H2|T]).
