% ===============================================
% Autor: Javier Rosas
% Fecha: 23 de octubre de 2024
% Descripción: Extrae N números aleatorios de un rango dado.
%              Utiliza la función 'range' para generar la lista de números
%              en el rango especificado y luego selecciona aleatoriamente
%              N elementos de esta lista mediante 'rnd_select'.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
% 
% class Program
% {
%     // Función para generar números aleatorios dentro de un rango.
%     static List<int> Lotto(int n, int m)
%     {
%         Random random = new Random();
%         List<int> range = Enumerable.Range(1, m).ToList(); // Genera la lista del rango.
%         return range.OrderBy(x => random.Next()).Take(n).ToList(); // Selecciona N números aleatorios.
%     }
% 
%     static void Main()
%     {
%         List<int> seleccionados = Lotto(6, 49); // Extrae 6 números del rango 1 a 49.
%         Console.WriteLine(string.Join(", ", seleccionados)); // Imprime los números seleccionados.
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Extrae N números aleatorios de un rango dado.
% N es la cantidad de números a seleccionar, M es el límite superior del rango, 
% y L es la lista de números seleccionados.
lotto(N, M, L) :- range(1, M, R), rnd_select(R, N, L).

% Crea una lista con todos los enteros dentro de un rango dado.
% Caso base: cuando el inicio y el final son iguales.
range(I, I, [I]).
% Caso recursivo: agrega el inicio a la lista y continúa con el siguiente número.
range(I, K, [I|R]) :- I < K, I1 is I + 1, range(I1, K, R).

% Extrae un número dado de elementos aleatorios de una lista.
% Caso base: si N es 0, devuelve una lista vacía.
rnd_select(_, 0, []).

% Caso recursivo: selecciona un elemento aleatorio y continúa con el resto.
rnd_select(L, N, [X|R]) :-
    length(L, Len),
    random(1, Len, I), % Genera un índice aleatorio entre 1 y Len.
    element_at(X, L, I), % Extrae el elemento en el índice I.
    delete(L, X, L1), % Elimina el elemento seleccionado de la lista.
    N1 is N - 1, % Disminuye el contador N.
    rnd_select(L1, N1, R). % Llama recursivamente para obtener el resto de elementos.

% Extrae el elemento en la posición I de la lista L.
% El índice I debe ser mayor que 0.
element_at(X, [X|_], 1). % Caso base: el primer elemento es X.
element_at(X, [_|T], I) :- 
    I > 1, 
    I1 is I - 1, 
    element_at(X, T, I1). % Llamada recursiva para obtener el siguiente elemento.

% Ejemplo de uso:
% ?- lotto(6, 49, L).
% L = [12, 25, 37, 5, 43, 18]. % Resultado variará en cada ejecución.
% ----------------------------------------------
