% ===============================================
% Autor: Javier Rosas
% Fecha: 27 de octubre de 2024
% Descripción: Programa en Prolog que encuentra 
%              los factores primos de un número 
%              entero positivo. Se incluye una 
%              versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     // Método para encontrar los factores primos de un número entero.
%     static List<int> PrimeFactors(int n)
%     {
%         List<int> factors = new List<int>();
%         // Comenzar desde el menor factor primo.
%         for (int factor = 2; n > 1; factor++)
%         {
%             // Si el factor es un divisor de n.
%             while (n % factor == 0)
%             {
%                 factors.Add(factor); // Agregar el factor a la lista.
%                 n /= factor; // Dividir n por el factor.
%             }
%         }
%         return factors;
%     }

%     static void Main()
%     {
%         int number = 28; // Ejemplo de uso.
%         List<int> factors = PrimeFactors(number);
%         Console.WriteLine("Factores primos de " + number + ": " + string.Join(", ", factors));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado principal para obtener factores primos
factorizar(Numero, Factores) :-
    Numero > 0,
    factorizar_aux(Numero, 2, Factores).

% Caso base: cuando llegamos a 1, la lista está vacía
factorizar_aux(1, _, []).

% Caso cuando encontramos un factor
factorizar_aux(N, Factor, [Factor|Resto]) :-
    N > 1,
    N mod Factor =:= 0,
    NextN is N div Factor,
    factorizar_aux(NextN, Factor, Resto).

% Caso cuando necesitamos probar el siguiente factor
factorizar_aux(N, Factor, Factores) :-
    N > 1,
    N mod Factor =\= 0,
    NextFactor is Factor + 1,
    factorizar_aux(N, NextFactor, Factores).

% Predicado para mostrar la factorización de forma bonita
mostrar_factorizacion(Numero) :-
    factorizar(Numero, Factores),
    format('Los factores primos de ~w son: ~w~n', [Numero, Factores]).

% Predicado para probar varios números
test_factorizacion :-
    write('=== Pruebas de Factorizacion Prima ==='), nl,
    mostrar_factorizacion(12),
    mostrar_factorizacion(28),
    mostrar_factorizacion(100),
    mostrar_factorizacion(17),
    mostrar_factorizacion(256),
    write('=== Fin de las pruebas ==='), nl.

% Predicado para verificar si un número es primo
es_primo(Numero) :-
    Numero > 1,
    factorizar(Numero, Factores),
    length(Factores, 1).
% ----------------------------------------------
