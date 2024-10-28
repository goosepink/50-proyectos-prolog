% ===============================================
% Autor: Javier Rosas
% Fecha: 23 de octubre de 2024
% Descripción: Codifica una lista usando codificación Run-Length.
%              Este predicado primero agrupa los duplicados y luego
%              transforma las sublistas en parejas (N, X), donde N es 
%              la cantidad de elementos consecutivos iguales.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para codificar una lista usando codificación Run-Length en C#.
%     static List<Tuple<int, T>> Encode<T>(List<T> list)
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
%         List<Tuple<int, char>> listaCodificada = Encode(lista);
%         Console.WriteLine("Lista codificada: ");
%         foreach (var par in listaCodificada)
%         {
%             Console.WriteLine($"({par.Item1}, {par.Item2})"");
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Codifica una lista usando codificación Run-Length.
% Primero agrupa los duplicados y luego transforma las sublistas en parejas (N, X).

% Agrupa duplicados consecutivos de una lista en sublistas.
pack([], []).

pack([X|Xs], [[X|Ys]|Zs]) :- 
    transfer(X, Xs, Ys, Rest), 
    pack(Rest, Zs).

% Transfiere los elementos duplicados consecutivos a una sublista.
transfer(X, [], [], []).
transfer(X, [Y|Ys], [], [Y|Ys]) :- 
    X \= Y.
transfer(X, [X|Xs], [X|Ys], Rest) :- 
    transfer(X, Xs, Ys, Rest).

% Codifica una lista usando codificación Run-Length.
% Primero agrupa los duplicados y luego transforma las sublistas en parejas (N, X).
encode(L, R) :- 
    pack(L, P), 
    transform(P, R).

% Transforma sublistas en parejas (N, X), donde N es la cantidad de elementos.
transform([], []).
transform([[X|Xs]|Ys], [[N,X]|Zs]) :- 
    length([X|Xs], N), 
    transform(Ys, Zs).

% Ejemplo de uso:
% ?- encode([a, a, b, b, c, a, a, a], R).
% R = [[2, a], [2, b], [1, c], [3, a]].
% ----------------------------------------------
