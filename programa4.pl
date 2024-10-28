% ===============================================
% Autor: Javier Rosas
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que calcula el número 
%              de elementos de una lista.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para calcular la longitud de una lista en C#.
%     static int ListLength<T>(List<T> list)
%     {
%         if (list == null)
%             throw new ArgumentNullException("La lista no puede ser nula.");
%         
%         return list.Count; // Devuelve el número de elementos en la lista.
%     }
% 
%     static void Main()
%     {
%         List<int> lista = new List<int> { 1, 2, 3, 4, 5 };
%         int longitud = ListLength(lista);
% 
%         Console.WriteLine("La longitud de la lista es: " + longitud);
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado list_length(List, N) que determina el
% número de elementos N en la lista List.

% Caso base: una lista vacía tiene longitud 0.
list_length([], 0).

% Caso recursivo: la longitud es 1 mas que la longitud de la cola.
list_length([_|T], N) :- 
    list_length(T, N1), 
    N is N1 + 1.

% Ejemplo de uso:
% ?- list_length([1, 2, 3, 4, 5], N).
% N = 5.
% ----------------------------------------------