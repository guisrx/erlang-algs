-module(solution).
-export([main/0]).

main() ->
    {ok, [N]} = io:fread("", "~d"),
    A = read_2darray(N, N, "~d"),
    Res = abs(sumPrimaryDiagonal(A, N) - sumSecondaryDiagonal(A, N)),
    io:format("~p~n", [Res]).

read_array(0, _) -> [];
read_array(N, D) -> 
   {ok, [X]} = io:fread("", D),
   [X | read_array(N-1, D)].

read_2darray(0, _, _) -> [];
read_2darray(N, M, D) ->
   Q = read_array(M, D),
   [Q | read_2darray(N-1, M, D)].


getLineValue([H|_T], 0) -> H;
getLineValue([_H|T], N) -> getLineValue(T, N - 1).

sumPrimaryDiagonal(M, _N) -> sumPrimaryDiagonal(M, 0, 0).
sumPrimaryDiagonal([H|T], N, Acc) -> sumPrimaryDiagonal(T, N + 1, getLineValue(H, N) + Acc);
sumPrimaryDiagonal([], _N, Acc) -> Acc.

sumSecondaryDiagonal(M, N) -> sumSecondaryDiagonal(M, N - 1, 0).
sumSecondaryDiagonal([H|T], N, Acc) -> sumSecondaryDiagonal(T, N - 1, getLineValue(H, N) + Acc);
sumSecondaryDiagonal([], _N, Acc) -> Acc.
