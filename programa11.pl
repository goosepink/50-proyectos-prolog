% ===============================================
% Autor: Javier Rosas
% Fecha: 23 de octubre de 2024
% Descripción: Modifica la codificación Run-Length de una lista.
%              Si un elemento no tiene duplicados, se mantiene sin empaquetar.
%              Este predicado utiliza la codificación Run-Length y 
%              modifica el resultado según las reglas especificadas.
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
%     // Función para modificar la codificación Run-Length.
%     static List<object> EncodeModified<T>(List<T> list)
%     {
%         var encoded = Encode(list);
%         var modified = new List<object>();
% 
%         foreach (var pair in encoded)
%         {
%             if (pair.Item1 == 1)
%                 modified.Add(pair.Item2); // Mantiene el elemento sin empaquetar.
%             else
%                 modified.Add(Tuple.Create(pair.Item1, pair.Item2)); // Mantiene el formato (N, X).
%         }
%         return modified;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'a', 'b', 'b', 'c', 'a', 'a', 'a' };
%         List<object> listaCodificadaModificada = EncodeModified(lista);
%         Console.WriteLine("Lista codificada modificada: ");
%         foreach (var item in listaCodificadaModificada)
%         {
%             if (item is Tuple<int, char> par)
%                 Console.WriteLine($"({par.Item1}, {par.Item2})"");
%             else
%                 Console.WriteLine(item);
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

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

% Modifica la codificación Run-Length de una lista.
% Si un elemento no tiene duplicados, se mantiene sin empaquetar.
encode_modified(L, R) :- 
    encode(L, Enc), 
    modify(Enc, R).

% Caso base: lista vacía.
modify([], []).
% Si hay solo un elemento, agrégalo directamente.
modify([[1,X]|T], [X|R]) :- modify(T, R).
% Si hay mas de un elemento, mantén el formato (N, X).
modify([[N,X]|T], [[N,X]|R]) :- N > 1, modify(T, R).

% Ejemplo de uso:
% ?- encode_modified([a, a, b, b, c, a, a, a], R).
% R = [[2, a], [2, b], c, [3, a]].
% ----------------------------------------------
