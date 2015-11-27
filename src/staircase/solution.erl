-module(solution).
-export([main/0]).

main() ->
    {ok, [Size]} = io:fread("", "~d"),
    drawStaircase(Size).


drawStaircase(Size) -> drawStaircase(Size, Size).

drawStaircase(_Size, Level) when Level == 0 -> 
	true;

drawStaircase(Size, Level) -> 
	drawLevel(Size, Level, 1),
	io:format("~n"),
	drawStaircase(Size, Level - 1).


drawLevel(Size, _Level, Pos) when Pos > Size -> 
	true;

drawLevel(Size, Level, Pos) when Pos < Level -> 
	io:format(" "),
	drawLevel(Size, Level, Pos + 1);

drawLevel(Size, Level, Pos) when Pos >= Level -> 
	io:format("#"),
	drawLevel(Size, Level, Pos + 1).
