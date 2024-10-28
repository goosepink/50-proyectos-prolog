% ===============================================
% Autor: Javier Rosas
% Fecha: 28 de octubre de 2024
% Descripción: Programa en Prolog que calcula la función
%              totiente de Euler (φ) para un número N,
%              utilizando los factores primos con multiplicidad
%              para mejorar la eficiencia del cálculo.
%              La función totiente cuenta el número de enteros
%              positivos menores o iguales a N que son coprimos
%              con N.
%              Referencia: https://es.wikipedia.org/wiki/Función_φ_de_Euler
% ===============================================

% -------- Código en Prolog --------------------
% Calcula la función totiente utilizando los factores primos con
% multiplicidad para mejorar la eficiencia.

% Predicado principal que calcula la función totiente mejorada.
totient_improved(N, Phi) :-
    prime_factors_mult(N, F),    % Calcula la lista de factores primos con multiplicidad.
    totient_phi(F, Phi).         % Llama al predicado auxiliar para calcular el resultado.

% Caso base: si la lista de factores está vacía, el resultado es 1.
totient_phi([], 1).

% Caso recursivo: calcula la función totiente para cada factor primo.
totient_phi([[P, M]|T], Phi) :-
    totient_phi(T, Phi1),               % Calcula el totiente para los factores restantes.
    Phi is Phi1 * (P - 1) * P ** (M - 1). % Calcula el totiente acumulado.

% Predicado que calcula los factores primos de un número con su multiplicidad.
prime_factors_mult(N, F) :-
    prime_factors(N, L),    % Obtiene los factores primos en una lista simple.
    encode(L, F).           % Codifica la lista para obtener la multiplicidad de cada factor.

% Predicado que encuentra los factores primos de un número.
prime_factors(1, []) :- !.
prime_factors(N, [F|T]) :-
    lowest_prime_factor(N, F),  % Encuentra el menor factor primo de N.
    N1 is N // F,
    prime_factors(N1, T).

% Predicado que encuentra el menor factor primo de un número.
lowest_prime_factor(N, F) :-
    lowest_prime_factor(N, 2, F).

lowest_prime_factor(N, F, F) :-
    N mod F =:= 0, !.
lowest_prime_factor(N, D, F) :-
    D * D =< N,
    D1 is D + 1,
    lowest_prime_factor(N, D1, F).
lowest_prime_factor(N, F, N) :-
    F * F > N.

% Predicado que codifica una lista de elementos iguales consecutivos con su multiplicidad.
encode([], []).
encode([H|T], [[H, N]|R]) :-
    count_occurrences(H, [H|T], N, Rest), % Cuenta las ocurrencias de H.
    encode(Rest, R).

% Predicado que cuenta las ocurrencias consecutivas de un elemento en una lista.
count_occurrences(_, [], 0, []).
count_occurrences(X, [X|T], N, Rest) :-
    count_occurrences(X, T, N1, Rest), N is N1 + 1.
count_occurrences(X, [Y|T], 0, [Y|T]) :-
    X \= Y.

% Ejemplo de uso:
% ?- totient_improved(10, Phi).
% Phi = 4.
% ----------------------------------------------
