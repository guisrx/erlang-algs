-module(solution).
-export([main/0]).

read_array(0, _D) -> [];
read_array(Size, D) -> 
    {ok, [X]} = io:fread("", D),
    [X | read_array(Size - 1, D)].

main() ->
    {ok, [Size]} = io:fread("", "~d"),
    Array = read_array(Size, "~d"),
	ValueToInsert = array:get(Size - 1, Array),
	insertOrderedValue(Array, Size - 1, ValueToInsert).


insertOrderedValue(Array, 0, ValueToInsert) ->
	array:set(Array, 0, ValueToInsert),
	io:format("~p~n", [Array]);
	
insertOrderedValue(Array, Index, ValueToInsert) ->
	PreviousValue = array:get(Index - 1, Array),
	IsRightPlace = isRightPlace(Array, Index, PreviousValue, ValueToInsert),
	if 
		IsRightPlace -> true;
		true -> insertOrderedValue(Array, Index - 1, ValueToInsert)
	end.


isRightPlace(Array, Index, PreviousValue, ValueToInsert) when PreviousValue <= ValueToInsert ->
	array:set(Array, Index, ValueToInsert),
	io:format("~p~n", [Array]),
	true;

isRightPlace(Array, Index, PreviousValue, ValueToInsert) when PreviousValue > ValueToInsert ->
	array:set(Array, Index, PreviousValue),
	io:format("~p~n", [Array]),
	false.
