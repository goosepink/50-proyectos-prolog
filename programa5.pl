% ===============================================
% Autor: Javier Rosas
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que invierte una lista.
%              Utiliza un acumulador para ir construyendo
%              la lista invertida.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para invertir una lista en C#.
%     static List<T> ReverseList<T>(List<T> list)
%     {
%         if (list == null)
%             throw new ArgumentNullException("La lista no puede ser nula.");
%         
%         List<T> reversed = new List<T>(list);
%         reversed.Reverse(); // Invierte la lista in situ.
%         return reversed; // Devuelve la lista invertida.
%     }
% 
%     static void Main()
%     {
%         List<int> lista = new List<int> { 1, 2, 3, 4, 5 };
%         List<int> listaInvertida = ReverseList(lista);
% 
%         Console.WriteLine("La lista invertida es: " + string.Join(", ", listaInvertida));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado reverse_list(L, R) que invierte la lista L
% y devuelve la lista invertida R.

% Utiliza un predicado auxiliar con un acumulador para
% construir la lista invertida.

reverse_list(L, R) :- 
    reverse_list(L, [], R).

% Caso base: cuando la lista original está vacía, el acumulador contiene la lista invertida.
reverse_list([], Acc, Acc).

% Caso recursivo: mueve el elemento de la cabeza al acumulador.
reverse_list([H|T], Acc, R) :- 
    reverse_list(T, [H|Acc], R).

% Ejemplo de uso:
% ?- reverse_list([1, 2, 3, 4, 5], R).
% R = [5, 4, 3, 2, 1].
% ----------------------------------------------
