% ===============================================
% Autor: Javier Rosas
% Fecha: 28 de octubre de 2024
% Descripción: Programa en Prolog que genera una lista de números
%              primos en un rango dado [Low, High]. Utiliza el
%              predicado is_prime/1 para verificar si un número es
%              primo.
% ===============================================

% -------- Código en Prolog --------------------
% Genera una lista de números primos en un rango dado.
prime_list(Low, High, Primes) :-
    findall(P, (between(Low, High, P), is_prime(P)), Primes).

% Predicado que verifica si un número es primo.
is_prime(2). % El número 2 es primo.
is_prime(N) :-
    N > 2,
    N mod 2 =\= 0, % Elimina los números pares.
    \+ has_factor(N, 3). % Verifica si tiene factores desde 3 en adelante.

% Predicado que verifica si N tiene un factor impar comenzando desde Factor.
has_factor(N, Factor) :-
    Factor * Factor =< N,
    N mod Factor =:= 0.
has_factor(N, Factor) :-
    Factor * Factor =< N,
    Factor2 is Factor + 2, % Incrementa en 2 para verificar solo factores impares.
    has_factor(N, Factor2).

% Ejemplo de uso:
% ?- prime_list(10, 30, Primes).
% Primes = [11, 13, 17, 19, 23, 29].
% ----------------------------------------------
