-module(solution).
-export([main/0]).

sumArray(Arr) -> sumArray(Arr, 0).

sumArray([H|T], Acc) -> sumArray(T, Acc + H);
sumArray([], Acc) -> Acc.

read_array(0, D) -> [];
read_array(N, D) -> 
    {ok, [X]} = io:fread("", D),
    [X | read_array(N-1, D)].

main() ->
    { ok, [N]} = io:fread("", "~d"),
    Arr = read_array(N, "~d"),
    Res = sumArray(Arr),
    io:format("~p~n", [Res]).
