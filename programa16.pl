% ===============================================
% Autor: Javier Rosas
% Fecha: 23 de octubre de 2024
% Descripción: Elimina cada n-ésimo elemento de una lista.
%              El predicado 'drop' utiliza un contador para determinar cuándo eliminar
%              un elemento de la lista original.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para eliminar cada n-ésimo elemento de una lista en C#.
%     static List<T> DropNth<T>(List<T> list, int N)
%     {
%         var result = new List<T>();
%         int count = 1;
%         foreach (var item in list)
%         {
%             if (count % N != 0) // Si no es el n-ésimo elemento, se agrega a la lista.
%             {
%                 result.Add(item);
%             }
%             count++;
%         }
%         return result;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e', 'f', 'g' };
%         int N = 3; // Eliminar cada tercer elemento.
%         List<char> listaSinElementos = DropNth(lista, N);
%         Console.WriteLine("Lista después de eliminar cada n-ésimo elemento: ");
%         foreach (var item in listaSinElementos)
%         {
%             Console.Write(item + " ");
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% Elimina cada n-ésimo elemento de una lista.
drop(L, N, R) :- 
    drop(L, N, N, R).

% Caso base: cuando la lista está vacía, el resultado es vacío.
drop([], _, _, []).

% Si el contador llega a 1, omite el primer elemento y reinicia el contador.
drop([_|T], 1, N, R) :- 
    drop(T, N, N, R).

% Caso recursivo: disminuye el contador y conserva el elemento.
drop([H|T], K, N, [H|R]) :- 
    K > 1, 
    K1 is K - 1, 
    drop(T, K1, N, R).

% Ejemplo de uso:
% ?- drop([a, b, c, d, e, f, g], 3, R).
% R = [a, b, d, e, g].
% ----------------------------------------------
