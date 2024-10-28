% ===============================================
% Autor: Javier Rosas
% Fecha: 28 de octubre de 2024
% Descripción: Programa en Prolog que construye un árbol binario equilibrado
%              en altura con un número dado de nodos.
% ===============================================

% Caso base: un árbol vacío tiene 0 nodos.
hbal_tree_nodes(0, nil).

% Construye un árbol binario equilibrado en altura con N nodos.
hbal_tree_nodes(N, T) :- 
    N > 0, 
    hbal_height(N, H), 
    hbal_tree(H, T), 
    count_nodes(T, N).

% Calcula la altura máxima de un árbol equilibrado en altura con N nodos.
hbal_height(N, H) :- 
    H is ceiling(log(N + 1) / log(2)).

% Construye un árbol equilibrado en altura.
hbal_tree(0, nil).
hbal_tree(H, t('x', L, R)) :- 
    H > 0,
    H1 is H - 1,
    H2 is H - 1,
    hbal_tree(H1, L),
    hbal_tree(H2, R).

% Cuenta el número de nodos en un árbol.
count_nodes(nil, 0).
count_nodes(t(_, L, R), N) :- 
    count_nodes(L, NL), 
    count_nodes(R, NR), 
    N is NL + NR + 1.

% Ejemplo de uso:
% Para construir un árbol equilibrado con 0 nodos:
% ?- hbal_tree_nodes(0, Tree).
% Resultado: Tree = nil.

% Para construir un árbol equilibrado con 1 nodo:
% ?- hbal_tree_nodes(1, Tree).
% Resultado: Tree = t(x, nil, nil).

% Para construir un árbol equilibrado con 3 nodos:
% ?- hbal_tree_nodes(3, Tree).
% Resultado: 
% Varias configuraciones posibles de un árbol equilibrado con 3 nodos.

% Para construir un árbol equilibrado con 7 nodos:
% ?- hbal_tree_nodes(7, Tree).
% Resultado:
% Varias configuraciones posibles de un árbol equilibrado con 7 nodos.
% ----------------------------------------------
