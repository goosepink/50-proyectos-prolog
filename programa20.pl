% ===============================================
% Autor: Javier Rosas
% Fecha: 23 de octubre de 2024
% Descripción: Elimina el k-ésimo elemento de una lista.
%              El predicado 'remove_at' toma un elemento X, una lista, un índice K y
%              una lista resultante donde se ha eliminado el elemento en la posición K.
% ===============================================

% Elimina el k-ésimo elemento de una lista.
% Caso base: si K es 1, elimina el primer elemento y el resultado es la cola de la lista.
remove_at(X, [X|T], 1, T).

% Caso recursivo: si K es mayor que 1, disminuye el índice y continúa con la cola.
remove_at(X, [H|T], K, [H|R]) :-
    K > 1,
    K1 is K - 1,
    remove_at(X, T, K1, R).

% Ejemplo de uso:
% ?- remove_at(X, [a, b, c, d, e], 3, R).
% X = c,
% R = [a, b, d, e].
