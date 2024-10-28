% ===============================================
% Autor: Javier Rosas
% Fecha: 23 de octubre de 2024
% Descripción: Rota una lista N lugares a la izquierda. El predicado 'rotate'
%              toma una lista y un número N, y rota los elementos de la lista N
%              posiciones a la izquierda. Si N es mayor que la longitud de la lista,
%              se utiliza la operación modulo para manejar el exceso.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para rotar una lista N lugares a la izquierda en C#.
%     static List<T> Rotate<T>(List<T> list, int N)
%     {
%         int len = list.Count;
%         int n = N % len; // Maneja rotaciones mayores que la longitud.
%         var result = new List<T>(list.GetRange(n, len - n));
%         result.AddRange(list.GetRange(0, n));
%         return result;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e', 'f', 'g' };
%         int N = 3; // Rotar 3 lugares a la izquierda.
%         List<char> resultado = Rotate(lista, N);
%         Console.WriteLine("Lista rotada: " + string.Join(", ", resultado));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Rota una lista N lugares a la izquierda.
% Utiliza la longitud de la lista para manejar rotaciones mayores que la longitud.
rotate(L, N, R) :- 
    length(L, Len), 
    N1 is N mod Len, 
    split(L, N1, L1, L2), 
    append(L2, L1, R).

    split(L, 0, [], L).
split([H|T], N, [H|L1], L2) :-
    N > 0,
    N1 is N - 1,
    split(T, N1, L1, L2).
% Ejemplo de uso:
% ?- rotate([a, b, c, d, e, f, g], 3, R).
% R = [d, e, f, g, a, b, c].
% ----------------------------------------------
