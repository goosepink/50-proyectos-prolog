% ===============================================
% Autor: Javier Rosas
% Fecha: 27 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              los factores primos de un número 
%              entero positivo junto con su 
%              multiplicidad. Se incluye una 
%              versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;

% class Program
% {
%     // Método para encontrar los factores primos y su multiplicidad.
%     static Dictionary<int, int> PrimeFactorsMult(int n)
%     {
%         Dictionary<int, int> factors = new Dictionary<int, int>();
%         for (int factor = 2; n > 1; factor++)
%         {
%             while (n % factor == 0)
%             {
%                 if (factors.ContainsKey(factor))
%                     factors[factor]++; // Incrementar la multiplicidad.
%                 else
%                     factors[factor] = 1; // Inicializar la multiplicidad.
%                 n /= factor; // Dividir n por el factor.
%             }
%         }
%         return factors;
%     }

%     static void Main()
%     {
%         int number = 28; // Ejemplo de uso.
%         var factors = PrimeFactorsMult(number);
%         foreach (var factor in factors)
%         {
%             Console.WriteLine($"Factor: {factor.Key}, Multiplicidad: {factor.Value}");
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado principal para obtener factores primos con multiplicidad
factores_multiplicidad(N, Factores) :-
    N > 0,
    factorizar(N, ListaFactores),
    contar_factores(ListaFactores, Factores).

% Factorización en lista simple de factores primos
factorizar(1, []).
factorizar(N, [Factor|Resto]) :-
    N > 1,
    encontrar_menor_factor(N, Factor),
    N1 is N div Factor,
    factorizar(N1, Resto).

% Encuentra el menor factor primo
encontrar_menor_factor(N, Factor) :-
    encontrar_factor(N, 2, Factor).

encontrar_factor(N, K, K) :-
    N mod K =:= 0,
    K =< N.
encontrar_factor(N, K, Factor) :-
    K * K =< N,
    K1 is K + 1,
    encontrar_factor(N, K1, Factor).

% Contar ocurrencias de factores
contar_factores([], []).
contar_factores([H|T], [[H,Count]|Rest]) :-
    contar_ocurrencias(H, [H|T], Count, Remaining),
    contar_factores(Remaining, Rest).

% Contar ocurrencias de un elemento
contar_ocurrencias(_, [], 0, []).
contar_ocurrencias(X, [X|T], Count1, Rest) :-
    contar_ocurrencias(X, T, Count, Rest),
    Count1 is Count + 1.
contar_ocurrencias(X, [Y|T], Count, [Y|Rest]) :-
    X \= Y,
    contar_ocurrencias(X, T, Count, Rest).

% Mostrar resultados de forma bonita
mostrar_factorizacion(N) :-
    factores_multiplicidad(N, Factores),
    format('~w = ', [N]),
    mostrar_factores(Factores).

% Mostrar factores de forma bonita
mostrar_factores([]).
mostrar_factores([[Factor,1]|Resto]) :-
    format('~w', [Factor]),
    mostrar_siguiente_factor(Resto).
mostrar_factores([[Factor,Exp]|Resto]) :-
    Exp > 1,
    format('~w^~w', [Factor,Exp]),
    mostrar_siguiente_factor(Resto).

% Auxiliar para mostrar el siguiente factor
mostrar_siguiente_factor([]) :- nl.
mostrar_siguiente_factor(Resto) :-
    write(' * '),
    mostrar_factores(Resto).

% Pruebas del sistema
test_factorizacion :-
    write('=== Pruebas de Factorización con Multiplicidad ==='), nl,
    mostrar_factorizacion(12),    % 2^2 * 3
    mostrar_factorizacion(28),    % 2^2 * 7
    mostrar_factorizacion(100),   % 2^2 * 5^2
    mostrar_factorizacion(17),    % 17
    mostrar_factorizacion(256),   % 2^8
    mostrar_factorizacion(1000),  % 2^3 * 5^3
    write('=== Fin de las pruebas ==='), nl.
    % factores_multiplicidad(100, F).
% ----------------------------------------------

