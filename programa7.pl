% ===============================================
% Autor: Javier Rosas
% Fecha: 23 de octubre de 2024
% Descripción: Aplana una lista anidada en una lista simple.
%              Una lista anidada puede contener listas dentro de listas,
%              y este predicado convierte toda la estructura en una lista simple.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para aplanar una lista anidada en C#.
%     static List<object> Flatten(List<object> list)
%     {
%         List<object> flatList = new List<object>();
%         foreach (var item in list)
%         {
%             if (item is List<object> sublist)
%             {
%                 flatList.AddRange(Flatten(sublist)); // Aplana la sublista recursivamente.
%             }
%             else
%             {
%                 flatList.Add(item); // Agrega el elemento directamente si no es una lista.
%             }
%         }
%         return flatList;
%     }
% 
%     static void Main()
%     {
%         List<object> listaAnidada = new List<object> { 1, new List<object> { 2, 3 }, 4, new List<object> { 5, new List<object> { 6, 7 } } };
%         List<object> listaAplanada = Flatten(listaAnidada);
%         Console.WriteLine("Lista aplanada: " + string.Join(", ", listaAplanada));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Aplana una lista anidada en una lista simple.
% Caso base: la lista vacía se aplana a una lista vacía.
my_flatten([], []).

% Caso recursivo: si la cabeza es una lista, aplana la cabeza y la cola recursivamente.
my_flatten([H|T], Flat) :- 
    my_flatten(H, FH), 
    my_flatten(T, FT), 
    append(FH, FT, Flat).

% Si la cabeza no es una lista, simplemente agrégala al resultado.
my_flatten(X, [X]) :- 
    X \= [], 
    \+ is_list(X).

% Ejemplo de uso:
% ?- my_flatten([1, [2, 3], 4, [5, [6, 7]]], Flat).
% Flat = [1, 2, 3, 4, 5, 6, 7].
% ----------------------------------------------
