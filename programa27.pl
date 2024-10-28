% ===============================================
% Autor: Javier Rosas
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que agrupa los
%              elementos de un conjunto en
%              subconjuntos disjuntos, dados los
%              tamaños de los subgrupos.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
% 
% class Program
% {
%     // Función para agrupar elementos en subgrupos disjuntos.
%     static List<List<List<T>>> Group<T>(List<T> list, List<int> sizes)
%     {
%         if (!sizes.Any()) return new List<List<List<T>>> { new List<List<T>>() };
%         int firstSize = sizes.First();
%         var combinations = GetCombinations(list, firstSize);
%         var result = new List<List<List<T>>>();
% 
%         foreach (var combination in combinations)
%         {
%             var remaining = list.Except(combination).ToList();
%             var subgroups = Group(remaining, sizes.Skip(1).ToList());
%             foreach (var subgroup in subgroups)
%             {
%                 subgroup.Insert(0, combination);
%                 result.Add(subgroup);
%             }
%         }
%         return result;
%     }
% 
%     // Reutiliza el metodo GetCombinations del ejemplo anterior.
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e' };
%         List<int> tamaños = new List<int> { 2, 3 };
%         var grupos = Group(lista, tamaños);
% 
%         Console.WriteLine("Grupos disjuntos:");
%         foreach (var grupo in grupos)
%         {
%             Console.WriteLine(string.Join(" | ", grupo.Select(g => string.Join(", ", g))));
%         }
%     }
% }
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

% group/3: Agrupa los elementos de una lista Es en subgrupos de tamaños dados por Ns.
group([], [], []). % Caso base: cuando no hay elementos ni tamaños restantes.

group([N|Ns], Es, [G|Gs]) :- 
    combination(N, Es, G), % Genera una combinación de N elementos.
    subtract(Es, G, Rest), % Resta los elementos seleccionados de la lista original.
    group(Ns, Rest, Gs).   % Continúa agrupando con los elementos restantes y tamaños.

% Predicado para encontrar todas las agrupaciones y devolverlas en una lista.
groups(Ns, Es, AllGroups) :-
    findall(Gs, group(Ns, Es, Gs), AllGroups).

% Ejemplo de uso:
% ?- groups([2, 3], [a, b, c, d, e], Grupos).
% Grupos = [[[a, b], [c, d, e]], [[a, c], [b, d, e]], [[a, d], [b, c, e]], ...].
% ----------------------------------------------
