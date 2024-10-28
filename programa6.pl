% ===============================================
% Autor: Javier Rosas
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que verifica si una
%              lista es un palíndromo. Una lista es un
%              palíndromo si es igual a su inversa.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para verificar si una lista es un palíndromo en C#.
%     static bool IsPalindrome<T>(List<T> list)
%     {
%         if (list == null)
%             throw new ArgumentNullException("La lista no puede ser nula.");
%         
%         for (int i = 0, j = list.Count - 1; i < j; i++, j--)
%         {
%             if (!EqualityComparer<T>.Default.Equals(list[i], list[j]))
%                 return false; // No es un palíndromo si los elementos no coinciden.
%         }
%         return true; // Es un palíndromo.
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'r', 'a', 'd', 'a', 'r' };
%         bool esPalindromo = IsPalindrome(lista);
% 
%         Console.WriteLine("¿Es la lista un palíndromo? " + esPalindromo);
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado palindrome(L) que verifica si la lista L
% es un palíndromo. Una lista es un palíndromo si es 
% igual a su inversa.

% Verifica si una lista es un palíndromo.
% Una lista es un palíndromo si es igual a su inversa.
palindrome(L) :- 
    reverse_list(L, Reversed), 
    L = Reversed.

% Predicado reverse_list/3 que invierte una lista utilizando un acumulador.
reverse_list(L, R) :- 
    reverse_list(L, [], R).

% Caso base: cuando la lista original está vacía, el acumulador contiene la lista invertida.
reverse_list([], Acc, Acc).

% Caso recursivo: mueve el elemento de la cabeza al acumulador.
reverse_list([H|T], Acc, R) :- 
    reverse_list(T, [H|Acc], R).

% Ejemplo de uso:
% ?- palindrome([r, a, d, a, r]).
% true.
% ?- palindrome([h, e, l, l, o]).
% false.
% ----------------------------------------------
