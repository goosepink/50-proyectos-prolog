% ===============================================
% Autor: Javier Rosas
% Fecha: 23 de octubre de 2024
% Descripción: Duplica los elementos de una lista.
%              El predicado 'dupli' toma cada elemento de la lista y lo duplica.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para duplicar los elementos de una lista en C#.
%     static List<T> Duplicate<T>(List<T> list)
%     {
%         var result = new List<T>();
%         foreach (var item in list)
%         {
%             result.Add(item); // Agrega el elemento original.
%             result.Add(item); // Agrega el duplicado.
%         }
%         return result;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c' };
%         List<char> listaDuplicada = Duplicate(lista);
%         Console.WriteLine("Lista duplicada: ");
%         foreach (var item in listaDuplicada)
%         {
%             Console.Write(item + " ");
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Duplica los elementos de una lista.
% Caso base: la lista vacía se mantiene vacía.
dupli([], []).
% Caso recursivo: duplica el primer elemento y continúa con el resto.
dupli([H|T], [H,H|R]) :- 
    dupli(T, R).

% Ejemplo de uso:
% ?- dupli([a, b, c], R).
% R = [a, a, b, b, c, c].
% ----------------------------------------------
