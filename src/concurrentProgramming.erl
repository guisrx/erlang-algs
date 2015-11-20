-module(concurrentProgramming).
-export([ringing_a/2]).

ringing_a(A, B) -> 
	receive
		{A, on_hook} ->
			A ! {stop_tone, ring},
			B ! terminate,
			idle(A);
		{B, answered} ->
			A ! {stop_tone, ring},
			switch ! {connect, A, B},
			conversation_a(A, B)
	end.