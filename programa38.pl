% ===============================================
% Autor: Javier Rosas
% Fecha: 28 de octubre de 2024
% Descripción: Programa en Prolog que encuentra dos números primos
%              que sumen un número par dado, según la conjetura de
%              Goldbach. La conjetura de Goldbach afirma que todo
%              número par mayor que 2 puede expresarse como la suma
%              de dos números primos.
%              Referencia: https://es.wikipedia.org/wiki/Conjetura_de_Goldbach
% ===============================================

% -------- Código en Prolog --------------------
% Encuentra dos números primos que sumen un número par dado.
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
% ?- goldbach(28, [P1, P2]).
% P1 = 5,
% P2 = 23 ;
% P1 = 11,
% P2 = 17 ;
% false.
% ----------------------------------------------
