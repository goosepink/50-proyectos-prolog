% ===============================================
% Autor: Javier Rosas
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que encuentra el 
%              k-ésimo elemento de una lista. El 
%              índice K debe ser mayor que 0.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para encontrar el k-ésimo elemento de una lista en C#.
%     static T ElementAt<T>(List<T> list, int k)
%     {
%         if (list == null || k <= 0 || k > list.Count)
%             throw new ArgumentException("El índice K debe ser mayor que 0 y menor o igual al tamaño de la lista.");
%         
%         return list[k - 1]; // Devuelve el elemento en la posición K-1.
%     }
% 
%     static void Main()
%     {
%         List<int> lista = new List<int> { 10, 20, 30, 40, 50 };
%         int elemento = ElementAt(lista, 3);
% 
%         Console.WriteLine("El elemento en la posición 3 es: " + elemento);
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado element_at(X, List, K) que determina el
% k-ésimo elemento X de la lista List. El índice K
% debe ser mayor que 0.

% Caso base: el primer elemento de la lista es el k-ésimo si K es 1.
element_at(X, [X|_], 1).

% Caso recursivo: decrementa K y evalúa el resto de la lista.
element_at(X, [_|T], K) :- 
    K > 1, 
    K1 is K - 1, 
    element_at(X, T, K1).

% Ejemplo de uso:
% ?- element_at(X, [10, 20, 30, 40, 50], 3).
% X = 30.
% ----------------------------------------------