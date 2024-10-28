% ===============================================
% Autor: Javier Rosas
% Fecha: 23 de octubre de 2024
% Descripción: Agrupa duplicados consecutivos de una lista en sublistas.
%              Este predicado organiza los elementos consecutivos
%              iguales en listas anidadas.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para agrupar duplicados consecutivos en sublistas en C#.
%     static List<List<T>> Pack<T>(List<T> list)
%     {
%         var result = new List<List<T>>();
%         if (list.Count == 0)
%             return result; // Caso base: lista vacía.
% 
%         List<T> currentGroup = new List<T> { list[0] }; // Agrega el primer elemento a la sublista.
% 
%         for (int i = 1; i < list.Count; i++)
%         {
%             if (list[i].Equals(list[i - 1]))
%                 currentGroup.Add(list[i]); // Agrégalo a la sublista actual.
%             else
%             {
%                 result.Add(currentGroup); // Agrega la sublista actual al resultado.
%                 currentGroup = new List<T> { list[i] }; // Inicia una nueva sublista.
%             }
%         }
% 
%         result.Add(currentGroup); // Agrega la última sublista.
%         return result;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'a', 'b', 'b', 'c', 'a', 'a', 'a' };
%         List<List<char>> listaAgrupada = Pack(lista);
%         Console.WriteLine("Lista agrupada: ");
%         foreach (var grupo in listaAgrupada)
%         {
%             Console.WriteLine("[" + string.Join(", ", grupo) + "]");
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Agrupa duplicados consecutivos de una lista en sublistas.
% Caso base: una lista vacía se agrupa como una lista vacía.
pack([], []).

% Caso recursivo: transfiere todos los elementos consecutivos iguales a una sublista.
pack([X|Xs], [[X|Ys]|Zs]) :- 
    transfer(X, Xs, Ys, Rest), 
    pack(Rest, Zs).

% Transfiere los elementos duplicados consecutivos a una sublista.
transfer(X, [], [], []).
% Si el siguiente elemento es diferente, termina la transferencia.
transfer(X, [Y|Ys], [], [Y|Ys]) :- 
    X \= Y.
% Si el siguiente elemento es igual, agrégalo a la sublista.
transfer(X, [X|Xs], [X|Ys], Rest) :- 
    transfer(X, Xs, Ys, Rest).

% Ejemplo de uso:
% ?- pack([a, a, b, b, c, a, a, a], R).
% R = [[a, a], [b, b], [c], [a, a, a]].
% ----------------------------------------------
