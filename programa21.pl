% ===============================================
% Autor: Javier Rosas
% Fecha: 23 de octubre de 2024
% Descripción: Inserta un elemento en una lista en la posición dada.
%              El predicado 'insert_at' toma un elemento X, una lista, un índice K y
%              una lista resultante donde se ha insertado el elemento en la posición K.
%              Si K es mayor que la longitud de la lista, el elemento se insertará al final.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para insertar un elemento en una lista en la posición dada.
%     static List<T> InsertAt<T>(T element, List<T> list, int index)
%     {
%         if (index < 1 || index > list.Count + 1)
%             throw new ArgumentOutOfRangeException("El índice debe estar dentro del rango válido.");
% 
%         list.Insert(index - 1, element); // Insertar en la posición especificada.
%         return list;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd' };
%         List<char> resultado = InsertAt('x', lista, 3);
% 
%         Console.WriteLine(string.Join(", ", resultado)); // Imprime: a, b, x, c, d
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Inserta un elemento en la posición dada.
% Caso base: si K es 1, el elemento X se inserta al principio de la lista.
insert_at(X, L, 1, [X|L]).

% Caso recursivo: si K es mayor que 1, disminuye el índice y continúa con la cola.
insert_at(X, [H|T], K, [H|R]) :-
    K > 1,
    K1 is K - 1,
    insert_at(X, T, K1, R).

% Ejemplo de uso:
% ?- insert_at(x, [a, b, c, d], 3, R).
% R = [a, b, x, c, d].
% ----------------------------------------------
