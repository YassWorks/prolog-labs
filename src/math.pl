clear :- shell("clear").

year(date(_, _, Y), Y).

country(canada,location(america),population(45000000), capital(ottawa),area(10000000)).

country(usa,location(america),population(300000000), capital(washington),area(9000000)).

country(tunisia,location(africa),population(12000000), capital(tunis),area(164000)).

density(Country, Density) :-
    country(Country,_,population(P),_,area(A)),
    Density is P / A.
