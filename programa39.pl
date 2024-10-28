% ===============================================
% Autor: Javier Rosas
% Fecha: 28 de octubre de 2024
% Descripción: Programa en Prolog que encuentra las composiciones
%              de Goldbach para todos los números pares dentro de
%              un rango dado [Low, High]. La conjetura de Goldbach
%              establece que todo número par mayor que 2 puede expresarse
%              como la suma de dos números primos.
% ===============================================

% -------- Código en Prolog --------------------
% Encuentra las composiciones de Goldbach para todos los números pares
% dentro de un rango dado.
goldbach_list(Low, High, L) :-
    findall([N, P1, P2], (
        between(Low, High, N),    % Itera sobre los números en el rango.
        N mod 2 =:= 0,            % Verifica que el número sea par.
        goldbach(N, [P1, P2])     % Encuentra una pareja de números primos P1 y P2 tal que N = P1 + P2.
    ), L).

% Encuentra dos números primos que sumen un número par dado (conjetura de Goldbach).
goldbach(N, [P1, P2]) :-
    N > 2,
    N mod 2 =:= 0,               % Verifica que N sea mayor que 2 y par.
    prime_list(2, N, Primes),    % Genera la lista de números primos hasta N.
    member(P1, Primes),          % Selecciona un primo P1 de la lista.
    P2 is N - P1,                % Calcula P2 como N - P1.
    is_prime(P2).                % Verifica que P2 también sea primo.

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
% ?- goldbach_list(10, 30, L).
% L = [[10, 3, 7], [12, 5, 7], [14, 3, 11], [16, 3, 13], [18, 5, 13], [20, 3, 17], [22, 3, 19], [24, 5, 19], [26, 3, 23], [28, 5, 23], [30, 7, 23]].
% ----------------------------------------------
