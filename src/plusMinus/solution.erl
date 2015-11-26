-module(solution).
-export([main/0]).

main() ->
    { ok, [N]} = io:fread("", "~d"),
    Arr = read_array(N, "~d"),
    Res = signsAverage(Arr, N),
    printElements(Res).

printElements([H|T]) -> 
	io:format("~p~n", [H]),
	printElements(T);
printElements([]) -> true.

read_array(0, _D) -> [];
read_array(N, D) -> 
   {ok, [X]} = io:fread("", D),
   [X | read_array(N-1, D)].

signsAverage(Arr, N) -> signsAverage(Arr, N, 0, 0, 0).

signsAverage([H|T], N, Positive, Negative, Zeroes) when H > 0 -> signsAverage(T, N, Positive + 1, Negative, Zeroes);
signsAverage([H|T], N, Positive, Negative, Zeroes) when H < 0 -> signsAverage(T, N, Positive, Negative + 1, Zeroes);
signsAverage([0|T], N, Positive, Negative, Zeroes) -> signsAverage(T, N, Positive, Negative, Zeroes + 1);
signsAverage([], N, Positive, Negative, Zeroes) -> [Positive/N, Negative/N, Zeroes/N].
