% ===============================================
% Autor: Javier Rosas
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que verifica si
%              un número entero dado es primo.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% 
% class Program
% {
%     // Función para verificar si un número es primo.
%     static bool IsPrime(int n)
%     {
%         if (n <= 1) return false;
%         if (n <= 3) return true;
%         if (n % 2 == 0 || n % 3 == 0) return false;
%         
%         for (int i = 5; i * i <= n; i += 6)
%         {
%             if (n % i == 0 || n % (i + 2) == 0)
%                 return false;
%         }
%         return true;
%     }
% 
%     static void Main()
%     {
%         int number = 29;
%         Console.WriteLine(IsPrime(number)
%             ? $"{number} es primo."
%             : $"{number} no es primo.");
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------

% is_prime/1: Verifica si un número entero dado es primo.
is_prime(2).
is_prime(3).
is_prime(P) :- P > 3, P mod 2 =\= 0, \+ has_factor(P, 3).

% has_factor/2: Verifica si un número tiene factores que lo dividen.
has_factor(N, L) :- N mod L =:= 0.
has_factor(N, L) :- L * L < N, L2 is L + 2, has_factor(N, L2).

% Ejemplo de uso:
% ?- is_prime(29).
% true.
% ?- is_prime(15).
% false.
% ----------------------------------------------
