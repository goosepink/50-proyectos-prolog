% ===============================================
% Autor: Javier Rosas
% Fecha: 28 de octubre de 2024
% Descripción: Programa en Prolog que construye un árbol binario equilibrado
%              en altura con una altura dada.
% ===============================================

% Caso base: un árbol de altura 0 es un árbol vacío.
hbal_tree(0, nil).

% Caso recursivo: construye un árbol equilibrado en altura.
hbal_tree(H, t('x', L, R)) :- 
    H > 0,
    H1 is H - 1,
    H2 is H - 1, 
    hbal_tree(H1, L), 
    hbal_tree(H2, R).

% Se permiten árboles de la misma altura en el lado izquierdo y derecho
hbal_tree(H, t('x', L, R)) :- 
    H > 0,
    H1 is H - 1,
    H2 is H1 - 1, 
    hbal_tree(H1, L), 
    hbal_tree(H2, R). 

hbal_tree(H, t('x', L, R)) :- 
    H > 0,
    H1 is H - 1,
    hbal_tree(H1, L), 
    hbal_tree(H1, R). 

% Ejemplo de uso:
% Para construir un árbol de altura 0 (debería ser un árbol vacío):
% ?- hbal_tree(0, Tree).
% Resultado: Tree = nil.

% Para construir un árbol de altura 1 (debería tener un solo nodo):
% ?- hbal_tree(1, Tree).
% Resultado: Tree = t(x, nil, nil).

% Para construir un árbol de altura 2:
% ?- hbal_tree(2, Tree).
% Resultado: 
% Tree = t(x, t(x, nil, nil), t(x, nil, nil)).
% (También puede tener otras configuraciones dependiendo del orden en que se construyen los nodos).

% Para construir un árbol de altura 3:
% ?- hbal_tree(3, Tree).
% Resultado: 
% Tree = t(x, t(x, t(x, nil, nil), nil), t(x, nil, nil)).
% (Varias configuraciones posibles).
% ----------------------------------------------
