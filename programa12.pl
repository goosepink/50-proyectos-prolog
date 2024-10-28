% ===============================================
% Autor: Javier Rosas
% Fecha: 23 de octubre de 2024
% Descripción: Decodifica una lista codificada mediante Run-Length.
%              El predicado 'decode' expande cada par (N, X) en una lista
%              con N elementos X. Se incluye una versión comentada en C# 
%              para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para decodificar una lista codificada mediante Run-Length en C#.
%     static List<T> Decode<T>(List<Tuple<int, T>> encodedList)
%     {
%         var result = new List<T>();
% 
%         foreach (var pair in encodedList)
%         {
%             int count = pair.Item1;
%             T value = pair.Item2;
% 
%             for (int i = 0; i < count; i++)
%             {
%                 result.Add(value); // Agrega el valor N veces a la lista resultado.
%             }
%         }
%         return result;
%     }
% 
%     static void Main()
%     {
%         List<Tuple<int, char>> listaCodificada = new List<Tuple<int, char>>
%         {
%             Tuple.Create(2, 'a'),
%             Tuple.Create(2, 'b'),
%             Tuple.Create(1, 'c'),
%             Tuple.Create(3, 'a')
%         };
%         List<char> listaDecodificada = Decode(listaCodificada);
%         Console.WriteLine("Lista decodificada: ");
%         foreach (var item in listaDecodificada)
%         {
%             Console.Write(item + " ");
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Decodifica una lista codificada mediante Run-Length.
% Expande cada par (N, X) en una lista con N elementos X.
decode([], []).
decode([[N,X]|T], R) :- 
    decode(T, R1), 
    expand(X, N, E), 
    append(E, R1, R).

% Expande un elemento X en una lista de longitud N.
expand(_, 0, []).
expand(X, N, [X|T]) :- 
    N > 0, 
    N1 is N - 1, 
    expand(X, N1, T).

% Ejemplo de uso:
% ?- decode([[2, a], [2, b], [1, c], [3, a]], R).
% R = [a, a, b, b, c, a, a, a].
% ----------------------------------------------
