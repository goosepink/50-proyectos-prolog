% ===============================================
% Autor: Javier Rosas
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que genera todas
%              las combinaciones de K elementos
%              seleccionados de una lista dada.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para generar combinaciones de K elementos de una lista.
%     static IEnumerable<List<T>> GetCombinations<T>(List<T> list, int k)
%     {
%         if (k == 0) yield return new List<T>();
%         else if (list.Count > 0)
%         {
%             T head = list[0];
%             List<T> tail = list.GetRange(1, list.Count - 1);
% 
%             foreach (var combination in GetCombinations(tail, k - 1))
%             {
%                 combination.Insert(0, head);
%                 yield return combination;
%             }
%             foreach (var combination in GetCombinations(tail, k))
%             {
%                 yield return combination;
%             }
%         }
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd' };
%         int k = 2;
%         var combinaciones = GetCombinations(lista, k);
% 
%         Console.WriteLine($"Combinaciones de {k} elementos:");
%         foreach (var comb in combinaciones)
%         {
%             Console.WriteLine(string.Join(", ", comb));
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog opcion1--------------------

% combination/3: Genera todas las combinaciones de K elementos de una lista dada.
% combination(0, _, []). % Caso base: una combinación de 0 elementos es la lista vacía.
% combination(K, [H|T], [H|Comb]) :- 
%    K > 0, 
%    K1 is K - 1, 
%    combination(K1, T, Comb). % Selecciona el primer elemento y sigue buscando.

% combination(K, [_|T], Comb) :- 
%    K > 0, 
%    combination(K, T, Comb). % No selecciona el primer elemento y sigue buscando.

% Ejemplo de uso:
% ?- combination(2, [a, b, c, d], Comb).
% dale al ; para mostar cada combo
% Comb = [a, b] ;
% Comb = [a, c] ;
% Comb = [a, d] ;
% Comb = [b, c] ;
% Comb = [b, d] ;
% Comb = [c, d].
% ----------------------------------------------

% -------- Código en Prolog --------------------

% combination/3: Genera todas las combinaciones de K elementos de una lista dada.
combination(0, _, []). % Caso base: una combinación de 0 elementos es la lista vacía.
combination(K, [H|T], [H|Comb]) :- 
    K > 0, 
    K1 is K - 1, 
    combination(K1, T, Comb). % Selecciona el primer elemento y sigue buscando.

combination(K, [_|T], Comb) :- 
    K > 0, 
    combination(K, T, Comb). % No selecciona el primer elemento y sigue buscando.

% Predicado para encontrar todas las combinaciones y devolverlas en una lista.
combinations(K, List, Combs) :-
    findall(Comb, combination(K, List, Comb), Combs).

% Ejemplo de uso:
% ?- combinations(2, [a, b, c, d], Combs).
% Combs = [[a, b], [a, c], [a, d], [b, c], [b, d], [c, d]].
% ----------------------------------------------
