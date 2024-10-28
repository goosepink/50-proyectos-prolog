% ===============================================
% Autor: Javier Rosas
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que ordena una
%              lista de listas de acuerdo con la
%              longitud de las sublistas.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
% 
% class Program
% {
%     // Función para ordenar una lista de listas según la longitud de las sublistas.
%     static List<List<T>> SortByLength<T>(List<List<T>> listOfLists)
%     {
%         return listOfLists.OrderBy(sublist => sublist.Count).ToList();
%     }
% 
%     static void Main()
%     {
%         var listas = new List<List<int>> 
%         {
%             new List<int> {1, 2, 3},
%             new List<int> {4, 5},
%             new List<int> {6}
%         };
% 
%         var ordenadas = SortByLength(listas);
%         Console.WriteLine("Listas ordenadas por longitud:");
%         foreach (var lista in ordenadas)
%         {
%             Console.WriteLine(string.Join(", ", lista));
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% lsort/2: Ordena una lista de listas L según la longitud de las sublistas.
lsort(L, S) :- 
    map_list_to_pairs(length, L, P), % Crea pares (longitud, sublista).
    keysort(P, SP),                  % Ordena los pares según la longitud.
    pairs_values(SP, S).             % Extrae las sublistas ordenadas.

% Ejemplo de uso:
% ?- lsort([[1, 2, 3], [4, 5], [6]], S).
% S = [[6], [4, 5], [1, 2, 3]].
% ----------------------------------------------
