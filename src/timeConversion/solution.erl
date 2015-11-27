-module(solution).
-export([main/0]).

main() ->
    {ok, [Time]} = io:fread("", "~s"),
    convertTime(Time).

convertTime(Time) -> 
	Hour = lists:sublist(Time, 1, 2),
	Min = lists:sublist(Time, 4, 2),
	Sec = lists:sublist(Time, 7, 2),
	Per = lists:sublist(Time, 9, 2),
	{HourValue, _} = string:to_integer(Hour),
	io:format("~2..0B:~s:~s", [militaryHour(Per, HourValue), Min, Sec]).

militaryHour("PM", 12) -> 12;
militaryHour("PM", HourValue) -> HourValue + 12;
militaryHour("AM", 12) -> 0;
militaryHour("AM", HourValue) -> HourValue.
