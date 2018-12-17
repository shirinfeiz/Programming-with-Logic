%initial definition
person(bill;julie; fred).
location(non;cinema;school;park;office).


time(0; 1; 2).%init; yesterday; this moning;
on(P,non,0):- person(P).

%data encoding
move(bill,cinema,0).
move(bill,cinema,1).
move(julie,school,2).
move(fred,park,1).
move(julie, office, 1).

% Generate
{ on(P,L,T): person(P), location(L), time(T) } .

% Define
on(P,L,T) :- move(P,L,T).
on(P,L,T+1) :- on(P,L,T), not move(P,_,T+1), time(T+1).



%where was julie before the school?
query1(L):- on(julie,L,T), on(julie, school, T+1 ), time(T),location(L). 
#show query1/1.
#show on/3.