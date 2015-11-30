-module(solution).
-export([main/0]).

readArray(0, _D) -> [];
readArray(Size, D) -> 
    {ok, [X]} = io:fread("", D),
    [X | readArray(Size - 1, D)].

main() ->
    {ok, [Size]} = io:fread("", "~d"),
    Array = readArray(Size, "~d"),
	ValueToInsert = lists:nth(Size, Array),
%	insertOrderedValue(Array, Size - 1, ValueToInsert).
	BaseArray = lists:sublist(Array, length(Array) - 1) ++ [lists:nth(length(Array) - 1, Array)],
	NewArray = processPosition(BaseArray, 5, 1, ValueToInsert),
	io:format("~p~n", [NewArray]).



insertOrderedValue(Array, TargetIndex, Index, ValueToInsert) ->
	array:set(Array, 0, ValueToInsert),
	io:format("~p~n", [Array]),
	true;



processPosition(Array, TargetIndex, Index, ValueToInsert) when Index == 1 ->
	CurrentValue = lists:nth(Index, Array),
	NextValue = lists:nth(Index + 1, Array),
	if
		(TargetIndex == 1) and (ValueToInsert =< NextValue) -> 
			[ValueToInsert, CurrentValue | processPosition(Array, TargetIndex, Index + 1, ValueToInsert, CurrentValue)];
		true -> 
			[CurrentValue | processPosition(Array, TargetIndex, Index + 1, ValueToInsert, CurrentValue)]
	end.


processPosition(Array, TargetIndex, Index, ValueToInsert, PreviousValue) when Index == length(Array) ->
	CurrentValue = lists:nth(Index, Array),
	[CurrentValue];

processPosition(Array, TargetIndex, Index, ValueToInsert, PreviousValue) when (Index < TargetIndex) or (Index > TargetIndex) ->
	CurrentValue = lists:nth(Index, Array),
	[CurrentValue | processPosition(Array, TargetIndex, Index + 1, ValueToInsert, CurrentValue)];

processPosition(Array, TargetIndex, Index, ValueToInsert, PreviousValue) when Index == TargetIndex ->
	CurrentValue = lists:nth(Index, Array),
	if
		(Index == length(Array)) and (PreviousValue > ValueToInsert) -> [CurrentValue];
		(Index == length(Array)) and (PreviousValue =< ValueToInsert) -> [ValueToInsert];
		true -> [CurrentValue | processPosition(Array, TargetIndex, Index + 1, ValueToInsert, CurrentValue)]
	end;

