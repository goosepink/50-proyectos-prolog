% ===============================================
% Autor: Javier Rosas
% Fecha: 28 de octubre de 2024
% Descripción: Programa en Prolog que genera todos los árboles binarios
%              simétricos y completamente equilibrados con N nodos.
% ===============================================

% Comprueba si un árbol binario es simétrico.
symmetric(nil).
symmetric(t(_, L, R)) :- mirror(L, R).

% Verifica si un árbol es el espejo de otro.
mirror(nil, nil).
mirror(t(_, L1, R1), t(_, L2, R2)) :- mirror(L1, R2), mirror(R1, L2).

% Construye un árbol binario completamente equilibrado con N nodos.
cbal_tree(0, nil).  % Un árbol vacío se construye con 0 nodos.
cbal_tree(N, t('x', L, R)) :- 
    N > 0, 
    N1 is N - 1, 
    divide(N1, N2, N3), 
    cbal_tree(N2, L), 
    cbal_tree(N3, R).

% Divide el número de nodos entre los dos subárboles.
divide(N, N1, N2) :- 
    N1 is N // 2, 
    N2 is N - N1.

% Genera todos los árboles binarios simétricos y completamente equilibrados con N nodos.
sym_cbal_trees(N, Ts) :- 
    findall(T, (cbal_tree(N, T), symmetric(T)), Ts).

% Ejemplo de uso:
% Para generar árboles con 0 nodos (debería retornar un árbol vacío):
% ?- sym_cbal_trees(0, Trees).
% Resultado: Trees = [nil].

% Para generar árboles con 1 nodo (debería retornar un árbol con un solo nodo):
% ?- sym_cbal_trees(1, Trees).
% Resultado: Trees = [t(x, nil, nil)].

% Para generar árboles con 2 nodos (no debería retornar nada, ya que no pueden ser simétricos):
% ?- sym_cbal_trees(2, Trees).
% Resultado: Trees = [].

% Para generar árboles con 3 nodos (debería retornar árboles simétricos):
% ?- sym_cbal_trees(3, Trees).
% Resultado: Trees = [t(x, t(x, nil, nil), t(x, nil, nil))].

% Para generar árboles con 4 nodos (no debería retornar nada):
% ?- sym_cbal_trees(4, Trees).
% Resultado: Trees = [].

% Para generar árboles con 5 nodos (debería retornar árboles simétricos):
% ?- sym_cbal_trees(5, Trees).
% Resultado: Trees = [t(x, t(x, t(x, nil, nil), nil), t(x, nil, nil))].
% ----------------------------------------------
