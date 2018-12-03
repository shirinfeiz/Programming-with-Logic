#program always.
person(bill;julie; fred).
location(non;cinema;school;park;office).

#program initial.
at(P,non):- person(P).


#program dynamic.
at(P,X) :- walkto(P,X).
 at(P,L) :- 'at(P,L), not -at(P,L).
-at(P,L) :- at(P,M), location(L), L!=M.
:- walkto(P,X), 'at(P,X).
 
%data encoding
walkto(bill,cinema):- at(bill,non).
walkto(bill,cinema):- 'at(bill,non).
walkto(julie,office):- 'at(julie,non).
walkto(julie,school):- 'at(julie,office).
walkto(fred,park):- 'at(fred,non).

%where was julie before the school?
query1(L):- 'at(julie,L), at(julie,school).

#program final.
:- not at(julie,school).

#show at/2.
#show query1/1.
