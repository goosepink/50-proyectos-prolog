% ===============================================
% Autor: Javier Rosas
% Fecha: 23 de octubre de 2024
% Descripción: Extrae un número dado de elementos aleatorios de una lista.
%              El predicado 'rnd_select' toma una lista L, un número N y genera
%              una lista de N elementos seleccionados aleatoriamente de L.
%              Utiliza un generador de números aleatorios para seleccionar los
%              índices de los elementos y elimina los elementos seleccionados
%              de la lista original para evitar repeticiones.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
% 
% class Program
% {
%     // Función para extraer un número dado de elementos aleatorios de una lista.
%     static List<T> RandomSelect<T>(List<T> list, int count)
%     {
%         Random random = new Random();
%         return list.OrderBy(x => random.Next()).Take(count).ToList(); // Selecciona N elementos aleatorios.
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e' };
%         List<char> seleccionados = RandomSelect(lista, 3);
%         Console.WriteLine(string.Join(", ", seleccionados)); // Imprime 3 elementos aleatorios de la lista.
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
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
% ?- rnd_select([a, b, c, d, e], 3, R).
% R = [c, a, d]. % Resultado variará en cada ejecución.
% ----------------------------------------------
