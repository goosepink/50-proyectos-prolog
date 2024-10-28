% ===============================================
% Autor: Javier Rosas
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que genera una
%              permutación aleatoria de los elementos
%              de una lista. Utiliza la selección
%              aleatoria para construir la permutación.
% ===============================================
% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para generar una permutación aleatoria de una lista.
%     static List<T> RandomPermutation<T>(List<T> list)
%     {
%         Random rnd = new Random();
%         List<T> result = new List<T>(list);
%         int n = result.Count;
%         while (n > 1)
%         {
%             n--;
%             int k = rnd.Next(n + 1);
%             T value = result[k];
%             result[k] = result[n];
%             result[n] = value;
%         }
%         return result; // Devuelve la lista permutada aleatoriamente.
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd' };
%         List<char> permutacion = RandomPermutation(lista);
% 
%         Console.WriteLine("Permutación aleatoria: " + string.Join(", ", permutacion));
%     }
% }
% ----------------------------------------------
% -------- Código en Prolog --------------------

% rnd_permu/2: Genera una permutación aleatoria P de la lista L.
rnd_permu(L, P) :- 
    length(L, Len),        % Obtiene la longitud de la lista L.
    rnd_select(L, Len, P). % Selecciona elementos aleatoriamente para la permutación.

% rnd_select/3: Selecciona N elementos aleatorios de una lista sin repetición.
rnd_select([], 0, []). % Caso base: seleccionar 0 elementos da una lista vacía.
rnd_select(List, N, [X|Rest]) :- 
    N > 0, 
    select(X, List, NewList), % Selecciona un elemento X de la lista.
    N1 is N - 1,               % Disminuye el conteo de elementos por seleccionar.
    rnd_select(NewList, N1, Rest). % Continúa seleccionando elementos de la lista restante.

% Ejemplo de uso:
% ?- rnd_permu([a, b, c, d], P).
% P = [c, a, d, b]. % El resultado puede variar debido a la aleatoriedad.
% ----------------------------------------------
