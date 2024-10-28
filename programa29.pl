% ===============================================
% Autor: Javier Rosas
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que ordena una
%              lista de listas de acuerdo con la
%              frecuencia de la longitud de las 
%              sublistas.
% ===============================================

% -------- Código en Prolog --------------------
% Predicado length_frequency(L, F) que ordena la
% lista L de listas de acuerdo con la frecuencia
% de la longitud de las sublistas, generando la
% lista F con las frecuencias correspondientes.

% Paso 1: map_list_to_pairs/3 convierte cada sublista
% en un par (Longitud-Sublista), donde Longitud es la
% longitud de la sublista.
% Paso 2: msort/2 ordena los pares de acuerdo con las
% longitudes.
% Paso 3: encode/2 cuenta las frecuencias y produce el
% resultado final.

length_frequency(L, F) :-
    map_list_to_pairs(length, L, P),  % Mapea las longitudes.
    msort(P, SP),                     % Ordena los pares por longitud.
    encode(SP, F).                    % Cuenta las frecuencias.

% Predicado encode/2 que agrupa elementos con la misma longitud
% y cuenta la frecuencia de aparición.
encode([], []).
encode([Len-List|T], [(Len, [List|Groups])|Rest]) :-
    pack(Len, T, Groups, Remaining),
    encode(Remaining, Rest).

% Predicado pack/4 que agrupa elementos con la misma longitud.
pack(_, [], [], []).
pack(Len, [Len-List|T], [List|Groups], Remaining) :-
    pack(Len, T, Groups, Remaining).
pack(Len, [Len1-List|T], [], [Len1-List|T]) :-
    Len \= Len1.

% Ejemplo de uso:
% ?- length_frequency([[a], [b, c], [d, e, f], [g], [h, i]], F).
% F = [(1, [[a], [g]]), (2, [[b, c], [h, i]]), (3, [[d, e, f]])].
% ----------------------------------------------
