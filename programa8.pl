% ===============================================
% Autor: Javier Rosas
% Fecha: 23 de octubre de 2024
% Descripción: Elimina duplicados consecutivos de una lista.
%              Este predicado conserva el primer elemento de una serie
%              de duplicados y elimina los que le siguen.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para eliminar duplicados consecutivos de una lista en C#.
%     static List<T> Compress<T>(List<T> list)
%     {
%         if (list.Count == 0)
%             return new List<T>(); // Caso base: lista vacía.
% 
%         List<T> result = new List<T> { list[0] }; // Agrega el primer elemento.
% 
%         for (int i = 1; i < list.Count; i++)
%         {
%             if (!list[i].Equals(list[i - 1]))
%                 result.Add(list[i]); // Agrega el elemento si es distinto del anterior.
%         }
% 
%         return result;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'a', 'b', 'b', 'c', 'a', 'a', 'a' };
%         List<char> listaComprimida = Compress(lista);
%         Console.WriteLine("Lista sin duplicados: " + string.Join(", ", listaComprimida));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Elimina duplicados consecutivos de una lista.
% Caso base: una lista vacía se mantiene vacía.
compress([], []).

% Si queda un solo elemento, no hay duplicados.
compress([X], [X]).

% Caso recursivo: si el primer y segundo elemento son iguales, ignora el primero.
compress([X,X|T], R) :- 
    compress([X|T], R).

% Si el primer y segundo elemento son distintos, conserva el primero.
compress([X,Y|T], [X|R]) :- 
    X \= Y, 
    compress([Y|T], R).

% Ejemplo de uso:
% ?- compress([a, a, b, b, c, a, a, a], R).
% R = [a, b, c, a].
% ----------------------------------------------
