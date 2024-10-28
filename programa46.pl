% ===============================================
% Autor: Javier Rosas
% Fecha: 28 de octubre de 2024
% Descripción: Programa en Prolog que comprueba si un árbol binario
%              es simétrico. Un árbol es simétrico si sus subárboles
%              izquierdo y derecho son espejos entre sí.
% ===============================================

% Definición de árboles binarios y verificación de simetría
% Un árbol puede ser nil (vacío) o t(Valor, IzqSubarbol, DerSubarbol)

% Verifica si un árbol es simétrico
symmetric(nil).
symmetric(t(_, L, R)) :- mirror(L, R).

% Verifica si dos árboles son espejos entre sí
mirror(nil, nil).
mirror(t(_, L1, R1), t(_, L2, R2)) :- 
    mirror(L1, R2), 
    mirror(R1, L2).

% Predicados auxiliares para crear y mostrar árboles

% Crear algunos árboles de ejemplo
arbol_simetrico1(T) :-
    T = t(1,
          t(2, t(4, nil, nil), t(5, nil, nil)),
          t(2, t(5, nil, nil), t(4, nil, nil))).

arbol_simetrico2(T) :-
    T = t(1,
          t(2, nil, nil),
          t(2, nil, nil)).

arbol_no_simetrico(T) :-
    T = t(1,
          t(2, t(4, nil, nil), nil),
          t(2, nil, t(4, nil, nil))).

% Mostrar árbol de forma visual
mostrar_arbol(nil) :- write('nil').
mostrar_arbol(t(V, L, R)) :-
    write('t('),
    write(V), write(', '),
    mostrar_arbol(L), write(', '),
    mostrar_arbol(R), write(')').

% Predicado para probar si un árbol es simétrico y mostrarlo
probar_simetria(Arbol) :-
    write('Arbol: '), nl,
    mostrar_arbol(Arbol), nl,
    (symmetric(Arbol) ->
        write('El arbol ES simetrico') ;
        write('El arbol NO es simetrico')
    ), nl, nl.

% Pruebas del sistema
test_arboles :-
    write('=== Pruebas de Simetría en Árboles ==='), nl,
    
    write('Prueba 1: Arbol simetrico complejo'), nl,
    arbol_simetrico1(T1),
    probar_simetria(T1),
    
    write('Prueba 2: Arbol simetrico simple'), nl,
    arbol_simetrico2(T2),
    probar_simetria(T2),
    
    write('Prueba 3: Arbol no simetrico'), nl,
    arbol_no_simetrico(T3),
    probar_simetria(T3),
    
    write('Prueba 4: Arbol vacio'), nl,
    probar_simetria(nil),
    
    write('=== Fin de las pruebas ===').

% ----------------------------------------------
