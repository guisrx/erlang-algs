-module(arraySum).
-export([sumArray/1, sumArray/2]).

sumArray(Arr) -> sumArray(Arr, 0).

sumArray([H|T], Acc) -> 
	sumArray(T, Acc + H);

sumArray([], Acc) -> Acc.
