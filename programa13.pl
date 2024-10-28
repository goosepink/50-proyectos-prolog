% ===============================================
% Autor: Javier Rosas
% Fecha: 23 de octubre de 2024
% Descripción: Codifica directamente una lista usando codificación Run-Length.
%              Cuenta cuántos elementos consecutivos son iguales y los agrupa
%              en pares (N, X), donde N es la cantidad de elementos y X es el valor.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para codificar directamente una lista usando codificación Run-Length en C#.
%     static List<Tuple<int, T>> EncodeDirect<T>(List<T> list)
%     {
%         var result = new List<Tuple<int, T>>();
%         if (list.Count == 0)
%             return result; // Caso base: lista vacía.
% 
%         int count = 1;
%         for (int i = 1; i < list.Count; i++)
%         {
%             if (list[i].Equals(list[i - 1]))
%                 count++; // Aumenta el contador si el elemento es igual al anterior.
%             else
%             {
%                 result.Add(Tuple.Create(count, list[i - 1])); // Agrega la pareja (N, X).
%                 count = 1; // Reinicia el contador.
%             }
%         }
%         result.Add(Tuple.Create(count, list[list.Count - 1])); // Agrega la última pareja.
%         return result;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'a', 'b', 'b', 'c', 'a', 'a', 'a' };
%         List<Tuple<int, char>> listaCodificada = EncodeDirect(lista);
%         Console.WriteLine("Lista codificada directamente: ");
%         foreach (var item in listaCodificada)
%         {
%             Console.WriteLine($"({item.Item1}, {item.Item2})"");
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Codifica directamente una lista usando codificación Run-Length.
% Cuenta cuántos elementos consecutivos son iguales.
encode_direct([], []).
encode_direct([X|Xs], [[N,X]|R]) :- 
    count(X, [X|Xs], N, Rest), 
    encode_direct(Rest, R).

% Cuenta cuántos elementos consecutivos son iguales.
count(_, [], 0, []).
count(X, [X|Xs], N, Rest) :- 
    count(X, Xs, N1, Rest), 
    N is N1 + 1.
count(X, [Y|Ys], 0, [Y|Ys]) :- 
    X \= Y.

% Ejemplo de uso:
% ?- encode_direct([a, a, b, b, c, a, a, a], R).
% R = [[2, a], [2, b], [1, c], [3, a]].
% ----------------------------------------------
