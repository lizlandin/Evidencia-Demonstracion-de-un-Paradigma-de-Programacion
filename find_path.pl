% -------------------------------------------------
% Find if Path Exists in Graph
%
% valid_path(N, Edges, Source, Destination)
%
% N: cantidad de nodos (aqui mantuve N como parámetro porque
% así esta en el formato del input del problema en LeetCode pero aqui
% no se va a usar).
%
% Edges:lista de conexiones del grafo
%
% Source:nodo inicial
%
% Destination:nodo destino
% -------------------------------------------------

valid_path(_, Edges, Source, Destination) :-

    % Iniciar DFS
    % [] = esto representa los nodos visitados,
    % pero como apenas vamos a empezar comienza vacia

    find_path(Source, Destination, Edges, []),
    write('True'), nl,
    !.

valid_path(_, Edges, Source, Destination) :-

    % Si no encuentra camino, imprime False.

    \+ find_path(Source, Destination, Edges, []),
    write('False'), nl.

% -------------------------------------------------
% CASO BASE: Si el nodo actual ya es el destino,
% entonces sí existe camino y termina.
% -------------------------------------------------

find_path(Node, Node, _, _) :-
    !. % este simbolo es cut y sirve para detener el backtracking, en este caso si el nodo source es el mismo que el de destino para automaticamente la busqueda.

% -------------------------------------------------
% CASO RECURSIVO: si el nodo actual no es el destino
% -------------------------------------------------

find_path(CurrentNode, Destination, Edges, Visited) :-

    % Verificar que NO hayamos visitado el nodo
    % member: es una funcion de Prolog que revisa si algo esta dentro de una lista
    % \+ : significa negacion o sea que el nodo actual no debe de ser parte de los nodos visitados
    \+ member(CurrentNode, Visited),

    % Buscar un vecino conectado
    connected(CurrentNode, NextNode, Edges),

    % Continuar búsqueda desde el vecino
    find_path(NextNode, Destination, Edges, [CurrentNode | Visited]).

% -------------------------------------------------
% connected(NodeA, NodeB, Edges)
%
% Revisa si dos nodos están conectados y como el grafo es bidireccional
% revisamos ambos sentidos.
% -------------------------------------------------

connected(NodeA, NodeB, Edges) :-
    member([NodeA, NodeB], Edges).

connected(NodeA, NodeB, Edges) :-
    member([NodeB, NodeA], Edges).
