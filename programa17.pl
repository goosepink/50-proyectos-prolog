% ===============================================
% Autor: Javier Rosas
% Fecha: 23 de octubre de 2024
% Descripción: Divide una lista en dos partes. La longitud de la primera parte
%              está dada por el segundo argumento.
%              El predicado 'split' toma una lista y un número N, y produce dos listas:
%              la primera con los primeros N elementos y la segunda con el resto.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para dividir una lista en dos partes en C#.
%     static Tuple<List<T>, List<T>> Split<T>(List<T> list, int N)
%     {
%         var firstPart = new List<T>();
%         var secondPart = new List<T>();
%         for (int i = 0; i < list.Count; i++)
%         {
%             if (i < N)
%                 firstPart.Add(list[i]); // Agrega a la primera parte.
%             else
%                 secondPart.Add(list[i]); // Agrega a la segunda parte.
%         }
%         return Tuple.Create(firstPart, secondPart);
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e', 'f', 'g' };
%         int N = 3; // Número de elementos en la primera parte.
%         var resultado = Split(lista, N);
%         Console.WriteLine("Primera parte: " + string.Join(", ", resultado.Item1));
%         Console.WriteLine("Segunda parte: " + string.Join(", ", resultado.Item2));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Divide una lista en dos partes.
% La longitud de la primera parte está dada por el segundo argumento.
split(L, 0, [], L).
split([H|T], N, [H|L1], L2) :- 
    N > 0, 
    N1 is N - 1, 
    split(T, N1, L1, L2).

% Ejemplo de uso:
% ?- split([a, b, c, d, e, f, g], 3, L1, L2).
% L1 = [a, b, c],
% L2 = [d, e, f, g].
% ----------------------------------------------
