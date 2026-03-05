clear :- shell("clear").

% exercise 2-2:
edge(a,b). 
edge(b,d).
edge(c,d).

edge(a,c).
edge(d,e).

path(Start,End) :- edge(Start,End).
path(Start,End) :- edge(Start,Node), path(Node,End).

% exercise 2-3:
ingredient(flour, dough).
ingredient(egg, dough).
ingredient(dough, cake).
ingredient(sugar, frosting).
ingredient(chocolate, cake).

partOfReceipe(X, Y) :- ingredient(X, Y).

partOfReceipe(X, Y) :-
    ingredient(X, Z),
    partOfReceipe(Z, Y).

% exercise 2-4:
reaction(h, h, h2).
reaction(h2, o, h2o).
reaction(h, o, oh).
reaction(h2, h, h3).
reaction(na, oh, naoh).

checkPartOf(X, Y) :- reaction(X, _, Y); reaction(_, X, Y).

checkPartOf(X, Y) :-
    (reaction(X, _, T); reaction(_, X, T)),
    checkPartOf(T, Y).

% exercise 2-5:
before(the_hunger_games, the_hunger_games_catching_fire).
before(the_hunger_games_catching_fire, the_hunger_games_mockingjay_part1).
before(the_hunger_games_mockingjay_part1, the_hunger_games_mockingjay_part2).

mustWatchBefore(X, Y) :-
    before(X, Y).

mustWatchBefore(X, Y) :-
    before(X, Z),
    mustWatchBefore(Z, Y).

% exercise 2-6:
parent(ahmed, karim).
parent(oumaima, karim).
parent(souhail, hasna).
parent(mounira, hasna).
parent(yassine, amira).
parent(hasna, amira).

descendant(X, Y) :- parent(Y, X).

descendant(X, Y) :-
    parent(Y, Z),
    descendant(X, Z).

% exercise 2-7:
composedOf(aggregate, sand).
composedOf(aggregate, rock).
composedOf(aggregate, gravel).
composedOf(concrete, aggregate).
composedOf(concrete, cement).
composedOf(concrete, water).
composedOf(wall, concrete).
composedOf(wall, brick).

partOf(X, Y) :- composedOf(Y, X).

partOf(X, Y) :-
    composedOf(Y, Z),
    partOf(X, Z).
