% ===============================================
% Autor: Javier Rosas
% Fecha: 23 de octubre de 2024
% Descripción: Extrae una porción de una lista, dados los índices de inicio y fin.
%              El predicado 'slice' toma una lista, un índice de inicio I y un índice
%              de fin K, y devuelve la sublista que comienza en el índice I y termina
%              en el índice K. Los índices I y K deben ser mayores que 0.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para extraer una porción de una lista en C#.
%     static List<T> Slice<T>(List<T> list, int start, int end)
%     {
%         var result = new List<T>();
%         for (int i = start - 1; i < end && i < list.Count; i++)
%         {
%             result.Add(list[i]);
%         }
%         return result;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e', 'f', 'g' };
%         int I = 2, K = 5; // Extraer desde el índice 2 hasta el 5.
%         List<char> sublista = Slice(lista, I, K);
%         Console.WriteLine("Sublista extraída: " + string.Join(", ", sublista));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Extrae una porción de una lista, dado un rango.
% Los índices I y K deben ser mayores que 0.
slice([H|_], 1, 1, [H]).
slice([H|T], 1, K, [H|R]) :- 
    K > 1, 
    K1 is K - 1, 
    slice(T, 1, K1, R).
slice([_|T], I, K, R) :- 
    I > 1, 
    I1 is I - 1, 
    K1 is K - 1, 
    slice(T, I1, K1, R).

% Ejemplo de uso:
% ?- slice([a, b, c, d, e, f, g], 2, 5, R).
% R = [b, c, d, e].
% ----------------------------------------------
