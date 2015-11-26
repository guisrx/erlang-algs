-module(solution).
-export([main/0]).

main() ->
    {ok, [N]} = io:fread("", "~d"),
    drawStaircase(N).

read_array(0, D) -> [];
read_array(N, D) -> 
   {ok, [X]} = io:fread("", D),
   [X | read_array(N-1, D)].

drawStaircase(N) -> drawStaircase(N, N).

drawStaircase(N, Level) -> drawStaircase(N, N).
