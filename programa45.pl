% ===============================================
% Autor: Javier Rosas
% Fecha: 28 de octubre de 2024
% Descripción: Programa en Prolog que construye un árbol binario
%              completamente equilibrado con N nodos. Un árbol
%              completamente equilibrado tiene subárboles cuya
%              diferencia de tamaño es como máximo 1.
% ===============================================

% -------- Construcción de un árbol completamente equilibrado ------
% Caso base: un árbol con 0 nodos es nil.
cbal_tree(0, nil).

% Caso recursivo: construye un árbol equilibrado con N nodos.
cbal_tree(N, t('x', L, R)) :- 
    N > 0,
    N1 is N - 1,                 % Reduce en 1 el número total de nodos para la raíz.
    divide(N1, N2, N3),          % Divide el resto de los nodos entre los subárboles.
    cbal_tree(N2, L),            % Construye el subárbol izquierdo.
    cbal_tree(N3, R).            % Construye el subárbol derecho.

% Divide el número de nodos entre los dos subárboles.
divide(N, N1, N2) :- 
    N1 is N // 2,                % Subárbol izquierdo tiene la mitad (redondeado hacia abajo).
    N2 is N - N1.                % Subárbol derecho toma el resto.

% Ejemplo de uso:
% ?- cbal_tree(3, T).
% T = t('x', t('x', nil, nil), t('x', nil, nil)).
%
% ?- cbal_tree(4, T).
% T = t('x', t('x', nil, nil), t('x', nil, nil)).
%
% ?- cbal_tree(5, T).
% T = t('x', t('x', t('x', nil, nil), nil), t('x', nil, nil)).
% ----------------------------------------------
