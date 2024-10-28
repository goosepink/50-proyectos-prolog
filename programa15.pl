% ===============================================
% Autor: Javier Rosas
% Fecha: 23 de octubre de 2024
% Descripción: Duplica los elementos de una lista un número dado de veces.
%              El predicado 'dupli' toma cada elemento de la lista y lo duplica
%              un número especificado de veces N.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para duplicar los elementos de una lista N veces en C#.
%     static List<T> DuplicateN<T>(List<T> list, int N)
%     {
%         var result = new List<T>();
%         foreach (var item in list)
%         {
%             for (int i = 0; i < N; i++)
%             {
%                 result.Add(item); // Agrega el elemento N veces.
%             }
%         }
%         return result;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c' };
%         int N = 3; // Número de veces que se duplicarán los elementos.
%         List<char> listaDuplicada = DuplicateN(lista, N);
%         Console.WriteLine("Lista duplicada N veces: ");
%         foreach (var item in listaDuplicada)
%         {
%             Console.Write(item + " ");
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Duplica los elementos de una lista un número dado de veces.
% Caso base: la lista vacía se mantiene vacía.
dupli([], _, []).
% Caso recursivo: duplica el primer elemento N veces y continúa con el resto.
dupli([H|T], N, R) :- 
    duplicate(H, N, D), 
    dupli(T, N, R1), 
    append(D, R1, R).

% Crea una lista con N repeticiones del elemento X.
duplicate(_, 0, []).
duplicate(X, N, [X|R]) :- 
    N > 0, 
    N1 is N - 1, 
    duplicate(X, N1, R).

% Ejemplo de uso:
% ?- dupli([a, b, c], 3, R).
% R = [a, a, a, b, b, b, c, c, c].
% ----------------------------------------------
