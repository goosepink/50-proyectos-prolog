% ===============================================
% Autor: Javier Rosas
% Fecha: 28 de octubre de 2024
% Descripción: Programa en Prolog que verifica si un término dado
%              representa un árbol binario. Un árbol binario está
%              compuesto por un nodo raíz y dos subárboles.
% ===============================================

% -------- Verificación de árboles binarios ------
% Caso base: el término nil representa un árbol vacío.
istree(nil).

% Caso recursivo: un término en la forma t(R, L, R) es un árbol si
% L y R también son árboles.
istree(t(_, L, R)) :-
    istree(L),  % Verifica que el subárbol izquierdo es un árbol.
    istree(R).  % Verifica que el subárbol derecho es un árbol.

% Ejemplo de uso:
% ?- istree(t(a, t(b, nil, nil), t(c, nil, nil))). % Verdadero
% ?- istree(t(a, t(b, nil, nil), nil)).         % Verdadero
% ?- istree(t(a, t(b, nil, nil), t(c, t(d, nil, nil), nil))). % Verdadero
% ?- istree(t(a, t(b, nil, nil), t(c, nil))).    % Falso (tiene solo un hijo)
% ?- istree(t(a, nil, t(b, nil, nil))).          % Verdadero
% ?- istree(t(a, t(b, nil, nil), t(c, nil, t(d, nil, nil)))). % Verdadero
% ----------------------------------------------
