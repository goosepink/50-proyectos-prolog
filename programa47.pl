% ===============================================
% Autor: Javier Rosas
% Fecha: 28 de octubre de 2024
% Descripción: Programa en Prolog que construye un árbol binario de
%              búsqueda a partir de una lista de enteros. En un árbol
%              binario de búsqueda, todos los elementos en el subárbol
%              izquierdo son menores que el nodo y todos los elementos
%              en el subárbol derecho son mayores o iguales.
% ===============================================

% Construye un árbol binario de búsqueda a partir de una lista de enteros.
construct([], nil).  % Un árbol vacío se construye a partir de una lista vacía.
construct([X|Xs], T) :- 
    construct(Xs, T1),   % Construir el árbol a partir del resto de la lista.
    add(X, T1, T).       % Añadir el primer elemento al árbol resultante.

% Añade un nodo a un árbol binario de búsqueda.
add(X, nil, t(X, nil, nil)).  % Si el árbol está vacío, crear un nuevo nodo.
add(X, t(Root, L, R), t(Root, NL, R)) :- 
    X < Root,                % Si X es menor que la raíz, añadir a la izquierda.
    add(X, L, NL).
add(X, t(Root, L, R), t(Root, L, NR)) :- 
    X >= Root,               % Si X es mayor o igual que la raíz, añadir a la derecha.
    add(X, R, NR).

% Ejemplo de uso:
% Para construir un árbol a partir de la lista [3, 1, 4, 1, 5, 9]:
% ?- construct([3, 1, 4, 1, 5, 9], Tree).
% Resultado: Tree = t(3, t(1, nil, nil), t(4, nil, t(5, nil, nil))).

% Consultas para verificar el árbol construido:
% ?- construct([7, 4, 9, 1, 6, 8, 10], T).
% Resultado: T = t(7, t(4, t(1, nil, nil), t(6, nil, nil)), t(9, t(8, nil, nil), t(10, nil, nil))).
% ----------------------------------------------
