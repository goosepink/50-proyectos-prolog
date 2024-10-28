% ===============================================
% Autor: Javier Rosas
% Fecha: 28 de octubre de 2024
% Descripción: Programa en Prolog que genera un árbol de Huffman
%              dado un conjunto de frecuencias. El algoritmo de Huffman
%              es utilizado para la compresión de datos, construyendo un
%              árbol binario óptimo para la codificación.
% ===============================================

% -------- Definición del árbol de Huffman ------
% Predicado principal que genera el árbol de Huffman.
huffman(Fs, Hs) :-
    length(Fs, Len),
    Len > 1,
    sort(2, @=<, Fs, Sorted),       % Ordena la lista de frecuencias por frecuencia ascendente.
    huffman_tree(Sorted, Hs).       % Construye el árbol de Huffman.

% Caso base para construir el árbol de Huffman cuando queda un solo nodo.
huffman_tree([fr(X, _) | []], hc(X, '0')). % Solo un elemento, código '0'.

% Caso de dos elementos restantes, crea el nodo del árbol.
huffman_tree([fr(X, FreqX), fr(Y, FreqY)], hc(nil, hc(X, '0'), hc(Y, '1'))) :-
    FreqX =< FreqY.

% Caso recursivo para construir el árbol de Huffman.
huffman_tree([fr(X, FreqX), fr(Y, FreqY) | Rest], Hs) :-
    FreqZ is FreqX + FreqY,           % Calcula la frecuencia combinada.
    Z = fr(nil, FreqZ),               % Crea un nuevo nodo combinado.
    append(Rest, [Z], NewRest),       % Añade el nodo combinado a la lista.
    sort(2, @=<, NewRest, NewSorted), % Reordena la lista por frecuencia.
    huffman_tree(NewSorted, Hs).      % Llama recursivamente a huffman_tree.

% Ejemplo de uso:
% ?- huffman([fr(a, 5), fr(b, 9), fr(c, 12), fr(d, 13), fr(e, 16), fr(f, 45)], Hs).
% Resultado esperado: un árbol de Huffman que represente las codificaciones óptimas.
% ----------------------------------------------
