% ===============================================
% Autor: Javier Rosas
% Fecha: 23 de octubre de 2024
% Descripción: Crea una lista con todos los enteros dentro de un rango dado.
%              El predicado 'range' toma dos enteros I y K, y genera una lista
%              que contiene todos los números desde I hasta K, inclusive.
%              Si I es mayor que K, el resultado será una lista vacía.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para crear una lista con todos los enteros dentro de un rango dado.
%     static List<int> Range(int start, int end)
%     {
%         if (start > end)
%             return new List<int>(); // Si el inicio es mayor que el final, devuelve una lista vacía.
% 
%         List<int> result = new List<int>();
%         for (int i = start; i <= end; i++)
%         {
%             result.Add(i); // Agrega el número actual a la lista.
%         }
%         return result;
%     }
% 
%     static void Main()
%     {
%         List<int> resultado = Range(4, 9);
%         Console.WriteLine(string.Join(", ", resultado)); // Imprime: 4, 5, 6, 7, 8, 9
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Crea una lista con todos los enteros dentro de un rango dado.
% Caso base: cuando el inicio y el final son iguales.
range(I, I, [I]).

% Caso recursivo: agrega el inicio a la lista y continúa con el siguiente número.
range(I, K, [I|R]) :-
    I < K,
    I1 is I + 1,
    range(I1, K, R).

% Ejemplo de uso:
% ?- range(4, 9, R).
% R = [4, 5, 6, 7, 8, 9].
% ----------------------------------------------
