% rel/3
% Se satisface cuando Elemento 1 esta relacionado en la relacion R con Elemento 2.
% argumentos:
%   - Elemento 1 de un conjunto A.
%   - Elemento 2 de un conjunto B.
%   - Relacion R de A en B.
% 
rel(E1, E2, [ [E1,E2] | _ ]).
rel(E1, E2, [ _ | T ]) :- rel(E1,E2, T).

% reflexive/2
% Se satisface cuando la relacion R es Reflexiva.
% argumentos:
%   - Conjunto A.
%   - Relacion R de A en A.
reflexive([],_).
reflexive([E | T], R) :- 
        rel(E,E,R),
        reflexive(T,R).

% symmetric/1
% Se satisface cuando la relacion R es Simetrica.
% argumentos:
%   - Relacion R de A en A.
symmetric([]).
symmetric(L) :- symmetric2([],L).

% symmetric2/2
% Se satisface cuando la relacion R (union de la particion 1 y la particion 2) es Simetrica.
% argumentos:
%   - Particion 1 de la relacion R de A en A que representa a la parte de R ya procesada.
%   - Particion 2 de la relacion R de A en A que representa a la parte de R que queda procesar.
symmetric2(_,[]).
symmetric2(P1, [[E1,E2] | TP2]) :-
    append(P1,[[E1,E2] | TP2], R),
    rel(E2,E1, R),
    append(P1,[[E1,E2]], P1new),
    symmetric2(P1new,TP2).

% antisymmetric/1
% Se satisface cuando la relacion R es Antisimetrica.
% argumentos:
%   - Relacion R de A en A.
antisymmetric([]).
antisymmetric(L) :- antisymmetric2([],L).

% antisymmetric2/2
% Se satisface cuando la relacion R es Antimetrica.
% argumentos:
%   - Particion 1 de la relacion R de A en A que representa a la parte de R ya procesada.
%   - Particion 2 de la relacion R de A en A que representa a la parte de R que queda procesar.
antisymmetric2(_,[]).
antisymmetric2(P1, [[E1,E2] | TP2]) :-
    append(P1, [[E1,E2] | TP2], R),
    \+((rel(E2,E1,R), E1 \= E2)),
    append(P1,[[E1,E2]], P1new),
    antisymmetric2(P1new, TP2).

% transitive/1
% Se satisface cuando la relacion R es Transitiva.
% argumentos:
%   - Relacion R de A en A.
transitive([]).
transitive(L) :- transitive2([],L).

% transitive2/2
% Se satisface cuando la relacion R (union de la particion 1 y la particion 2) es Transitiva.
% argumentos:
%   - Particion 1 de la relacion R de A en A que representa a la parte de R ya procesada.
%   - Particion 2 de la relacion R de A en A que representa a la parte de R que queda procesar.
transitive2(_,[]).
transitive2(P1, [[E1,E2] | TP2]) :-
    append(P1, [[E1,E2] | TP2], R),
    \+((rel(E2,X,R), \+(rel(E1,X,R)))),
    append(P1,[[E1,E2]], P1new),
    transitive2(P1new, TP2).