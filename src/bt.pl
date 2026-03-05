clear :- shell("clear").

% sum
sum(nil, 0).
sum(bt(R,Left,Right), S) :-
    sum(Left, SL),
    sum(Right, SR),
    S is R + SL + SR.

test_tree(
    bt(5,
        bt(3,
            bt(1, nil, nil),
            nil
        ),
        bt(7,
            bt(2, nil, nil),
            bt(4, nil, nil)
        )
    )
).

test_sum(S) :-
    test_tree(T),
    sum(T,S).

% count_leaves
count_leaves(nil, 0).
count_leaves(bt(_, nil, nil), 1).

count_leaves(bt(_, Left, Right), C) :-
    count_leaves(Left, CL),
    count_leaves(Right, CR),
    C is CL+CR.

test_count(C) :-
    test_tree(T),
    count_leaves(T, C).
