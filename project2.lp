#program always.
person(bill;julie; fred).
location(non;cinema;school;park;office).

#program initial.
original_time.
at(P,non):- person(P).

#program dynamic.
at(P,X) :- walkto(P,X).
 at(P,L) :- 'at(P,L), not -at(P,L).
-at(P,L) :- at(P,M), location(L), L!=M.
:- walkto(P,X), 'at(P,X).
 
%data encoding
walkto(bill,cinema):- yesterday.
walkto(julie,office):- yesterday.
walkto(julie,school):- this_morning.
walkto(fred,park):- yesterday.

%time rules
yesterday:- 'original_time.
this_morning:- 'yesterday.

%where was julie before the school?
query1(L):- 'at(julie,L), at(julie,school).

#program final.
:- not at(julie,school).

#show at/2.
#show query1/1.
